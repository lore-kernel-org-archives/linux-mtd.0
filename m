Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cveok-0000gv-Mb
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:54:27 -0500
Date: Mon, 31 Jan 2005 11:51:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107188815.19262.203.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: tglx@linutronix.de, MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 Jan 2005, David Woodhouse wrote:

> On Mon, 2005-01-31 at 17:22 +0100, Thomas Gleixner wrote:
> >
> > ???
> >
> > It's just missing the k and M suffixes. So its easy to fix.
>
> Don't add k and M. Those are power-of-ten and almost never what the
> users wants. Add Ki and Mi only.

i agree completely, but i thought some of the recognized suffixes were
"KiB", "MiB" and so on.  anyway, i was pretty sure that even a
suggestion this innocuous was going to generate some discussion.

i'll leave it up to the gurus here to decide how they want to
standardize this.

rday
