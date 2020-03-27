Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9641AC43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 15:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6431820748
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 15:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IS5zKlbC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUm2khva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6431820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4lk3kkmeyaaPC8LAKA/0hONbXsW22PImZTnoRqvEAcE=; b=IS5zKlbCsYbtIaoNKYqRR/dCTj
	358RPq+/9hqJaVFh32mCBVb4sEdfI8WeqMXLAgU1KzJVAqLVSVzxWKOGK+DKMKUBbDQlNJB7mbgMF
	z9ZVAbJ9FqDLFKiT6BwXX4HL8O47GDFTOeJNBfc6j8FuG97DRcEjmJgTS+aePPWuqcqh3usxLFX39
	xGg2EfCtfFWfLfj0C9fSkg6aeV9vEkF6yilJnUL1GdlToHrTAVYWktZnfbRMZpm2cC4l8jwKevOi/
	oeLH9YWZ6mqx6SvUOMEMr3VFgL22WyRS8qAvuAjl7KJDd23EfKi8QatlGi/MkrSfGT6Wr8EQOLk3m
	gV+ThsKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHrE6-0002a8-VD; Fri, 27 Mar 2020 15:48:54 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHrE4-0002Z8-Ov
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 15:48:54 +0000
Received: by mail-oi1-x243.google.com with SMTP id k9so9145975oia.8
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2020 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EssPC9VCPqWkS53+bqdnDqDak4ryoHlft0AXjfEy4R0=;
 b=pUm2khva+9/rUc6a3kw5CIiPiaIMEAwVIzLLS9jaRcAE/0zHNMKPo8ZwCIQ7lxsnF/
 9Uz6eQl4k0rmgJm5IfYSwI7pDmFV1q+P500C4uMfuMnOEvGypgl8A9y/8LnbtpNrxx0/
 3DpnTbdBwPi8Tb+DBn0DX/W+fn2bsfNw87rTWWKVrloxPE4os6Jtc1FIEvCpCpj4JcKH
 8alU2foJOo+/OE/pc1GC3y45M/LtBzAF/j62xgnTnmTPfjwTEcXebgwfpyyeRSdMB60X
 BRStTW7okfvbHq+XJ64QAZLLl9faz5Is/dMO3NwzFmJxjki89PpQLzcA1exuNYBBUpmY
 Oi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EssPC9VCPqWkS53+bqdnDqDak4ryoHlft0AXjfEy4R0=;
 b=DCIhlvMLOFD9NtSiHfUq067j98TB5IcOK26JQzMMVRWT0V3KQutW7GzuLSwZ7X1nDp
 EucgVe8ejfCDXwg7XTizXgCdPLT9yJw7C3oiJkrWa/1sxyF8lRX6UW0JJ6f9FbN3UfgH
 SxpCcIAACT8IwQNOs6mjTjrIk4tjtWYiRkAcr67G+To1K0jPYO0igmpoCVI0gXcefagr
 dZ//mC6EsfLHNyVpDhbd9LUMkJSygg+G6Tdhot77eZRbKVjrHzvmz/kCw3ICddpR2Nyn
 IyGSUNQn5MszRz+KZJga3eMogOKC1nvxo8QACGIW+OP83bKRRr73CtlhbJ9RolvG2dOa
 cuqA==
X-Gm-Message-State: ANhLgQ3TTRVy/IlVxFzMRKgAopnVLA0g+fYE4xqyAAaZ1QhekXjVE4sV
 wrGeJC+ppngyjBBX33L8g117OEglzATGsJkzUmH+HA==
X-Google-Smtp-Source: ADFU+vuu3gUQwKYtz7Y5cZJJ2c5Khy4Tx4iLfb1u6KhYMcv8Yi8uKxmYYNVvP+gh0FLEhR71Q2fyzRtmxQqbUOV8Hcw=
X-Received: by 2002:aca:5d8a:: with SMTP id r132mr4485006oib.129.1585324130349; 
 Fri, 27 Mar 2020 08:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
In-Reply-To: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Mar 2020 08:48:39 -0700
Message-ID: <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 mika.westerberg@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_084852_817184_B721C366 
X-CRM114-Status: GOOD (  24.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

anyone? This is in our internal tree but I'd like to get it upstreamed
if possible.

On Wed, Mar 25, 2020 at 10:34 AM ron minnich <rminnich@gmail.com> wrote:
>
> Sorry, on that first one, I forgot the checkpatch. This one is clean.
>
> thanks
>
> On Wed, Mar 25, 2020 at 10:34 AM ron minnich <rminnich@gmail.com> wrote:
> >
> > The MTD subsystem can support command-line defined partitions
> > for one or more MTD devices.
> >
> > The format is:
> >  * mtdparts=<mtddef>[;<mtddef]
> >  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
> >
> > The ':' currently separates the id from the partdef.
> >
> > The mtdparts can define more than one part, in which case
> > there will be more than one <mtd-id>:<partdef> component.
> >
> > On Intel spi devices, the name is set to the PCI slot name,
> > e.g. 0000:00:1f.5.  There are two : in the name alone.
> > Since strchr is used to find the <mtd-id>,
> > in this case it will return the wrong
> > result. Using strrchr is not an option, as there may
> > be more than one mtddef in the argument.
> >
> > This change modifies the name attached to the intel spi
> > device, changing all ':' to '.', e.g. 0000:00:1f.5
> > becomes 0000.00.1f.5. It also adds command line partition
> > parsing registration to the intel_spi_probe function.
> >
> > Signed-off-by: Ronald G. Minnich <rminnich@google.com>
> > Change-Id: Ibfa5caba51b8cdd3c41c60b15f8f8c583ded82ff
> > ---
> >  drivers/mtd/spi-nor/intel-spi-pci.c | 23 +++++++++++++++++++++++
> >  drivers/mtd/spi-nor/intel-spi.c     |  5 ++++-
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c
> > b/drivers/mtd/spi-nor/intel-spi-pci.c
> > index 81329f680bec..dc608d74e824 100644
> > --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> > +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> > @@ -24,6 +24,24 @@ static const struct intel_spi_boardinfo cnl_info = {
> >      .type = INTEL_SPI_CNL,
> >  };
> >
> > +/*
> > + * PCI names use a ':' as a separator, which conflicts
> > + * with the mtdparts cmdline parameter. Dup the name and
> > + * replace : with .
> > + */
> > +static int fixname(struct pci_dev *pdev)
> > +{
> > +    char *name;
> > +
> > +    name = kstrdup(pci_name(pdev), GFP_KERNEL);
> > +    if (!name)
> > +        return -ENOMEM;
> > +    strreplace(name, ':', '.');
> > +    dev_set_name(&pdev->dev, name);
> > +    kfree(name);
> > +    return 0;
> > +}
> > +
> >  static int intel_spi_pci_probe(struct pci_dev *pdev,
> >                     const struct pci_device_id *id)
> >  {
> > @@ -41,6 +59,11 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
> >      if (!info)
> >          return -ENOMEM;
> >
> > +    if (fixname(pdev)) {
> > +        kfree(info);
> > +        return -ENOMEM;
> > +    }
> > +
> >      /* Try to make the chip read/write */
> >      pci_read_config_dword(pdev, BCR, &bcr);
> >      if (!(bcr & BCR_WPD)) {
> > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > index 61d2a0ad2131..cb08ee4d2029 100644
> > --- a/drivers/mtd/spi-nor/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > @@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops
> > intel_spi_controller_ops = {
> >      .erase = intel_spi_erase,
> >  };
> >
> > +static const char * const part_probes[] = { "cmdlinepart", NULL };
> > +
> >  struct intel_spi *intel_spi_probe(struct device *dev,
> >      struct resource *mem, const struct intel_spi_boardinfo *info)
> >  {
> > @@ -941,7 +943,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
> >      if (!ispi->writeable || !writeable)
> >          ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
> >
> > -    ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
> > +    ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
> > +                    NULL, &part, 1);
> >
> >      if (ret)
> >          return ERR_PTR(ret);
> >
> > --
> > 2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
