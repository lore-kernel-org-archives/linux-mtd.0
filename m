Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8VNuK4mS9wTk2xJ9+6VoXjlANqYylXiGROh9l66k5kY=; b=ZBysm3wM5gUlSXb2ZpaskhLT9a
	7SBRQIELch9bI82u16eTJigvuaUv5m0bhkiwYF8MOnqH6Qqxi1mo9w6bzxTIU9wcMveja7iRrdJXE
	EAdOGEj4L8B4rXjAjbg23+J4VHLNGw+NXLh4Rjgo1Wzaa4SGA1nZzCWPYLArMHQAdGDQHZSsshan1
	aKuBS/fYXieDFC9dNAni4kiZMLyiihB8FrL/farMXQM5Uc/OUM0CBMNqdyUHGb/KvaEJOXm1nWj75
	Nc/91CRggzqeJ5VyfisIgRVBnpTl/jlBXQAluSR6u4lArPsFN+xY+H4JDkjLNXoIImDWz+SwuRVpQ
	4rv/t4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Qdy-00Ejhb-GE; Mon, 17 Jan 2022 11:57:50 +0000
Received: from mxout04.lancloud.ru ([45.84.86.114])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Qds-00EjeJ-RT; Mon, 17 Jan 2022 11:57:47 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 2B84620D27D1
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
 <minyard@acm.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, "William
 Breathitt Gray" <vilhelm.gray@gmail.com>, Khuong Dinh
 <khuong@os.amperecomputing.com>, Borislav Petkov <bp@alien8.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "James Morse" <james.morse@arm.com>, Robert Richter <rric@kernel.org>, Mun
 Yew Tham <mun.yew.tham@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, "Peter Korsgaard"
 <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Ulf Hansson
 <ulf.hansson@linaro.org>, Brian Norris <computersforpeace@gmail.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joakim Zhang
 <qiangqing.zhang@nxp.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Benson Leung <bleung@chromium.org>, "Guenter
 Roeck" <groeck@chromium.org>, Zha Qipeng <qipeng.zha@intel.com>, Hans de
 Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Saravanan
 Sekar <sravanhome@gmail.com>, Sebastian Reichel <sre@kernel.org>, John Garry
 <john.garry@huawei.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund@ragnatech.se>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Jiri Slaby
 <jirislaby@kernel.org>, Eric Auger <eric.auger@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <openipmi-developer@lists.sourceforge.net>,
 <linux-iio@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <kvm@vger.kernel.org>, <alsa-devel@alsa-project.org>, Matthias Schiffer
 <matthias.schiffer@ew.tq-group.com>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <770fb569-03c8-78f9-c174-94b31e866017@omp.ru>
Date: Mon, 17 Jan 2022 14:57:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220110195449.12448-2-s.shtylyov@omp.ru>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_035745_290483_27329FB0 
X-CRM114-Status: GOOD (  29.78  )
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

On 1/10/22 10:54 PM, Sergey Shtylyov wrote:

> This patch is based on the former Andy Shevchenko's patch:
> 
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
> 
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found. It prevents the callers from being
> error code agnostic in their error handling:
> 
> 	ret = platform_get_irq_optional(...);
> 	if (ret < 0 && ret != -ENXIO)
> 		return ret; // respect deferred probe
> 	if (ret > 0)
> 		...we get an IRQ...
> 
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available. Let's follow this good example, so that the
> callers would look like:
> 
> 	ret = platform_get_irq_optional(...);
> 	if (ret < 0)
> 		return ret;
> 	if (ret > 0)
> 		...we get an IRQ...
> 
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
[...]

   Please don't merge this as yet, I'm going thru this patch once again
and have already found some sloppy code. :-/

> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 7450904e330a..fdc63bfa5be4 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -382,12 +382,14 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>  	bt_bmc->irq = platform_get_irq_optional(pdev, 0);
>  	if (bt_bmc->irq < 0)
>  		return bt_bmc->irq;
> +	if (!bt_bmc->irq)
> +		return 0;

   Hm, this is sloppy. Will recast and rebase to the -next branch.

>  
>  	rc = devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED,
>  			      DEVICE_NAME, bt_bmc);
>  	if (rc < 0) {
>  		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> -		bt_bmc->irq = rc;
> +		bt_bmc->irq = 0;

   This change isn't needed...

>  		return rc;
>  	}
>  
[...]
> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> index 2ccd1db5e98f..0d1bdd27cd78 100644
> --- a/drivers/edac/xgene_edac.c
> +++ b/drivers/edac/xgene_edac.c
> @@ -1917,7 +1917,7 @@ static int xgene_edac_probe(struct platform_device *pdev)
>  
>  		for (i = 0; i < 3; i++) {
>  			irq = platform_get_irq_optional(pdev, i);

   Is *_optinal() even correct here?

> -			if (irq < 0) {
> +			if (irq <= 0) {
>  				dev_err(&pdev->dev, "No IRQ resource\n");
>  				rc = -EINVAL;
>  				goto out_err;
[...]
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index f75929783b94..ac222985efde 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -1521,7 +1521,7 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
>  
>  	/* check if you need to piggy back on the ctrlrdy irq */
>  	if (ctrl->edu_pending) {
> -		if (irq == ctrl->irq && ((int)ctrl->edu_irq >= 0))
> +		if (irq == ctrl->irq && ((int)ctrl->edu_irq > 0))

   Note to self: the cast to *int* isn't needed, the edu_irq field is *int* already...

[...]
> diff --git a/drivers/power/supply/mp2629_charger.c b/drivers/power/supply/mp2629_charger.c
> index bdf924b73e47..51289700a7ac 100644
> --- a/drivers/power/supply/mp2629_charger.c
> +++ b/drivers/power/supply/mp2629_charger.c
> @@ -581,9 +581,9 @@ static int mp2629_charger_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, charger);
>  
>  	irq = platform_get_irq_optional(to_platform_device(dev->parent), 0);

   Again, is *_optional() even correct here?

> -	if (irq < 0) {
> +	if (irq <= 0) {
>  		dev_err(dev, "get irq fail: %d\n", irq);
> -		return irq;
> +		return irq < 0 ? irq : -ENXIO;
>  	}
>  
>  	for (i = 0; i < MP2629_MAX_FIELD; i++) {
[...]
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 43eb25b167bc..776cfed4339c 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -430,7 +430,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>  
>  	for (i = 0; i < 2; i++) {
>  		irq = platform_get_irq_optional(pdev, i);
> -		if (irq < 0)
> +		if (irq <= 0)
>  			return irq;

   Sloppy code again? We shouldn't return 0...

[...]
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index 68a1c87066d7..cd7494933563 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -32,8 +32,12 @@ static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
>  static int get_platform_irq(struct vfio_platform_device *vdev, int i)
>  {
>  	struct platform_device *pdev = (struct platform_device *) vdev->opaque;
> +	int ret;
>  
> -	return platform_get_irq_optional(pdev, i);
> +	ret = platform_get_irq_optional(pdev, i);
> +	if (ret < 0)
> +		return ret;
> +	return ret > 0 ? ret : -ENXIO;

   Could be expressed more concisely:

	return ret ? : -ENXIO;

just like vfio_amba.c does it...

[...]

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
