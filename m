Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CvgDr-0003Dl-3F
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 13:24:28 -0500
Date: Mon, 31 Jan 2005 13:22:03 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050131175233.GM6694@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.61.0501311321040.28147@localhost.localdomain>
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
	<20050131175233.GM6694@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-251277581-1107195723=:28147"
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-251277581-1107195723=:28147
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Mon, 31 Jan 2005, Jörn Engel wrote:

> On Mon, 31 January 2005 12:43:47 -0500, Robert P. J. Day wrote:
> > On Mon, 31 Jan 2005, Artem B. Bityuckiy wrote:
> >
> > > Nobody told about not to use KiB/MiB. It wos told about not to us K
> > > and M, like 10K, 100M. Use 10KiB, 100MiB instead.
> >
> > ok, i'll start poking around and come up with a patch or two.  don't
> > hold your breath, it's a busy week.  the rules:
> >
> >   acceptable suffixes: 	{K,k,M,m,G,g}i[Bb]    	(final "b" is optional)
>                                        ^   ^
> 'm' and 'g' don't make sense.  'm' means Milli, instead of Mega, which
> is a slight difference. :)

you're right, i was typing faster than i was thinking.

> >   not acceptable	{K,k,M,m,G,g}		(not a single letter)
> >
> > and any bare number means *exactly* that number of bytes.  agreed?
> > let's leave hex and octal prefixes for round two.
>
> If you're lazy and simply call ustrtoul (posted 3min ago), there is no
> need for round two.

ok.

rday
--8323328-251277581-1107195723=:28147--
