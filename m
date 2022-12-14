Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC3DC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLKhRjroNLVX8MR9NdSKPDll/qXU0Wb4f78VCvJrn1s=; b=yeGeR4dy0377Bj
	h3Jsns9muOP9seOqK+INSmqrcEt/6R1Q4ybVdjT78gHGk2N32yE8LkAU0VutyxS1Z0v/lZ0I4wr+m
	GmbFhF9YozU5gkioI1TP/GVATAxZt8tJO1r3lZDnYkXV15wmhxtDVXTE2MfOpSVNPH6LJmCWP7PzK
	Hf0fEtQ1G8hF1FHiFv0x65ckosbEv8spV7Jp6ARdd2cNhz3EMB5I/vrgHl5EonsIryDO4edrLvYCI
	bykrBbP7nU9nERX/GJsun2nc4OjyPA6BUdSuJk35SrlRf1X0mdHiFjUFXTcwiVRSHFfORCI7P5i++
	cIefpTjCvXOK3IO8Tx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5U8G-000OkF-CY; Wed, 14 Dec 2022 15:57:20 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5U8D-000Ogf-Hu
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 15:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671033437; x=1702569437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LFXBukgQPsSVobJ4TQvaAaS4znUymOqfbKoEQKnuF8=;
  b=cg8AL3IG7RrOrQrrUhG1m3400K5R2ZrNFmvKith4DWbr7GDUk2K+NjNm
   0YnooCUwqLVExQszWIc1iTF0kkJ4EdKOVegZgivBROtafeuYbIkyilrN7
   DOa71WbO87LDfRD37yi5X2ee6DIA1wwfuwcW/bdZtSrrOsNYM1Vi9UEtV
   t1LYQBRHsjXmGKEuo7eoLPSb0SwGnoLAv9SNfaz47ptYbQ0qhHAoFaWhL
   0rVGXSWv8d8Eo9YWAGKhxD++vns5piSQemoKJegfPlk2UP3HXKSkPSjdW
   wXu9BMgbDUpeWQ4WPgrthbQsI0i+w3Ue7V2TtWKRABdjMCS2Ok5GhVnNv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="380640653"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="380640653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 07:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="737738842"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="737738842"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2022 07:57:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p5U86-009t4i-01;
	Wed, 14 Dec 2022 17:57:10 +0200
Date: Wed, 14 Dec 2022 17:57:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	david.keisarschm@mail.huji.ac.il, dri-devel@lists.freedesktop.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5nyVXv1KpX5baQE@smile.fi.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
 <Y5nxjzV0Mio86NU6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5nxjzV0Mio86NU6@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_075717_663489_8B11955D 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, Dec 14, 2022 at 05:53:52PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> > On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> > <stanislaw.gruszka@linux.intel.com> wrote:
> > > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > > Please CC me on future revisions.
> > > >
> > > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > > There's no need to rename anything. So nack on this patch 1/5.
> > >
> > > It is not obvious (for casual developers like me) that p in prandom
> > > stands for predictable. Some renaming would be useful IMHO.
> > 
> > Renaming makes backports more complicated, because stable teams will
> > have to 'undo' name changes.
> > Stable teams are already overwhelmed by the amount of backports, and
> > silly merge conflicts.
> > 
> > Take another example :
> > 
> > u64 timecounter_read(struct timecounter *tc)
> > 
> > You would think this function would read the timecounter, right ?
> > 
> > Well, it _updates_ many fields from @tc, so a 'better name' would also
> > be useful.
> 
> Right, at some point we become into the world of
> 
> #define true 0
> 
> because... (read below)
> 
> > linux kernel is not for casual readers.
> 
> P.S. I believe you applied a common sense and in some cases
>      the renames are necessary.

And before you become to a wrong conclusion by reading between the lines,
no, I'm not taking either side (to rename or not to rename) in this case.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
