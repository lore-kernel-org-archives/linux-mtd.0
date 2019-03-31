Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA034C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB33B20872
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8Q9Xkdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB33B20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NogjEyhF8OgWW5xlxsMZ2k+k4Q9HYSRn5HPOo1070LI=; b=A8Q9XkdinZgTLM
	q4HzDMb5s3XlaThiKGsfLSdz1ZiN16+Zn8dCnEWe+1cQnNftj3fLUC6DxQm2rQWPjuBJCqnNFE9Cy
	Tmazbftc7YF4K8Z8i1I2JU9OFBw/t8Xni61DMoKy3ohtFpqaOiwhYGfUkCQrQpXm4GMQ+kIuDk/l2
	K8qtn89CCQ5q2c20QiA88qGk2Vz2yUyGbPNEOCC2kT0xeTqsilNfXvCWSGetBoljiQ5jF+G+GdcLO
	kdSn9eTxfgkrXYIG9OI1KcP4JkoRoaCWiB7X+ri9/FoKgxLlGcsyRU1o1wXeGbAdGEVya4JytVPwX
	trpTcpug9D5Toygbfj/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAZ3h-0001WC-Jf; Sun, 31 Mar 2019 11:55:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAZ3X-0001Or-66; Sun, 31 Mar 2019 11:55:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 53D3A26040B;
 Sun, 31 Mar 2019 12:55:16 +0100 (BST)
Date: Sun, 31 Mar 2019 13:55:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 07/36] mtd: rawnand: Avoid a typedef
Message-ID: <20190331135513.59257c1d@collabora.com>
In-Reply-To: <20190304222841.13899-8-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_045519_487131_6F35996F 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon,  4 Mar 2019 23:28:12 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In new code, the use of typedef is discouraged. Before moving this
> section out of the raw NAND base, let's switch the nand_ecc_modes_t
> type into a regular nand_ecc_mode enumeration.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c               | 4 ++--
>  include/linux/mtd/rawnand.h                    | 6 +++---
>  include/linux/platform_data/mtd-davinci.h      | 2 +-
>  include/linux/platform_data/mtd-nand-s3c2410.h | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index e14f02a01efd..05174c6a3099 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4881,8 +4881,8 @@ static int of_get_nand_ecc_mode(struct device_node *np)
>  
>  	/*
>  	 * For backward compatibility we support few obsoleted values that don't
> -	 * have their mappings into nand_ecc_modes_t anymore (they were merged
> -	 * with other enums).
> +	 * have their mappings into the nand_ecc_mode enum anymore (they were
> +	 * merged with other enums).
>  	 */
>  	if (!strcasecmp(pm, "soft_bch"))
>  		return NAND_ECC_SOFT;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 14748183508b..c5bf6bb49329 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -87,14 +87,14 @@ struct nand_chip;
>  /*
>   * Constants for ECC_MODES
>   */
> -typedef enum {
> +enum nand_ecc_mode {
>  	NAND_ECC_NONE,
>  	NAND_ECC_SOFT,
>  	NAND_ECC_HW,
>  	NAND_ECC_HW_SYNDROME,
>  	NAND_ECC_HW_OOB_FIRST,
>  	NAND_ECC_ON_DIE,
> -} nand_ecc_modes_t;
> +};

Hm, I'm really not a big fan of this enum because it's mixing 2
different concepts: the type of ECC engine to use (on-die,
hw-controller-side, software, no-ECC) and the layout of
ECC/FREE bytes (_SYNDROME, _OOB_FIRST).

I'd recommend creating a nand_ecc_engine_type enum:

enum nand_ecc_engine_type {
	NAND_NO_ECC_ENGINE,
	NAND_SOFT_ECC_ENGINE,
	NAND_HW_ECC_ENGINE,
	NAND_ON_DIE_ECC_ENGINE,
};

and then convert the raw NAND layer to this enum when the time comes.

>  
>  enum nand_ecc_algo {
>  	NAND_ECC_UNKNOWN,
> @@ -340,7 +340,7 @@ static const struct nand_ecc_caps __name = {			\
>   * @write_oob:	function to write chip OOB data
>   */
>  struct nand_ecc_ctrl {
> -	nand_ecc_modes_t mode;
> +	enum nand_ecc_mode mode;
>  	enum nand_ecc_algo algo;
>  	int steps;
>  	int size;
> diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
> index 1bbfa27cccb4..e7457be12b8f 100644
> --- a/include/linux/platform_data/mtd-davinci.h
> +++ b/include/linux/platform_data/mtd-davinci.h
> @@ -81,7 +81,7 @@ struct davinci_nand_pdata {		/* platform_data */
>  	 * Newer ones also support 4-bit ECC, but are awkward
>  	 * using it with large page chips.
>  	 */
> -	nand_ecc_modes_t	ecc_mode;
> +	enum nand_ecc_mode	ecc_mode;
>  	u8			ecc_bits;
>  
>  	/* e.g. NAND_BUSWIDTH_16 */
> diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
> index f8c553f92655..ff6501c51244 100644
> --- a/include/linux/platform_data/mtd-nand-s3c2410.h
> +++ b/include/linux/platform_data/mtd-nand-s3c2410.h
> @@ -52,7 +52,7 @@ struct s3c2410_platform_nand {
>  
>  	unsigned int	ignore_unset_ecc:1;
>  
> -	nand_ecc_modes_t	ecc_mode;
> +	enum nand_ecc_mode	ecc_mode;
>  
>  	int			nr_sets;
>  	struct s3c2410_nand_set *sets;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
