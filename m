Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D810FC440
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dl7Fp5NSTEHT2BqL9F2WFg2ding++RcWk7I0ZvrGhNs=; b=CbkMA5pm8PtSX7
	Dc408phorPdHBSPgXfUJJN4VT762uO5/fDX2+jbA5ySZYWUvdyQxyMgQd+1imW8BX7ltcIwRQVoEs
	Q8mqqsKsRVrF1+xeDMPzf5eQyi54sFt+uS/X0MeWjHxplA0HQC3FFKmoSosZ31CBnRb0TIxtM2HUz
	xevXT4gSk7sP7gAZN7rUZCJjOT20CSe+Qo4OWRmaPQdmV495nNIxWWKs2KZw1avD8zNGOpwkl5T0V
	fqjIxN8VMmreRaGZyfUfn2DhPzkeECrMgEDEZT6dHSAh9MUDCD+zF8MxkLcu0/kWKieAvl0vQyD0U
	zt3wlcubsPXK6X8QFc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaHH-00000009Qdj-0ekN;
	Wed, 08 Apr 2026 21:17:35 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaHE-00000009QdG-3LFo
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 21:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775683053; x=1807219053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pz81uMFs2Qmae/VhHfgnh2rVYPhupxolCWPOu86YAbw=;
  b=AoZ6CxfWQQqdABo25HHIpPT+YET1KhoKO6siFpvv1LINUNIYUmCluHEX
   wEjQRQlQgKueHU7FN9bmSmIwlLh2ZCV1WHIxo66q0boPXPYMJW5zF4943
   BcMHEhaHrzE3zA3wEkbFCD1EXxRi3w8/bi6rlXMtdHe2xydYsDN8HzZ6T
   ojocN8XuXM7KmwE1pnw/gg0RjxL5M55sVGXIbDpJLBovXGyLafUau2/PO
   w9EnDHHnOji7EoyCPbzaj0hcOlu2/As6ywzF0EYo3AjDfjuXYvJu6qjDk
   riyQTFVzvmPAVSZJXg6OZ5srnGq0JU0u1F201ukv+0IjnmuIkQDclH5rZ
   w==;
X-CSE-ConnectionGUID: WT7wesCmTCmzTAIGKXWyNA==
X-CSE-MsgGUID: p01rIXSFQY6nBDbfdr7b6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76396228"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="76396228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 14:17:32 -0700
X-CSE-ConnectionGUID: /6SbeINxR0KpWpI5k7UQOQ==
X-CSE-MsgGUID: 1rkp+oivQWaqAwfPr0zc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="223823953"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 14:17:30 -0700
Date: Thu, 9 Apr 2026 00:17:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <adbF6F3N11cZDIIm@ashevche-desk.local>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <adX3SHYgazijahbG@wunner.de>
 <adY7r_YNFjGk9EKZ@ashevche-desk.local>
 <adZazsIA5D-gJ1OS@wunner.de>
 <adZnVlDAsGTCCXF8@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adZnVlDAsGTCCXF8@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_141732_909578_B1F8C984 
X-CRM114-Status: GOOD (  24.79  )
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

On Wed, Apr 08, 2026 at 05:34:02PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 08, 2026 at 03:40:30PM +0200, Lukas Wunner wrote:
> > On Wed, Apr 08, 2026 at 02:27:43PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 08, 2026 at 08:35:52AM +0200, Lukas Wunner wrote:
> > > > On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> > > > > Compiler is not happy about used stack frame:
> > > > > 
> > > > > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > > > > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > > > > 
> > > > > Fix this by factoring out do_write_buffer_locked().
> > > > 
> > > > FWIW, the issue only occurs with CONFIG_KASAN_STACK=y, so an alternative
> > > > to refactoring the function is to disable KASAN for this particular file:
> > > 
> > > I would like to avoid such big hammers.
> > > 
> > > Somehow I lost the track of this patch, I need to find it locally and check
> > > the status, I will come up with updated one once I found the latest version.
> > 
> > I just wanted to highlight that it's a KASAN-specific issue that doesn't
> > show up unless CONFIG_KASAN_STACK=y.  I think it's worth mentioning that
> > in the commit message.
> 
> Sure, makes sense.

Sorry, I forgot this in v3. If you still think it's crucial to have, I will
wait for MTD maintainers and update later on, but please, comment on v3, so
I won't forget it again (as it was two email threads for v2 and I missed one
to check carefully for the requests).

> > I'm not saying disabling KASAN is the right approach here, but it's one
> > *possible* approach.  Ideally the number of variables on the stack should
> > be reduced.  Perhaps alocating them on the heap would be more appropriate
> > than refactoring the code, I don't know.
> 
> Thanks, Lukas, for reviewing and proposing alternatives!

FWIW, v3 just has been sent: 20260408211407.2295175-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
