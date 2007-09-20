Received: from an-out-0708.google.com ([209.85.132.249])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYQr9-0007vf-Vq
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 14:34:35 -0400
Received: by an-out-0708.google.com with SMTP id c3so87624ana
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Sep 2007 11:34:30 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
Date: Thu, 20 Sep 2007 20:34:21 +0200
References: <200709201728.10866.technoboy85@gmail.com>
	<200709201755.06712.technoboy85@gmail.com>
	<20070920175204.GA26132@lst.de>
In-Reply-To: <20070920175204.GA26132@lst.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709202034.21764.technoboy85@gmail.com>
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	Eugene Konev <ejka@imfi.kspu.ru>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il Thursday 20 September 2007 19:52:05 hai scritto:
> > +#include <linux/squashfs_fs.h>
> 
> As Ralf mentioned this is not in mainline, so you can't include it.
> Fortunately for you including it seems to be a rather dumb idea anyway,
> see below for further comments.

You're right, i'll move the magic into linux/magic.h

> > +static struct mtd_partition ar7_parts[5];
> 
> Can we please get a symbolic name for that 5?  Then again we only
> seems to use 3 anyway, and create_mtd_partitions returns 4..

we use 4, and bootloader  is right, it returns 4
The fourth partition is empty, the kernel formats it as jffs2
when mounting

> > +	unsigned int root_offset = 0xe0000;
> 
> Please provide a symbolic name for this one.

Ok

> > +	printk(KERN_INFO "Parsing AR7 partition map...\n");
> 
> Do we really need this printk?

No?

> > +		if (header.checksum == 0xfeedfa42)
> > +			break;
> > +		if (header.checksum == 0xfeed1281)
> > +			break;
> 
> These two want symbolic names, please:
> 
> enum {
> 	/* some comment */
> 	FOO_PART_MAGIC = 0xfeedfa42,	
> 
> 	/* more comment */
> 	BAR_PART_MAGIC = 0xfeed1281,
> };
> 
> > +	switch (header.checksum) {
> > +	case 0xfeedfa42:
> > +		while (header.length) {
> > +			offset += sizeof(header) + header.length;
> > +			master->read(master, offset, sizeof(header),
> > +				     &len, (u_char *)&header);
> > +		}
> > +		root_offset = offset + sizeof(header) + 4;
> > +		break;
> > +	case 0xfeed1281:
> 
> Especially as you use them here again.

Right, will do


> > +	default:
> > +		printk(KERN_WARNING "Unknown magic: %08x\n", header.checksum);
> > +		break;
> > +	}
> > +
> > +	master->read(master, root_offset,
> > +		sizeof(header), &len, (u_char *)&header);
> > +	if (header.checksum != SQUASHFS_MAGIC) {
> > +		root_offset += master->erasesize - 1;
> > +		root_offset &= ~(master->erasesize - 1);
> > +	}
> 
> And after this I'm pretty sure either of the two hex constants above
> is SQUASHFS_MAGIC.  But not actually the magic in the squashfs
> superblock, but someone decided to reuse it for the partitions magic.
> So one of the comments for *_PART_MAGIC becomes:
> 
> 	/* same as SQUASHFS_MAGIC for some odd reason.. */

No. There are MIPS instructions. We look for the loader
start offset since it is in the first partition
