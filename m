Received: from 66.239.25.20.ptr.us.xo.net ([66.239.25.20] helo=zoot.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZYFt-00083i-Lr
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 13:31:43 -0500
To: =?iso-8859-1?q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Tue, 08 Nov 2005 11:10:27 -0700
In-Reply-To: <20051108105923.GA31446@wohnheim.fh-wedel.de> (
	=?iso-8859-1?q?J=F6rn_Engel's_message_of?= "Tue, 8 Nov 2005 11:59:24
	+0100")
Message-ID: <m3zmofovsc.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> writes:

> Moving crap over to mtdchar.c is a good thing.  Complete removal of
> mtdchar.c might be even better, but at least the crap is relatively
> self-contained now.

Agreed moving the compat_ioctl to mtdchar now that it is possible
sounds good.

I can see that argument with respect to mtdblock.  But why would
removal of mtdchar be a good thing?  It is a simple raw access
interface.   For those whose flash parts are too small for a filesystem
or when you are doing things that you can't do with a filesystem
like making or checking it you need something like mtd char.  For
embedded folks who don't care you can just compile it out.


Eric
