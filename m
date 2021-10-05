Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9BDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E106128A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99E106128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54uVi2yV/dE/7XWLx1XKt+MkMv5+8LHG897XAwKeGuI=; b=YmRQZXvtZLW6R5
	IGmXWjH1T6Onag0z6Pvlxq+JzyOfrtS3mSZkYCSK6dDJ9MGyAGkqvszkihuQ0pSktjlLNYjH2PbGI
	6QEE1sE326mSzEwJI2e4vsKzbDbSfNDwmNXUW+nsLydTu2pdHjZgzH6oz4wFgBFwrb+0CoEqTKUdJ
	X5lSZJgTGK3HYbaJLTd3c9Oc+y6r3Kce8aIg8V5wipKOU20mIyEkRBd4UxD+cZabMv2YWdkfc5FLO
	SM9LVbSTQijO97teI+8ukIVj671EIQpLi2QVvJ/a4IbEEo75CJksMnRerk30xV/bXjKRRr/+Q6Sv+
	OlXYXgNs45S1gIXx2waA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgxL-009q1M-7s; Tue, 05 Oct 2021 09:41:51 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgxI-009q0O-De
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 09:41:49 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="226011635"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="226011635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 02:41:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="438633858"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 02:41:42 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 05 Oct 2021 12:41:39 +0300
Date: Tue, 5 Oct 2021 12:41:39 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <YVwd09KZwOQVvh4g@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <CAHp75VdtOHn4ED-ixdDngBQw10OnKmbtTv=ydLs6dYbkjyqW4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VdtOHn4ED-ixdDngBQw10OnKmbtTv=ydLs6dYbkjyqW4Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_024148_505036_43F96AE6 
X-CRM114-Status: GOOD (  33.72  )
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

Hi Andy,

On Mon, Oct 04, 2021 at 05:29:47PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 30, 2021 at 1:08 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > The preferred way to implement SPI-NOR controller drivers is through SPI
> > subsubsystem utilizing the SPI MEM core functions. This converts the
> > Intel SPI flash controller driver over the SPI MEM by moving the driver
> > from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> > SPI MEM functions. The driver name will be changed from intel-spi to
> > spi-intel to match the convention used in the SPI subsystem.
> 
> ...
> 
> > +config SPI_INTEL_PCI
> > +       tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > +       depends on PCI && (X86 || COMPILE_TEST)
> 
> Perhaps two entries, one of which will be the same as for platform case?

Sure will do that in v2.

> > +       depends on SPI_MEM
> > +       select SPI_INTEL
> > +       help
> > +         This enables PCI support for the Intel PCH/PCU SPI controller in
> > +         master mode. This controller is present in modern Intel hardware
> > +         and is used to hold BIOS and other persistent settings. Using
> > +         this driver it is possible to upgrade BIOS directly from Linux.
> > +
> > +         Say N here unless you know what you are doing. Overwriting the
> > +         SPI flash may render the system unbootable.
> > +
> > +         To compile this driver as a module, choose M here: the module
> > +         will be called spi-intel-pci.
> > +
> > +config SPI_INTEL_PLATFORM
> > +       tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> > +       depends on X86 || COMPILE_TEST
> > +       depends on SPI_MEM
> > +       select SPI_INTEL
> > +       help
> > +         This enables platform support for the Intel PCH/PCU SPI
> > +         controller in master mode. This controller is present in modern
> > +         Intel hardware and is used to hold BIOS and other persistent
> > +         settings. Using this driver it is possible to upgrade BIOS
> > +         directly from Linux.
> > +
> > +         Say N here unless you know what you are doing. Overwriting the
> > +         SPI flash may render the system unbootable.
> > +
> > +         To compile this driver as a module, choose M here: the module
> > +         will be called spi-intel-platform.
> 
> ...
> 
> + Blank line ?

OK

> 
> >  #include <linux/mtd/partitions.h>
> >  #include <linux/mtd/spi-nor.h>
> 
> + Blank line?

OK

> > +#include <linux/spi/flash.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/spi/spi-mem.h>
> 
> The rationale is to show that we use two sub(sub)sytems here.

Yup, got it.

> ...
> 
> > -                       dev_err(ispi->dev, "read error: %llx: %#x\n", from,
> > +                       dev_err(ispi->dev, "read error: %x: %#x\n", from,
> >                                 status);
> 
> Now one line?
> 
> ...
> 
> > -                       dev_err(ispi->dev, "write error: %llx: %#x\n", to,
> > +                       dev_err(ispi->dev, "write error: %x: %#x\n", to,
> >                                 status);
> 
> Ditto.

Sure for both.
> 
> ...
> 
> > +               ret = intel_spi_sw_cycle(ispi, opcode, 0,
> > +                                        OPTYPE_WRITE_WITH_ADDR);
> > +               return ret ? ret : 0;
> 
> Why not simply return intel_spi_dw_cycle(...); ?

Good point. Will fix that.

> ...
> 
> > +       val = readl(ispi->base + HSFSTS_CTL);
> > +       val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> > +       val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> 
> > +       val |= cmd;
> > +       val |= HSFSTS_CTL_FGO;
> 
> Maybe swap these lines to group constants?

OK

> ...
> 
> > +       status = readl(ispi->base + HSFSTS_CTL);
> > +       if (status & HSFSTS_CTL_FCERR)
> > +               return -EIO;
> 
> > +       else if (status & HSFSTS_CTL_AEL)
> 
> Redundant 'else'

Right.

> > +               return -EACCES;
> 
> ...
> 
> > +static int intel_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
> > +{
> > +       struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> > +       size_t nbytes = op->data.nbytes;
> > +       u8 opcode = op->cmd.opcode;
> > +
> > +       if (op->addr.nbytes) {
> > +               if  (op->data.dir == SPI_MEM_DATA_IN)
> > +                       return intel_spi_read(ispi, op->addr.val, nbytes,
> > +                                             op->data.buf.in);
> 
> > +               else if (op->data.dir == SPI_MEM_DATA_OUT)
> 
> Redundant 'else' here and nearby.

Right. I'll fix these in v2.

> > +                       return intel_spi_write(ispi, op->addr.val, nbytes,
> > +                                              op->data.buf.out);
> > +               else if (op->data.dir == SPI_MEM_NO_DATA)
> > +                       return intel_spi_erase(ispi, opcode, op->addr.val);
> > +       } else {
> > +               if  (op->data.dir == SPI_MEM_DATA_IN)
> > +                       return intel_spi_read_reg(ispi, opcode, op->data.buf.in,
> > +                                                 nbytes);
> > +               else if (op->data.dir == SPI_MEM_DATA_OUT)
> > +                       return intel_spi_write_reg(ispi, opcode, op->data.buf.out,
> > +                                                  nbytes);
> > +               else if (op->data.dir == SPI_MEM_NO_DATA)
> > +                       return intel_spi_write_reg(ispi, opcode, NULL, 0);
> >         }
> 
> > +       return -EINVAL;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
