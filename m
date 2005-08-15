Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4g1S-0006hw-5r
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 10:33:16 -0400
Date: Mon, 15 Aug 2005 16:32:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050815143241.GA7045@wohnheim.fh-wedel.de>
References: <20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>
	<20050815140530.GE3829@wohnheim.fh-wedel.de>
	<1124115547.6148.17.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1124115547.6148.17.camel@sauron.oktetlabs.ru>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
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

On Mon, 15 August 2005 18:19:07 +0400, Artem B. Bityuckiy wrote:
> On Mon, 2005-08-15 at 16:05 +0200, Jörn Engel wrote:
> > Others are less external fragmentation and lower-order memory
> > allocations.
> > 
> > Say, you need about 65k for your erase blocks.  With slab, you need to
> > allocate roughly 17 pages of 4k each, plus slab overhead.  With
> > kmalloc, you allocate 128k.  That's nearly twice what you need.
> > 
> > With slab, you allocate order-0 pages.  With kmalloc you allocate
> > order-5 pages.  Ask Martin J Bligh about high-order allocations if you
> > want to hear some spooky stories.
> > 
> > Going from kmalloc to vmalloc makes things even worse.
> 
> Ok, how about just to allocate as many pages as we need, and make an
> array of pointers to pages? Then the 'struct jffs2_eraseblock' object of
> the eraseblock with offset 'offs' will be something like this:
> 
> blocks_per_page = PAGE_SIZE/sizeof(struct jffs2_eraseblock);
> blknum = offs/c->erase_size;
> pgidx = blknum/PAGE_SIZE;
> blkidx = blknum - pgidx * blocks_per_page;
> 
> jeb = &c->blocks[pgidx][blkidx];

How about encapsulating all the page handling code in - say -
mm/slab.c and just handling single objects? ;)

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
