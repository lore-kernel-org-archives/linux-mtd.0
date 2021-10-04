Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E232C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 10:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1657B6120A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 10:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1657B6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoZDInFMfg3/yVoTuSjpk3BI4LzAJsc8OseqF5v6Edk=; b=2Ft8LAtZgDugWW
	YHYDLcMeUiPuk03zpF65A2+k721EKE2vV0SS9vohMBoLt6FeRswlBNkA1EsMs0bJXh4qHHOxLtxsQ
	MsvqkxV2XDou9FxbVPjv8S7NGt4DB0FId94fLfJ89pGxDdbOBO8rTU9X/senmen7UcDgiCdBQko92
	PNt90+ri9Y9J11w8NmzEvhXLnHbngBg7IHyCHGxah6zLuQbi26xVvDp+6YjsaD7b7Tu5EAdqTnJ0E
	gxM6rZ9s/X304kcdu39t3Tp0u/CBIiKu+hH1oBCzHILOd0WdUFiOJlbDmAric8ic5uTo+G1odGNEJ
	vFOott+4mAPNr22SFmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKtE-005v9W-OK; Mon, 04 Oct 2021 10:08:08 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKtB-005v5Y-PZ
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 10:08:07 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="206176629"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="206176629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 03:07:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="622044812"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 03:07:45 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 04 Oct 2021 13:07:43 +0300
Date: Mon, 4 Oct 2021 13:07:43 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <YVrSbyEsSLMOu1bU@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <20211004095239.dyowgkyq5lnfdag2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004095239.dyowgkyq5lnfdag2@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_030805_876466_DAEFCFC1 
X-CRM114-Status: GOOD (  31.41  )
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

On Mon, Oct 04, 2021 at 03:22:41PM +0530, Pratyush Yadav wrote:
> On 30/09/21 01:07PM, Mika Westerberg wrote:
> > The preferred way to implement SPI-NOR controller drivers is through SPI
> > subsubsystem utilizing the SPI MEM core functions. This converts the
> > Intel SPI flash controller driver over the SPI MEM by moving the driver
> > from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> > SPI MEM functions. The driver name will be changed from intel-spi to
> > spi-intel to match the convention used in the SPI subsystem.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/controllers/Kconfig       |  36 ---
> >  drivers/mtd/spi-nor/controllers/Makefile      |   3 -
> >  drivers/mtd/spi-nor/controllers/intel-spi.h   |  21 --
> >  drivers/spi/Kconfig                           |  38 +++
> >  drivers/spi/Makefile                          |   3 +
> >  .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  20 +-
> >  .../spi-intel-platform.c}                     |  21 +-
> >  .../intel-spi.c => spi/spi-intel.c}           | 300 +++++++++++-------
> >  drivers/spi/spi-intel.h                       |  19 ++
> >  include/linux/mfd/lpc_ich.h                   |   2 +-
> >  .../x86/{intel-spi.h => spi-intel.h}          |   6 +-
> >  11 files changed, 252 insertions(+), 217 deletions(-)
> >  delete mode 100644 drivers/mtd/spi-nor/controllers/intel-spi.h
> >  rename drivers/{mtd/spi-nor/controllers/intel-spi-pci.c => spi/spi-intel-pci.c} (86%)
> >  rename drivers/{mtd/spi-nor/controllers/intel-spi-platform.c => spi/spi-intel-platform.c} (65%)
> >  rename drivers/{mtd/spi-nor/controllers/intel-spi.c => spi/spi-intel.c} (80%)
> >  create mode 100644 drivers/spi/spi-intel.h
> >  rename include/linux/platform_data/x86/{intel-spi.h => spi-intel.h} (89%)
> > 
> [...]
> > +static bool intel_spi_supports_mem_op(struct spi_mem *mem,
> > +				      const struct spi_mem_op *op)
> > +{
> > +	struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> >  
> > -			offs += erase_size;
> > -			len -= erase_size;
> > +	if (op->cmd.dtr)
> > +		return false;
> > +
> > +	if (ispi->swseq_reg && ispi->locked) {
> > +		int i;
> > +
> > +		for (i = 0; i < ARRAY_SIZE(ispi->opcodes); i++) {
> > +			if (ispi->opcodes[i] == op->cmd.opcode)
> > +				return true;
> >  		}
> >  
> > -		return 0;
> > +		return false;
> >  	}
> >  
> > -	/* Not needed with HW sequencer erase, make sure it is cleared */
> > -	ispi->atomic_preopcode = 0;
> > +	switch (op->cmd.opcode) {
> > +	case SPINOR_OP_RDID:
> > +	case SPINOR_OP_RDSR:
> > +	case SPINOR_OP_WRSR:
> > +		return true;
> >  
> > -	while (len > 0) {
> > -		writel(offs, ispi->base + FADDR);
> > +	case SPINOR_OP_READ:
> > +	case SPINOR_OP_READ_FAST:
> > +	case SPINOR_OP_READ_4B:
> > +	case SPINOR_OP_READ_FAST_4B:
> > +		return true;
> 
> I think the checks need to be stricter here. For example, I don't see 
> you pass in protocol width (dual, quad, octal, etc.) to intel_spi_read() 
> so I assume it can only do a certain protocol. You need to make sure 
> that other protocols are rejected here.
> 
> Similarly, you also don't pass in dummy cycles to intel_spi_read(), so I 
> assume it can only do a fix number of dummy cycles. Need to make sure 
> you reject unsupported ones. Same for other opcodes/cases.

Unfortunately there is no way to tell the controller any of these. It
simply does "read" or "write" (as we command it) and internally then
uses whatever it got from the SFDP tables of the flash chip. That's why
we just claim to support all these operations and let the controller do
its thing (whatever it is).

Hope this clarifies.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
