Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8739C38A30
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9FB206D9
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 06:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tBEEN4eU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9FB206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrLznBziJR2UiAAc3C7idWnGWnTadytnGCf3XD+0pig=; b=tBEEN4eURkYqSb
	3Dc6ggV1eBVOuvvcRHPyuDQG7KxmWvIRDFvv3U/My61Y4lHapKp+xBZPhuZ6D1GnaQr0AvbpiD/Oo
	t6SX2VcQTt4JXRG8SN4d3Zbs8RgkAeYU5f/frvsM6v7oMkHjccKOIagqY00mi5+7DY/ySVe6eeW8A
	kocbgW+CiQDgTaQIbUEYLF1ddx8/1GMQBI8p0hSBSaBPzrFSrvJtaJa3uEqX4RxoQllywE1pMy8Qh
	YR2WSmWUaWeKFCQAE9lLapq8DF41N22EyuTHehV0oTv/GYFM86tRzf9JfT9rlUTV5zNuLEMf+ztm7
	tG4sO15ZaAyJKR2QpAbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9ET-0003Ra-Gj; Wed, 22 Apr 2020 06:51:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9EQ-0003QA-5F
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 06:51:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CFA9B2A1914;
 Wed, 22 Apr 2020 07:51:35 +0100 (BST)
Date: Wed, 22 Apr 2020 08:51:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/8] mtd: rawnand: onfi: Use an intermediate variable to
 decomplefixy conditions
Message-ID: <20200422085132.4d7b2960@collabora.com>
In-Reply-To: <20200421164637.8086-5-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_235138_330872_C2F2AC6C 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:46:33 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Before reworking a little bit the ONFI detection code, let's
> decomplefixy the if statements.

It's more about coding style/formatting than complexity, but the change
improves readability indeed, so

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_onfi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index 8fe8d7bdd203..7d9a3130443a 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -146,6 +146,7 @@ int nand_onfi_detect(struct nand_chip *chip)
>  	int onfi_version = 0;
>  	char id[4];
>  	int i, ret, val;
> +	u16 crc;
>  
>  	memorg = nanddev_get_memorg(&chip->base);
>  
> @@ -172,8 +173,8 @@ int nand_onfi_detect(struct nand_chip *chip)
>  			goto free_onfi_param_page;
>  		}
>  
> -		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) ==
> -		    le16_to_cpu(p[i].crc)) {
> +		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254);
> +		if (crc == le16_to_cpu(p[i].crc)) {
>  			if (i)
>  				memcpy(p, &p[i], sizeof(*p));
>  			break;
> @@ -187,8 +188,8 @@ int nand_onfi_detect(struct nand_chip *chip)
>  		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
>  				       sizeof(*p));
>  
> -		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=
> -				le16_to_cpu(p->crc)) {
> +		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254);
> +		if (crc != le16_to_cpu(p->crc)) {
>  			pr_err("ONFI parameter recovery failed, aborting\n");
>  			goto free_onfi_param_page;
>  		}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
