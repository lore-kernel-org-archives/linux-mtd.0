Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D79C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/VvWtDKwz5tDjw8rr/ERAeJsOuTHmaJGiRKI63D9jTU=; b=mzrIqzTS7gfJT6jXjy/brOq5Ci
	3akxdTqsSB8VyJpXHdVB+W6v18wJt+FGG6GHBKxcXRWY8xH7Mlv9MiNczUfb0UNSBvBBp1eH/2ql8
	dOHrmKbHaJ8As2JiGbhs2Hn7V8rmWIZRFD9wlR7UIlq67Wzj/r5VuSBxGZ6p/471bVsa1Xijkfaje
	FWTDb4GEJkrDauFgjhAlAin05knFLcEqgO+3NuyUmY/JhV9yBZ5Q5yBEtEfVMk0+KigeX7AyfzuYF
	m4shNd0QrN0PZ7fpoLwFo4bFHIb2p08IN+c97oyni0vWP4P2/gNOY5RYM1IIweO9J/2V6s9G6PKHS
	1xYBQktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAFiO-006oje-Cy; Wed, 19 Jan 2022 18:29:48 +0000
Received: from mxout01.lancloud.ru ([45.84.86.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAFiI-006ofc-Qt; Wed, 19 Jan 2022 18:29:45 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru EF8112090480
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
CC: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, <linux-iio@vger.kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, "ALSA
 Development Mailing List" <alsa-devel@alsa-project.org>, Jaroslav Kysela
 <perex@perex.cz>, Guenter Roeck <groeck@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-phy@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Kamal Dasu <kdasu.kdev@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Lee Jones
 <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open
 list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 <platform-driver-x86@vger.kernel.org>, Linux PWM List
 <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, "Saravanan
 Sekar" <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, Linux PM list
 <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>, William Breathitt Gray
 <vilhelm.gray@gmail.com>, Mark Gross <markgross@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "Mark
 Brown" <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Takashi Iwai
 <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <openipmi-developer@lists.sourceforge.net>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <linux-edac@vger.kernel.org>, "Tony
 Luck" <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>, Mun Yew
 Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>, netdev
 <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>, "Linux MMC
 List" <linux-mmc@vger.kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "James
 Morse" <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, "Sebastian
 Reichel" <sre@kernel.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, <linux-mediatek@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>
References: <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
 <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
 <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
 <20220118120806.pbjsat4ulg3vnhsh@pengutronix.de>
 <CAMuHMdWkwV9XE_R5FZ=jPtDwLpDbEngG6+X2JmiDJCZJZvUjYA@mail.gmail.com>
 <20220118142945.6y3rmvzt44pjpr4z@pengutronix.de>
 <6370798a-7a7e-243d-99f9-09bf772ddbac@omp.ru>
Organization: Open Mobile Platform
Message-ID: <96ff907a-4ad2-5b2e-9bcc-09592d65a6df@omp.ru>
Date: Wed, 19 Jan 2022 21:29:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6370798a-7a7e-243d-99f9-09bf772ddbac@omp.ru>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_102943_261986_D758C455 
X-CRM114-Status: GOOD (  15.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/19/22 7:12 PM, Sergey Shtylyov wrote:

[...]
>>> So there's still a need for two functions.
>>
>> Or a single function not emitting an error message together with the
>> callers being responsible for calling dev_err().
>>
>> So the options in my preference order (first is best) are:
>>
>>  - Remove the printk from platform_get_irq() and remove
>>    platform_get_irq_optional();
> 
>    Strong NAK here:
> - dev_err() in our function saves a lot of (repeatable!) comments;

   s/comments/code/.
   Actually, I think I can accept the removal of dev_err_probe() in platform_get_irq()
as this is not a common practice anyway (yet? :-))...

> - we've already discussed that it's more optimal to check againt 0 than

   Against. :-)

>   against -ENXIO in the callers.

   And we also aim to be the error code agnostic in the callers...

>>  - Rename platform_get_irq_optional() to platform_get_irq_silently()
> 
>    NAK as well. We'd better off complaining about irq < 0 in this function.

>>  - Keep platform_get_irq_optional() as is
> 
>    NAK, it's suboptimal in the call sites.

   s/in/on/.

[...]

>> Best regards
>> Uwe

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
