Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E331C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1301460F21
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1301460F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atD3JNesue++PJUyWYKjQ2mjHTuWtLGYs9dy16OQOWk=; b=ga/dyt5fd960F1
	kFaTM/65eDNLbsVQj5EApSazZOqEq1kOKv18dmthl0Tda2k+CzbCWwRWwq3w+3C4P8rNASf3u3k/t
	2AnqINHDqKU8Pnx79i+YqnNt7i8R1/PEB1xefnPcn6/otkKFSGtZPAXWb6ZXs2AHKrjL2szUDU2R1
	0NIV6CB/LY6Vt63fKkyHQCopRsfmn/efEZ7yQaBt/TSKOt2zBRyqv0v31I9BDm9tDXdG31sSWqOir
	Kbzt6s0ICdY0OVlAvu7RzWIykrNxTwREVG4PirviUQrr9BZlkn8yONDwubIrKURqiiCsAXunbbfIH
	58c3pWIOym/aPWh+0Z9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maBT6-00BhYy-Oc; Tue, 12 Oct 2021 06:40:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maBT3-00BhYF-BG
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 06:40:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 202531F40F0B;
 Tue, 12 Oct 2021 07:40:51 +0100 (BST)
Date: Tue, 12 Oct 2021 08:40:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 03/14] mtd: spinand: Patch spi_mem_op for the SPI IO
 protocol using reg_proto
Message-ID: <20211012084047.6381ddce@collabora.com>
In-Reply-To: <20211011204619.81893-4-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
 <20211011204619.81893-4-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_234053_686019_4775DF00 
X-CRM114-Status: GOOD (  27.12  )
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

On Tue, 12 Oct 2021 02:16:08 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Currently, the op macros in spinand.h don't give the option to setup
> any non-array access instructions for Dual/Quad/Octal DTR SPI bus.
> Having a function that patches the op based on reg_proto would be
> better than trying to write all the setup logic in op macros.
> 
> Create a spimem_patch_op() that would patch cmd, addr, dummy and data
> phase of the spi_mem op, for the given spinand->reg_proto. And hence,
> call the spimem_patch_op() before executing any spi_mem op.

I'm honestly not sure this rule will stand over time, and patching
operations at submission time has a cost (ok, it's negligible compared
to the IO duration, but still), so I'd rather see this done statically
with all relevant macros taking an extra dtr argument.

> 
> Note: In this commit, spimem_patch_op() isn't called in the
> read_reg_op(), write_reg_op() and wait() functions, as they need
> modifications in address value and data nbytes when in Octal DTR mode.
> This will be fixed in a later commit.

See, that's what I'm talking about.

> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c | 49 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index d82a3e6d9bb5..11746d858f87 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -20,6 +20,49 @@
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-mem.h>
>  
> +/**
> + * spinand_patch_op() - Helper function to patch the spi_mem op based on the
> + *			spinand->reg_proto
> + * @spinand: the spinand device
> + * @op: the spi_mem op to patch
> + *
> + * Set up buswidth and dtr fields for cmd, addr, dummy and data phase. Also
> + * adjust cmd opcode and dummy nbytes. This function doesn't make any changes
> + * to addr val or data buf.
> + */
> +static void spinand_patch_op(const struct spinand_device *spinand,
> +			     struct spi_mem_op *op)
> +{
> +	u8 op_buswidth = SPINAND_PROTO_BUSWIDTH(spinand->reg_proto);
> +	u8 op_is_dtr = SPINAND_PROTO_IS_DTR(spinand->reg_proto);
> +
> +	if (spinand->reg_proto == SPINAND_SINGLE_STR)
> +		return;
> +
> +	op->cmd.buswidth = op_buswidth;
> +	op->cmd.dtr = op_is_dtr;
> +	if (spinand->reg_proto == SPINAND_OCTAL_DTR) {
> +		op->cmd.opcode = (op->cmd.opcode << 8) | op->cmd.opcode;
> +		op->cmd.nbytes = 2;
> +	}
> +
> +	if (op->addr.nbytes) {
> +		op->addr.buswidth = op_buswidth;
> +		op->addr.dtr = op_is_dtr;
> +	}
> +
> +	if (op->dummy.nbytes) {
> +		op->dummy.buswidth = op_buswidth;
> +		op->dummy.dtr = op_is_dtr;
> +		op->dummy.nbytes <<= op_is_dtr;
> +	}
> +
> +	if (op->data.nbytes) {
> +		op->data.buswidth = op_buswidth;
> +		op->data.dtr = op_is_dtr;
> +	}
> +}
> +
>  static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
>  {
>  	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
> @@ -343,6 +386,7 @@ static int spinand_write_enable_op(struct spinand_device *spinand)
>  {
>  	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
>  
> +	spinand_patch_op(spinand, &op);
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
>  
> @@ -353,6 +397,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
>  	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
>  	struct spi_mem_op op = SPINAND_PAGE_READ_OP(row);
>  
> +	spinand_patch_op(spinand, &op);
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
>  
> @@ -477,6 +522,7 @@ static int spinand_program_op(struct spinand_device *spinand,
>  	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
>  	struct spi_mem_op op = SPINAND_PROG_EXEC_OP(row);
>  
> +	spinand_patch_op(spinand, &op);
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
>  
> @@ -487,6 +533,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
>  	unsigned int row = nanddev_pos_to_row(nand, pos);
>  	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
>  
> +	spinand_patch_op(spinand, &op);
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
>  
> @@ -533,6 +580,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
>  		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
>  	int ret;
>  
> +	spinand_patch_op(spinand, &op);
>  	ret = spi_mem_exec_op(spinand->spimem, &op);
>  	if (!ret)
>  		memcpy(buf, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
> @@ -545,6 +593,7 @@ static int spinand_reset_op(struct spinand_device *spinand)
>  	struct spi_mem_op op = SPINAND_RESET_OP;
>  	int ret;
>  
> +	spinand_patch_op(spinand, &op);
>  	ret = spi_mem_exec_op(spinand->spimem, &op);
>  	if (ret)
>  		return ret;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
