Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwcyG-0001ER-K4
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 04:08:22 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050202124043.GB23156@wohnheim.fh-wedel.de>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
	<20050202124043.GB23156@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1107421396.32163.53.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 03 Feb 2005 11:03:16 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Jörn,

> > +	/* and Dataflash */
> > +	if (jffs2_dataflash(c)) {
> > +		ret = jffs2_dataflash_setup(c);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> This can be a bit simpler:
> 	ret = jffs2_dataflash_setup()
> 	if (ret)
> 		return ret;

I just copied the way it was done for the the NOR ECC flash.


> > -	return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
> > +	if (c->cleanmarker_size == 0)
> > +		return BLK_STATE_CLEANMARKER;	/* don't bother with re-erase */

If a cleanmarker is not detected (within the first EMPTY_SCAN_SIZE bytes
of a block), the block is added to the 'erase_pending_list' to be
re-erased (and have a new cleanmarker written).

Since we don't need cleanmarkers on DataFlash, we return
BLK_STATE_CLEANMARKER from jffs2_scan_eraseblock() so that the block
rather gets added directly to the 'free_list'.


Regards,
  Andrew Victor
