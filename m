Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E687AC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jan 2022 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zEaPKIQyr0ztb2f/ra3u1fiAneqgw0Xyhnp1Y+1iZAY=; b=1JlBUx0HiVPfQVxg5KzerX4jR3
	MQjLKYnijfMsxm7noG4opuTsmdA8Tl2LO0kMrPThF9JwKZDBCnPMiA/qsmY6zrdmnvA53o26SyQYb
	VQv+x7qgIdMoGAR4zyhKEw2L/vHRmqwPL0C1+/1ewhhvl4BNUH1aA7MjN5LOe2yn/bU1Ax0xoFF7i
	S5F7j5pUakmF8ui1fL2tvq8Pt86trxEx2vnS6SmnJSdZLmFUexvXR/O5+JM70DXB8GHmQJ/2HmTAM
	pV62k50+anQ5FBshNUjttQ9LlkN0YwukNcyd9qBMRnVPh0osT6QL8neCFJXFhbF2fMYq7ubJpKJL2
	wrPSdyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9A46-00Co5g-Nf; Sun, 16 Jan 2022 18:15:42 +0000
Received: from mxout02.lancloud.ru ([45.84.86.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9A40-00Co3i-Di; Sun, 16 Jan 2022 18:15:39 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 20CE0205BB5A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, <linux-iio@vger.kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, "ALSA
 Development Mailing List" <alsa-devel@alsa-project.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-phy@lists.infradead.org>, Jiri Slaby
 <jirislaby@kernel.org>, <openipmi-developer@lists.sourceforge.net>, "David S.
 Miller" <davem@davemloft.net>, Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, "open list:SERIAL DRIVERS"
 <linux-serial@vger.kernel.org>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>, Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry
 <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>, "William
 Breathitt Gray" <vilhelm.gray@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai
 <tiwai@suse.com>, <platform-driver-x86@vger.kernel.org>, Benson Leung
 <bleung@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Mun Yew Tham
 <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>, "Linux MMC
 List" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Vinod Koul
 <vkoul@kernel.org>, James Morse <james.morse@arm.com>, Zha Qipeng
 <qipeng.zha@intel.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, <linux-mediatek@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, <netdev@vger.kernel.org>
References: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <57af1851-9341-985e-7b28-d2ba86770ecb@omp.ru>
Date: Sun, 16 Jan 2022 21:15:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_101536_869969_7CCEBFE5 
X-CRM114-Status: GOOD (  23.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 1/14/22 11:22 PM, Uwe Kleine-K=F6nig wrote:

>>>>>>> To me it sounds much more logical for the driver to check if an
>>>>>>> optional irq is non-zero (available) or zero (not available), than =
to
>>>>>>> sprinkle around checks for -ENXIO. In addition, you have to remember
>>>>>>> that this one returns -ENXIO, while other APIs use -ENOENT or -ENOS=
YS
>>>>>>> (or some other error code) to indicate absence. I thought not having
>>>>>>> to care about the actual error code was the main reason behind the
>>>>>>> introduction of the *_optional() APIs.
>>>>>
>>>>>> No, the main benefit of gpiod_get_optional() (and clk_get_optional()=
) is
>>>>>> that you can handle an absent GPIO (or clk) as if it were available.
>>>>
>>>>    Hm, I've just looked at these and must note that they match 1:1 with
>>>> platform_get_irq_optional(). Unfortunately, we can't however behave the
>>>> same way in request_irq() -- because it has to support IRQ0 for the sa=
ke
>>>> of i8253 drivers in arch/...
>>>
>>> Let me reformulate your statement to the IMHO equivalent:
>>>
>>> 	If you set aside the differences between
>>> 	platform_get_irq_optional() and gpiod_get_optional(),
>>
>>    Sorry, I should make it clear this is actually the diff between a wou=
ld-be
>> platform_get_irq_optional() after my patch, not the current code...
> =

> The similarity is that with your patch both gpiod_get_optional() and
> platform_get_irq_optional() return NULL and 0 on not-found. The relevant
> difference however is that for a gpiod NULL is a dummy value, while for
> irqs it's not. So the similarity is only syntactically, but not
> semantically.

   I have noting to say here, rather than optional IRQ could well have a di=
fferent
meaning than for clk/gpio/etc.

[...]
>>> However for an interupt this cannot work. You will always have to check
>>> if the irq is actually there or not because if it's not you cannot just
>>> ignore that. So there is no benefit of an optional irq.
>>>
>>> Leaving error message reporting aside, the introduction of
>>> platform_get_irq_optional() allows to change
>>>
>>> 	irq =3D platform_get_irq(...);
>>> 	if (irq < 0 && irq !=3D -ENXIO) {
>>> 		return irq;
>>> 	} else if (irq >=3D 0) {
>>
>>    Rather (irq > 0) actually, IRQ0 is considered invalid (but still retu=
rned).
> =

> This is a topic I don't feel strong for, so I'm sloppy here. If changing
> this is all that is needed to convince you of my point ...

   Note that we should absolutely (and first of all) stop returning 0 from =
platform_get_irq()
on a "real" IRQ0. Handling that "still good" zero absolutely doesn't scale =
e.g. for the subsystems
(like libata) which take 0 as an indication that the polling mode should be=
 used... We can't afford
to be sloppy here. ;-)

[...]

> Best regards
> Uwe

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
