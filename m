Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0Ep5-0006b6-FC
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 13:32:24 +0000
Date: Tue, 20 Oct 2009 15:32:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: About the mxc nand driver
Message-ID: <20091020133221.GT8818@pengutronix.de>
References: <20091020131157.GR8818@pengutronix.de>
	<200910201528.55271.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200910201528.55271.jbe@pengutronix.de>
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	linux-mtd@lists.infradead.org, Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 20, 2009 at 03:28:54PM +0200, Juergen Beisert wrote:
> On Dienstag, 20. Oktober 2009, Sascha Hauer wrote:
> > [...]
> > The original Freescale driver uses this ecc layout for 8/16 bit busses:
> >
> > static struct nand_ecclayout nand_hw_eccoob_8 = {
> > 	.eccbytes = 5,
> > 	.eccpos = {6, 7, 8, 9, 10},
> > 	.oobfree = {{0, 5}, {11, 5}}
> > };
> 
> This one is bogus, as it describes an 8 byte OOB with more than 8 bytes...

Well, in current mainline driver it is, but in the Freescale driver
where this snipped has been copied from it is used for 8bit busses
rather than 8bit oob size.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
