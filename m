Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7C0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CB860FC0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50CB860FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT9oqiN5x2XFYuSdxDYc6RZgQRIxJcAzwM6VebnG/H0=; b=EIjxV0Z5Lku0/S
	p2Y+K/ISJtiv3IFlaCrdS2lEQ3rCPmqdqcL9ef3GkentO13l8ejpILiVdfJHMC62MNT/AOMUFnk5x
	4ww59AUtzhfBiBXDszTrXO6j2IiprsMj/U7tVATImfq/5wuau+eVPvuAkAwLNTZhbuvaWSBxlUnhD
	go09h0JHXk9sKTcx3xbTQV8VlIFy2SbZ0CHYIj9rkQXGF+bMoifa93xkMmzqL3++VbO8LMHvudiOA
	Guhc6phaco5Nj7VQlv0TZWSB4wNmxWOYBzBjT7/VmsphSA1Ya9QKolQjfxgrkge+v2sqsEqZqRbUN
	XD5RU7I/y/iUlVkAn2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4U9-00BFJs-Ue; Fri, 03 Sep 2021 08:23:41 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4Tv-00BFGg-WD
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 08:23:29 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 00DCC5C1FB7;
 Fri,  3 Sep 2021 10:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1630657403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=649dDLEsTpY20f1ujpD4Ab5GxIseeAzBCbsCN967yd0=;
 b=mD90OOChPsCYRklb3tv2eE3zeOCpGUJuCBEyZoaA69+HCnicdvw0D/XfIykaJsH3jR+rpx
 Z3l/XhF+SIfc+qvE7IYiICPo0lV2CDB64S1Uyb9QXiNkLPoHo+qJXuT0rU6J9nCG5RGW5a
 GALTdK7nKYlDJLtBytORL7Wptov1jzI=
MIME-Version: 1.0
Date: Fri, 03 Sep 2021 10:23:22 +0200
From: Stefan Agner <stefan@agner.ch>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: vf610: Make use of the helper function
 devm_platform_ioremap_resource()
In-Reply-To: <20210901074245.9583-1-caihuoqing@baidu.com>
References: <20210901074245.9583-1-caihuoqing@baidu.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <26cdf34dbda1327f60da32b9c29130a6@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_012328_525655_D7FFEC27 
X-CRM114-Status: GOOD (  14.33  )
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
>  drivers/mtd/nand/raw/vf610_nfc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index 40d70f991d89..a2b89b75073f 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -807,7 +807,6 @@ static const struct nand_controller_ops
> vf610_nfc_controller_ops = {
>  static int vf610_nfc_probe(struct platform_device *pdev)
>  {
>  	struct vf610_nfc *nfc;
> -	struct resource *res;
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
>  	struct device_node *child;
> @@ -831,8 +830,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  	if (irq <= 0)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->regs = devm_ioremap_resource(nfc->dev, res);
> +	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(nfc->regs))
>  		return PTR_ERR(nfc->regs);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
