Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvfMW-0001q3-Hq
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 12:29:22 -0500
Date: Mon, 31 Jan 2005 18:29:23 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050131172923.GK6694@wohnheim.fh-wedel.de>
References: <1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
	<20050131172133.GJ6694@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 17:25:05 +0000, Artem B. Bityuckiy wrote:
> On Mon, 31 Jan 2005, [iso-8859-1] Jörn Engel wrote:
> > 
> > What information does the "B" in "10KiB" contain?  And why is it "Ki"
> > instead of the correct "ki"?
> Hehe.
> 
> This is just widely used unit. And it is usually written like that. And 
> now most utilities work with such. But if one wants and thinks it is 
> reasonable, why not to use kib :-)

Well, if people really prefer it, allowing either "ki" or "kiB" would
be fine.  Not that much extra code.  "kib" as well, sure.  phram and
block2mtd will remain unchanged until people explicitly request it,
though. :)

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
