Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FF6EA8121
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8oP0XCAvMChsIBY3RDpqcYgVNPcAkmbMVOhNgyE47Q=; b=Hyzi9fcFUfAOM9
	CJNz6c1nvKOZDS2aanJgJQXI4LHMJweMCbFk35hy1eEv7mXbsw6OKbj2zqVVSSE6QZRDIs4ShNYt/
	g1obTZiTnonl1GjrbYyrclt68avbL+G5XlZDrOaNIfR7eT7qwZDy1caDLjCC2eD6Kq1TEzhxD9Q8l
	TDtoWUyPNWW6U3IDK0VKHj7bGfp4nhySw0N5pZwqnInenyYNIggnmwI59CN/dFPuxBOrbZG2lenGF
	S0gLZhkzTdWtij391rB+u83b3DjjvTi45sIeiI/0xx+uUbn2ia+TH8hGofg87GasDd+s9NLlUnxNF
	Y1lqQ0/r8fWvWNGRCHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpozU-0000000H3nF-2BIO;
	Tue, 10 Feb 2026 14:45:24 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpozR-0000000H3mp-2nnI
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 14:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770734721; x=1802270721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yltjel1XmY4Ww8KkB64cnTsT+2R71mBZ+oug87haKX8=;
  b=MxMIgtumGCeFDq+mj6HeeaM8S9MqpUE9/H9O+VhAj+0yeDK5KkAi5sao
   bdeeu+oP5qoubEUGEz2kX1kbaqqVlOyUsHdvk1frp6KqzTbne+Gce3izW
   sv03l5/cXgCCd58oIfKn3KrXGxdLcxZcW70SyZOhqEzc0QS8uELs1Ej2n
   WzXzae9nfdQY6XRdzEbc632gWFCxz9x3xLLtWdTOyIGs6IB4bnaGQVjAC
   LhPRIpwgpO9pQ32jYKghvmVYSVoFrvngu3xourQhI4MAw5xNV+0LUC1TT
   Kdx6UOecOmNLwkIrOEKvjPA9WJSZ9HJc8V5v8XQRmwCFvUYX+vXEMgU0m
   g==;
X-CSE-ConnectionGUID: YV+o7xNJQ6y5R13BP0alXQ==
X-CSE-MsgGUID: YdIseMGwS+uuPPhA8Ix+rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94506238"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94506238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:45:19 -0800
X-CSE-ConnectionGUID: aSxYArWMRgqYsYncyDnQ4g==
X-CSE-MsgGUID: eLGGViCFTSCpAy3KCVuVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249583389"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:45:18 -0800
Date: Tue, 10 Feb 2026 16:45:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aYtEe1xtm740HqPL@smile.fi.intel.com>
References: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>
 <202601250653.LXBUL5W6-lkp@intel.com>
 <afc434a2-07d0-4a25-803a-4a42a4da8e3d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afc434a2-07d0-4a25-803a-4a42a4da8e3d@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_064521_754460_3D708F35 
X-CRM114-Status: GOOD (  21.49  )
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

On Tue, Feb 10, 2026 at 03:35:39PM +0530, Vignesh Raghavendra wrote:
> On 25/01/26 04:11, kernel test robot wrote:

> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on mtd/mtd/next]
> > [also build test WARNING on mtd/mtd/fixes linus/master v6.19-rc6 next-20260123]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mtd-cfi_cmdset_0001-Factor-out-do_write_buffer_locked-to-reduce-stack-frame/20260124-213936
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
> > patch link:    https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko%40linux.intel.com
> > patch subject: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out do_write_buffer_locked() to reduce stack frame
> > config: xtensa-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/config)
> > compiler: xtensa-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601250653.LXBUL5W6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer_locked':
> >>> drivers/mtd/chips/cfi_cmdset_0001.c:1734:6: warning: unused variable 'initial_len' [-Wunused-variable]
> >      int initial_len = len;
> >          ^~~~~~~~~~~
> >>> drivers/mtd/chips/cfi_cmdset_0001.c:1733:16: warning: variable 'initial_adr' set but not used [-Wunused-but-set-variable]
> >      unsigned long initial_adr;
> >                    ^~~~~~~~~~~
> 
> Copying my response here again from [1] , as this LKP report seems to on a 
> different thread:

Thanks! I will look at this after -rc1 is out. Maybe earlier, but quite busy
with other issue(s).

> Things become tricky with CONFIG_MTD_XIP enabled. With
> XIP_INVAL_CACHED_RANGE() moved to caller, initial_adr becomes unused
> when CONFIG_MTD_XIP=y
> 
> One solution maybe to move calls to XIP_INVAL_CACHED_RANGE(),
> ENABLE_VPP(map) and xip_disable() and their complementary functions to
> do_write_buffer_locked() as these calls need to repeated for every
> writes (if and when we find need to reuse do_write_buffer_locked())
> 
> Alternately move INVAL_CACHE_AND_WAIT() and everything after that to 
> caller

[...]

> [1] https://lore.kernel.org/all/4d4ab8af-3e09-4e48-a79d-0af3453600c3@ti.com/

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
