Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BC7EB28DE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2NRyMinVSS0/yJmjSrIvmKlsBGs49kz0VsLGVbwFYk=; b=0aWkkTKEbi3JJx
	qRLuzPIk0/HYig089toy/ItdbVmM0Np5f12vjNE6JnMvOFfBrdbv2GFDNwkHRdUFxEUofBsNVki7X
	kRSWU2HOVplRhTcqP1kpHJvmUXVBh5IvFvttmCtVSImN3tweaEZDXcEGWzczToNUnyAhZbh3XKdnF
	JJX4KMdkJem8kCSzQ+MBaNYEGmHycFrpFLcNI2R50AZdaG0kijQ3Ytco9Xd8YmdFQdmF554pZN54v
	x6KGxKMPXU3id5Ya5q56lip5YwU10U65Ir1NsCMcAvpAUFxcJ8SVmG68g+ieu13nSps9f5K9F6cbj
	r3Xvl3Zic0C6WrTn/XYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGVr-0000000B0Cj-1vtY;
	Fri, 06 Feb 2026 07:44:23 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGVo-0000000B0CM-2cZu
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 07:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770363860; x=1801899860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wYE5OneJ/g/mwNt3BOSwejXssQef62ZbTSSfHnVdr4Q=;
  b=ZKv2W21xYcUS8/b8dMDtBZT15bzC9F1EB2uQYHySlT/xnX9dwjR9/ft4
   OD1fVv2DWICWuUWHR+6ZTFAU7fguvQNAGFYhgOEOkn4x9PHZT3QAywAvb
   1pmnM1Z7tG9epJIZlUqvdEIgapRkXorp5wenIUCee9hjuVJokfxNJYsmS
   n9HAlp96ddswHMBZewSuh1knl4aR8sGAMOwi7xOgDrTa0JdSYfXNnIJKh
   rIH9zNlLSeTPCgQrRhQaYOfFq9L7po3MuVFDmSMTxUQN4x7x6iH36nlkY
   448t5srzRsaYOj24Ws2pGTw+kdPetO7uh4HL9GGjODcNC1tAHqNQUoj0M
   A==;
X-CSE-ConnectionGUID: 4VEB1w8MS12ICQTHIlRCQA==
X-CSE-MsgGUID: fpZw9d0NQJGqzuRTFIZnHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71608552"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71608552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 23:44:18 -0800
X-CSE-ConnectionGUID: NN8Kw4KrRmyqwYzPZfpmNA==
X-CSE-MsgGUID: 4C0JrzuqRTexQQEfEBAXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210602322"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 23:44:16 -0800
Date: Fri, 6 Feb 2026 09:44:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aYWbzp9HhmYhUmyX@smile.fi.intel.com>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <aYO2IPsoxmDtTsec@smile.fi.intel.com>
 <87a4xnfu8j.fsf@bootlin.com>
 <aYS93aJ_TlN3C3-T@smile.fi.intel.com>
 <87y0l7gkmo.fsf@bootlin.com>
 <4d4ab8af-3e09-4e48-a79d-0af3453600c3@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d4ab8af-3e09-4e48-a79d-0af3453600c3@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_234420_743795_600EF583 
X-CRM114-Status: GOOD (  23.29  )
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

On Fri, Feb 06, 2026 at 11:26:23AM +0530, Vignesh Raghavendra wrote:
> On 05/02/26 23:04, Miquel Raynal wrote:
> > On 05/02/2026 at 17:57:17 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> On Thu, Feb 05, 2026 at 09:51:56AM +0100, Miquel Raynal wrote:
> >>> On 04/02/2026 at 23:12:00 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>> On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> >>>>> Compiler is not happy about used stack frame:
> >>>>>
> >>>>> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> >>>>> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> >>>>>
> >>>>> Fix this by factoring out do_write_buffer_locked().
> >>>>
> >>>> My gosh, I already sent a v2 earlier and there were some replies,
> >>>> I need to check...
> >>>
> >>> I'm not sure I get what you mean here? I got no reply (in my inbox) to
> >>> your v2. I am letting a bit of time for Vignesh to take a look, but I
> >>> know he's busy so I might take it nevertheless by the end of the week as
> >>> we are approaching the merge window.
> >>
> >> I got some strange LKP reports, I need to check them.
> >> Please, discard this email thread as we have it there
> >>
> >> https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko@linux.intel.com
> > 
> > Ah, this did not reach my inbox, marked SPAM... I'll discard this patch
> > for this cycle, feel free to resend once the report has been figured
> > out.
> 
> Yeah, things become tricky with CONFIG_MTD_XIP enabled. With
> XIP_INVAL_CACHED_RANGE() moved to caller, initial_adr becomes unused
> when CONFIG_MTD_XIP=y
> 
> One solution maybe to move calls to XIP_INVAL_CACHED_RANGE(),
> ENABLE_VPP(map) and xip_disable() and their complementary functions to
> do_write_buffer_locked() as these calls need to repeated for every
> writes (if and when we find need to reuse do_write_buffer_locked())
> 
> Alternately move INVAL_CACHE_AND_WAIT() and everything after that to caller

Thanks for the analysis! Can you copy this as the reply to the LKP report?
I don't want to have the report and analysis in different threads, I may
forgot about this one (and actually I closed this thread for myself).

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
