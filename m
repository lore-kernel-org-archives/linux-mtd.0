Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23821C5B572
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2026 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebKQnDUhpYS6Y6NQmcXCV/rD961GPjKF+3MD+RfCC3k=; b=ocekVmvJSAmXfQ
	vhPlB1CNxnAuH3/HNMWV/otVW/xQMpod2iFb178W1WzQBiK4PM0W02i5KsaChKdS4RIiq4koQXrUC
	CIFuinfkyoHt4+2EtbZMnSrTAesezUmfVoVEFBda6BlutUF+0ksFdX0iLr+jf6RLXWd4ZW5aLOE3V
	E/RLwTgxaMjTbQYTzeA3Y5+L8jiHcPr0UIQ4t+ZVpilSZxoFTmhKBJraREPwShLlykBGVVduS1Gwr
	GrpBWZ5thRENtPW9bUce3clsQe7TpmWO2K1HvYqu9zXlXmzY2/5CG3Adn9fl2QJpxRNmnImr4VvN2
	ECAtBwwyzopGDiAMwJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYto-00000004htH-2ZYS;
	Sun, 16 Aug 2026 11:19:32 +0000
Received: from submarine.notk.org ([62.210.214.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYtl-00000004hsf-1ej6
	for linux-mtd@lists.infradead.org;
	Sun, 16 Aug 2026 11:19:31 +0000
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 9BECC14C2D6;
	Sun, 16 Aug 2026 13:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1786879162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3v8MA1w26DHXvbEfHlFOLgAI0VEXKENl933YCR6Cw6Y=;
	b=o5PTRdNf9ZjXx61BQ0JFv4b+/kBdH8j+RkYDrVkXcqefwNpIsosjEcbImJFTiOFxkz6W8Y
	pBU3rC77rk47QTTiSRs6tAunU0eZg7ZiRj+/gxHSmMei1VMFn1fo2GdMzyFSyIB670L0f5
	ilo58mAd+YW52CS57mP0MQzlvRxJgEqeJFRLCBX/r2AMGtxjLFOHr6hLiQzRj380OL8OEF
	C0cgVJ6DSF1fGQ4rtYcgEOYDnNwAi1O5CcvnU4hRj28wKHRQUh59xBCFFIpJi/AMX/14vr
	xCU8YKCe4hT1y6MxWIyzJ0uavZPfB+mPfCwnj4aRNCXdbCR2eAd8UDei0j62ew==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 91dbc645;
	Sun, 16 Aug 2026 11:19:17 +0000 (UTC)
Date: Sun, 16 Aug 2026 20:19:02 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Huasin Liao <huasinliao@gmail.com>
Cc: miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
	tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, huasin.liao@airoha.com
Subject: Re: [PATCH] mtd: spinand: winbond: add support for W25N04LV
Message-ID: <aoGcpsZFxXdtkspZ@codewreck.org>
References: <20260816093124.12325-1-huasinliao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816093124.12325-1-huasinliao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_041929_845194_537B9AC1 
X-CRM114-Status: GOOD (  12.79  )
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

Huasin Liao wrote on Sun, Aug 16, 2026 at 05:31:24PM +0800:
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 9b78c1e6cbc9..892220a12b22 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -345,6 +345,35 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
>  	.free = w25n02kv_ooblayout_free,
>  };
>  
> +static int w25n04lv_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *region)
> +{
> +	if (section > 7)
> +		return -ERANGE;
> +
> +	region->offset = 128 + (16 * section);
> +	region->length = 13;
> +
> +	return 0;
> +}
> +
> +static int w25n04lv_ooblayout_free(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
> +{
> +	if (section > 7)
> +		return -ERANGE;
> +
> +	region->offset = (16 * section) + 2;
> +	region->length = 14;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops w25n04lv_ooblayout = {
> +	.ecc = w25n04lv_ooblayout_ecc,
> +	.free = w25n04lv_ooblayout_free,

FWIW, these two are the same as what I consolidated in
https://lore.kernel.org/r/20260814-w25n04lw-v3-1-c6a7423ac7d0@atmark-techno.com
using oobsize, so we probably want to reuse that here too

(Should I split the patch?)

-- 
Dominique Martinet | Asmadeus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
