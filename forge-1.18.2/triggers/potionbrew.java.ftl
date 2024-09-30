<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(PotionBrewEvent.Pre event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "Length": "event.getLength()",
            "Potion": "PotionUtils.getPotion(event.getItem(0))",
            "Ingredient": "event.getItem(3)",
            "Fuel": "event.getItem(4)",
            "FirstResult": "event.getItem(0)",
            "SecondResult": "event.getItem(1)",
            "ThirdResult": "event.getItem(2)",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }