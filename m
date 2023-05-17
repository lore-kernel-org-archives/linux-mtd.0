Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5391DC77B7D
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12X2XLbP1c0UGXOzG0hqY7l7sGwM2PekT1H0/SAj1jY=; b=NzDcjmiz1DVecr
	hBIze94uLucPU59eZCRS9Fqsq6h+FwJ5ULaFQKj2YpJc2N5ouuq9og0XPpY6P1k4QjCs8AMkyqfLP
	oGi8eYVIEpwj6mRv+ZtVfq0U9PHJyoX8OuCBF5LxVvRl7j3VXVzvOY1Pt5sAYP+M42K1MK8te6YxX
	HjYvZVHigFSOGWhB2qpjW7An5qh2igzmbZGjCgxxYkRZrtoJF5Co5bYmbBYr0wMuglwI+Vnz0KJmQ
	9aJFme8jFInp1Jk2zuKqmPojLR9SXkDdLxL2nnhh+bI6xaFdMoAia7hpmwgT4fpiEOfVOIsrfCJ2R
	XpOlmIs4YIi8JyCbfXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIgr-00AErr-1L;
	Wed, 17 May 2023 15:03:45 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIgo-00AEqt-08
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 15:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684335822; x=1715871822;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N1BSP4Ia8BM8HI0rdakyWqbYxRwvAQiEFATJFkkYIKE=;
  b=fPkxED1Uq4+QX/ZVJS9oNi/6ZW0OgDpjQeI6wmiPiffjObWxaIKZLaJD
   QBN3AftVMv9ADQ+Z1ex0pCaKj+AdT4yYqCXEH+Nyu2CFTITOfoCVewyeH
   5a4xPARiWRUFA4iaXwgoOqU4frqd8xGSyr99PG8JTwow/mCoofVpNB1rp
   hQhy6XprnFPIwJKJ5aUqSitBkDxaqsAR7e8Ky+ls4jRzEOEDp3wBC69Ed
   nT/WJLYVcfeZcBSX1xlPGgSybMRDEsULoHlDG3IN2OTDzUBDb1KuaUIHA
   amrKJ86JxenyBq8YWsZ585fOLkgPRwTOAxcbVKQ6xo6kFktKufxmH+Std
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354081701"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="354081701"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 08:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="652277172"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="652277172"
Received: from wopr.jf.intel.com ([10.54.75.136])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 08:03:23 -0700
Message-ID: <38bf4bce7961c674b7ac798a8413cb1256eea8f4.camel@linux.intel.com>
Subject: Re: [PATCH] MTD SPI-NOR: BUG FIX of divide by zero in new n_banks
 value
From: Todd Brandt <todd.e.brandt@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Todd Brandt
	 <todd.e.brandt@intel.com>, miquel.raynal@bootlin.com, 
	linux-kernel@vger.kernel.org
Cc: pratyush@kernel.org, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Date: Wed, 17 May 2023 08:03:23 -0700
In-Reply-To: <3ab922a4-255a-5aef-86ba-d906819f0f3a@linaro.org>
References: <20230516225108.29194-1-todd.e.brandt@intel.com>
	 <3ab922a4-255a-5aef-86ba-d906819f0f3a@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_080342_223247_3C960C57 
X-CRM114-Status: GOOD (  30.11  )
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
Reply-To: todd.e.brandt@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2023-05-17 at 08:10 +0100, Tudor Ambarus wrote:
> Hi, Todd,
> 
> On 5/16/23 23:51, Todd Brandt wrote:
> > While testing 6.4-rc1 on our Lenovo Thinkpad X1 I discovered
> > that freeze, suspend, and shutdown, all hang the system. I bisected
> > it to an addition made to the MTD spi-nor code.
> > 
> > The new "n_banks" value is being divided into without a proper
> > check..
> > Thus on certain systems this causes a divide by zero hang.
> > 
> > Reported-and-tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> > Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> > Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-
> > nor/core.c
> > index 0bb0ad14a2fc..084117959be4 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2921,7 +2921,10 @@ static void spi_nor_late_init_params(struct
> > spi_nor *nor)
> >  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
> >  		spi_nor_init_default_locking_ops(nor);
> >  
> > -	nor->params->bank_size = div64_u64(nor->params->size, nor-
> > >info->n_banks);
> > +	if (nor->info->n_banks > 0)
> > +		nor->params->bank_size = div64_u64(nor->params->size,
> > nor->info->n_banks);
> > +	else
> > +		nor->params->bank_size = 0;
> >  }
> >  
> >  /**
> 
> Indeed, thanks for the report and patch. You probably use the
> spi-nor-generic driver, don't you?
> 
> Can you try the following change instead?

Yes, this also seems to fix things on the Lenovo Thinkpad X1, but the
solution should be this AND the "if (nor->info->n_banks > 0)" patch. It
doesn't hurt to check even if it's a very unlikely border case. It
guarantees that the issue won't occur again even if somehow a struct
instance is created uninitialized.

You could probably just slim it down to a single if line instead of
if/else since the default bank_size is zero by default:

+   if (nor->info->n_banks > 0)
+       nor->params->bank_size = div64_u64(nor->params->size, nor-
>info->n_banks);

> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>                       index 0bb0ad14a2fc..37f750bd7bfb 100644
> --- a/drivers/mtd/spi-nor/core.cdrivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.cdrivers/mtd/spi-nor/core.c
> @@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
> 
>  static const struct flash_info spi_nor_generic_flash = {
>         .name = "spi-nor-generic",
> +       .n_banks = 1,
>         /*
>          * JESD216 rev A doesn't specify the page size, therefore we
> need a
>          * sane default.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
