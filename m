Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9329DD59D6F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eUqOxIZVX94u3/sn2IPb9cBa4O3TYcPFhvujxGuFXI=; b=3MDlthKmuFc9JB
	q4YYR/HM4AeJQlJceEeGsYsaCtWvPkSD+Gc2e39TiRWRntkLYU9kInqdcJYb0+L7gPe/7FeHObHyV
	UvFy/4JBRnL+Voa41SawPJQ3XYoVNxwVoxLDspfJQHrrdUMrYsRFIyxCT7tN0MjSM199caGpHbNIS
	tDVFydu8hDxXpGgA2Ye/EVtvx0yqjyeXyB3bSmZCGd446r3bJB6Idvl7I5JWbGH63qkUNAMCC85Dn
	HCRnc+NVwMFCGHRT73hJC01ke3imwDp1Wo5YAe4NPZp+K3njFQiTpXR0IljxYZFZjxAQaeQOEcMdm
	miOLhdDmKlBcGvTgh5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU75Z-00000000tzz-2vBx;
	Fri, 12 Dec 2025 17:37:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU75V-00000000tyy-1tEX
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 17:37:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 466DCC19356;
	Fri, 12 Dec 2025 17:37:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3824A606DF;
	Fri, 12 Dec 2025 17:37:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBEF0103C8DEA;
	Fri, 12 Dec 2025 18:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765561067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+2hXAzMg48p6R/oXqTisskWAXxrhQhyyLNcBJNRfGbw=;
	b=ONA4zBLST0UPgrjhOK1FkmRyKgcNYBVB39ZgJDyVXUFHYUmaL4k7v0LSjjqDeXH+0DhZlN
	NgVJTCSVmvnygDvT4Iq4aYa520G0xW5iggHttbxBT+X7X4is3qhZNUas/YNB+UUg0vgymA
	Rt8GcKYWANQRWjlafDefvLVoTwMpcTJ1b4jEWnK01qw827ThvCvEI9/7XxHkQvTIREdF1g
	pTQgyI0VXbEOXN79EC8cawAE32gEIcQDlErxtkuPC62CNoWMomBXkvvNilM38f2vpicnIA
	byBPfFNaqPVuUp3bkW+SLcjLpC6ZsYu0g4tn32qSZd8VgvQfrvaeT1WJL3Yklg==
Date: Fri, 12 Dec 2025 18:37:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] at91: Remove of_platform_default_populate() calls
Message-ID: <202512121737447cdf2224@mail.local>
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_093753_835863_538D3D35 
X-CRM114-Status: GOOD (  14.78  )
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

On 20/11/2025 15:37:49-0600, Rob Herring (Arm) wrote:
> This is another attempt at removing of_platform_default_populate() calls 
> on at91 platforms. The last attempts were in 2018[1] and 2023[2]. The 
> problems reported are PM and NAND failures. Both of these depend on SRAM 
> pool which doesn't have any fw_devlink tracking. Also, the PM code is 
> not a driver, so fw_devlink wouldn't help. For the NAND driver, we can 
> simply defer probe. For the PM init, we can move it to the .late_init 
> hook.
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20180712192222.32481-1-robh@kernel.org/
> [2] https://lore.kernel.org/all/3908fa6f-dc33-4aac-c21f-4a676a3a6b23@microchip.com/
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For the whole series:

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

I tested on at91rm9200, at91sam9m10 and sama5d3 which is a
representative sample of the older platforms.

I tested suspend/resume successfully on at91sam9m10 and sama5d3.
at91rm9200 is not waking up but this is not caused by the series.


> ---
> Rob Herring (1):
>       ARM: at91: Move PM init functions to .init_late hook
> 
> Rob Herring (Arm) (2):
>       mtd: nand: atmel: Defer probe if SRAM is missing
>       ARM: at91: remove unnecessary of_platform_default_populate calls
> 
>  arch/arm/mach-at91/at91rm9200.c              | 12 +-----------
>  arch/arm/mach-at91/at91sam9.c                | 12 +-----------
>  arch/arm/mach-at91/sam9x60.c                 | 12 +-----------
>  arch/arm/mach-at91/sam9x7.c                  | 12 +-----------
>  arch/arm/mach-at91/sama5.c                   | 21 +++------------------
>  arch/arm/mach-at91/sama7.c                   | 11 +----------
>  drivers/mtd/nand/raw/atmel/nand-controller.c |  2 +-
>  7 files changed, 9 insertions(+), 73 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251120-at91-probe-20fbce9a6d1b
> 
> Best regards,
> --  
> Rob Herring (Arm) <robh@kernel.org>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
