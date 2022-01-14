Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D227C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3OQxLUFf4aUxCOlN08FM6j1o2gpmCy6Wq3E2AfK35HA=; b=wBBWglC+sGZ5B8OA8brTtsFt0t
	dQvgwJGPWBIhaxZDJjs3J/8rJ4aNj1rvME59+vLMpRWsyT0sUtpO21x/v9eX6sjJPKen1q24Lw1c5
	OwNQr3cATiDvOCBCPsLq8geEiFVU6bbOvCyP6+18HpsG1jewdeLUgGMztGTXZZk0zjxBggFnEDd8k
	qsOFCoVaLyFsGVlsxHY31AJIMPspqvs7HQKb/BSorXMfT59DtbYnKV4Su41V/yJVU1q7PRoIJhxSx
	xrQt28k3FfCMECwKGivqZd3P+FijFJETnmrn4/+paV9g/fDDMQKJXQRFRgDenTAKm2bBvAzOFDkyd
	UdXNilMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Rac-00A2uo-1y; Fri, 14 Jan 2022 18:46:18 +0000
Received: from mxout02.lancloud.ru ([45.84.86.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8RaX-00A2tW-43; Fri, 14 Jan 2022 18:46:15 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru CB087207210C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-iio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Amit
 Kucheria" <amitk@kernel.org>, ALSA Development Mailing List
 <alsa-devel@alsa-project.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-phy@lists.infradead.org>,
 <netdev@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, <openipmi-developer@lists.sourceforge.net>, "Khuong
 Dinh" <khuong@os.amperecomputing.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Kamal Dasu <kdasu.kdev@gmail.com>, "Lee
 Jones" <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open
 list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Linux PWM List <linux-pwm@vger.kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, Linux PM list
 <linux-pm@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "John
 Garry" <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 "William Breathitt Gray" <vilhelm.gray@gmail.com>, Mark Gross
 <markgross@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "Sebastian Reichel" <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "Takashi Iwai" <tiwai@suse.com>,
 <platform-driver-x86@vger.kernel.org>, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Mun Yew Tham
 <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Cornelia Huck <cohuck@redhat.com>, "Linux
 MMC List" <linux-mmc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "James
 Morse" <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 <linux-mediatek@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "David S. Miller" <davem@davemloft.net>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3a6b7348-ffcf-e26a-1874-830e78ae2d57@omp.ru>
Date: Fri, 14 Jan 2022 21:46:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_104613_572912_A31172C2 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On 1/13/22 11:35 PM, Sergey Shtylyov wrote:

[...]
>> (Do we really need *all* the CCs here?)
> 
>    Yeah, 25 files were changed and that resulted in 75 persons/lists addressed.
> I didn't expect such a wide audience myself... :-)

   And, of course, I specified --nogit-fallback to scripts/get_maintainers.pl, so
there's no random people...

[...]

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
