Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84523C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 05:36:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53054207D3
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 05:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TaNDL+5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53054207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu/FKo/bQVm0Lvb87/duH727gbkQ5FqmwrunUtYa+Cc=; b=TaNDL+5ICKB6hr
	UMRqfKP+skH1KYzlX52b6SLDcXo33K046czKjxEz/6Uz61cM1ONZZCJ+e+8tx7UfLRvqqe17H5bL7
	bishkIMX5opHIFprz+hVgGJGNIWrM2VLsN9X2AyCwwZlHdZ+yaJap56YDSjwVXllsAdXd8r1Amgls
	kyLO3PDTCYeV1411AW7Ul6XwGf69hkcGrtPYCqbRT1hakmi4qpkYEQvrrQiGSwEwhuV8SF7zyeymd
	WOxmxTy/KcW1MvqRALGpM0LQVZ89WXWZybOSpINDxAudD7Hu/6hWhTEdr37vKOSm1kMmbldSu1byU
	LY60xE7itlKYOcr1n0JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeXge-0004Wu-Ku; Fri, 29 May 2020 05:36:08 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeXgb-0004WZ-8K
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 05:36:07 +0000
IronPort-SDR: DTEUrJ6PnuEedHUa6/5C5mkdX642nFAu0EtWEv73oCouGt8Dsk4cVyDk7kvd//QxnZzurlLBoZ
 Bo5KiLkDGGlw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 22:36:04 -0700
IronPort-SDR: tFxe2BIxiPncpHrnHQKfWj9p753Jl38BkPgEowEyCCXBfhuxe0OTUteghpYeL/ARwT5aZQMPBN
 8jDENjB0GgZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="376607924"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 28 May 2020 22:36:00 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 29 May 2020 08:36:00 +0300
Date: Fri, 29 May 2020 08:36:00 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: create/Export parameter softwareseq
 for intel-spi driver to user
Message-ID: <20200529053600.GG247495@lahna.fi.intel.com>
References: <20200518175930.10948-1-danielwa@cisco.com>
 <589a2ef5-e086-766d-44b3-1d2b990f1f67@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <589a2ef5-e086-766d-44b3-1d2b990f1f67@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_223605_341400_53F2334B 
X-CRM114-Status: GOOD (  29.59  )
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
Cc: Bobby Liu <bobbliu@cisco.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, xe-linux-external@cisco.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andrew Morton <akpm@linux-foundation.org>, Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I wonder if we can "generalize" this a bit and use SW sequencer to run
commands HW sequencer does not support? The BIOS can then setup the
allowed SW sequencer opcodes and lock the thing down if needed.

There are couple of other commands related to FSR register where this
could be useful.

On Thu, May 28, 2020 at 04:16:38PM +0530, Vignesh Raghavendra wrote:
> +Mika Westerberg original author of the driver
> 
> On 18/05/20 11:29 pm, Daniel Walker wrote:
> > From: Bobby Liu <bobbliu@cisco.com>
> > 
> > How to use:
> > append softwareseq=1 while probe the driver.
> > example:
> > modprobe intel-spi writeable=1 softwareseq=1
> > it will let driver use software sequence to write register for opt=EN4B
> > by default it's 0 if not specified, driver will do usual HW cycle
> > 
> 
> Could some one from Intel please review this patch?
> 
> Regards
> Vignesh
> 
> > Why this parameter is posted to user:
> > Intel PCH provides two groups of registers for SPI flash operation,
> > Hard Sequence registers and Software Sequence registers,
> > corresponding to intel_spi_hw_cycle() and intel_spi_sw_cycle()
> > respectively in driver code. But HW sequence register won't send EN4B
> > opcode to SPI flash. BIOS code use SW register to send EN4B.
> > 
> > On some Cisco routers, two 32M SPI flashes, which require 4-byte address mode enabled,
> > are physically connected to an FPGA, one flash is active and one is inactive.
> > When we do BIOS upgrade, we need switch to the inactive one,
> > but unfortunately, this one is still 3-byte address mode as default,
> > after we do real-time switch, we need reload SPI driver to send EN4B code to
> > enable 4-byte address mode.
> > 
> > Refering to our BIOS code, Software sequence register is processed
> > while sending EN4B opcode. So here we use sw_cycle in driver for EN4B as well.
> > 
> > Why I don't just easily use software sequence for all:
> > 1.It will impact all flash operation, include flash W/R, high risk
> > 2.The only SPI type I can use is INTEL_SPI_BXT according to datasheet,
> >   this will require using hw seq.
> >   I tried to specify other SPI type, it couldn't work with Intel PCH.
> >   If I force SW seq for all, during boot up, sw_cycle fails to read
> >   vendor ID.
> > 
> > In conclusion, I only use SW cycle for EN4B opcode to minimize impact.
> > It won't impact other users as well.
> > 
> > Why the default flash can work at 4-byte address mode:
> > BIOS sets 4-byte address mode for the current active SPI flash with SW seq registers.
> > So we don't need append softwareseq=1 for normal boot up script,
> > it will only be used in BIOS upgrade script.
> > 
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Bobby Liu <bobbliu@cisco.com>
> > [ danielwa: edited the commit message a little. ]
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >  drivers/mtd/spi-nor/controllers/intel-spi.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > index 61d2a0ad2131..e5a3d51a2e4d 100644
> > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > @@ -163,6 +163,10 @@ static bool writeable;
> >  module_param(writeable, bool, 0);
> >  MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");
> >  
> > +static bool softwareseq;
> > +module_param(softwareseq, bool, 0);
> > +MODULE_PARM_DESC(softwareseq, "Use software sequence for register write (default=0)");
> > +
> >  static void intel_spi_dump_regs(struct intel_spi *ispi)
> >  {
> >  	u32 value;
> > @@ -619,6 +623,18 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * Intel Skylake will not send EN4B to SPI flash if we use HW sequence
> > +	 * Here export one interface "softwareseq" to OS,
> > +	 * let driver user decide if use SW sequence or not
> > +	 */
> > +	if (opcode == SPINOR_OP_EN4B && softwareseq) {
> > +	    dev_info(ispi->dev,
> > +		"Write register opcode is SPINOR_OP_EN4B, do SW cycle\n");
> > +	    return intel_spi_sw_cycle(ispi, opcode, len,
> > +		OPTYPE_WRITE_NO_ADDR);
> > +	}
> > +
> >  	if (ispi->swseq_reg)
> >  		return intel_spi_sw_cycle(ispi, opcode, len,
> >  					  OPTYPE_WRITE_NO_ADDR);
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
