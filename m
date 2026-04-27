Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744BAFF8868
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yiIgwl1xqb8p5HumQl2IhDp4AcMMgFq/6LyyPT0Y9U=; b=hUIPT5FxSTLGJp
	S1v9tPvFbnPEWj16rVswRD6+WVyxG4pfvLs6+AR0BvhMBRqY//5REtUviYmjBLQkTwhXA2p9fS/Sb
	mC3YdEtKx+sbdjfPMv9R15/gTIZTjhAWWpXl1ASba+sJTAgGEUJBV2XcSH7iYqTHDvsSnljZrgZL2
	c5kdn/TxSPdb95I3wI30BxW2YryQmwGK9zk4wLKRKlEc11H07+TIfuHLT9FgDCnKHyUBstb58xQn4
	3yt85QUsxUffxB9djjZeVMa74/HJnXGo6K3jYhfwnNwl+Lw3ryZeVTnBzPlK481kaUPnoooJCgESh
	h75egaUN/bGnhzuFIdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOBp-0000000HEkV-2RCj;
	Mon, 27 Apr 2026 15:48:05 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOBm-0000000HEjT-3dmu
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 15:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777304883; x=1808840883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X0yZ8fv//dJjQj72P4wIFoT4NGZLaIID0GSsUCfRQXk=;
  b=N5d3X5DyvntZ+3LQxQY5ZAZpmwMHAVSBQAjMpTBoB4EF6li5AOlbI0ta
   MWorrewQ62El8HjCvwoZdJM8tNXEQDh5zYA1wdR4SBKuuHBzFWBhVgblr
   K4yQa2J7MhwPqYuHgNg1I8KvdNUSpKHtxnQsBdEEnDya5++5jtvV2KBFg
   ECr5Ie6Rk7c4YxWLArygURQszkT84JPF2ZEW2AFui+83/EETQb+0pclHv
   slCHS/kwCke4fyl9aZwtM5RH4CwK4SnUcgp8d2e21nX3AwFXbp99u1Vfp
   SRncsjDaKKMYRx4wn7gcwPajCCQsM+y8hcbPKV6/auFbULsv+TG7ckIkS
   A==;
X-CSE-ConnectionGUID: qXot3YGqSIC5+Gr4ifs2rw==
X-CSE-MsgGUID: fZ5Idy5fQ1e8/HoRSLjQSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88797394"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88797394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:48:02 -0700
X-CSE-ConnectionGUID: DQJu360zTWS6XVnQGHAY+Q==
X-CSE-MsgGUID: nehGvcVATL6KshOwM11xtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="256986764"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:48:00 -0700
Date: Mon, 27 Apr 2026 18:47:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <ae-FLk1N3wJs8sTW@ashevche-desk.local>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
 <20260409082611.73fac9ab@pumpkin>
 <addcJP2erqYh8pD2@wunner.de>
 <20260409122846.7d08d2b4@pumpkin>
 <ad41TpzL4onrcKzn@ashevche-desk.local>
 <87ik9cfm6g.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ik9cfm6g.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_084802_941184_B0B455F7 
X-CRM114-Status: GOOD (  27.69  )
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

On Mon, Apr 27, 2026 at 05:38:31PM +0200, Miquel Raynal wrote:
> On 14/04/2026 at 15:38:38 +03, Andy Shevchenko <andriy.shevchenko@linux.i=
ntel.com> wrote:
> > On Thu, Apr 09, 2026 at 12:28:46PM +0100, David Laight wrote:
> >> On Thu, 9 Apr 2026 09:58:28 +0200
> >> Lukas Wunner <lukas@wunner.de> wrote:
> >> > On Thu, Apr 09, 2026 at 08:26:11AM +0100, David Laight wrote:
> >> > > On Wed,  8 Apr 2026 23:11:48 +0200 Andy Shevchenko <andriy.shevche=
nko@linux.intel.com> wrote:  =

> >> > > > Compiler is not happy about used stack frame:
> >> > > > =

> >> > > > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffe=
r':
> >> > > > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame siz=
e of 1296 bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
> >> > > > =

> >> > > > Fix this by factoring out do_write_buffer_locked().  =

> >> > > =

> >> > > Does this just split the large stack frame between two nested func=
tions?
> >> > > I'd also expect the compiler to inline do_write_buffer_locked() so=
 it
> >> > > makes little difference.
> >> > > OTOH I can't immediately see where the large stack frame comes fro=
m.  =

> >> > =

> >> > The error occurs for an allmodconfig build on arm, which implies
> >> > CONFIG_KASAN_STACK=3Dy and thus increases stack usage vis-=E0-vis a
> >> > "regular" build.
> >> > =

> >> > Stack usage is high here because of the three "map_word" types,
> >> > which can each be up to 256 unsigned longs (32 * 8), see the
> >> > definitions of MAX_MAP_LONGS, MAX_MAP_BANKWIDTH, map_word in
> >> > include/linux/mtd/map.h.
> >> =

> >> Ugg - that code is horrid.
> >> Returning structures by value isn't really a good idea.
> =

> Looks like the primary reason for the stack over usage, no? Isn't
> playing with inline and refactoring just a tiny fix that prevents
> problem by just a couple of bytes?
> =

> I haven't looked too carefully, but could we (Andy?) have a fix that
> reduces the number of map_word (as suggested, IIUC) and/or avoid passing
> them by value?

I am not an expert for this particular change, I am afraid. Consider my pat=
ch
as a bug report that needs to be addressed, Currently it might break some
builds when `make W=3D1` is passed.

> I can also take this cleanup if enclosed in a bigger
> series, I don't mind because it may make the code easier to read as
> well, but I feel like this is not a proper fix. If it is, please explain
> to me again :-)

-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
