Return-Path: <SRS0=6jNp=Q5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C24C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 14:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96742075A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 14:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNBJfxTx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfgC9JOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96742075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzAshk7+HJIp/wZFLaNNlH/OHt5g/fa0NIQDAbCyaRQ=; b=aNBJfxTx/Ty+zz
	wbKFU7fgcNxaAQ0pGbNGYHBuk8RjTQKyKqUSAmDgnWpWGmOf0X4wT6eDcM55W5+5noCuO4a+cfZxh
	6cUSM3nMuKwJ0uaP+tjp1BScQ4M13sbjCkv+W595U49DagUP/ecjvi2st29hAQYJ/E7oj1CG8k8dY
	Q9t4nRiTtnW1dgFOL2xHgZEym+3FChiLOhEH09ClIWZwprigiVqzShvptaEnNj8FmmYUer5cQLOEp
	bGjF8/FZyq5GwJXXbSzwZQBBc35zizUqEaPcQr7TVs0BcYVosNN/Y7nunLhRJWT4Pg8z873fdQ+io
	1OTuY4pM96g42Z6qFHQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxBtS-0008DB-55; Fri, 22 Feb 2019 14:33:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxBtJ-00084k-V6; Fri, 22 Feb 2019 14:33:31 +0000
Received: from localhost (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 576882075A;
 Fri, 22 Feb 2019 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550846009;
 bh=GpzMJvdjSis+pRH/ZzBiCNAN+uefcqjeQgAH26klJFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pfgC9JObBVIoJxZZEpHl/aF7wg/cJieJzX8qAI/kbftDMPrULjRrCiP3osVXXJHd+
 eGIjba3m1Nq5Sy4zZwaxa68Hvyte5KOAvRC23+huUkZkS8kA7Efshgp+y8rcm3/PAp
 iyOuE0pfu/AUFR0PnEInwyDHPBk1+rNkcy6Rs45g=
Date: Fri, 22 Feb 2019 15:33:22 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 22/27] mtd: spinand: Let the SPI-NAND core flag a
 SPI-NAND chip
Message-ID: <20190222153322.2c7a5fa3@kernel.org>
In-Reply-To: <20190221125806.28875-10-miquel.raynal@bootlin.com>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
 <20190221125806.28875-10-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_063330_034348_13397836 
X-CRM114-Status: GOOD (  20.79  )
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
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 13:58:01 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> As of today there is no way to make the distinction between a raw NAND
> chip and a SPI-NAND chip. The ABI is stable and we cannot add a
> "SPI-NAND" tag to the MTD type, but we can add a special SPINAND
> capability to the flags instead. A helper is also provided to retrieve
> if whether or not the chip is working over SPI or not.

Why would we need a new cap or a new type? The user should only care
about the class of device (NAND, NOR, SRAM, ...) and not the
bus/protocol used to communicate with this device.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/core.c    | 2 +-
>  include/linux/mtd/mtd.h    | 5 +++++
>  include/uapi/mtd/mtd-abi.h | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> index a76d206d233a..872d46b5fc0f 100644
> --- a/drivers/mtd/nand/core.c
> +++ b/drivers/mtd/nand/core.c
> @@ -245,7 +245,7 @@ int nanddev_init(struct nand_device *nand, const struct nand_ops *ops,
>  
>  	mtd->type = memorg->bits_per_cell == 1 ?
>  		    MTD_NANDFLASH : MTD_MLCNANDFLASH;
> -	mtd->flags = MTD_CAP_NANDFLASH;
> +	mtd->flags = MTD_SPINAND | MTD_CAP_NANDFLASH;
>  	mtd->erasesize = memorg->pagesize * memorg->pages_per_eraseblock;
>  	mtd->writesize = memorg->pagesize;
>  	mtd->writebufsize = memorg->pagesize;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b21a1d..7c245d109524 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -551,6 +551,11 @@ static inline int mtd_type_is_nand(const struct mtd_info *mtd)
>  	return mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
>  }
>  
> +static inline int mtd_type_is_spinand(const struct mtd_info *mtd)
> +{
> +	return mtd_type_is_nand(mtd) && (mtd->flags & MTD_SPINAND);
> +}
> +
>  static inline int mtd_can_have_bb(const struct mtd_info *mtd)
>  {
>  	return !!mtd->_block_isbad;
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index aff5b5e59845..7c7124c88fe0 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -104,6 +104,7 @@ struct mtd_write_req {
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
>  #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
> +#define MTD_SPINAND		0x4000	/* Device works over SPI */
>  
>  /* Some common devices / combinations of capabilities */
>  #define MTD_CAP_ROM		0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
