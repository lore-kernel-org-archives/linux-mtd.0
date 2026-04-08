Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44510F9940
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkKsLfpz4h9aeeguNleRNVHBAvwafcXa+rzc5n7V7dk=; b=FuaoAO1Yvdg7hB
	CN7YVs8l+3618S0ET6O5BluIZao94+bWOWcHnMjNBqs+lW/qCcCZD9A+0XWfHYgIfo0FAz4xar294
	XSjgGAP5C5GeXlKRtOL6yyuy4YdaMt1O8MC1VAs8CtBLGM1gWCgIn1Je5qqr8LAVvUUy4w7+MmDhh
	y7wrUo7iJ/LcvwZORZXiwi+Dfmvo+C1hfpSCsOV03mB7HdVGtuqcYZEOjLVdB0iYaY2L28o1fVTvQ
	xegk+wR/ISmXSCIJqFZCjWaEtJBFKVbp1M9Qq04iWDe7Tt4FbtDiW3qx/feOUP3yRXIjKv95FEJDk
	iZwaBJi9//CgQI7NrKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATyo-000000090C7-3jZX;
	Wed, 08 Apr 2026 14:34:06 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATym-000000090Bn-0qjT
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 14:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775658844; x=1807194844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqOqG5Y0bw2N3gZBXXVuy9ZFnSrp6BKjj2IhzRDWsw8=;
  b=g7bSLE/6KvCkPRju9JUFvjNMdMOT+Dh4NCfLyFYzwJY9J+8nSQSY6KNR
   UM7SceSMO/W0MI3ugpujB+DB6Z3rJ/qpTsJl+oGpGDP9aw3Rx16e9Q93a
   1gvcYi8T+RPvcxmzkrDV82jiX9Yj+JZ3rqaxIiqm8rPG7yHt/upwHHT4Z
   7LMw/XbXww5AmSsLGLk77Xfk6avWtnmseHdB2+cpi+v4Gjg5WHRXJbsGy
   /B6pfB5F4Zw2EcTBtNGvdj5znrH8bYHSxBDre9cKdITj7mnWmUOAyrfF3
   56askYKMKC665pjxGS4v9YbxPbwjGewANAgJR9BC46tdEfTE9Cbv/+f1P
   Q==;
X-CSE-ConnectionGUID: 1MeUda37TfqtbzlApIO/Nw==
X-CSE-MsgGUID: TuMzdopVSzO1mPYteFwjFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76609925"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76609925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:34:02 -0700
X-CSE-ConnectionGUID: shs8NeIhS9CLvIkiPvTbWg==
X-CSE-MsgGUID: 2uZnOa+nS9qVF60o6hnUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232865436"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:34:00 -0700
Date: Wed, 8 Apr 2026 17:33:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <adZnVlDAsGTCCXF8@ashevche-desk.local>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <adX3SHYgazijahbG@wunner.de>
 <adY7r_YNFjGk9EKZ@ashevche-desk.local>
 <adZazsIA5D-gJ1OS@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adZazsIA5D-gJ1OS@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_073404_287875_A98659B9 
X-CRM114-Status: GOOD (  20.72  )
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

On Wed, Apr 08, 2026 at 03:40:30PM +0200, Lukas Wunner wrote:
> On Wed, Apr 08, 2026 at 02:27:43PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 08, 2026 at 08:35:52AM +0200, Lukas Wunner wrote:
> > > On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> > > > Compiler is not happy about used stack frame:
> > > > 
> > > > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > > > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > > > 
> > > > Fix this by factoring out do_write_buffer_locked().
> > > 
> > > FWIW, the issue only occurs with CONFIG_KASAN_STACK=y, so an alternative
> > > to refactoring the function is to disable KASAN for this particular file:
> > 
> > I would like to avoid such big hammers.
> > 
> > Somehow I lost the track of this patch, I need to find it locally and check
> > the status, I will come up with updated one once I found the latest version.
> 
> I just wanted to highlight that it's a KASAN-specific issue that doesn't
> show up unless CONFIG_KASAN_STACK=y.  I think it's worth mentioning that
> in the commit message.

Sure, makes sense.

> I'm not saying disabling KASAN is the right approach here, but it's one
> *possible* approach.  Ideally the number of variables on the stack should
> be reduced.  Perhaps alocating them on the heap would be more appropriate
> than refactoring the code, I don't know.

Thanks, Lukas, for reviewing and proposing alternatives!

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
