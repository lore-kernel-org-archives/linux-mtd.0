Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52652CCD193
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLKERVyecKAnLrfcWeX1nFsIsyKKjq0iPnouBVhMY98=; b=kmF6RA+Dz1o8yA
	CixGlJ4UYcBAbqbvnArb1R1oADiBMnBQsuqSVbjqSJkbHViK1sWeeIjaEJVLeIX8cDFA6e3eQb/VE
	nHJyNF54Pr1snSomTp8v3A8qDNUut09eB3PHqn0gHmptw7CXztQCcBnY+EAYB86DXt3mLv1y1pJ+M
	G1FK+LdB7TNoraWTApWdnSc32bLfHX3WcfdkIQIbHvfwVW+9rjUPwSp1p2+eAFd8ufvduNPqcpiyn
	UvGR1PTCFFGSHMG+b0v1v+kCa1seghGvP+IQ3owJTkFOmMSGd0TTotfa4CcjLBP4PWYbU8pOKINJ5
	7hGKBSJ9QEQDM6UIBK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmqD-0000000Clgj-42UB;
	Mon, 20 Oct 2025 10:10:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmqB-0000000Clg4-1khY
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760955011; x=1792491011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m0Z4/kO1hD5Zj2fBiAxkTlYbbvoBAeQvprznDxDU4yA=;
  b=UaOay63Uk1Q1ZJKi1D990t9RsDSBenO/EIkouYq8pDzAdv5rd4f7vWXK
   bqlouSrXwKYr8oMRhqc8X2fNMA/RVFkCQS9dnGPgE3owLac3/7M/ucJQ/
   Rs66r1/1r+RWNigeROyfffW93536ZQ83KwEvPgjsvWGECVZjvp5ai0J9S
   LEtXbjEPrdBOaMZkXCR1SCKWpS5H5nUmFHVlq7qjkBZ/q6EHvp8nGwZ+p
   gydtStp+GovoJEXIu2QFMixK0csFnVjddxVWgcpQjEgMi9NYJWt4+I76f
   KGCXMUpwEJq5mF5NktCVuP5ewo0juQG+rG65itJpK2vgBWyb/+t11YozM
   g==;
X-CSE-ConnectionGUID: Edckae2jQee4OgJJcDiIRQ==
X-CSE-MsgGUID: 6GeHeC5bTBuKB5CNH5IlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62976482"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62976482"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:10:11 -0700
X-CSE-ConnectionGUID: qnx3ZbRrSriWwVrbHjqX2A==
X-CSE-MsgGUID: R5PK7M9TQtmakJbfJ6zXBQ==
X-ExtLoop1: 1
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:10:09 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAmq6-00000001Gq5-2Sd0;
	Mon, 20 Oct 2025 13:10:06 +0300
Date: Mon, 20 Oct 2025 13:10:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] mtd: intel-dg: wake card on operations
Message-ID: <aPYKfhTDF5kXulz9@ashevche-desk.local>
References: <20251019150145.3228079-1-alexander.usyskin@intel.com>
 <aPYKRvCenwnrFXcb@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPYKRvCenwnrFXcb@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_031011_491643_3E7500C8 
X-CRM114-Status: GOOD (  12.43  )
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

On Mon, Oct 20, 2025 at 01:09:10PM +0300, Andy Shevchenko wrote:
> On Sun, Oct 19, 2025 at 06:01:45PM +0300, Alexander Usyskin wrote:
> > Enable runtime PM in mtd driver to notify parent graphics driver
> > that whole card should be kept awake while nvm operations are
> > performed through this driver.

Ah, and perhaps a bit elaboration why graphics card needs that?

...

> > +	pm_runtime_mark_last_busy(nvm->dev);
> > +	pm_runtime_put_autosuspend(nvm->dev);
> 
> Please, drop the second (duplicate) call.

...

> > +	devm_pm_runtime_enable(device);
> 
> Please, justify why this code is good without error checking. Before doing that
> think for a moment for the cases when devm_*() might be developed in the future
> and return something interesting (if not yet).

...

> >  err:
> > +	pm_runtime_put(device);
> > +err_norpm:
> >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> >  	return ret;
> 
> Mixing devm with non-devm usually lead to hard to catch bugs in the error paths
> / remove stages with ordering of cleaning resources up.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
