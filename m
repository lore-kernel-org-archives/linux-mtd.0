Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB38CCCD184
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Oct 2025 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf2S/zlhbz9XtB4SppWNzUzzsWwkaqaDf2M94PMPnfE=; b=PWsrA4Wvn2UM7l
	2qrUdDlBBgbXTP0S3epv0ZF2BKsaxdvguRzRAKzpPQzE5RV+++tzwSgXJZu9j7wPfV7+A0GMCp4iR
	N3VgeJWGTGwaIigQA9gzvyeMhlVPL5FKrRZAknzmfN/DJVTqGEvuffm7lHizmQRWA3K+pTJifirXW
	zVTzmwQw+c5dtUIsjmVAePd68HuwRwPIVAkVykCTW5vp79UzAW5I0j3vYhY8z4CrHpU3B0yWLwkg8
	7S4Vc0Hg9b1bR6wYqxDdxbmKhJuzw9qPgVs2/x9MSfHxAoggCyvRjorQhXV9/G/ayJG9RJo2tUogK
	Olo21+pFCOo03BaposMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDWb-0000000HLzQ-0HpC;
	Tue, 21 Oct 2025 14:39:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDWY-0000000HLyy-1utP
	for linux-mtd@lists.infradead.org;
	Tue, 21 Oct 2025 14:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761057583; x=1792593583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gTA9DHqq1ZEV51oA7dPZUUGbSHQxjaWyKlOjjm1PTcM=;
  b=jWw0lAeoXBUWFHMIdQJIp0spX7jnwUJNMTa3gEtFsQmr9lVM4m2oZLuf
   d6S0nqdRXoGiqiabyDtJuVaYAfcuGkKiJ6RX6XJOtSkjHXUkziWfPnl+F
   wsOYH5C6yS6NCAoXPs3nA+KtrEx5xih3Furq3dAF58DhP4RahchlzMmbc
   6ilwDXuNvwngFioiPRYgfAI4mYe7jyQNgxnmo4bbxUTcsnbR8wAo/QDIl
   qYUlMqWbqaIkInnmKyE0mZaRzTlWshBTAV3MeMcp83HzfN2LPqOK+YUep
   MCRkIqwcZ9/FSCdkXaE9RIGRtURA09vspMprKYzHcwGfqLpbWLO+UWBdy
   w==;
X-CSE-ConnectionGUID: FVinlYGXTKWPBKM3kMlU7w==
X-CSE-MsgGUID: 3YKLPpovQv+jhNPrDLW55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80622385"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="80622385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:39:40 -0700
X-CSE-ConnectionGUID: FYtv4IEwSiiejaBsPkkcGg==
X-CSE-MsgGUID: TmE7Je7qTvSr+xpCYrVFEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="214560959"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:39:37 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBDWQ-00000001WJ7-493Y;
	Tue, 21 Oct 2025 17:39:34 +0300
Date: Tue, 21 Oct 2025 17:39:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] mtd: intel-dg: wake card on operations
Message-ID: <aPebJrWsqMCKmMpX@smile.fi.intel.com>
References: <20251019150145.3228079-1-alexander.usyskin@intel.com>
 <aPYKRvCenwnrFXcb@ashevche-desk.local>
 <aPYKfhTDF5kXulz9@ashevche-desk.local>
 <CY5PR11MB6366D892E7B6FDB112751306EDF2A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366D892E7B6FDB112751306EDF2A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_073942_580525_665A4409 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Oct 21, 2025 at 12:51:30PM +0000, Usyskin, Alexander wrote:
> > On Mon, Oct 20, 2025 at 01:09:10PM +0300, Andy Shevchenko wrote:
> > > On Sun, Oct 19, 2025 at 06:01:45PM +0300, Alexander Usyskin wrote:

...

> > > > +	devm_pm_runtime_enable(device);
> > >
> > > Please, justify why this code is good without error checking. Before doing
> > that
> > > think for a moment for the cases when devm_*() might be developed in the
> > future
> > > and return something interesting (if not yet).
> 
> We should not fail the probe because of runtime  pm enablement failure, I suppose.
> There are other ways to keep card awake.
> The pm_runtime_* functions work without runtime_enable but have no effect.
> Thus, we can ignore failure here.

Using devm_*() in such a case is misleading. It incorporates errors from
different layers and ignoring both is odd.

I would suggest to avoid using devm_*() in this case and put a comment on
the ignored PM errors (however, personally I think this approach is wrong).

...

> > > >  err:
> > > > +	pm_runtime_put(device);
> > > > +err_norpm:
> > > >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > > >  	return ret;
> > >
> > > Mixing devm with non-devm usually lead to hard to catch bugs in the error
> > paths
> > > / remove stages with ordering of cleaning resources up.
> 
> I see that this pattern is reasonably common in drivers.
> There can't be devm wrappers for pm_runtime_get/put and these functions works
> regardless of enable status.

It can be wrapped to become a managed resource, but the problem is that you are
ignoring errors from it, which I consider a bit incorrect.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
