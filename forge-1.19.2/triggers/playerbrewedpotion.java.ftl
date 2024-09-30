<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(PlayerBrewedPotionEvent event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "(Player) getEntityPlayer.getX()",
            "y": "(Player) getEntityPlayer.getZ()",
            "z": "(Player) getEntityPlayer.getY()",
            "entity": "(Player) getEntityPlayer",
            "world": "(Player) getEntityPlayer.level()",
            "itemstack": "event.getStack()",
            "Potion": "PotionUtils.getPotion(event.getStack())",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }