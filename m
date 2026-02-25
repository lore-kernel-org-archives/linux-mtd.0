Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A37EFD211
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzN4PyF3A0q83ZCjNvESffaGju3z6gIFn4wt/79uBp0=; b=h5i7BIPskp110V
	EYU/Xkyve/4X1WItc4Brr6uDvdKEx4gCsTPvna9UWyyWQ5ngGQaq3cjqg6PURQ+brGMlazjbTIdsJ
	Un0bMOeUGCaJ8dkThMfRO6I7rqyFwrrsvDoH/CPUzf7QYDGuyuPM/s6BYO4j3MvhmRatYctkyn0K7
	4m9oQCoPVVYNJ5N7tW6pwg1HJtzoaGLj+nk+c1xk17FfEKXlzrPjWpAlEOWbzalgJa1MdYM2ncO61
	4OR8sHuXsnxt+UoyZaShUFOqaYt+yHN3aoLVJXbCvXtdeU423bucRqkJI7U39fmrZRRxhhI/FA5Lb
	tpvPq0Q+xzafyfInUQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4Q-00000003eZR-04Ms;
	Wed, 25 Feb 2026 09:20:38 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4M-00000003eYm-1hqY
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 09:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772011234; x=1803547234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EYd3NDvQIUi4EpRkk9wdlnrRbcqeblN4BQz09FGZvBA=;
  b=OHGP7qa/oID0ZKC76E3MG7DY9fgLuFRP/gqYnHir8c7Lq8efxMpN0lR1
   BYqpyS2eveybHcccWNXAVBOmtW68TQxrZr2hLaQsv3utoiQF6b5SueDtB
   WchAPlwY+AugcUWuSeUBcoGw5Ikt6hS/hTlL5TcMboy8P/PmmCAZ7agy4
   3NknspyWOl2J2Cyx7iKRP9G2Q8Wfjiz9VjcVtvjW1bVs8Jb9DWELkxXxb
   zLLV8DcBHAObHocgbIYbBGvCXNq2fLAZUMB7660kM5qkIs6aVYadB1zTz
   I/SrfNp/06whC8Nr/arotTJccFm/OfK7oz6+sE8yfSRxezGsrO0jr4QC8
   Q==;
X-CSE-ConnectionGUID: pe3qe9qLSrOFMOt6b+xfIw==
X-CSE-MsgGUID: T8KaAlC6RSSyT3eYLZ8uTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84408961"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="84408961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:20:34 -0800
X-CSE-ConnectionGUID: aIsR1vNSREOiCyw6OJfVNQ==
X-CSE-MsgGUID: WVbpTeIQTZeoA8KF3ClwIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="213887445"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:20:32 -0800
Date: Wed, 25 Feb 2026 11:20:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
Message-ID: <aZ6-3rCTH_LrC-kq@smile.fi.intel.com>
References: <20260224153927.3627867-1-andriy.shevchenko@linux.intel.com>
 <710526b9-8a5e-4c6d-8f5b-1ed51f015f5f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <710526b9-8a5e-4c6d-8f5b-1ed51f015f5f@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012034_455271_19EF47F0 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, Feb 24, 2026 at 10:47:06AM -0800, Randy Dunlap wrote:
> On 2/24/26 7:39 AM, Andy Shevchenko wrote:
> > As noticed in the discussion [1] the Baikal SoC and platforms
> > are not going to be finalized, hence remove stale code.
> > 
> > Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mtd/maps/Kconfig           |  11 ---
> >  drivers/mtd/maps/Makefile          |   1 -
> >  drivers/mtd/maps/physmap-bt1-rom.c | 125 -----------------------------
> >  drivers/mtd/maps/physmap-bt1-rom.h |  17 ----
> >  4 files changed, 154 deletions(-)
> >  delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
> >  delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.h
> 
> There is also a small change in drivers/mtd/maps/physmap-core.c
> that is needed:
> 
> -#include "physmap-bt1-rom.h"

I somehow missed that.

> and then
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
