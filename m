Received: from smtp.falooley.org ([66.180.170.91])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PScLv-0005Ow-OP
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 21:24:08 +0000
Date: Tue, 14 Dec 2010 13:23:49 -0800
From: Jason Lunz <lunz@acm.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Message-ID: <20101214212349.GA6937@falooley.org>
References: <20071024011712.GA3762@falooley.org>
	<1193208689.26096.48.camel@pmac.infradead.org>
	<20071227181524.GA19051@falooley.org>
	<20071228174853.GA4252@uranus.ravnborg.org>
	<20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
	<20101207182012.GA10546@falooley.org>
	<1292343878.2538.80.camel@localhost>
	<20101214195124.GA6010@falooley.org>
	<1292356893.29257.1.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1292356893.29257.1.camel@koala>
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	richard -rw- weinberger <richard.weinberger@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On one hand you've got uml, which simply doesn't have mmio. On the other
there's mtd, which began as a method for accessing hardware devices that
are often accessed using mmio. But then the mtd subsystem developed
emulations of that hardware that are software based and thus don't
require mmio. It's mainly these emulated backends I'm interested in
exposing.

Nothing is going to change so that it makes sense to have any real
mmio-using hardware driver run on uml. The question you raise is, are
there other classes of driver with a software-only subset that can be
exposed on uml? And if so, would adding stub implementations of
readb/writeb and friends actually be enough to make those work? I'm not
aware of any, so at present I don't think the argument for implementing
this in uml arch code is very strong. Or in other words, I don't think a
"general solution" would be very general.

Jason

On Tue, Dec 14, 2010 at 10:01:33PM +0200, Artem Bityutskiy wrote:
> This problem does not seem to be mtd-specific, right? So my point was
> that it would be nicer to come up with a general solution.
