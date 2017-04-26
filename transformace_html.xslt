<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
 
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">

    <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
      
      <body>
        <h1>Transformace</h1>

        <ul>
          <li>
            <a href="#netw">1. Network</a>
          </li>
          <li>
            <a href="#regi">2. Region</a>
          </li>
          <li>
            <a href="#soun">3. Sound</a>
          </li>          
        </ul>
        
        <section id="netw">
         <h2>1. Network - stav sítě pro profil 2</h2>
        <table border="1">
          <tr style="background-color: #ffcc99">

            <th>Název profilu</th>
            <th>Bluetooth</th>
            <th>Mobilní síť</th>
            <th>Heslo k Hotspotu</th>
            <th>Tethering</th>
            <th>IP adresa VPN</th>


          </tr>
          <xsl:for-each select="phoneSettings/profiles/profile">
            <xsl:if test="@id=2">
              <tr>
                <td>
                  <xsl:value-of select="@name"/>
                </td>
                <td>
                  <xsl:if test="network/bluetooth='false'">Bluetooth vypnut</xsl:if>
                  <xsl:if test="network/bluetooth='true'">Bluetooth zapnut</xsl:if>
                </td>
                <td>
                  <xsl:if test="network/mobileNetwork='false'">Síť 3G vypnuta</xsl:if>
                  <xsl:if test="network/mobileNetwork='true'">Síť 3G zapnuta</xsl:if>
                </td>
                <td>
                  <xsl:value-of select="network/hotspot/@password"/>
                </td>
                <td>
                  <xsl:if test="network/tethering='false'">Tethering vypnut</xsl:if>
                  <xsl:if test="network/tethering='true'">Tethering zapnut</xsl:if>
                </td>
                <td>
                  <xsl:value-of select="network/vpn/@ip"/>
                </td>
              </tr>
            </xsl:if>


          </xsl:for-each>

        </table>
        </section>

        
        <section id="regi">
        <h2>2. Region - Nastavení umístění všech profilů</h2>
        
        <table border="1">
          <tr style="background-color: #ffcc99">
            <th>Profil</th>
            <th>Jazyk</th>
            <th>Časový formát</th>
            <th>Použít data pro nastavení času</th>
          </tr>
          <xsl:for-each select="phoneSettings/profiles/profile">
            <tr>
              <td><xsl:value-of select="@name"/></td>
              <td><xsl:value-of select="region/language"/></td>
              <td><xsl:value-of select="region/timeFormat"/></td>
              <td>
                <xsl:if test="region/useNetwork='false'">Manuálně</xsl:if>
                <xsl:if test="region/useNetwork='true'">Pomocí sítě</xsl:if>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        </section>
        <section id="soun">
          
        <h2>3. Sound - srovnání hlasitosti profilů</h2>
        <table border="1">
          <tr style="background-color: #ffcc99">
            <th>Profil</th>
            <th>Hlasitost</th>
          
          </tr>
          <xsl:for-each select="phoneSettings/profiles/profile">
            <xsl:sort select="sound/masterVolume"/>
            <tr>
              <td>
                <xsl:value-of select="@name"/>
              </td>
              <td>
                <xsl:value-of select="sound/masterVolume"/>
                <xsl:if test="sound/masterVolume>79"> - Může dojít k poškození sluchu</xsl:if>
              </td>
          
            </tr>
            
          </xsl:for-each>
        </table>
        </section>
        
        
        
      </body>
    </html>
    
    
    
    
    



  </xsl:template>
</xsl:stylesheet>
