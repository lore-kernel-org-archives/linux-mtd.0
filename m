Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DFDC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 14:08:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5432E20BED
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 14:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POfGSBRY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="Q/yUQX4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5432E20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NXyPp5i4aJFdEpLTuncW0zKNYGCkiIunMckPTB4y8XY=; b=POfGSBRYNbLlMD7mz1fesY0yO
	85Emh9p1q+I+Lv8U6O3KNa1TvcIGW73mi3iCCX9E6dswDDRnIZwDtWwKw5R8c0sHYkT2qiwTXAjG9
	zuYG4qGiUFc34n9JLfeosmdkMNKolkxY1gV8SI1iyPjkNRVqO8KZ7Ba2Ap+hPgwk8HsgsRUbxlhyC
	JZSV8pKeHWJbdhI7YFSbM+AhynDqUsidWqU10WJQOoOAQTFRw5HYuzVuVRFQZeJPatNoNPeggS8Qq
	OPbviTeG0UU9Zp9Ih29OzdvOoGRtJMQpS9CHJACCvqd57fQtDzouzjp/M7uJdTwkGC8O3aDdxAb0p
	cAnguxMUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcUJ5-0006M0-R0; Tue, 10 Nov 2020 14:07:35 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcUJ2-0006Km-PG
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 14:07:34 +0000
Received: by mail-lf1-x144.google.com with SMTP id e27so17704565lfn.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2020 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyaFDmv9n+DlMi8b29T94TKK3unvJxPiu1LCzCeynyI=;
 b=Q/yUQX4/IOYYhSKBfHS9CgoDBsSKp0lu3yzAF0Naw1H/lDuR9BuQbpehzCBE+20iY3
 o9GV0/JHeVsWYLEfp49eOomatnayOJ8oq1oVkhXUxX+Yd22Ye78ib+fKenEaEoMZgVB4
 a9CbT5Y3c/6tPP/pNGCdh2e6gurCI71W88FBN/sPSfir9Y20jkY+saf7cmJ4pHvzDg01
 Ix98/vh6D/Lu4YciKimPfqwlzSDgQP0gexwW1oOuHtHmUutuBjYPNO0TI09nM5ur83F2
 sH+oaY9SXgIG/ApqfpPo5RDDlJI812rk3BV1VI6IIhHFHJ5TbqiKaiwgyTPeHFTHj4jT
 GhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyaFDmv9n+DlMi8b29T94TKK3unvJxPiu1LCzCeynyI=;
 b=Wg24uj2VaoJsf/SSP6THXg6i2bfj0jsCL8Z5Nekl0AkHvJmZ0T8A9mW3JJd6ZTp02D
 ezPUELPQBVoAd1eZPKvqu5sGYxhK9g8XDyIcL0wYdRPV79D+mZeKQYWsiKI+nyk/btiH
 MQhsjHEAPTW9ZyHN15jT7c1I6KMaQcREqWHnuru4FMbHJ5WJvIVGJh55xoFEdZ+0Vmsd
 oF8zmExIWk+SUU/C9lBZQj7Hh1O9BSp4BRYVN/H7UPuq/VEqxHoXZ6xNSTvf1+5dxUp9
 b4vBpJwx02g/eGvu1lXvi78i4KQkEvuD4unVck8BXlcPBq7/p+d+Ar0EoecKghTYFCr0
 0uvw==
X-Gm-Message-State: AOAM530THPVZfFuWGNdj5CnrJ1W46btWUgl6T0Ff4kKdQUJIaYAleLb0
 vS8LJaSPIh0g2wQ090+E2SjRGAJO5XrGNd5VR+7xsQ==
X-Google-Smtp-Source: ABdhPJzzaH5GLfhRaUWu5NGdK1eBNucf3k4+1Vl4b2g/6vugVqyiM2XuXC8siEttFWDkrjZDXfPiW00sXTITd5LlNTM=
X-Received: by 2002:ac2:483b:: with SMTP id 27mr2376786lft.551.1605017249001; 
 Tue, 10 Nov 2020 06:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
 <20200930163714.12879-3-daniel.gutson@eclypsium.com>
 <20201002134331.GA3418160@kroah.com>
 <CAFmMkTFP9t4NnmVc6_n=5WKoJwvSbCHgY+i=Y_PQxua_626Pfg@mail.gmail.com>
In-Reply-To: <CAFmMkTFP9t4NnmVc6_n=5WKoJwvSbCHgY+i=Y_PQxua_626Pfg@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Tue, 10 Nov 2020 11:07:15 -0300
Message-ID: <CAFmMkTG0Sq0nUmuqSVCMhnrkWmKiseh==SbRsbM0jNVomiBHMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Platform integrity information in sysfs (version 9)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_090733_107678_0B1D020A 
X-CRM114-Status: GOOD (  38.08  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>, Yoav Yaari <yoav.yaari@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 21, 2020 at 4:55 PM Daniel Gutson <daniel@eclypsium.com> wrote:
>
> On Fri, Oct 2, 2020 at 10:43 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Sep 30, 2020 at 01:37:14PM -0300, Daniel Gutson wrote:
> > > This patch exports the BIOS Write Enable (bioswe), BIOS
> > > Lock Enable (biosle), and the SMM BIOS Write Protect (SMM_BIOSWP) fields of
> > > the BIOS Control register using the platform-integrity misc kernel module.
> > > The idea is to keep adding more flags, not only from the BC but also from
> > > other registers in following versions.
> > >
> > > The goal is that the attributes are avilable to fwupd when SecureBoot
> > > is turned on.
> > >
> > > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> >
> > The subject line doesn't match what this patch does, please fix that up.
> >
> > But there are more core issues in this patch:
> >
> > >
> > > ---
> > >  drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
> > >  .../mtd/spi-nor/controllers/intel-spi-pci.c   | 75 ++++++++++++++-
> > >  .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
> > >  drivers/mtd/spi-nor/controllers/intel-spi.c   | 91 ++++++++++++++++++-
> > >  drivers/mtd/spi-nor/controllers/intel-spi.h   |  9 +-
> > >  5 files changed, 171 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > > index 5c0e0ec2e6d1..e7eaef506fc2 100644
> > > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > > @@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
> > >
> > >  config SPI_INTEL_SPI
> > >       tristate
> > > +     depends on PLATFORM_INTEGRITY_DATA
> > >
> > >  config SPI_INTEL_SPI_PCI
> > >       tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > index c72aa1ab71ad..644b1a6091dc 100644
> > > --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > @@ -10,11 +10,19 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pci.h>
> > > +#include <linux/platform-integrity.h>
> > >
> > >  #include "intel-spi.h"
> > >
> > >  #define BCR          0xdc
> > >  #define BCR_WPD              BIT(0)
> > > +#define BCR_BLE              BIT(1)
> > > +#define BCR_SMM_BWP  BIT(5)
> > > +
> > > +struct cnl_spi_attr {
> > > +     struct device_attribute dev_attr;
> > > +     u32 mask;
> > > +};
> > >
> > >  static const struct intel_spi_boardinfo bxt_info = {
> > >       .type = INTEL_SPI_BXT,
> > > @@ -24,6 +32,70 @@ static const struct intel_spi_boardinfo cnl_info = {
> > >       .type = INTEL_SPI_CNL,
> > >  };
> > >
> > > +#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
> > > +static ssize_t intel_spi_cnl_spi_attr_show(struct device *dev,
> > > +                                        struct device_attribute *attr,
> > > +                                        char *buf, u32 mask)
> > > +{
> > > +     u32 bcr;
> > > +
> > > +     if (dev->parent == NULL)
> > > +             return -EIO;
> > > +
> > > +     if (pci_read_config_dword(container_of(dev->parent, struct pci_dev, dev),
> > > +                               BCR, &bcr) != PCIBIOS_SUCCESSFUL)
> > > +             return -EIO;
> > > +
> > > +     return sprintf(buf, "%d\n", (int)!!(bcr & mask));
> > > +}
> > > +
> > > +static ssize_t bioswe_show(struct device *dev, struct device_attribute *attr,
> > > +                        char *buf)
> > > +{
> > > +     return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_WPD);
> > > +}
> > > +static DEVICE_ATTR_RO(bioswe);
> > > +
> > > +static ssize_t biosle_show(struct device *dev, struct device_attribute *attr,
> > > +                        char *buf)
> > > +{
> > > +     return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_BLE);
> > > +}
> > > +static DEVICE_ATTR_RO(biosle);
> > > +
> > > +static ssize_t smm_bioswp_show(struct device *dev, struct device_attribute *attr,
> > > +                            char *buf)
> > > +{
> > > +     return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_SMM_BWP);
> > > +}
> > > +static DEVICE_ATTR_RO(smm_bioswp);
> > > +
> > > +static struct attribute *cnl_attrs[] = {
> > > +     &dev_attr_bioswe.attr,
> > > +     &dev_attr_biosle.attr,
> > > +     &dev_attr_smm_bioswp.attr,
> > > +     NULL
> > > +};
> > > +ATTRIBUTE_GROUPS(cnl);
> >
> > If you are forcing the driver to create the groups, then you are forcing
> > us to audit each driver and verify that the files are the same name and
> > such.  Put the files in the "common" code please, and if you really need
> > a way to get the data out, make that a callback or something.
>
> If I understand you correctly, you are asking the opposite that Arnd
> asked me in a
> previous patch version: he told me no new callbacks, just use the
> device attribute API.
> However I'm not sure I understand your proposal, do you mean to let
> the device attr
> stay in the driver file, and do the group inside the common part? Therefore,
> to pass a dev attributes array to the common part?
> If not, could you please explain your proposal again?


ping please.

>
> >
> > Also, this name "platform integrity" is really really generic, while in
> > reality you are describing something very specific.  Are you sure you
> > want that?
> >
> > thanks,
> >
> > greg k-h
>
>
>
> --
>
>
> Daniel Gutson
> Engineering Director
> Eclypsium, Inc.
>
>
> Below The Surface: Get the latest threat research and insights on
> firmware and supply chain threats from the research team at Eclypsium.
> https://eclypsium.com/research/#threatreport



-- 


Daniel Gutson
Engineering Director
Eclypsium, Inc.


Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
