Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvfiy-0002PE-2y
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 12:52:34 -0500
Date: Mon, 31 Jan 2005 18:52:33 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050131175233.GM6694@wohnheim.fh-wedel.de>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0501311240100.27952@localhost.localdomain>
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

On Mon, 31 January 2005 12:43:47 -0500, Robert P. J. Day wrote:
> On Mon, 31 Jan 2005, Artem B. Bityuckiy wrote:
> 
> > Nobody told about not to use KiB/MiB. It wos told about not to us K
> > and M, like 10K, 100M. Use 10KiB, 100MiB instead.
> 
> ok, i'll start poking around and come up with a patch or two.  don't
> hold your breath, it's a busy week.  the rules:
> 
>   acceptable suffixes: 	{K,k,M,m,G,g}i[Bb]    	(final "b" is optional)
                                       ^   ^
'm' and 'g' don't make sense.  'm' means Milli, instead of Mega, which
is a slight difference. :)
>   not acceptable	{K,k,M,m,G,g}		(not a single letter)
> 
> and any bare number means *exactly* that number of bytes.  agreed?
> let's leave hex and octal prefixes for round two.

If you're lazy and simply call ustrtoul (posted 3min ago), there is no
need for round two.

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
