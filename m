Return-Path: <SRS0=hzeh=CS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079A1C43461
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 14:26:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BAA215A4
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 14:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZqmeaiR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="cDZ3FvJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BAA215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ogyvslyO266Uonv/oWCm6G4oWendX/6c7hlwIU8NHjQ=; b=DZqmeaiRJIkImXWMLC1otnL48
	rpcR2rMIPLWp2eTEtNe8xWY7pcvM1eSieh4aXLzpvf3tUuLDPqsJO8nS4tecbEjjXcUSOlSARg0Yc
	G9RK2or6pNYycU5n7Yh8tHD3RF42qU5cmRA1bTbYRhngDnVzYJh31XBmtKdJM/UfQwymhDxYpJHGj
	dyhwO1AgtN659mqPZPhQDm+iIpSuAFTaSzkEEuA+lRDcyUKuE4Ehpq1KQWALOLzMGe4ojzu+kkKY9
	ilnUMwLoxd3aYY945lmSETLvOIHAmAPL8vQpRGzyVzovOJjx8ZU8zYufd/BGG4L2ORGqvxZ0N7Pnn
	XYAzobPFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG12T-0003M4-50; Wed, 09 Sep 2020 14:25:33 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG12P-0003Kt-M0
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2020 14:25:31 +0000
Received: by mail-qv1-xf41.google.com with SMTP id di5so1556644qvb.13
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2020 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmOHg8qLdIxGmn6WIdyF0yDMs8Pd4/sNoCK3Ea7awWI=;
 b=cDZ3FvJzKqd1Dvp2nRsJt8pkjCOmcNg/+psjrnaaXOym2zXYsZ4dPPqfTz/mL6YjRG
 /E4oxQ+MNKpf0wySA5WcmlTrQT+GYlVl8GbfCIxryiHf5/fKv7hLPngVT/jM+Hn1khzE
 JQ2J7MPSwgz2QfQKMnxl0A+zQN9/Vci/IOOTZ2LMCFVFMvm/BEZD2Z9KARixNq9HeMEy
 fxKzCWoSYSFdoXN8TE2m4nI2bkh79ArDvlKfwjAYdswBxrP2pJFl1rNDwB9cGlJdVPCT
 hb6DxP0Eblfoe2qyBWb53U0GrbjaTG112kGtuMyIhvMnfnfaBYs99G6fQ213h40Wv8S9
 Igfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmOHg8qLdIxGmn6WIdyF0yDMs8Pd4/sNoCK3Ea7awWI=;
 b=qQq5+JxIevB6Bg93iIaavsT3CqCjlUYjd/2Ed+H7g5GbtXu3gTNubnGA+x+AaQFrqL
 /6WOy8HYTXB2i4VGkw4gYt26kuUgqwj9HckmGAPKzIi3D52eX3yDulnLwy0qjRHByC2Z
 Gas2FM1f2aae9rf45r1IMDaUFLGUYfH45yXa4wLegdYjTMGYiEtPT97ozAZNP7fKEckW
 UNiQ6YHPrdVRekU/HMrkCk0uCg/scwch4GmCPru304806zV9RQOYM+aOttmUyiKBsV2n
 JD6HEZHB8W+0QBrbmPT0eOgT3ykfbGfg92QQhvs0v+xrxvOpwEget49mDRCEYEtCDY1I
 Qz/Q==
X-Gm-Message-State: AOAM5335YLOeWlPuUfkK4rBkehXh8QJ+zavMjNdmfcQsywgJGYD310vT
 q3mU1ksmPQ0oO5akm/EZk0WZh7jJdghZJidhmXjp5Q==
X-Google-Smtp-Source: ABdhPJwC/9RlWBKE1YZR9qf0dEG3NRmIrd1RkvV7XTm8Oz4KihQ7bdtlmdcAadGq2dZW0Q3kqAjRhLh+nfWyJ6OGkbc=
X-Received: by 2002:a0c:b35d:: with SMTP id a29mr4114921qvf.19.1599661525454; 
 Wed, 09 Sep 2020 07:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200903161804.403299-1-daniel.gutson@eclypsium.com>
 <7885ca85-5982-a0d5-2307-d785d4dc0eea@ti.com>
In-Reply-To: <7885ca85-5982-a0d5-2307-d785d4dc0eea@ti.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Wed, 9 Sep 2020 11:25:13 -0300
Message-ID: <CAFmMkTHXkhAdQT-1kTDYnwarshV1JTLSgnPi4X7=EMgS5iVZpA@mail.gmail.com>
Subject: Re: [PATCH] Platform integrity information in sysfs
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_102530_004297_A884A436 
X-CRM114-Status: GOOD (  51.53  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 8, 2020 at 5:48 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi,

Hi, thanks for your review.

>
> On 9/3/20 9:48 PM, Daniel Gutson wrote:
> > This patch exports information about the platform integrity
> > firmware configuration in the sysfs filesystem.
> > In this initial patch, I include some configuration attributes
> > for the system SPI chip.
> >
>
> Please avoid first-person singular pronouns instead use imperative mood.
>
> > This initial version exports the BIOS Write Enable (bioswe),
> > BIOS Lock Enable (ble), and the SMM BIOS Write Protect (SMM_BWP)
> > fields of the BIOS Control register. The idea is to keep adding more
> > flags, not only from the BC but also from other registers in following
> > versions.
> >
> > The goal is that the attributes are avilable to fwupd when SecureBoot
> > is turned on.
> >
>
> s/avilable/available
>
> > The patch provides a new misc driver, as proposed in the previous patch,
> > that provides a registration function for HW Driver devices to register
> > class_attributes.
> > In this case, the intel SPI flash chip (intel-spi) registers three
>
> s/intel SPI/Intel SPI
>
> > class_attributes corresponding to the fields mentioned above.
> >
> > This version of the patch provides a new API supporting regular
> > device attributes rather than custom attributes, and also avoids
> > a race condition when exporting the driver sysfs dir and the
> > attributes files inside it.
> > Also, this patch renames 'platform lockdown' by 'platform integrity'.
>
> Changes wrt to previous versions should not be part of commit message
> but instead should be below tearline (b/w "---" and diffstat below)
>
> >
> > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> > ---
>
> Changes wrt previous versions go here...
>
> >  .../ABI/stable/sysfs-class-platform-integrity | 23 +++++
> >  MAINTAINERS                                   |  7 ++
> >  drivers/misc/Kconfig                          | 11 +++
> >  drivers/misc/Makefile                         |  1 +
> >  drivers/misc/platform-integrity.c             | 61 +++++++++++++
> >  drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
> >  .../mtd/spi-nor/controllers/intel-spi-pci.c   | 64 ++++++++++++-
> >  .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
> >  drivers/mtd/spi-nor/controllers/intel-spi.c   | 89 ++++++++++++++++++-
> >  drivers/mtd/spi-nor/controllers/intel-spi.h   |  5 +-
> >  include/linux/platform-integrity.h            | 20 +++++
> >  11 files changed, 278 insertions(+), 6 deletions(-)
> >  create mode 100644 Documentation/ABI/stable/sysfs-class-platform-integrity
> >  create mode 100644 drivers/misc/platform-integrity.c
> >  create mode 100644 include/linux/platform-integrity.h
> >
>
>
> You forgot to cc linux-mtd lists and hence patch did not show up in my
> queue.. MTD Patches are managed via patchoworks and if linux-mtd is not
> cc'd then they will most likely be ignored. Please use
> scripts/get_maintainer.pl to get list of maintainters and mailing lists
> to cc.

Sorry, I don't know when I lost the list in the emails, I included it
in previous
patches.

>
> Also, this patch needs to be split into at least two patches: one
> introducing platform-integrity module and another adding suuport for
> intel-spi driver to use the same.
>
> Also, I see there are multiple iterations of the patch posted but are
> not versioned. Please use appropriate version number in $subject.
>
> Please read Documentation/process/submitting-patches.rst for more details.
>
>
> > diff --git a/Documentation/ABI/stable/sysfs-class-platform-integrity b/Documentation/ABI/stable/sysfs-class-platform-integrity
> > new file mode 100644
> > index 000000000000..b31ec051ca48
> > --- /dev/null
> > +++ b/Documentation/ABI/stable/sysfs-class-platform-integrity
> > @@ -0,0 +1,23 @@
> > +What:                /sys/class/platform-integrity/intel-spi/bioswe
> > +Date:                September 2020
> > +KernelVersion:       5.9.1
>
> 5.9 merge window is closed. This won't make it to 5.9... Maybe 5.10
>
> > +Contact:     Daniel Gutson <daniel.gutson@eclypsium.com>
> > +Description: If the system firmware set BIOS Write Enable.
> > +             0: writes disabled, 1: writes enabled.
> > +Users:               https://github.com/fwupd/fwupd
> > +
> > +What:                /sys/class/platform-integrity/intel-spi/ble
>
> Naming seems inconsistent... Previous entry was bioswe (BIOS write
> enable) but this one is called ble (BIOS latch enable). Maybe rename
> previous one as bwe to be consistent with other entries?
>
> > +Date:                September 2020
> > +KernelVersion:       5.9.1
> > +Contact:     Daniel Gutson <daniel.gutson@eclypsium.com>
> > +Description: If the system firmware set BIOS Lock Enable.
> > +             0: SMM lock disabled, 1: SMM lock enabled.
> > +Users:               https://github.com/fwupd/fwupd
> > +
> > +What:                /sys/class/platform-integrity/intel-spi/smm_bwp
> > +Date:                September 2020
> > +KernelVersion:       5.9.1
> > +Contact:     Daniel Gutson <daniel.gutson@eclypsium.com>
> > +Description: If the system firmware set SMM BIOS Write Protect.
> > +             0: writes disabled unless in SMM, 1: writes enabled.
>
> Is SMM a standard abbreviation in  Intel world? If not you may want to
> expand what it means in Description.
>
> > +Users:               https://github.com/fwupd/fwupd
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e4647c84c987..771eaf715427 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13744,6 +13744,13 @@ S:   Maintained
> >  F:   Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
> >  F:   drivers/iio/chemical/pms7003.c
> >
> > +PLATFORM INTEGRITY DATA MODULE
> > +M:   Daniel Gutson <daniel.gutson@eclypsium.com>
> > +S:   Supported
> > +F:   Documentation/ABI/sysfs-class-platform-integrity
> > +F:   drivers/misc/platform-integrity.c
> > +F:   include/linux/platform-integrity.h
> > +
> >  PLDMFW LIBRARY
> >  M:   Jacob Keller <jacob.e.keller@intel.com>
> >  S:   Maintained
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index ce136d685d14..d5d0de5b5706 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -456,6 +456,17 @@ config PVPANIC
> >         a paravirtualized device provided by QEMU; it lets a virtual machine
> >         (guest) communicate panic events to the host.
> >
> > +config PLATFORM_INTEGRITY_ATTRS
> > +     tristate "Platform integrity information in the sysfs"
> > +     depends on SYSFS
> > +     help
> > +       This kernel module is a helper driver to provide information about
> > +       platform integrity settings and configuration.
> > +       This module is used by other device drivers -such as the intel-spi-
> > +       to publish the information in /sys/class/platform-integrity which is
> > +       consumed by software such as fwupd which can verify the platform
> > +       has been configured in a secure way.
> > +
>
> [...]
>
> > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > index 5c0e0ec2e6d1..113e349a826b 100644
> > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > @@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
> >
> >  config SPI_INTEL_SPI
> >       tristate
> > +     select PLATFORM_INTEGRITY_ATTRS
> >
>
> Not a good idea to use select clause on symbols that have dependencies
> as select will force a symbol to a value without visiting the
> dependencies. Instead use depends on

I just tried this, but when selecting the Intel SPI drivers, my new
platform integrity driver
was not selected, as it was with the select clause.

>
>
> >  config SPI_INTEL_SPI_PCI
> >       tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > index c72aa1ab71ad..e1bca8aedf7c 100644
> > --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > @@ -10,11 +10,19 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/platform-integrity.h>
> >
> >  #include "intel-spi.h"
> >
> >  #define BCR          0xdc
> >  #define BCR_WPD              BIT(0)
> > +#define BCR_BLE              BIT(1)
> > +#define BCR_SMM_BWP  BIT(5)
> > +
> > +struct cnl_spi_attr {
> > +     struct device_attribute dev_attr;
> > +     u32 mask;
> > +};
> >
> >  static const struct intel_spi_boardinfo bxt_info = {
> >       .type = INTEL_SPI_BXT,
> > @@ -24,6 +32,59 @@ static const struct intel_spi_boardinfo cnl_info = {
> >       .type = INTEL_SPI_CNL,
> >  };
> >
> > +static ssize_t cnl_spi_attr_show(struct device *dev,
> > +     struct device_attribute *attr, char *buf, u32 mask)
> > +{
>
> Please be consistent with existing code and use intel_spi_ prefix for
> function names.
>
> Also Alignment should match open parenthesis..
> Please run scripts/checkpatch.pl --strict on patch and fix all issue
> reported.

I just added the --strict flag and indeed a lot of alignment
issues showed up. I will fix this in the next version. Thanks.

>
> [...]
>
> Regards
> Vignesh



-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
