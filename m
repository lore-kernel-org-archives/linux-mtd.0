Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E23C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6Z8C1I+oUE4byLgQsBdpOy4YNbBz2VkgXl0En3E4XQ=; b=Lc6/BPvIJoiGm2k/cAaWyz8St/
	5lafXF7Ks839dmGKhd8G308UBcFHUjy7PmtsmCJnDTb7JZsD1EbXi+MmndQFYJEp1s4Qp81Vu2doZ
	UEtKLyBiFkYZGLSoodPuua7HGVV4p8ko9SkdF878gqK390GUpme8U9e4EuZRvJPP1PVFyPpTwRYt2
	hupTK1zArp9c1AxIVKXBLpXyCudmLq+AH3FjAFQ/qvfYxJzDiufsc9JRPp4XpTD5seslpiPd3fiSO
	emIaiDuGnbYiF9Hkf55PL03U/We/gswPySeWGjxP/ojSFUJ6E7eBQBuZ2f4sJiPvsbCFdpfslBHcg
	ue7+zTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7acP-002RH5-2j;
	Mon, 27 Nov 2023 12:21:41 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7acN-002RGU-1Z
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 12:21:40 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0310D132;
	Mon, 27 Nov 2023 13:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701087695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zslr1ut2taOeO91dxL0vKQz91NPoahm00wOyq9ct6s=;
	b=Rot1IZRol9KdY7VvUAr23BobQs+h8bw2dFjiB8naCPYg2hZEfIMq70F9XSa7PayYxMJAXM
	FoYbrbgGmEFzr3NCdZ7KPtxSyajt6BycbBeKxDN5BuXoXIBqJJiS6tcxeH2k74Q4jjnnjr
	XxR6AEqwfNr0m2qUeATQLvAijvNj7EGXwTQHu6GhbZNAbMX9e6w0TlE0JB93UgpRwBKHAQ
	3Fz+thkRyDTJfxhS3Vkgr0MiX5Syr/n53ek4DQF/KUoPa+DvfcDkVpZyOrDh9TE9/05ZwX
	Qv74GlsW1vKt33yevMXqWdHteSv/4Zv+42dKpAqaoY4Vkeo7SNgs0sa0MK7RVA==
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 13:21:34 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name
 does not exist
In-Reply-To: <20231127100756.41605-3-jaimeliao.tw@gmail.com>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127100756.41605-3-jaimeliao.tw@gmail.com>
Message-ID: <6d362dd698095b04dd895019d3af26d0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_042139_680482_74603F1A 
X-CRM114-Status: GOOD (  14.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> (null) will print when flash ID founded in ID table but
> the flash name didn't include in it.
> 
> Make info->name optional in the print for showing flash name
> and flash size.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..73405bed2a5a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3518,7 +3518,7 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	/* No mtd_info fields should be used up to this point. */
>  	spi_nor_set_mtd_info(nor);
> 
> -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> +	dev_info(dev, "%s (%lld Kbytes)\n", info->name ?: "",

Maybe print the jedec id if the name is empty.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
