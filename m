Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A44C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 15:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3D6206E6
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 15:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVNiMihA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3D6206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5KtrVmX/o2814/11FkQSY3KmZmqy7xgw8NrNuNIx5o=; b=hVNiMihALDKJC4
	RhYxl0McIRNxLE4DpeHjSgS5uhvz0vR7HQvqJxCYwnNFKXff5TLdFB72pAzQMh4yMGQ6J8oi0V221
	YPugUmdy05B0+NNPpsVP5a3GyfB+Fy187To1NUR6+r5hLO9voOtwVZVDetClz94KKTJlqHsRdD5gJ
	p1w2/TaGFs0PMb5LwbFkmVl8ddqqmuGlZA6sRWZKN3B7dNsCx700Wr3nclmFDwy1+yet+WBt7ANbF
	/+ytc/+0RxXdNY32M/BzRXmEoPKeARvUNYKaDOQ63YUBdbhelYlYZkDTLUMDuqR0MGkIha31SVpwR
	Tzg1fEItcDw4PxRXCOfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHrLD-0006FD-MW; Fri, 27 Mar 2020 15:56:15 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHrLB-0006En-0T
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 15:56:14 +0000
IronPort-SDR: GDwv+n1uN4lYOB2qKJDW4RGvabkH3CXnDXjpWs55VCglnSEBbfLPvwN/0cRunW2c4woXAWwuJN
 uHxhfAkclkqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 08:56:11 -0700
IronPort-SDR: HHgO+2yDhr0h2scXvnAb5yPVZB62zJeRaqwsRrSdtJloKHyUO2Gg0bL/7zXTmiP3xi+eoCuSYC
 BKKIF9FG4aHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="358520742"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 27 Mar 2020 08:56:09 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 27 Mar 2020 17:56:08 +0200
Date: Fri, 27 Mar 2020 17:56:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200327155608.GM2564@lahna.fi.intel.com>
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_085613_103170_64348E04 
X-CRM114-Status: GOOD (  28.20  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I don't think it is good idea to change PCI device name like that.

Instead the MTD cmdline parser should be teach to handle names like this
properly.

On Fri, Mar 27, 2020 at 08:48:39AM -0700, ron minnich wrote:
> anyone? This is in our internal tree but I'd like to get it upstreamed
> if possible.
> 
> On Wed, Mar 25, 2020 at 10:34 AM ron minnich <rminnich@gmail.com> wrote:
> >
> > Sorry, on that first one, I forgot the checkpatch. This one is clean.
> >
> > thanks
> >
> > On Wed, Mar 25, 2020 at 10:34 AM ron minnich <rminnich@gmail.com> wrote:
> > >
> > > The MTD subsystem can support command-line defined partitions
> > > for one or more MTD devices.
> > >
> > > The format is:
> > >  * mtdparts=<mtddef>[;<mtddef]
> > >  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
> > >
> > > The ':' currently separates the id from the partdef.
> > >
> > > The mtdparts can define more than one part, in which case
> > > there will be more than one <mtd-id>:<partdef> component.
> > >
> > > On Intel spi devices, the name is set to the PCI slot name,
> > > e.g. 0000:00:1f.5.  There are two : in the name alone.
> > > Since strchr is used to find the <mtd-id>,
> > > in this case it will return the wrong
> > > result. Using strrchr is not an option, as there may
> > > be more than one mtddef in the argument.
> > >
> > > This change modifies the name attached to the intel spi
> > > device, changing all ':' to '.', e.g. 0000:00:1f.5
> > > becomes 0000.00.1f.5. It also adds command line partition
> > > parsing registration to the intel_spi_probe function.
> > >
> > > Signed-off-by: Ronald G. Minnich <rminnich@google.com>
> > > Change-Id: Ibfa5caba51b8cdd3c41c60b15f8f8c583ded82ff
> > > ---
> > >  drivers/mtd/spi-nor/intel-spi-pci.c | 23 +++++++++++++++++++++++
> > >  drivers/mtd/spi-nor/intel-spi.c     |  5 ++++-
> > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c
> > > b/drivers/mtd/spi-nor/intel-spi-pci.c
> > > index 81329f680bec..dc608d74e824 100644
> > > --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> > > +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> > > @@ -24,6 +24,24 @@ static const struct intel_spi_boardinfo cnl_info = {
> > >      .type = INTEL_SPI_CNL,
> > >  };
> > >
> > > +/*
> > > + * PCI names use a ':' as a separator, which conflicts
> > > + * with the mtdparts cmdline parameter. Dup the name and
> > > + * replace : with .
> > > + */
> > > +static int fixname(struct pci_dev *pdev)
> > > +{
> > > +    char *name;
> > > +
> > > +    name = kstrdup(pci_name(pdev), GFP_KERNEL);
> > > +    if (!name)
> > > +        return -ENOMEM;
> > > +    strreplace(name, ':', '.');
> > > +    dev_set_name(&pdev->dev, name);
> > > +    kfree(name);
> > > +    return 0;
> > > +}
> > > +
> > >  static int intel_spi_pci_probe(struct pci_dev *pdev,
> > >                     const struct pci_device_id *id)
> > >  {
> > > @@ -41,6 +59,11 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
> > >      if (!info)
> > >          return -ENOMEM;
> > >
> > > +    if (fixname(pdev)) {
> > > +        kfree(info);
> > > +        return -ENOMEM;
> > > +    }
> > > +
> > >      /* Try to make the chip read/write */
> > >      pci_read_config_dword(pdev, BCR, &bcr);
> > >      if (!(bcr & BCR_WPD)) {
> > > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > > index 61d2a0ad2131..cb08ee4d2029 100644
> > > --- a/drivers/mtd/spi-nor/intel-spi.c
> > > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > > @@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops
> > > intel_spi_controller_ops = {
> > >      .erase = intel_spi_erase,
> > >  };
> > >
> > > +static const char * const part_probes[] = { "cmdlinepart", NULL };
> > > +
> > >  struct intel_spi *intel_spi_probe(struct device *dev,
> > >      struct resource *mem, const struct intel_spi_boardinfo *info)
> > >  {
> > > @@ -941,7 +943,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
> > >      if (!ispi->writeable || !writeable)
> > >          ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
> > >
> > > -    ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
> > > +    ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
> > > +                    NULL, &part, 1);
> > >
> > >      if (ret)
> > >          return ERR_PTR(ret);
> > >
> > > --
> > > 2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
