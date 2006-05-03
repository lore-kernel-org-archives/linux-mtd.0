Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbK5Q-00036g-4u
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 17:20:25 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060426155116.GL29108@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<20060426155116.GL29108@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 03 May 2006 18:22:38 +0200
Message-Id: <1146673359.27820.100.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-04-26 at 17:51 +0200, Jörn Engel wrote:
> > +	if (mtd->flags & MTD_PROGRAM_REGIONS) {
> > +		pagesize = MTD_PROGREGION_SIZE(mtd);
> > +	} else {
> > +		pagesize = mtd->oobblock;
> > +	}
> 
> Take a look at my tree:
> http://git.infradead.org/?p=users/joern/mtd-2.6.git;a=summary
> 
> Once writesize is in, this part can just go.

And we should get rid of the _ecc variants too. Nothing outside of the
flash chip driver itself needs to be aware of them. Hopefully I come
around to clean that up along with the oob mess in the next weeks.

	tglx
