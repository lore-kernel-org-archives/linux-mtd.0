Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09390C55185
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C23BC2071C
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aO39+Kk0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C23BC2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tg8QHg7xHkqRHWGbkYruzkWkTaAwi2lHk3prCdLr+HA=; b=aO39+Kk0z28C82
	JQh2HlWadOOtxPX4xSdihVQgaqX4YNZhdXD5al1C6/Xt8AYVITUzrhSYnh55wxdIuaU0u5YUEGrll
	9/761u5F4liC5OQtnI5HpurrQH0mJkKU1e2MMXKStfGILm3Vy+a3Zk2nHnpWWDWH45MnYA5jBmzyK
	uQ1tW11zi4/O0I8467atW/F1rIiO3cD1xAyz3I8CgjvSIeAIDhRvdM8/jK4fv16WxMeLIvKTOZhk2
	oqLbK6ZAidHfR6w/dHloTLo8iliQaeRYiLhraAzuapwJr8zZl4fQQFrx71euwdm5iLsCq5Jz9RIJF
	E57wU3/qF9uyx+VpeWcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSG7p-0004nT-SE; Sat, 25 Apr 2020 08:25:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSG7n-0004lv-Pd
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 08:25:25 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 744D72A2D79;
 Sat, 25 Apr 2020 09:25:22 +0100 (BST)
Date: Sat, 25 Apr 2020 10:25:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 5/9] mtd: rawnand: onfi: Define the number of
 parameter pages
Message-ID: <20200425102519.367cf1ea@collabora.com>
In-Reply-To: <20200424164042.26572-6-miquel.raynal@bootlin.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_012523_962165_24AEF20A 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 24 Apr 2020 18:40:38 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Use a macro to define the number of parameter page instead of
> hardcoding it everywhere.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_onfi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index 7d9a3130443a..9fe39adbde4c 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -16,6 +16,8 @@
>  
>  #include "internals.h"
>  
> +#define ONFI_PARAM_PAGES 3
> +
>  u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
>  {
>  	int i;
> @@ -156,7 +158,7 @@ int nand_onfi_detect(struct nand_chip *chip)
>  		return 0;
>  
>  	/* ONFI chip: allocate a buffer to hold its parameter page */
> -	p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
> +	p = kzalloc((sizeof(*p) * ONFI_PARAM_PAGES), GFP_KERNEL);
>  	if (!p)
>  		return -ENOMEM;
>  
> @@ -166,7 +168,7 @@ int nand_onfi_detect(struct nand_chip *chip)
>  		goto free_onfi_param_page;
>  	}
>  
> -	for (i = 0; i < 3; i++) {
> +	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
>  		ret = nand_read_data_op(chip, &p[i], sizeof(*p), true);
>  		if (ret) {
>  			ret = 0;
> @@ -181,8 +183,8 @@ int nand_onfi_detect(struct nand_chip *chip)
>  		}
>  	}
>  
> -	if (i == 3) {
> -		const void *srcbufs[3] = {p, p + 1, p + 2};
> +	if (i == ONFI_PARAM_PAGES) {
> +		const void *srcbufs[ONFI_PARAM_PAGES] = {p, p + 1, p + 2};
>  

Maybe initialize the srcbufs array using a for loop so you can easily
change ONFI_PARAM_PAGES without having to touch the code. Looks good
otherwise, so

Reviewed-by: Boris Breillon <boris.brezillon@collabora.com>

>  		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
>  		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
