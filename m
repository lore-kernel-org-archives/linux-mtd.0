Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0125C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzPq4nAioG5JWDqwgHJOXcxrvMaCfMvVKXKAZiKoCcs=; b=zpzL02JauhL5VK
	GYFzUjBusXQaVb4Sf/EIZUJ2MAJhXslnUWY9GJpkfngW3LM69S7fbLmsRphcIeHuMTAwdDYbubPgG
	Ub2IZTN7810tfzQ+FWjjcNURk0tWcH67jjn8vagLOFs9j21oz+OOv+RzXWa4mRlg4PWTD1s95wxV3
	jRtcAMmhcdtC4uFqwrDL/EVwDUqWfHfWaxRPkVMa9NckHXDWBjqwCf83XeyA/mHJ4DYURSXA4+G+L
	VEgkzPH4GdwFG+OY/VUes6SOW2FQGl4pRsv2t9kqeRhKluGADiq8frw4L7w2nb2r4iMcMRNEuDlpT
	HliXUpgvRjgbc+uqaQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFDJb-00Eycb-TZ; Wed, 02 Feb 2022 10:56:43 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFDJY-00EyQq-8q
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 10:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643799400; x=1675335400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iC9YgXytjVUAp+qoN5iGpU9fzC0i/z0Qc7tg1868z0o=;
 b=QqFFzGopprXF6HD7HNKIBMrwE491OXNLvvTl6CXsn+keAkSls+RzSrw1
 SjG4d7rolU+53ZZBaDE97sPTOEpgv75ekikfjCgsptTV15mAfoNt0VO4m
 i36aIRzlxnrHZBUSwo74aMu4O2PC2/9lqjszT8lfLRjCbZtPqcEf+sRj5
 anQOTp/B+yxZ/lljkNLH8C89WMFsJCQUJGA4jmnl424cmcXzukkrPO/YV
 xpilGdeiikODhAWbLWmBC4HNgAEIlPFuyvzHS8mJ1aq5+9QS5t4c8WcXJ
 cYLasuEwe9N7g8BOhNTlwF0yvt066s5hS2RZdMyRPSBa38MmcEAropIsi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248111823"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="248111823"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:54:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="630882825"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:54:13 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 02 Feb 2022 12:54:11 +0200
Date: Wed, 2 Feb 2022 12:54:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Cc: broonie@kernel.org, lee.jones@linaro.org, boris.brezillon@collabora.com,
 michael@walle.cc, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, corbet@lwn.net,
 mauro.lima@eclypsium.com, alexander.sverdlin@nokia.com,
 andriy.shevchenko@linux.intel.com, hans-gert.dahmen@immu.ne,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <Yfpi04V7ZIDNpjoV@lahna>
References: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
 <20211220164625.9400-3-mika.westerberg@linux.intel.com>
 <ed2a0fe0-c78d-7f09-6f68-b378cb09931e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed2a0fe0-c78d-7f09-6f68-b378cb09931e@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_025640_400182_5AF12637 
X-CRM114-Status: GOOD (  35.89  )
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

Hi,

On Tue, Feb 01, 2022 at 03:24:58PM +0000, Tudor.Ambarus@microchip.com wrote:
> 
> > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/spi/spi-intel.c
> > similarity index 59%
> > rename from drivers/mtd/spi-nor/controllers/intel-spi.c
> > rename to drivers/spi/spi-intel.c
> > index f35597cbea0c..3b126927419c 100644
> > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> > +++ b/drivers/spi/spi-intel.c
> 
> cut
> 
> > -static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
> > +static int intel_spi_erase(struct intel_spi *ispi, const struct spi_mem_op *op)
> >  {
> > -       size_t erase_size, len = nor->mtd.erasesize;
> > -       struct intel_spi *ispi = nor->priv;
> > +       u8 opcode = op->cmd.opcode;
> > +       u32 addr = op->addr.val;
> >         u32 val, status, cmd;
> >         int ret;
> > 
> > -       /* If the hardware can do 64k erase use that when possible */
> > -       if (len >= SZ_64K && ispi->erase_64k) {
> > +       switch (opcode) {
> > +       case SPINOR_OP_SE:
> 
> Would it worth to extend the intel_spi_mem_op struct and introduce an
> u32 replacement_op; member and use it directly here without doing the
> switch, so that we don't mix SPI NOR code in the driver?

Sure.

> Also the cmd assignement can be done after if (ispi->swseq_erase), right?
> 
> >                 cmd = HSFSTS_CTL_FCYCLE_ERASE_64K;
> > -               erase_size = SZ_64K;
> > -       } else {
> > +               break;
> > +
> > +       case SPINOR_OP_BE_4K:
> >                 cmd = HSFSTS_CTL_FCYCLE_ERASE;
> > -               erase_size = SZ_4K;
> > +               break;
> > +
> > +       default:
> > +               return -EINVAL;
> 
> you have a INTEL_SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BE_4K_4B, 1), ...) defined.
> supported_op will return true, but you get an -EINVAL here.

Good catch. This will be dealt with the iop->replacement_op too (so the
switch will be dropped completely) in v6.

> >         }
> > 
> > -       if (ispi->swseq_erase) {
> > -               while (len > 0) {
> > -                       writel(offs, ispi->base + FADDR);
> > +       writel(addr, ispi->base + FADDR);
> > +
> > +       if (ispi->swseq_erase)
> > +               return intel_spi_sw_cycle(ispi, opcode, 0,
> > +                                         OPTYPE_WRITE_WITH_ADDR);
> > +
> > +       /* Not needed with HW sequencer erase, make sure it is cleared */
> > +       ispi->atomic_preopcode = 0;
> > +
> > +       val = readl(ispi->base + HSFSTS_CTL);
> > +       val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> > +       val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> > +       val |= HSFSTS_CTL_FGO;
> > +       val |= cmd;
> > +       writel(val, ispi->base + HSFSTS_CTL);
> > +
> > +       ret = intel_spi_wait_hw_busy(ispi);
> > +       if (ret)
> > +               return ret;
> > +
> > +       status = readl(ispi->base + HSFSTS_CTL);
> > +       if (status & HSFSTS_CTL_FCERR)
> > +               return -EIO;
> > +       if (status & HSFSTS_CTL_AEL)
> > +               return -EACCES;
> > +
> > +       return 0;
> > +}
> > +
> 
> cut
> 
> > +static int intel_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
> > +{
> > +       struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> > +       const struct intel_spi_mem_op *iop;
> > 
> > -               val = readl(ispi->base + HSFSTS_CTL);
> > -               val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> > -               val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> > -               val |= cmd;
> > -               val |= HSFSTS_CTL_FGO;
> > -               writel(val, ispi->base + HSFSTS_CTL);
> > +       iop = intel_spi_match_mem_op(ispi, op);
> > +       if (!iop)
> > +               return -EINVAL;
> 
> return -EOPNOTSUPP?

OK

> > 
> > -               ret = intel_spi_wait_hw_busy(ispi);
> > -               if (ret)
> > -                       return ret;
> > +       return iop->exec_op(ispi, op);
> > +}
> > 
> > -               status = readl(ispi->base + HSFSTS_CTL);
> > -               if (status & HSFSTS_CTL_FCERR)
> > -                       return -EIO;
> > -               else if (status & HSFSTS_CTL_AEL)
> > -                       return -EACCES;
> > +static const char *intel_spi_get_name(struct spi_mem *mem)
> > +{
> > +       const struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> > +
> > +       /*
> > +        * Return name of the flash controller device to be compatible
> > +        * with the MTD version.
> > +        */
> > +       return dev_name(ispi->dev);
> > +}
> > +
> > +static const struct spi_controller_mem_ops intel_spi_mem_ops = {
> > +       .supports_op = intel_spi_supports_mem_op,
> > +       .exec_op = intel_spi_exec_mem_op,
> > +       .get_name = intel_spi_get_name,
> > +};
> > +
> > +#define INTEL_SPI_OP_ADDR(__nbytes)                                    \
> > +       {                                                               \
> > +               .nbytes = __nbytes,                                     \
> > +       }
> > +
> > +#define INTEL_SPI_OP_NO_DATA                                           \
> > +       {                                                               \
> > +               .dir = SPI_MEM_NO_DATA,                                 \
> > +       }
> > +
> > +#define INTEL_SPI_OP_DATA_IN(__buswidth)                               \
> > +       {                                                               \
> > +               .dir = SPI_MEM_DATA_IN,                                 \
> > +               .buswidth = __buswidth,                                 \
> > +       }
> > +
> > +#define INTEL_SPI_OP_DATA_OUT(__buswidth)                              \
> > +       {                                                               \
> > +               .dir = SPI_MEM_DATA_OUT,                                \
> > +               .buswidth = __buswidth,                                 \
> > +       }
> > +
> > +#define INTEL_SPI_MEM_OP(__cmd, __addr, __data, __exec_op)             \
> > +       {                                                               \
> > +               .mem_op = {                                             \
> > +                       .cmd = __cmd,                                   \
> > +                       .addr = __addr,                                 \
> > +                       .data = __data,                                 \
> > +               },                                                      \
> > +               .exec_op = __exec_op,                                   \
> > +       }
> > +
> > +/*
> > + * The controller handles pretty much everything internally based on the
> > + * SFDP data but we want to make sure we only support the operations
> > + * actually possible. Only check buswidth and transfer direction, the
> > + * core validates data.
> > + */
> > +#define INTEL_SPI_GENERIC_OPS
> 
> checkpatch --strict complains:
> ERROR: Macros with complex values should be enclosed in parentheses
> #955: FILE: drivers/spi/spi-intel.c:826:
> +#define INTEL_SPI_GENERIC_OPS

I saw that too but to be honest, I have no idea how this could be
applied to the macros here. Therefore I chose to ignore this one.

>                                           \
> > +       /* Status register operations */                                \
> > +       INTEL_SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),             \
> > +                        SPI_MEM_OP_NO_ADDR,                            \
> > +                        INTEL_SPI_OP_DATA_IN(1),                       \
> > +                        intel_spi_read_reg),                           \
> 
> I like the idea	with the array of ops. Maybe you'd like to order the ops and
> put the ops that are highly used as the first elements in the array, so that
> you speed up a bit the op selection at run-time. No hard requirement.

I think for better maintainability ordering them by type is better. I
will be adding dirmap support in subsequent patches which should then
use cached ->exec_op for read/write so there is no need to look up the
op more than once.

> Neat work. Thanks for the patience.

Thanks for the review! :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
