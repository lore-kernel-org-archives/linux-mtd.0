Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4dXD-0000Ht-T4
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 07:53:52 -0400
Date: Mon, 15 Aug 2005 13:53:45 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050815115345.GB27229@wohnheim.fh-wedel.de>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43007773.2070602@yandex.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 August 2005 15:07:31 +0400, Artem B. Bityuckiy wrote:
> 
> Ok, to keep you busy with some technical stuff also, here is a remark.
> 
> >+		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
> >+
> >+			if(je32_to_cpu(sm->erase_size) == c->sector_size) {
> >+				err = 
> >jffs2_sum_scan_sumnode(c,jeb,je32_to_cpu(sm->offset),&pseudo_random);
> >+
> >+				if (err) {
> >+					kfree(sm);
> >+					return err;
> >+				}
> >+			}
> >+			printk(KERN_WARNING "FS erase_block_size != JFFS2 
> erase_block_size => skipping summary information\n");
> >+		}
> 
> if(je32_to_cpu(sm->erase_size) == c->sector_size) { ...
> 
> AFAIU, you're protecting against the situation when the size of the 
> JFFS2 virtual eraseblock is changed.
> 
> But why is the eraseblock size may change? If it becomes less, this is a 
> problem since some nodes that cross the boundary will be ignored. If the 
> size of the JFFS2 virtual eraseblock becomes larger, it is also a 
> problem - due to present bad blocks, some eraseblocks with valid data 
> will be ignored (remember, if there is a bad eraseblock in the JFFS2 
> virtual eraseblock, the whole virtual eraseblock is regarded as bad).
> 
> Thus, please, don't solve this problem this way. You're trying to solve 
> it privately for your summaries, while you have to solve it for *JFFS2 
> in general* (if it exists at all). I suppose it exists in your case 
> since you add one more field to struct eraseblock...

Agreed.  Best place to put the check would be in
jffs2_do_fill_super(), about here:

	c->sector_size = c->mtd->erasesize; 
	blocks = c->flash_size / c->sector_size;
	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS)) {
		while ((blocks * sizeof (struct jffs2_eraseblock))
				> (128 * 1024)) {
			blocks >>= 1;
			c->sector_size <<= 1;
		}	
	}

Imo, this block growing is an ugly hack.  It defeats the ability to
grow/shrink your partition on the fly.  Worse, it makes
growing/shrinking fail only rarely, while it usually just works.

Anyway.  Once the size of erase blocks changes, we're basically
fucked - even without summary.  So we want that check unconditionally.
Of course, we don't have any nodes containing the erase_size yet.
Hmm.

David, my best idea right now would be to change the erase marker and
add a field to it.  Doesn't really make me happy, though.  Do you have
a better idea?

And while we're at it, why not create a new function for this code.
Something like this:

int jffs2_check_erase_size(struct jffs2_sb_info *c)
{
	size_t blocks;

	c->sector_size = c->mtd->erasesize; 
	blocks = c->flash_size / c->sector_size;
	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS)) {
		while ((blocks * sizeof (struct jffs2_eraseblock))
				> (128 * 1024)) {
			blocks >>= 1;
			c->sector_size <<= 1;
		}	
	}

	if (/* magic check about changed erase_size fails */)
		return -EIO;
	return 0;
}

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
