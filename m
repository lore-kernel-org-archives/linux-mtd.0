Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C03F9D0C9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2026 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saQdRQTqDS7Vev6iGscCzBz6i3EQymVOfRuiGXJTVd0=; b=EyxlBIisIiecXd
	W4CJKG2H2Q8NH4auQOFwsWRk296kL9KsYhTQ8dzbMVI7T2w8QkQls+k2AVLzBo/TaKLdBxmaiBJkV
	aFy4trlpcuvO69joKBHAUniEUDGKEwYyuLJaioHKo6qUqB8GGaK2lP5M8DeQfSQr4E+6EQizT03xp
	88aQsOFzI9g5c2vVKxvkYhONArv/5h54qAadj8TiuINVdcsaSpbf0mvS/mjeBCWzm6Ii+O5NazWBq
	pYN5IjwAjTI09hChMO/dX/fOZeYk8YhSJxOxcSTII5dx0qpAHwOJI4CM4u+JjJ/4gc6pHn1ZvDYjn
	UInTeZ4Xg15c2viZl99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd2W-0000000HIzg-36Kt;
	Tue, 14 Apr 2026 12:38:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd2T-0000000HIzL-3Q9C
	for linux-mtd@lists.infradead.org;
	Tue, 14 Apr 2026 12:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170326; x=1807706326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9gD9t0+kbSxr6E+N0FKZKJlGgNjiqmd6/XrBToiXwVo=;
  b=Wk52GaWdabmOEEu6lKPL2Pvw/r44IxagNBItwp71ctgyjQZELkQO8ls6
   uSS560zLJgppQZyRneOxWjpim13TrCwEQ02sAh0JUFlkmxIvNJNzWC69c
   sLCnHqSGWTiCqhZPb1AFLJBhcBdfQpTC3JgEvtoZvOFNONJhRHZGlLqHG
   aDSSkd2MLNMpBRkOx1FubU28aoILLkDBdlnHkIr6tX3gV48pOD6zp92tt
   G0touykSrmunO8P/d9ta96tfDem7iAXtnbYFNU9lRXE+9Q06s6hmomZSE
   PrDZDxxOHBMoYEbQj9DRmA5yH90OPKmh2g+Fayg5pDw2LM9V438T8CI94
   g==;
X-CSE-ConnectionGUID: Yrdcu4EyRU6CPI2+kr43UQ==
X-CSE-MsgGUID: frGAfX8zSrWmcbIjkOV3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77029669"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77029669"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:38:44 -0700
X-CSE-ConnectionGUID: G700Qm/mTxqCxUFLOBuj+g==
X-CSE-MsgGUID: 7OKeXwtGTeK90m0Jx2XsAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229953827"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:38:41 -0700
Date: Tue, 14 Apr 2026 15:38:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Lukas Wunner <lukas@wunner.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <ad41TpzL4onrcKzn@ashevche-desk.local>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
 <20260409082611.73fac9ab@pumpkin>
 <addcJP2erqYh8pD2@wunner.de>
 <20260409122846.7d08d2b4@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409122846.7d08d2b4@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_053845_928751_CED4570F 
X-CRM114-Status: GOOD (  33.16  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 09, 2026 at 12:28:46PM +0100, David Laight wrote:
> On Thu, 9 Apr 2026 09:58:28 +0200
> Lukas Wunner <lukas@wunner.de> wrote:
> > On Thu, Apr 09, 2026 at 08:26:11AM +0100, David Laight wrote:
> > > On Wed,  8 Apr 2026 23:11:48 +0200 Andy Shevchenko <andriy.shevchenko=
@linux.intel.com> wrote:  =

> > > > Compiler is not happy about used stack frame:
> > > > =

> > > > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > > > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size o=
f 1296 bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
> > > > =

> > > > Fix this by factoring out do_write_buffer_locked().  =

> > > =

> > > Does this just split the large stack frame between two nested functio=
ns?
> > > I'd also expect the compiler to inline do_write_buffer_locked() so it
> > > makes little difference.
> > > OTOH I can't immediately see where the large stack frame comes from.  =

> > =

> > The error occurs for an allmodconfig build on arm, which implies
> > CONFIG_KASAN_STACK=3Dy and thus increases stack usage vis-=E0-vis a
> > "regular" build.
> > =

> > Stack usage is high here because of the three "map_word" types,
> > which can each be up to 256 unsigned longs (32 * 8), see the
> > definitions of MAX_MAP_LONGS, MAX_MAP_BANKWIDTH, map_word in
> > include/linux/mtd/map.h.
> =

> Ugg - that code is horrid.
> Returning structures by value isn't really a good idea.
> =

> > =

> > Possible solutions:
> > =

> > - Disable KASAN entirely for this file:
> >   https://lore.kernel.org/all/adX3SHYgazijahbG@wunner.de/
> > =

> >   Not always a good option, particularly for stuff like lib/maple_tree.c
> >   where the same issue exists in mas_wr_spanning_store() and KASAN would
> >   certainly be good to have for that one.
> =

> I've peeked at that at least once.
> Some big functions get inlined; IIRC one small function is basically:
> 	if (expr) a(args) else b(args);
> and marking both a and b noinline would help a lot.
> =

> > =

> > - Use heap instead of stack.
> > =

> > - Split function in smaller chunks and mark them "noinline".
> =

> That might make the code easier to read as well.
> =

> But looking at it, I think that a small amount of refactoring
> (mostly moving the initial 'status' check before the command
> is written) would mean that only one 'map_word' would be valid
> at any one time.
> =

> I didn't look at what was really happening though.
> I suspect it is similar to some code I've written for accessing serial
> EEPROM where the control data is written one bit at a time, but the
> data itself is read/written in 4 bit chunks (although the low-level hardw=
are
> did multiple 'nibble' accesses for wider transfers).
> In any case it surely can't be necessary to have a 256+ byte structure
> to hold the 8-bit command/status values.
> (In my case the 8 bits got 'spread' across a 32bit word and written
> (to the fgpa - helped because I was writing that end as well) as a single=
 word.)

Okay, I leave this to maintainers to decide what to do with my contribution.
Dunno if this refactoring helps doing better one in the future (like David
suggested) or should be rewritten completely. In my opinion, smaller functi=
ons
are always easier to follow.

-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
