Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cmoWpaiNvnTqZDoBP89oskQL399MwxglNg9Ds8JprHA=; b=Znpq1wicmmzPUTe6zWbT25a5cn
	yxJkuDAhuFMTV0dnPDseCS2bxNe6dllhjLyvddta2glo3LhyZ89eXMagn78f48fY/3U8PnbNslh9W
	dBFbu6CeTisAmGw43JIoRkgqz711RicVW9X9vmYAvIay4vAmgKee/EK1XfKaiTXJyn7LhwW9fkfVo
	ayQH7rDc+RTsW5QG5vOamz9H8rSQQ+rIvZRjs2FG2mLU+lMe1imgOxWFmx+lnxO2Gzfs0vQ+Sfksn
	yiEwrMNv7sC/69OgX7PfPUcyvJD9ItvX6SI6qjRvRSOoEt/UK25bb5/khdB+Jgu3BC6fvO6yMI8iS
	2vRuicdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAVbK-00B43Y-1X; Thu, 20 Jan 2022 11:27:34 +0000
Received: from mxout01.lancloud.ru ([45.84.86.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAVbE-00B40J-0o; Thu, 20 Jan 2022 11:27:30 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru BF82F20E4C10
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
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
References: <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
Organization: Open Mobile Platform
Message-ID: <b8fda2ae-07b7-af30-2b0d-213a60a7b802@omp.ru>
Date: Thu, 20 Jan 2022 14:27:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_032728_496726_62296D20 
X-CRM114-Status: GOOD (  20.31  )
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

On 1/17/22 4:08 PM, Geert Uytterhoeven wrote:

[...]
>>> But as we were all in a hurry to kill the non-applicable error
>>> message, we went for the quick and dirty fix.
>>>
>>>> Also I fail to see how a caller of (today's) platform_get_irq_optional()
>>>> is simpler than a caller of platform_get_irq() given that there is no
>>>> semantic difference between the two. Please show me a single
>>>> conversion from platform_get_irq to platform_get_irq_optional that
>>>> yielded a simplification.
>>>
>>> That's exactly why we want to change the latter to return 0 ;-)
>>
>> OK. So you agree to my statement "The reason for
>> platform_get_irq_optional()'s existence is just that platform_get_irq()
>> emits an error message [...]". Actually you don't want to oppose but
>> say: It's unfortunate that the silent variant of platform_get_irq() took
>> the obvious name of a function that could have an improved return code
>> semantic.
>>
>> So my suggestion to rename todays platform_get_irq_optional() to
>> platform_get_irq_silently() and then introducing
>> platform_get_irq_optional() with your suggested semantic seems
>> intriguing and straigt forward to me.
> 
> I don't really see the point of needing platform_get_irq_silently(),
> unless as an intermediary step, where it's going to be removed again
> once the conversion has completed.
> Still, the rename would touch all users at once anyway.
> 
>> Another thought: platform_get_irq emits an error message for all
>> problems. Wouldn't it be consistent to let platform_get_irq_optional()
>> emit an error message for all problems but "not found"?
>> Alternatively remove the error printk from platform_get_irq().
> 
> Yes, all problems but not found are real errors.

   ACK for using dev_err_probe() in platfrom_get_irq_optional()
for the real errors...
   I've also noted that only platfrom_get_irq_optional() got converted
from dev_err() to dev_err_probe() but not platfrom_get_irq_byname_optional()...

[...]

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
