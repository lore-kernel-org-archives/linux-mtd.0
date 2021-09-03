Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE81C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C1B60FC0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C1B60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFrNeuz7u04jSDxRhzKXfFYOB59mg6z9nOo8bpM9s8s=; b=XsdVfRSKekJaLs
	EYyXXBFMZePG9f2L3hl05YI/hdWE5rfsyHvCwVh2zJl5TLpfSoMziEk6RUQuVmtUcGNxuIkpCz+ZO
	q76coQSO12OJQh9MKQAU/tytEIxDepFeJy/aIKiyH4+VH+W64sZnrksH8j0pcGVeZHAm2FvkHTSI6
	hZrmkt0+A+tN5C648eJZKF0KrVIDMzszl6aJln/MPlVKeRb8SinFnFHXaVnC0SHeKoIOMs7mkluG1
	l6aivXn3c1jILRLGFRuWW8ABtSxnScXehaPU4IBrP82X5Kfy4+GOuoFG2pExABMZ0QuhzCVWc/S/y
	H9n3Eo8jvDU49zSnn9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4Uc-00BFR5-0p; Fri, 03 Sep 2021 08:24:10 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4UF-00BFKu-Ua
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 08:23:49 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 40DB15C0222;
 Fri,  3 Sep 2021 10:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1630657426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjLOEiXgMndi2Q7uZCMxj1Uu2i4mPZJaKSRzdIFBuTQ=;
 b=T/cjSSjNuV1c5iAHsIX3UEBP41pp58INL2FhGpdroivJwC/W88r2CIGqkTVc5KHRp2gflq
 fXGWBSJgRnR+n8v4eFDJcqT2GWdgSjge9OEX0+1cDnxr9zQF19kle6KCZxVtvArhFbOHJP
 zevChd2TLYExLz8D8f/TXTpkdjYxTYI=
MIME-Version: 1.0
Date: Fri, 03 Sep 2021 10:23:45 +0200
From: Stefan Agner <stefan@agner.ch>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: Make use of the helper function
 devm_platform_ioremap_resource()
In-Reply-To: <20210901074230.9483-1-caihuoqing@baidu.com>
References: <20210901074230.9483-1-caihuoqing@baidu.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <fb7aec944e72f91a9a33d7d37d0cbb44@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_012348_188387_3A51C06B 
X-CRM114-Status: GOOD (  13.81  )
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

On 2021-09-01 09:42, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> b/drivers/mtd/nand/raw/tegra_nand.c
> index fbf67722a049..32431bbe69b8 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -1144,7 +1144,6 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  {
>  	struct reset_control *rst;
>  	struct tegra_nand_controller *ctrl;
> -	struct resource *res;
>  	int err = 0;
>  
>  	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> @@ -1155,8 +1154,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  	nand_controller_init(&ctrl->controller);
>  	ctrl->controller.ops = &tegra_nand_controller_ops;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctrl->regs = devm_ioremap_resource(&pdev->dev, res);
> +	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctrl->regs))
>  		return PTR_ERR(ctrl->regs);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
