exports.handler = async (event) => {
    return {
        statusCode: 201,
        body: JSON.stringify({
            message: "Lambda function executed successfully!",
            success: true
        }),
        headers: {
            "Content-Type": "application/json"
        }
    };
};
