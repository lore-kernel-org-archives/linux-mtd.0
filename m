Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al2D4-0007Vk-NX
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 08:35:06 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
   "'Eric W. Biederman'" <ebiederman@lnxi.com>
Date: Mon, 26 Jan 2004 09:34:31 +0100
Message-ID: <000d01c3e3e7$385e71d0$0a01a8c0@LUMENTIS02>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1075102799.17157.209.camel@lapdancer.baythorne.internal>
cc: linux-mtd@lists.infradead.org
Subject: RE: Q: Filesystem choice..
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> When you get down to the kind of sizes you're talking about, I suspect
> we need to be thinking in bytes rather than blocks -- because there
> isn't just one threshold; there's many, of which three are 
> particularly
> relevant:
> 
>         /* Deletion should almost _always_ be allowed. We're fairly
>            buggered once we stop allowing people to delete stuff
>            because there's not enough free space... */
>         c->resv_blocks_deletion = 2;
>                                                               
>                   
>         /* Be conservative about how much space we need 
> before we allow writes.
>            On top of that which is required for deletia, 
> require an extra 2%
>            of the medium to be available, for overhead caused 
> by nodes being
>            split across blocks, etc. */
>                                                               
>                   
>         size = c->flash_size / 50; /* 2% of flash size */
>         size += c->nr_blocks * 100; /* And 100 bytes per eraseblock */
>         size += c->sector_size - 1; /* ... and round up */
>                                                               
>                   
>         c->resv_blocks_write = c->resv_blocks_deletion + 
> (size / c->sector_size);
> 
>         /* When do we allow garbage collection to merge nodes to make
>            long-term progress at the expense of short-term 
> space exhaustion? */
>         c->resv_blocks_gcmerge = c->resv_blocks_deletion + 1;
>                                                               
>                   
> You want resv_blocks_write to be larger than 
> resv_blocks_deletion, and I
> suspect you could get away with values of 2 and 1.5 
> respectively, if we
> were counting bytes rather than whole eraseblocks.
> 
> Then resv_blocks_gcmerge wants to be probably about the same as
> resv_blocks_deletion, to make sure we get as much benefit from GC as
> possible.

Hmm, I got a ~63 MB JFFS2 NOR(EB=256 KB) FS. If I understand the above calculations above correcly, I get:

size = 63*1024*1024/50 = 1321205
size += 252*100 = 1321457
size += 256*1024 -1 = 1583600

resv_blocks_write = 2 + 1583600/(256*1024) = 2 + 6 = 8
resv_blocks_gcmerge = 2+1 = 3

So now I need 8(2 MB) reserved blocks instead of 5?
I never had any trouble with 5 reserved blocks, maybe one could do a
resv_blocks_write = MIN(5, resv_blocks_write) iff NOR flash?

    Jocke
