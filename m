Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913CCCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMkmRg8ZZzYe9zj52NbhJyetPxYDsTGRAo8d/+kXSvg=; b=VR9jVK5xNMJh01
	CDRczflYxHwg1T/45WDLEjK16o7DQ5bwmrc4NcQWs4Qcwzp9coSufPcCaFF5ZIJLnanBm5LXrVj+i
	UFlyfoalWuNhHlflmAq+zoDAYV11WIb7VuDdfsoibn7eXHQbkfd300C6H7lmpiTAdqeRxkmY+u5IP
	LxUgUfKL3SY9tBr6EyFSHepXpEQw4tEETd4SId/T+Kn2BZJe13GCO9P5RdrxW84eaaUkFqVjtVVyL
	WUIcRM2kbtj/WOJNmf96dpRWjb59E4B8AVxPhY1GEiqYsI6xBocQ/lU9mqR9DriShI6a4NJ5R/Nb3
	yufNHbCaJKqxkf1stHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Xd-0000000FsSO-14Nb;
	Thu, 06 Nov 2025 16:08:53 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Xa-0000000FsRK-0Tjo;
	Thu, 06 Nov 2025 16:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762445330; x=1793981330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BxSiubnDJFoi3hF0gZEV1dDowKtMOnRvt3PDCt/YgRc=;
  b=hTE3d3vjVTnnLzaSAF3KZjzVRrcrOtKSkx5NsV1yAgXpJN8Rz6r57Lfv
   dx847H3ox5IhPkrkjAoNgJBin+rladq9OYiPdGoRdHQyMZ9jFVVVJdc1Q
   eAhN+zEqGHwrH1xRU/k2t7sQJs61aUeoYwT4MHMhemucMhzX4iK8/CgMO
   D5o9Kmh1k9leThtnfHfcJ/CiGaWFGk76O/3CtVcQlcYPB5psYWx/Iq9Bb
   MdApZAs9cku/VrdACovnkmkzYTFFSNPGBT0RRYJtoHSZRbxgNs9iUTbe+
   bvF1rpiYrk03yL3MSQmt9HgyH6u0bk7itfQrWaHK/tZNnMYa1sF6kxotK
   Q==;
X-CSE-ConnectionGUID: EzZBqegDQy+UEygAEKtiNA==
X-CSE-MsgGUID: 0RTiSgqZRhmlcgWErMrmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82215789"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="82215789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:08:50 -0800
X-CSE-ConnectionGUID: csRhl/YrR3mh6V3vjCg1UA==
X-CSE-MsgGUID: aB5X0TIERP63avd4sWT1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187454619"
Received: from abityuts-desk.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.224])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:08:39 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vH2XJ-00000006BqD-4AI9;
	Thu, 06 Nov 2025 18:08:33 +0200
Date: Thu, 6 Nov 2025 18:08:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
Message-ID: <aQzIAd91tlR3o9hu@smile.fi.intel.com>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
 <aQzGY4AKiMQpuL0R@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQzGY4AKiMQpuL0R@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080850_167266_2F9A7AD6 
X-CRM114-Status: GOOD (  21.74  )
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

On Thu, Nov 06, 2025 at 11:01:39AM -0500, Yury Norov wrote:
> On Thu, Nov 06, 2025 at 04:44:31PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > > (long) long" _mask types.  For constant masks, that condition is usually
> > > met, as GENMASK() yields an UL value.  The few places where the
> > > constant mask is stored in an intermediate variable were fixed by
> > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > 
> > > However, for non-constant masks, smaller unsigned types should be valid,
> > > too, but currently lead to "result of comparison of constant
> > > 18446744073709551615 with expression of type ... is always
> > > false"-warnings with clang and W=1.
> > > 
> > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > > used in the fully non-const variants later.
> > > 
> > > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> > >     HWM_FIELD_PREP()")
> > > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> > >     warnings from clang")
> > 
> > 
> > Also can be made as
> > 
> > Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]
> > 
> > The positive effect that one may click that on Git Web.
> > Ideally, of course, would be an additional parses on Git Web kernel.org uses to
> > parse that standard "commit ...()" notation to add the respective HREF link.
> 
> Those flying over Atlantic or cruising cross Caribbean would disagree. :)

They won't. The purpose of these Links is described in the above commit message.
Even they read the commit message before clicking.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
