Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAD3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=anTa8x2Kjy3CVyRR47RqouXGVOMcVPSBi3/7oeoYzQg=; b=yq7kN3xTNLvM4PhtNHomzxlv1b
	aEEy6yx1ZnmDT1pTYyuIu/7Gla8FVimQsLVFLpO84sntgQ1NqCtN+DWOS7+f99sSRyXpGaEW0/tJA
	vaG4bsIu5nZpOhtKokoUAArkYQKD4gk1GJUpNYVXkSP3PEKU6fZ8CHtxke9sl/UJIdEGc8PRvoPas
	GAuqxrzMvUjclqArayL8ZFwtdpSvIC0zkQwYstbmny40HsxoKxqyZvlX+iFmqSGKvqkbojtqRdTUH
	7rG7eo5O3zykdQQ/NabEmn3bDrODb5ni/MaltVacqrPRMyJG+fd6k/N90K3quo4xNfvapCC3v8qEf
	TJ3i4TGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Kqq-008wkb-Sz; Fri, 14 Jan 2022 11:34:36 +0000
Received: from mxout04.lancloud.ru ([45.84.86.114])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Kqj-008wh3-Fe; Fri, 14 Jan 2022 11:34:31 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru F263B20CE313
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
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
 <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>, "Borislav
 Petkov" <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai
 <tiwai@suse.com>, <platform-driver-x86@vger.kernel.org>, Benson Leung
 <bleung@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, Mun Yew Tham <mun.yew.tham@intel.com>, "Eric
 Auger" <eric.auger@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "open list:GPIO SUBSYSTEM"
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
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fba81d0d-c7e3-394d-5929-1706ac9ef5b7@omp.ru>
Date: Fri, 14 Jan 2022 14:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_033429_918155_462936F7 
X-CRM114-Status: GOOD (  15.97  )
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

On 1/13/22 11:57 PM, Sergey Shtylyov wrote:

>>> The subsystems regulator, clk and gpio have the concept of a dummy
>>> resource. For regulator, clk and gpio there is a semantic difference
>>> between the regular _get() function and the _get_optional() variant.
>>> (One might return the dummy resource, the other won't. Unfortunately
>>> which one implements which isn't the same for these three.) The
>>> difference between platform_get_irq() and platform_get_irq_optional() is
>>> only that the former might emit an error message and the later won't.
> 
>    This is only a current difference but I'm still going to return 0 ISO
> -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO there

   platform.

> alone... :-)
> 
>> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
>    Hm... I'm seeing a tag bit not seeing the patch itself...

   Grr, my mail server tossed it into the spam folder... :-(

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
