Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20C7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=447yCZ8PnFFmVfr7H40fY9Du6HRO13xhW94EX4T/Ojw=; b=RPrFc85iwyOrXGT2Vfs8NvkPWq
	d+I5NaQAEZ1cscx1SPd3IY3PQ4GIAjYusAf4DT/sGEUOpS/b4H+ElREw7RoGCZyTW+WaMQZQj53gs
	5kvbSOAM2PUNPBoYD1n0cNh+Fxb7nrEd2+tJE8+iXUIrK/jvCr7+ZZxlC4i9SEGyQcMcBcpxnTWQO
	QmkEv9uXV2bLR1wVpsMlzKoXH7lsy1c8ALYvXhz6UgoC+/7D10sf6Mj3+F2ymM3Wcy4M4+x8WgFmQ
	7onh4VKrPNezN0WwtSHDuF6ZozCa4BgwyTzPLD2w7PKDToRcV/URqHBS9zBO+xKrHNuE20ah6d/Ri
	xXh4anqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8dg-00529o-63; Wed, 19 Jan 2022 10:56:28 +0000
Received: from mxout03.lancloud.ru ([45.84.86.113])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8da-00526A-OW; Wed, 19 Jan 2022 10:56:25 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru A788320EEBBF
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
 (summary)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, <kvm@vger.kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, <linux-iio@vger.kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>, "Guenter
 Roeck" <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-i2c@vger.kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-phy@lists.infradead.org>, Lee Jones
 <lee.jones@linaro.org>, Khuong Dinh <khuong@os.amperecomputing.com>, "Florian
 Fainelli" <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, "Tony Luck" <tony.luck@intel.com>, Kishon Vijay
 Abraham I <kishon@ti.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-serial@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-pwm@vger.kernel.org>, Robert
 Richter <rric@kernel.org>, "Saravanan Sekar" <sravanhome@gmail.com>, Corey
 Minyard <minyard@acm.org>, <linux-pm@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "John Garry" <john.garry@huawei.com>, Peter Korsgaard
 <peter@korsgaard.com>, "William Breathitt Gray" <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, <linux-gpio@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>, Takashi
 Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 <openipmi-developer@lists.sourceforge.net>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 "Richard Weinberger" <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 "Hans de Goede" <hdegoede@redhat.com>, <netdev@vger.kernel.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, Cornelia Huck
 <cohuck@redhat.com>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, James
 Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, Sebastian
 Reichel <sre@kernel.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, <linux-mediatek@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "David S. Miller" <davem@davemloft.net>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de> <YeQpWu2sUVOSaT9I@kroah.com>
 <20220118091819.zzxpffrxbckoxiys@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <b6038ec2-da4a-de92-b845-cac2be0efcd1@omp.ru>
Date: Wed, 19 Jan 2022 13:56:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220118091819.zzxpffrxbckoxiys@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_025623_180112_99F5C2C8 
X-CRM114-Status: GOOD (  15.79  )
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

On 1/18/22 12:18 PM, Uwe Kleine-K=F6nig wrote:
> On Sun, Jan 16, 2022 at 03:19:06PM +0100, Greg Kroah-Hartman wrote:
>> On Sat, Jan 15, 2022 at 07:36:43PM +0100, Uwe Kleine-K=F6nig wrote:
>>> A possible compromise: We can have both. We rename
>>> platform_get_irq_optional() to platform_get_irq_silent() (or
>>> platform_get_irq_silently() if this is preferred) and once all users are
>>> are changed (which can be done mechanically), we reintroduce a
>>> platform_get_irq_optional() with Sergey's suggested semantic (i.e.
>>> return 0 on not-found, no error message printking).
>>
>> Please do not do that as anyone trying to forward-port an old driver
>> will miss the abi change of functionality and get confused.  Make
>> build-breaking changes, if the way a function currently works is
>> changed in order to give people a chance.
> =

> Fine for me. I assume this is a Nack for Sergey's patch?

   Which patch do you mean? I'm starting to get really muddled... :-(

> Best regards
> Uwe

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
