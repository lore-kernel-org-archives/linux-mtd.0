Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvgr5-0003u8-3u
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 14:05:00 -0500
Date: Mon, 31 Jan 2005 14:02:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107196307.19262.207.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.61.0501311402020.28370@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311240100.27952@localhost.localdomain>
	<1107196307.19262.207.camel@hades.cambridge.redhat.com>
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

> On Mon, 2005-01-31 at 12:43 -0500, Robert P. J. Day wrote:
> >
> > ok, i'll start poking around and come up with a patch or two.  don't
> > hold your breath, it's a busy week.  the rules:
> >
> >   acceptable suffixes:  {K,k,M,m,G,g}i[Bb]      (final "b" is
> > optional)
>
> By convention, 'b' is bits, 'B' is bytes. Let's support only 'KiB' and
> 'MiB'; nothing else is really necessary, surely?

i'm all for that.

rday
