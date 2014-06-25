Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzezS-00053c-Kj
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 04:39:23 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH v1 3/3] ARM: dts: am335x-bone: add support for
 beaglebone LCD4 cape
Date: Wed, 25 Jun 2014 04:38:53 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF7327@DBDE04.ent.ti.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-4-git-send-email-pekon@ti.com>
 <20140624150336.GA10041@arch.cereza>
In-Reply-To: <20140624150336.GA10041@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 =?iso-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ezequiel Garcia
>>On 24 Jun 05:54 PM, Pekon Gupta wrote:
>> This patch adds support for LCD4 cape as advertised on
>>   http://elinux.org/CircuitCo:BeagleBone_LCD4
>>
>> This cape has:
>> * 480x272 TFT-LCD panel
>>  - LCD panel datasheet and timing information are sourced from [1]
>>  - LCD backlight is connected to 'EHRPWM1A' on cape board, but its used =
for
>>    enabling backlight power-supply. So 'gpio-backlight' driver is used i=
nstead
>>    of 'pwm-backlight' driver (Kconfig: BACKLIGHT_GPIO=3Dy).
>>
>
>I'm confused about this, can you clarify why you are not using pwm-backlig=
ht?
>

As per the schematics of this LCD4 cape board, "EHRPWM1A" pin controls
enabling/disabling of the power to backlight LED. It does not control the
voltage levels (brightness levels) of the LED. Thus it wasn't making sense
to use pwm-backlight driver which more suitable in cases where you have
multiple levels of brightness.
Here, you have only 2 levels "backlight=3Doff | on", so I used gpio-backlig=
ht driver.
Though you can use pwm-backlight driver also, but the backlight turns ON
only when you set the /sys/class/backlight/<backlight_device>/brighteness
to maximum level (as set in DT).


with regards, pekon
