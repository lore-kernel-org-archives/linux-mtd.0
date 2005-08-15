Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4eN4-0002BM-6S
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 08:47:23 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050815115345.GB27229@wohnheim.fh-wedel.de>
References: <20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru>
	<20050815115345.GB27229@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 15 Aug 2005 16:46:44 +0400
Message-Id: <1124110005.6148.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-08-15 at 13:53 +0200, Jörn Engel wrote:

> David, my best idea right now would be to change the erase marker and
> add a field to it.  Doesn't really make me happy, though.  Do you have
> a better idea?
> 
> And while we're at it, why not create a new function for this code.
> Something like this:
> 
> int jffs2_check_erase_size(struct jffs2_sb_info *c)
> {
> 	size_t blocks;
> 
> 	c->sector_size = c->mtd->erasesize; 
> 	blocks = c->flash_size / c->sector_size;
> 	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS)) {
> 		while ((blocks * sizeof (struct jffs2_eraseblock))
> 				> (128 * 1024)) {
> 			blocks >>= 1;
> 			c->sector_size <<= 1;
> 		}	
> 	}
> 
> 	if (/* magic check about changed erase_size fails */)
> 		return -EIO;
> 	return 0;
> }

If we will have the same algorithm for calculating the size of virtual
block both in JFFS2 and in sumtool, the problem should go, isn't it?
User supplies sumtool with size of the eraseblock, sumtool knows the
size of struct jffs2_eraseblock, so it knows the virtual block size and
we're happy.
