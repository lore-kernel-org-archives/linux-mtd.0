Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0UWT-0001jk-GM
 for linux-mtd@lists.infradead.org; Fri, 27 Jun 2014 11:40:54 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Etheridge, Darren" <detheridge@ti.com>, =?iso-8859-1?Q?Guido_Mart=EDnez?=
 <guido@vanguardiasur.com.ar>
Subject: RE: [PATCH v1 3/3] ARM: dts: am335x-bone: add support for
 beaglebone LCD4 cape
Date: Fri, 27 Jun 2014 11:38:43 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF807B@DBDE04.ent.ti.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-4-git-send-email-pekon@ti.com>
 <20140626154052.GB15648@fox> <53AC67FC.4050103@ti.com>
In-Reply-To: <53AC67FC.4050103@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Daren, Guido,

>From: Etheridge, Darren
>>On 06/26/2014 10:40 AM, Guido Mart=EDnez wrote:
>> I had some issues with this patch. Booting linux-next on a BeagleBone
>> Black with this exact LCD left me with an unusable white screen. Please
>> see below for some details.
>>
>>> On Tue, Jun 24, 2014 at 05:54:26PM +0530, Pekon Gupta wrote:
>>> This patch adds support for LCD4 cape as advertised on
>>>    http://elinux.org/CircuitCo:BeagleBone_LCD4
>>>
>>> This cape has:
>>> * 480x272 TFT-LCD panel
>>>   - LCD panel datasheet and timing information are sourced from [1]
>>>   - LCD backlight is connected to 'EHRPWM1A' on cape board, but its use=
d for
>>>     enabling backlight power-supply. So 'gpio-backlight' driver is used=
 instead
>>>     of 'pwm-backlight' driver (Kconfig: BACKLIGHT_GPIO=3Dy).
>>>
>>> * 4-wire resistive Touchscreen
>>>
>>> *Known constrains*
>>> As LCD panel pins (lcd_data, hsync, vsync, pclk) are shared with on-boa=
rd
>>> NXP HDMI framer, so either HDMI or LCD-cape can be used at time. Thus w=
hile
>>> using this cape 'hdmi' DT node needs to be disabled in am335x-boneblack=
.dts
>>>
>>> [1] www.newhavendisplay.com/specs/NHD-4.3-480272MF-ATXI-T-1.pdf
>>>      www.newhavendisplay.com/app_notes/OTA5180A.pdf
>>>
>>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>>> ---
>
><snip>
>
>>> +
>>> +	panel {
>>> +		status =3D "disabled";
>>> +		compatible =3D "ti,tilcdc,panel";
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&bbcape_lcd_pins>;
>>> +		panel-info {
>>> +			ac-bias           =3D <255>;
>>> +			ac-bias-intrpt    =3D <0>;
>>> +			dma-burst-sz      =3D <16>;
>>> +			bpp               =3D <16>;
>>> +			fdd               =3D <0x80>;
>>> +			sync-edge         =3D <0>;
>>> +			sync-ctrl         =3D <0>;
>> I had to set this to <1>. Does that make sense?
>>
Yes, I'll check this one again at my end.

>>> +			raster-order      =3D <0>;
>>> +			fifo-th           =3D <0>;
>>> +		};
>>> +		display-timings {
>>> +			native-mode =3D <&timing0>;
>>> +			/* www.newhavendisplay.com/app_notes/OTA5180A.pdf */
>>> +			timing0: 480x272 {
>>> +				clock-frequency =3D <30000000>;
>>> +				hactive =3D <480>;
>>> +				vactive =3D <272>;
>>> +				hfront-porch =3D <8>;
>>> +				hback-porch =3D <47>;
>>> +				hsync-len =3D <41>;
>>> +				vback-porch =3D <2>;
>>> +				vfront-porch =3D <3>;
>>> +				vsync-len =3D <10>;
>>> +				hsync-active =3D <0>;
>>> +				vsync-active =3D <0>;
>>> +				de-active =3D <1>;
>>> +				pixelclk-active =3D <0>;
>> Are you sure these timings are ok? When enabling the sync control I get
>> an usable display, but it looks a bit funny. For example an all black
>> display looks very clear and has a dotted pattern.
>>
>> I tried to take a picture of it but it doesn't show.
>>
I could run and test 'fbtest' and 'fbconsole' on this cape, using following=
 configs
CONFIG_DRM=3Dy
CONFIG_DRM_TILCDC=3Dy
[...]
CONFIG_FB=3Dy
CONFIG_FIRMWARE_EDID=3Dy
CONFIG_FRAMEBUFFER_CONSOLE=3Dy


>These timings look wrong to me, for instance this sets a clock frequency
>of 30MHz where as the linked app-note says 9MHz.  I think the LCD4 cape
>uses the same LCD panel as is used on the AM335x EVMSK.  Therefore the
>display timings from my DT patch for the EVMSK should work:
>https://patchwork.kernel.org/patch/4144801/
>
Yes, probably I got the pixel-clock timing wrong, I'll fix this.
It should be 9.2MHz as per
www.newhavendisplay.com/specs/NHD-4.3-480272MF-ATXI-T-1.pdf
Table: Electrical Characteristics
But as 'hsync' timings are relative to pixel-clock somehow it worked for me=
.

I got other vsync and hsync timings from following reference:
	www.newhavendisplay.com/app_notes/OTA5180A.pdf
	Table: 8.4.1 480XRGBX272 Vertical Timing
	Table: 8.4.2 480XRGBX272 Horizontal Timing
And I/O signal polarity for vsync-active and hsync-active from
	Table: 5. SIGNAL DESCRIPTIONS


with regards, pekon
