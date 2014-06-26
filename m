Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0EY6-000867-Gp
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 18:37:34 +0000
Message-ID: <53AC67FC.4050103@ti.com>
Date: Thu, 26 Jun 2014 13:35:40 -0500
From: Darren Etheridge <detheridge@ti.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>, Pekon
 Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: am335x-bone: add support for beaglebone
 LCD4 cape
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-4-git-send-email-pekon@ti.com> <20140626154052.GB15648@fox>
In-Reply-To: <20140626154052.GB15648@fox>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Nelson <robertcnelson@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guido, Pekon,

On 06/26/2014 10:40 AM, Guido Martínez wrote:
> Hi Pekon,
>
> I had some issues with this patch. Booting linux-next on a BeagleBone
> Black with this exact LCD left me with an unusable white screen. Please
> see below for some details.
>
> On Tue, Jun 24, 2014 at 05:54:26PM +0530, Pekon Gupta wrote:
>> This patch adds support for LCD4 cape as advertised on
>>    http://elinux.org/CircuitCo:BeagleBone_LCD4
>>
>> This cape has:
>> * 480x272 TFT-LCD panel
>>   - LCD panel datasheet and timing information are sourced from [1]
>>   - LCD backlight is connected to 'EHRPWM1A' on cape board, but its used for
>>     enabling backlight power-supply. So 'gpio-backlight' driver is used instead
>>     of 'pwm-backlight' driver (Kconfig: BACKLIGHT_GPIO=y).
>>
>> * 4-wire resistive Touchscreen
>>
>> *Known constrains*
>> As LCD panel pins (lcd_data, hsync, vsync, pclk) are shared with on-board
>> NXP HDMI framer, so either HDMI or LCD-cape can be used at time. Thus while
>> using this cape 'hdmi' DT node needs to be disabled in am335x-boneblack.dts
>>
>> [1] www.newhavendisplay.com/specs/NHD-4.3-480272MF-ATXI-T-1.pdf
>>      www.newhavendisplay.com/app_notes/OTA5180A.pdf
>>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---

<snip>

>> +
>> +	panel {
>> +		status = "disabled";
>> +		compatible = "ti,tilcdc,panel";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bbcape_lcd_pins>;
>> +		panel-info {
>> +			ac-bias           = <255>;
>> +			ac-bias-intrpt    = <0>;
>> +			dma-burst-sz      = <16>;
>> +			bpp               = <16>;
>> +			fdd               = <0x80>;
>> +			sync-edge         = <0>;
>> +			sync-ctrl         = <0>;
> I had to set this to <1>. Does that make sense?
>
>> +			raster-order      = <0>;
>> +			fifo-th           = <0>;
>> +		};
>> +		display-timings {
>> +			native-mode = <&timing0>;
>> +			/* www.newhavendisplay.com/app_notes/OTA5180A.pdf */
>> +			timing0: 480x272 {
>> +				clock-frequency = <30000000>;
>> +				hactive = <480>;
>> +				vactive = <272>;
>> +				hfront-porch = <8>;
>> +				hback-porch = <47>;
>> +				hsync-len = <41>;
>> +				vback-porch = <2>;
>> +				vfront-porch = <3>;
>> +				vsync-len = <10>;
>> +				hsync-active = <0>;
>> +				vsync-active = <0>;
>> +				de-active = <1>;
>> +				pixelclk-active = <0>;
> Are you sure these timings are ok? When enabling the sync control I get
> an usable display, but it looks a bit funny. For example an all black
> display looks very clear and has a dotted pattern.
>
> I tried to take a picture of it but it doesn't show.

These timings look wrong to me, for instance this sets a clock frequency 
of 30MHz where as the linked app-note says 9MHz.  I think the LCD4 cape 
uses the same LCD panel as is used on the AM335x EVMSK.  Therefore the 
display timings from my DT patch for the EVMSK should work: 
https://patchwork.kernel.org/patch/4144801/

Darren

>
> Also I'm just guessing about the timings, maybe it's something else?
>
>> +			};
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/am335x-bone.dts b/arch/arm/boot/dts/am335x-bone.dts
>> index f16bfcf..41439dc 100644
>> --- a/arch/arm/boot/dts/am335x-bone.dts
>> +++ b/arch/arm/boot/dts/am335x-bone.dts
>> @@ -10,6 +10,7 @@
>>   #include "am33xx.dtsi"
>>   #include "am335x-bone-common.dtsi"
>>   #include "am335x-bone-memory-cape.dts"
>> +#include "am335x-bone-display-cape.dts"
>>
>>   &ldo3_reg {
>>   	regulator-min-microvolt = <1800000>;
>> diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
>> index e6d7e54..03232c7 100644
>> --- a/arch/arm/boot/dts/am335x-boneblack.dts
>> +++ b/arch/arm/boot/dts/am335x-boneblack.dts
>> @@ -10,6 +10,7 @@
>>   #include "am33xx.dtsi"
>>   #include "am335x-bone-common.dtsi"
>>   #include "am335x-bone-memory-cape.dts"
>> +#include "am335x-bone-display-cape.dts"
>>
>>   &ldo3_reg {
>>   	regulator-min-microvolt = <1800000>;
>> --
>> 1.8.5.1.163.gd7aced9
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
