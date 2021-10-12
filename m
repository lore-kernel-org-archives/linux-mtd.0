Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBA6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA51F60E94
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA51F60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pMHKKviiV26BzZX6bY6bCxnj7V0A6pL52TN1fV+Zlw=; b=relbhEFOlz/VuD
	exketF/iE1BhGCes1CqeqDnB69MfsYg6Wj7SBxeXf/Yn7Rek6WXPTYNTSJOT9F4Qlt6hPEtV9yvAx
	Sdd17a5jVfD9DlvBxXHya2Ab+93Ml4p7N6+QMN8hJoVZgHYsoBc6jqEQJJ3n49Jr2b4RwtCDm/9KA
	NNb9T97Xx9MlSiFmcNS8LR+rTVmapw46t29xnJFh84q5uFv3WUkkOxBnDeEvCX6I9KjOdnFo9854a
	yF0nAWPYFqjl+7fDjapuiI/kAUfTHZJc3Ragb59D0lBxMexPXcqUebZ5z5YSKokqgsrDsqqc4a4v+
	RCsg31SFYoHrjzYP2Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maBRV-00BhQF-73; Tue, 12 Oct 2021 06:39:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maBRS-00BhPu-Cj
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 06:39:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 074CA1F43331;
 Tue, 12 Oct 2021 07:39:11 +0100 (BST)
Date: Tue, 12 Oct 2021 08:39:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 02/14] mtd: spinand: Add enum spinand_proto to
 indicate current SPI IO mode
Message-ID: <20211012083906.30c50009@collabora.com>
In-Reply-To: <20211011204619.81893-3-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
 <20211011204619.81893-3-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_233914_623215_01343A93 
X-CRM114-Status: GOOD (  24.79  )
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

On Tue, 12 Oct 2021 02:16:07 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Unlike Dual and Quad SPI modes flashes, Octal DTR SPI NAND flashes
> require all instructions to be made in 8D-8D-8D protocol when the
> flash is in Octal DTR mode. Hence, storing the current SPI IO mode
> becomes necessary for correctly generating non-array access operations.
> 
> Store the current SPI IO mode in the spinand struct using a reg_proto
> enum. This would act as a flag, denoting that the core should use
> the given SPI protocol for non-page access operations.
> 
> Also provide basic macros for extracting buswidth and dtr mode
> information from the spinand_proto enum.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c |  2 ++
>  include/linux/mtd/spinand.h | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 2c8685f1f2fa..d82a3e6d9bb5 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1155,6 +1155,7 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
>  	struct spinand_device *spinand = mtd_to_spinand(mtd);
>  	int ret;
>  
> +	spinand->reg_proto = SPINAND_SINGLE_STR;
>  	ret = spinand_reset_op(spinand);
>  	if (ret)
>  		return;
> @@ -1181,6 +1182,7 @@ static int spinand_init(struct spinand_device *spinand)
>  	if (!spinand->scratchbuf)
>  		return -ENOMEM;
>  
> +	spinand->reg_proto = SPINAND_SINGLE_STR;
>  	ret = spinand_detect(spinand);
>  	if (ret)
>  		goto err_free_bufs;
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 6988956b8492..f6093cd98d7b 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -140,6 +140,31 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT(len, buf, 4))
>  
> +#define SPINAND_PROTO_BUSWIDTH_MASK	GENMASK(6, 0)
> +#define SPINAND_PROTO_DTR_BIT		BIT(7)
> +
> +#define SPINAND_PROTO_STR(__buswidth)	\
> +	((u8)(((__buswidth) - 1) & SPINAND_PROTO_BUSWIDTH_MASK))
> +#define SPINAND_PROTO_DTR(__buswidth)	\
> +	(SPINAND_PROTO_DTR_BIT | SPINAND_PROTO_STR(__buswidth))
> +
> +#define SPINAND_PROTO_BUSWIDTH(__proto)	\
> +	((u8)(((__proto) & SPINAND_PROTO_BUSWIDTH_MASK) + 1))
> +#define SPINAND_PROTO_IS_DTR(__proto)	(!!((__proto) & SPINAND_PROTO_DTR_BIT))
> +
> +/**
> + * enum spinand_proto - List allowable SPI protocol variants for read reg,
> + *			write reg, blk erase, write enable/disable, page read
> + *			and program exec operations.
> + */
> +enum spinand_proto {

s/spinand_proto/spinand_protocol/

> +	SPINAND_SINGLE_STR = SPINAND_PROTO_STR(1),
> +	SPINAND_DUAL_STR = SPINAND_PROTO_STR(2),
> +	SPINAND_QUAD_STR = SPINAND_PROTO_STR(4),
> +	SPINAND_OCTAL_STR = SPINAND_PROTO_STR(8),
> +	SPINAND_OCTAL_DTR = SPINAND_PROTO_DTR(8),

Why not have a contiguous enum listing all the modes? Are you extracting
the buswidth from these values?

> +};
> +
>  /**
>   * Standard SPI NAND flash commands
>   */
> @@ -407,6 +432,9 @@ struct spinand_dirmap {
>   *		   this die. Only required if your chip exposes several dies
>   * @cur_target: currently selected target/die
>   * @eccinfo: on-die ECC information
> + * @reg_proto: select a variant of SPI IO protocol (single, quad, octal or
> + *	       octal DTR) for read_reg/write_reg/erase operations. Update on
> + *	       successful transition into a different SPI IO protocol.
>   * @cfg_cache: config register cache. One entry per die
>   * @databuf: bounce buffer for data
>   * @oobbuf: bounce buffer for OOB data
> @@ -438,6 +466,8 @@ struct spinand_device {
>  
>  	struct spinand_ecc_info eccinfo;
>  
> +	enum spinand_proto reg_proto;
> +

I guess this mode will apply to all sort of commands, not just reg
accesses, so why not name it protocol or mode?

>  	u8 *cfg_cache;
>  	u8 *databuf;
>  	u8 *oobbuf;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
