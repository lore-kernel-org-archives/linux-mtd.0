Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B3AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vtb7+fD6n3nhVgybywXp+BAfsCKg5J1pSyF/3M+FB+Q=; b=OgCwLCz0kFwmI8
	De+HJ1X5MPRrow7wrTmrMAyNPcmPa7WSmQrcCkOeLZSUIuHJkQ6qCaQqvjkv4cWebH8eeRIxj18tx
	11I6p9TUb546RHG9jY4Utyfs+HyOOUEQ2U/C60naZ1+VEGrQ0PBPo7qmCgfltAHDKn8L7V9i7Qz/P
	LGMcaC6RGdOuu2iTOCeizO4Faym0Lqb9fkAAwPnXHoP8ddrQZPz78UTPx5cijCmB+99eIvcu2s0tq
	hRbXT/DRnFHhabFnkiGf+W+jympCCRqV0O3Eg/eIqr1WQuU1tqy+0zd2k2XFY25FWU03QENHIo/TT
	kCVP3M4x0QMYebn3rEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eIG-00AHyp-NX; Mon, 12 Dec 2022 08:36:12 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eI9-00AHoO-Uo
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 08:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670834165; x=1702370165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFYTa27LxNC965Nl6ptrEOem3ftkvwtR2lcZjjhuh7w=;
  b=n+ApWSX/vJfjqttM7Gb1jvVjNu4SPOvXXyMALKEpyXIwwfTDTNIN5lYq
   AjXOn2w7cFqVlOIGppgHhrj2CIOhiv1YjSW+45F0Vq4bYLRU+VxSYtkjC
   abJTIQ5rX/G6gDImXSwWGgDT65QeZ77L2psjh9y+c6mB9L18b8QOZNzKe
   rmxn+N44LoD88dYfCqhmYnx1UBKVH5jFFpxLJ3qbGJNVppadslbV5nUzv
   kOXDr/msokJRnldrovHyBpRK6Q6M74LgBmknO9RaJClVlrWi+g0uJ7vir
   3b1HysMlsu9aBqG6otf+sJLEJl1ye0w8CXUpbd5BvcwwZ+BplkQwm+5X8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="380011026"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; 
   d="scan'208";a="380011026"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 00:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="822407894"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; 
   d="scan'208";a="822407894"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2022 00:35:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p4eHx-008Nh5-28;
	Mon, 12 Dec 2022 10:35:53 +0200
Date: Mon, 12 Dec 2022 10:35:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: david.keisarschm@mail.huji.ac.il
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
	linux-scsi@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5bn6XcozgjbcSkf@smile.fi.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_003606_070924_B720411C 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, Dec 12, 2022 at 12:16:04AM +0200, david.keisarschm@mail.huji.ac.il wrote:
> From: David <david.keisarschm@mail.huji.ac.il>
> 
> Since the two functions
>  prandom_byte_state and prandom_u32_state
>  use the weak prng prandom_u32,
>  we added the prefix predictable_rng,
>  to their signatures so it is clear they are weak.

It's fancy indentation.

...

>  		/* Fisher-Yates shuffle */
>  		for (i = count - 1; i > 0; i--) {
> -			rand = prandom_u32_state(&state.rnd_state);
> +			rand = predictable_rng_prandom_u32_state(&state.rnd_state);

Isn't it too many "random":s encoded in the name?

I would leave either "rng" or "[p]random".

>  			rand %= (i + 1);
>  			swap_free_obj(slab, i, rand);
>  		}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
