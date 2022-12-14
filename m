Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0548C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLzR2N8yGNfD+Ze2OCZlCNjXY+qCiNZ6P6ETDldLlII=; b=HuaW4Z+RIFMUsP
	CKtN1mPLTaeOkOk2lsUyNtWKuycfARgIrk2BXzem0nbh8K0Rdg+SNhAT9HpS7/qUTE/8ZU+lQmZNx
	lgoworNWTU+8t54KK3HM9+Cmr0rM7/jaNqlkAswxgqwNNnfvY2/58PbyginQZSiyt+4onB60qOtsB
	+Wr87MzXEsOHg/OwZmwOIPpNOYombPENz0++RxMz5CdVacNQSfPujqwJdlcxQzMMfXRBTzi9Ql8VK
	4x4qWioob5VinNow/Ge1U+2IiKCq+FRzePe90czJxcHpZcDb8xuSA6t0ttDgKCw23JKOX+Pj9yr+w
	kXjmLgRPoHPiJf3H3ibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5U59-000N0x-E8; Wed, 14 Dec 2022 15:54:07 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5U57-000Mwe-4L
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 15:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671033244; x=1702569244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12BnbcHagZMkwl9OeOA4D0nsPFyieVD2ck3mCiVJ72w=;
  b=XRihjZlDYySRPR0hlAHiXWX6Yv4wojjtB0jxoA3Lrr6YOMfwChcwDhrT
   tuBMcUJg8xPJJn6oqZpdYB2kSfAzpIqiHIGPNiY9hxpYLj6YfbwfSbpSE
   nN9nrRS2gRUPNfr+ygXZA9CSZbo/90wxbSf73lCFs/BVlOx8jgcf2WD0a
   SL7IllddTxPboGHNvIqUJMUAXMUD0dEi3CV5VscPrHbjvLyRCsNTIvkR6
   SH1JmvrW4YyOh1/7Tmy9n+R1bezJrlxBRPxE7Jzd7urT+HR/rhXiLWJmr
   Qm/jCYD3IL3dcPgFHGIEx5lGA8JW3Wk79j+kCGBnEPwyHPV3wYOcsbis3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="382739970"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="382739970"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 07:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="642545781"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="642545781"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2022 07:53:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p5U4u-009sxL-0B;
	Wed, 14 Dec 2022 17:53:52 +0200
Date: Wed, 14 Dec 2022 17:53:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	david.keisarschm@mail.huji.ac.il, dri-devel@lists.freedesktop.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5nxjzV0Mio86NU6@smile.fi.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_075405_252946_AD9F5298 
X-CRM114-Status: GOOD (  17.66  )
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

On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > Please CC me on future revisions.
> > >
> > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > There's no need to rename anything. So nack on this patch 1/5.
> >
> > It is not obvious (for casual developers like me) that p in prandom
> > stands for predictable. Some renaming would be useful IMHO.
> 
> Renaming makes backports more complicated, because stable teams will
> have to 'undo' name changes.
> Stable teams are already overwhelmed by the amount of backports, and
> silly merge conflicts.
> 
> Take another example :
> 
> u64 timecounter_read(struct timecounter *tc)
> 
> You would think this function would read the timecounter, right ?
> 
> Well, it _updates_ many fields from @tc, so a 'better name' would also
> be useful.

Right, at some point we become into the world of

#define true 0

because... (read below)

> linux kernel is not for casual readers.

P.S. I believe you applied a common sense and in some cases
     the renames are necessary.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
