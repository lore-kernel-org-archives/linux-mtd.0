Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BDBCC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5gJCLXjJgCt2Ndvv0KGbPGll/01rHVOSlIPS6Q3sUA=; b=rI9Hio2jcIrFeI
	4MNC9uVE2NUFDsfcRXQtGNKXGvuPFbHwueg6I6/lpXLV0rGpKqpz0z00s4MmTHxMxi6YMtcUSU0Tf
	mQnl7+KwehfDf+pRAiC363FkscOnobkf6OdpwrTrcW9TN947ysUXtVb/8V+s8CuMUbNAnb4fz4b8z
	khskgO/a1qpAcQlVYTqMCjJsjm0HgKEP2BGRpMmjlre+7wExu1h6XK7LqVcF49sjkId3Njuzx+tZY
	0vMjFS3s6DSTjCpRTGbsV7x8VodtUbviBTWJmT8ftPmXUF0EpEOVPDubz1LnK29NQfDXX9QwlE8m1
	E6Gy/prh6shHkYvYOsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiT1-0000000Dwx0-2H9D;
	Tue, 13 Oct 2026 19:47:19 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSz-0000000Dwuk-0C7z
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 19:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791920837; x=1823456837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJuQqMA4q8tSxuJu/goXmCkJ2O3/BBEzNNXTsEU7kCI=;
  b=etv6FqTQmG6uJo7JSRhg4W4mpfX6CFF56ZEhDIwAfW70s0rolrL3Gjmm
   AwIh2zz6TfGjMnnlgvqClVRa3glbiDcVm6dduM8l0IE7wvVFShqa6pr2z
   eZFMrc6C28EJOmfmBZIFpqIBU9WT8zQ0df1HSYtox3pUL9YgNjbQUsDBI
   oMMqim8jxPJ7Qr+5niaD5R+9cvrOdFT1bEWfHQDDL7peVgN8XllX11vmv
   cVd5hXUXpQtiM1396il0HtsApWBQJ/sJbbsescHUpzJrnNNSU80ZOvOjq
   B9usW+tkHcGhVFnzlRcYeXKzW0okGpoPbzDBXP0flpGxEMQe6tRKtbcBP
   A==;
X-CSE-ConnectionGUID: y914sz0yRvW7rwfXe7/aIg==
X-CSE-MsgGUID: DuHdlUr4Qe+DhP0L51Th8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="650326"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="650326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:47:16 -0700
X-CSE-ConnectionGUID: /19LJbibRPi3oed3PgHAMA==
X-CSE-MsgGUID: FIHpLiVmRtmrmy4gn+EaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1343501"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:47:14 -0700
Date: Tue, 13 Oct 2026 22:47:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <as6Kv9usOjhlx8zx@ashevche-desk.local>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
 <20260409082611.73fac9ab@pumpkin>
 <addcJP2erqYh8pD2@wunner.de>
 <20260409122846.7d08d2b4@pumpkin>
 <ad41TpzL4onrcKzn@ashevche-desk.local>
 <87ik9cfm6g.fsf@bootlin.com>
 <ae-FLk1N3wJs8sTW@ashevche-desk.local>
 <87pl3jebsv.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pl3jebsv.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124717_154851_DCE0AAD3 
X-CRM114-Status: GOOD (  26.74  )
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

On Tue, Apr 28, 2026 at 10:20:16AM +0200, Miquel Raynal wrote:

I had some text here already written in response, but...

...

> >> >> > Stack usage is high here because of the three "map_word" types,
> >> >> > which can each be up to 256 unsigned longs (32 * 8), see the
> >> >> > definitions of MAX_MAP_LONGS, MAX_MAP_BANKWIDTH, map_word in
> >> >> > include/linux/mtd/map.h.
> >> >> 
> >> >> Ugg - that code is horrid.
> >> >> Returning structures by value isn't really a good idea.
> >> 
> >> Looks like the primary reason for the stack over usage, no? Isn't
> >> playing with inline and refactoring just a tiny fix that prevents
> >> problem by just a couple of bytes?
> >> 
> >> I haven't looked too carefully, but could we (Andy?) have a fix that
> >> reduces the number of map_word (as suggested, IIUC) and/or avoid passing
> >> them by value?
> >
> > I am not an expert for this particular change, I am afraid.
> 
> Surprising flannel from someone sorely insisting to force contributors
> into doing zillions more changes than they initially wanted, easily
> triggering iniquitously NACKs otherwise.

...after meeting you during Linux Plumbers and actually having a couple of
ideas how to solve that, I promised to answer to that thread sharing new
information.

> > Consider my patch
> > as a bug report that needs to be addressed, Currently it might break some
> > builds when `make W=1` is passed.
> 
> Hopefully you will remember that you have your own limits too. Maybe
> that will allow others to breeze next time there will be something that
> matters so much to you that you prefer to fully block their work.

As for the changes that reside in the lib/, which is tree wide and
has zillions of different users with different requirements, finding
a common ground is really hard.

> >> I can also take this cleanup if enclosed in a bigger
> >> series, I don't mind because it may make the code easier to read as
> >> well, but I feel like this is not a proper fix. If it is, please explain
> >> to me again :-)

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
