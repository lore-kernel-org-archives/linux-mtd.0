Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t+ns+tujv0cM1k1IEzIe5Z4QO4VctHLCz7DWS0Pojqs=; b=ud9/aQwa+a+kXbzoQxvszeEHZ3
	MirHCnUbQgWbw/gj/7FpQ9eXRmxbVgiKbdhZDxnvg+1539J83Un3UycxVLgwEFdy55jSp3TOsnq6K
	4angGjoNzd+xXu9aEzQUeg0vIgiOUGhdXda9ZZjIOrGDCT8fU21CvP//5lyHvQImsfNrQGdRq3HCw
	uWlkVXzxA1OgW7vOzTHsPaIZB5OnZ3sn7WV1KPMpPMnZJTAusKtcX0GukZ7WpVb/7EaT5KZLGlIAA
	SnBVU+bfKTaHIGng0oNV05dyzyTHuuPzQ19p0QIhMApOrCxsw9vEqqTREnEL4voEb6E8uXDoQqG/s
	5/Ipr85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA9M6-005DCt-Sz; Wed, 19 Jan 2022 11:42:22 +0000
Received: from mxout04.lancloud.ru ([45.84.86.114])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA9M1-005DBc-PI; Wed, 19 Jan 2022 11:42:19 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 385F120D1C64
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
 (summary)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn
 <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, <kvm@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-iio@vger.kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 <alsa-devel@alsa-project.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 <linux-phy@lists.infradead.org>, <linux-spi@vger.kernel.org>, Lee Jones
 <lee.jones@linaro.org>, <openipmi-developer@lists.sourceforge.net>, "Khuong
 Dinh" <khuong@os.amperecomputing.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>, Kamal Dasu <kdasu.kdev@gmail.com>, "Jiri
 Slaby" <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 <bcm-kernel-feedback-list@broadcom.com>, <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, "Jaroslav
 Kysela" <perex@perex.cz>, <linux-pwm@vger.kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 <linux-pm@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "John
 Garry" <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 "William Breathitt Gray" <vilhelm.gray@gmail.com>, Mark Gross
 <markgross@kernel.org>, <linux-gpio@vger.kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>, Borislav
 Petkov <bp@alien8.de>, "Sebastian Reichel" <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Takashi Iwai" <tiwai@suse.com>,
 <platform-driver-x86@vger.kernel.org>, Benson Leung <bleung@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-edac@vger.kernel.org>, Tony
 Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger
 <eric.auger@redhat.com>, <netdev@vger.kernel.org>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Cornelia Huck <cohuck@redhat.com>,
 <linux-mmc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, James Morse <james.morse@arm.com>, Zha Qipeng
 <qipeng.zha@intel.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, <linux-mediatek@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de> <YeQpWu2sUVOSaT9I@kroah.com>
 <20220118091819.zzxpffrxbckoxiys@pengutronix.de>
 <b6038ec2-da4a-de92-b845-cac2be0efcd1@omp.ru>
 <20220119113314.tpqfdgi6nurmzfun@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a42e1c8b-2c3d-e3f2-e48c-ad145322ad3d@omp.ru>
Date: Wed, 19 Jan 2022 14:42:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220119113314.tpqfdgi6nurmzfun@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_034218_207935_79A26F05 
X-CRM114-Status: GOOD (  16.05  )
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

On 1/19/22 2:33 PM, Uwe Kleine-K=F6nig wrote:

[...]
>>>>> A possible compromise: We can have both. We rename
>>>>> platform_get_irq_optional() to platform_get_irq_silent() (or
>>>>> platform_get_irq_silently() if this is preferred) and once all users =
are
>>>>> are changed (which can be done mechanically), we reintroduce a
>>>>> platform_get_irq_optional() with Sergey's suggested semantic (i.e.
>>>>> return 0 on not-found, no error message printking).
>>>>
>>>> Please do not do that as anyone trying to forward-port an old driver
>>>> will miss the abi change of functionality and get confused.  Make
>>>> build-breaking changes, if the way a function currently works is
>>>> changed in order to give people a chance.
>>>
>>> Fine for me. I assume this is a Nack for Sergey's patch?
>>
>>    Which patch do you mean? I'm starting to get really muddled... :-(
> =

> I'm talking about "[PATCH 1/2] platform: make
> platform_get_irq_optional() optional"

   I thought GregKH was talking about your renaming patch... :-/

> because "trying to forward-port an
> old driver will miss the abi" applies to it.

   Mhm... why not tell me right from the start? Jr even tell that to Andy
instead of merging his patch, so I wouldn't get sucked into this work? =

I wouldn't bother with v2 and it would have saved a lot of time spent on
email... :-(
   Do we also remember that "the stable API is a nonsense" thing? :-)

> Best regards
> Uwe

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
