({
    calculateHandler : function(component, event, helper) {
        var weight = parseFloat(component.get('v.weight'));
        var height = parseFloat(component.get('v.height')) / 100;

        var bmi_score = parseFloat(weight) / (height * height);
        component.set('v.bmi_score', bmi_score);

        var weight_status = '';
        if (bmi_score < 18.5) {
            weight_status = 'Underweight';
        } else if (bmi_score >= 18.5 && bmi_score <= 24.9) {
            weight_status = 'Normal';
        } else if (bmi_score >= 25 && bmi_score <= 29.9) {
            weight_status = 'Overweight';
        } else if (bmi_score >= 30) {
            weight_status = 'Obese';
        }
        component.set('v.weight_status', weight_status);
    },
    doInit : function(component, event, helper) {
        var weight_status_picklist = [
            {
                label: 'Underweight',
                value: 'Underweight'
            },
            {
                label: 'Normal',
                value: 'Normal'
            },
            {
                label: 'Overweight',
                value: 'Overweight'
            },
            {
                label: 'Obese',
                value: 'Obese'
            }
        ];

        component.set('v.weight_status_picklist', weight_status_picklist);
    }
})