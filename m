Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFE4C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 874D0206B7
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbOJxB/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 874D0206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD1rZqM/T6KN2IZSo9KYXDhxfFjwQRbYmNlNVRAo/I0=; b=ZbOJxB/Yd31UdC
	kfg3/AzwmQxiD92C+io/CNxR6+4yq855K6fXOTLXcvUWkjaA7hMw0cgUFPN8qGpewz1K1wrSvJxN7
	D5obI2R68LFFWJa4je+9bdizEyyYJWckciwmSoIXd3lKpmZvvnyP/Ge9vgNknydNAjDUI9PbyQ2kW
	svTRd9w28kTVQqnCCyB9iRGvTdp251SIDNlDGLmLu88F3Hyh16EJr4VShGTgGwY0MhLN/tmCJ1obQ
	v7d0H1fTABQ3SrwUhi0X8oJaOyVWgh+ApQsWOr1IFLnHBtbPan+mNd7K1h9fyn+ZlbzcXYUwvHxAU
	wBoc6iS+gQ1uVnnHMKxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAYfI-0001mX-5S; Sun, 31 Mar 2019 11:30:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAYf8-0001A9-Nf; Sun, 31 Mar 2019 11:30:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0A09126128E;
 Sun, 31 Mar 2019 12:30:05 +0100 (BST)
Date: Sun, 31 Mar 2019 13:30:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 06/36] mtd: nand: Rename a core structure
Message-ID: <20190331133001.7b313cf0@collabora.com>
In-Reply-To: <20190304222841.13899-7-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-7-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_043006_904015_6FA96772 
X-CRM114-Status: GOOD (  18.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 23:28:11 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Prepare the migration to a generic ECC engine by renaming the
> nand_ecc_req structure into nand_ecc_conf. This structure will be the
> base of a wider 'nand_ecc' structure.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/nand.h    | 8 ++++----
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 84ab76f34c74..78cf905083c9 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -123,11 +123,11 @@ struct nand_page_io_req {
>  };
>  
>  /**
> - * struct nand_ecc_req - NAND ECC requirements
> + * struct nand_ecc_conf - NAND ECC configuration

Maybe nand_ecc_info, nand_ecc_caps or nand_ecc_props would be more
appropriate as _conf seems to imply you can change it, which is not
the case when you use this struct to express chip requirements or when
you use an on-die ECC which is not configurable.

>   * @strength: ECC strength
> - * @step_size: ECC step/block size
> + * @step_size: Number of bytes per step
>   */
> -struct nand_ecc_req {
> +struct nand_ecc_conf {
>  	unsigned int strength;
>  	unsigned int step_size;
>  };
> @@ -186,7 +186,7 @@ struct nand_ops {
>  struct nand_device {
>  	struct mtd_info mtd;
>  	struct nand_memory_organization memorg;
> -	struct nand_ecc_req eccreq;
> +	struct nand_ecc_conf eccreq;
>  	struct nand_row_converter rowconv;
>  	struct nand_bbt bbt;
>  	const struct nand_ops *ops;
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index b92e2aa955b6..3008de54f958 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -263,7 +263,7 @@ struct spinand_info {
>  	u8 devid;
>  	u32 flags;
>  	struct nand_memory_organization memorg;
> -	struct nand_ecc_req eccreq;
> +	struct nand_ecc_conf eccreq;
>  	struct spinand_ecc_info eccinfo;
>  	struct {
>  		const struct spinand_op_variants *read_cache;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
