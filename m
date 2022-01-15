Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54250C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jan 2022 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2yyHho3PCHCJpZSleQnw/qyDEQwNKpTA7Zc4Ed17CWk=; b=0eRB8wV2MUKrvstxH9RjTs62ql
	33ctBGTY9XwU09G4A6JTLwTPUgxtdaEsdh23jwaGTh7YQyOtUpYpZdMhI5ZfKmHmLx2/ow5kc1v6N
	j3putqRXV+7Us6wUIve+c1APR3OSHnZjZo5xZsQAzueVQXSLjTFO7gQldXgp9kogJyXagRnlunMF1
	pP3vg6KWqcE87hSpAHooPo6EjykNNGOc/7/TfquCidkanm4OO3rr6M4f/cHgN0/krajQJm4ClKJB1
	VdKlWp7hmsDaKrocUFTTNIWZIc1qpvJyZ2I+0N6vqf2Pptjgrm3/53/5raIbCybJ5Crt/+yFxwCvs
	kX0K2/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8qFa-00BZIK-UD; Sat, 15 Jan 2022 21:06:15 +0000
Received: from mxout04.lancloud.ru ([45.84.86.114])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8qFV-00BZH5-16; Sat, 15 Jan 2022 21:06:11 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 21DDC20ADE46
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
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
 <jirislaby@kernel.org>, <openipmi-developer@lists.sourceforge.net>, "Khuong
 Dinh" <khuong@os.amperecomputing.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Tony Luck" <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open
 list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Linux PWM List
 <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, "Saravanan
 Sekar" <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, Linux PM list
 <linux-pm@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, Mark Gross
 <markgross@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, "Sebastian
 Reichel" <sre@kernel.org>, Eric Auger <eric.auger@redhat.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 <platform-driver-x86@vger.kernel.org>, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, Mun Yew Tham <mun.yew.tham@intel.com>, "Hans de
 Goede" <hdegoede@redhat.com>, netdev <netdev@vger.kernel.org>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Cornelia Huck
 <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Vinod Koul
 <vkoul@kernel.org>, James Morse <james.morse@arm.com>, Zha Qipeng
 <qipeng.zha@intel.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, <linux-mediatek@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
References: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
 <20220113224319.akljsjtu7ps75vun@pengutronix.de>
 <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
 <20220115152102.m47snsdrw2elagak@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <77cea138-977a-1454-4808-bd16dd7d2734@omp.ru>
Date: Sun, 16 Jan 2022 00:06:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220115152102.m47snsdrw2elagak@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_130609_472883_B0B8D2CB 
X-CRM114-Status: GOOD (  24.82  )
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

On 1/15/22 6:21 PM, Uwe Kleine-K=F6nig wrote:

[...]
>>>>>> The subsystems regulator, clk and gpio have the concept of a dummy
>>>>>> resource. For regulator, clk and gpio there is a semantic difference
>>>>>> between the regular _get() function and the _get_optional() variant.
>>>>>> (One might return the dummy resource, the other won't. Unfortunately
>>>>>> which one implements which isn't the same for these three.) The
>>>>>> difference between platform_get_irq() and platform_get_irq_optional(=
) is
>>>>>> only that the former might emit an error message and the later won't.
>>>>
>>>>    This is only a current difference but I'm still going to return 0 I=
SO
>>>> -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO t=
here
>>>> alone... :-)
>>>
>>> This would address a bit of the critic in my commit log. But as 0 isn't
>>> a dummy value like the dummy values that exist for clk, gpiod and
>>> regulator I still think that the naming is a bad idea because it's not
>>> in the spirit of the other *_get_optional functions.
>>>
>>> Seeing you say that -ENXIO is a bad return value for
>>> platform_get_irq_optional() and 0 should be used instead, I wonder why
>>> not changing platform_get_irq() to return 0 instead of -ENXIO, too.
>>> This question is for now only about a sensible semantic. That actually
>>> changing platform_get_irq() is probably harder than changing
>>> platform_get_irq_optional() is a different story.
>>>
>>> If only platform_get_irq_optional() is changed and given that the
>>> callers have to do something like:
>>>
>>>         if (this_irq_exists()):
>>>                 ... (e.g. request_irq)
>>>         else:
>>>                 ... (e.g. setup polling)
>>>
>>> I really think it's a bad idea that this_irq_exists() has to be
>>> different for platform_get_irq() vs. platform_get_irq_optional().
>>
>> For platform_get_irq(), the IRQ being absent is an error condition,
>> hence it should return an error code.
>> For platform_get_irq_optional(), the IRQ being absent is not an error
>> condition, hence it should not return an error code, and 0 is OK.
> =

> Please show a few examples how this simplifies the code. If it's only

   As for platform_get_irq(), returning -ENXIO simplifies things a lot: you=
 don't
have to check for 0 at every freaking call site and have s/th like (every
time!):

	irq =3D platform_get_irq();
	if (irq <=3D 0)
		return irq ?: -ENXIO; // any error code you choose

instead of just:

	irq =3D platform_get_irq();
	if (irq < 0)
		return irq;

This scales better in my book.

> that a driver has to check for =3D=3D 0 instead of =3D=3D -ENXIO, than th=
at's
> not a good enough motivation to make platform_get_irq_optional()
> different to platform_get_irq().

   Again, it scales better... good motivation in my eyes.

> Best regards
> Uwe

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
