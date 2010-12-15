Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSfQ0-0006SG-D0
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 00:40:32 +0000
Received: by gyg4 with SMTP id 4so795342gyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 16:40:30 -0800 (PST)
From: Rob Landley <rob@landley.net>
To: Jason Lunz <lunz@acm.org>
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Date: Tue, 14 Dec 2010 18:40:25 -0600
References: <20071024011712.GA3762@falooley.org>
	<1292356893.29257.1.camel@koala>
	<20101214212349.GA6937@falooley.org>
In-Reply-To: <20101214212349.GA6937@falooley.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012141840.27529.rob@landley.net>
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	Artem Bityutskiy <dedekind1@gmail.com>,
	richard -rw- weinberger <richard.weinberger@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	lkml <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 14 December 2010 15:23:49 Jason Lunz wrote:
> On one hand you've got uml, which simply doesn't have mmio. On the other
> there's mtd, which began as a method for accessing hardware devices that
> are often accessed using mmio. But then the mtd subsystem developed
> emulations of that hardware that are software based and thus don't
> require mmio. It's mainly these emulated backends I'm interested in
> exposing.
>
> Nothing is going to change so that it makes sense to have any real
> mmio-using hardware driver run on uml. The question you raise is, are
> there other classes of driver with a software-only subset that can be
> exposed on uml? And if so, would adding stub implementations of
> readb/writeb and friends actually be enough to make those work? I'm not
> aware of any, so at present I don't think the argument for implementing
> this in uml arch code is very strong. Or in other words, I don't think a
> "general solution" would be very general.

For what it's worth, QEMU had replaced all my use cases for UML in the past 
few years.  If I wanted to play with loopback mounting jffs2 I'd build a kernel 
to run under QEMU, and have that emulate the flash.

Rob
-- 
GPLv3: as worthy a successor as The Phantom Menace, as timely as Duke Nukem 
Forever, and as welcome as New Coke.
