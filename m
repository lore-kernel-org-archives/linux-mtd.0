Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC4hx-00023p-Rt
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 06:46:46 +0000
Received: by eyh6 with SMTP id 6so1843014eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 23:46:44 -0700 (PDT)
Subject: Re: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTinXxYy-rHEWz2D_c_s-wS8L3oy7-g@mail.gmail.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTik3bKP4=zBgqxpN2vNTWD5V5DzKAA@mail.gmail.com>
	<1303134901.8589.9.camel@localhost>
	<BANLkTi=7yxRMgw+UpCZ+bmwrQw_QfFT44A@mail.gmail.com>
	<1303135646.8589.12.camel@localhost>
	<1303136762.24954.12.camel@fs-test.research.nokia.com>
	<BANLkTi=DNOTANVFDvip8=RqppRCVUe08_w@mail.gmail.com>
	<1303138210.24954.14.camel@fs-test.research.nokia.com>
	<BANLkTi==M8mEkMd8NjyyNe_jWocZQS5_OQ@mail.gmail.com>
	<1303140041.24954.17.camel@fs-test.research.nokia.com>
	<BANLkTinXxYy-rHEWz2D_c_s-wS8L3oy7-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Apr 2011 09:43:49 +0300
Message-ID: <1303195429.2779.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 17:33 -0400, Mike Frysinger wrote:
> On Mon, Apr 18, 2011 at 11:20, Andy Shevchenko wrote:
> > On Mon, 2011-04-18 at 10:57 -0400, ext Mike Frysinger wrote:
> >> so let's go with an explicitly 64bit printf modifier.
> >
> > Regarding to above I couldn't see any objection against %jd. At least
> > one for PRIu64 - it looks awful in code.
> 
> it doesnt make sense to me to pair a non-explicit sized format string
> with an explicit sized type.  off64_t is exactly 64bits, and PRIu64
> prints exactly 64bits.

Yes, I agree.

> that said, %ju is at least an improvement over the current code as
> well as the patch you've posted (doesnt seem to need casts on 32 or 64
> bit systems).  so if Artem is OK with that, i wont fight it.  even
> though it's still not as correct as my proposal :P.

To be frank, I do not care much :-) We are talking about a single place.
If Andy make a fix for all the mtd code, that would matter much much
more :-)

But yes, of course it is difficult to disagree that for explicitly sized
type it is saner to use explicit-size print placeholder.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
