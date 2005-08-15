Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fao-0005uZ-9b
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 10:05:41 -0400
Date: Mon, 15 Aug 2005 16:05:30 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050815140530.GE3829@wohnheim.fh-wedel.de>
References: <43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43009FFC.3090200@yandex.ru>
Cc: linux-mtd@lists.infradead.org
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

On Mon, 15 August 2005 18:00:28 +0400, Artem B. Bityuckiy wrote:
> Jörn Engel wrote:
> >My preferred approach would be to allocate a slab cache for jffs2
> >erase blocks.  Then we either need a (much smaller) array of pointers
> >to the slab objects or maintain them as linked lists.  But then again,
> >it wouldn't be the first ugly hack in jffs2.  Go right ahead if you
> >really want to!
> 
> Only not slab cache, what for? We allocate the erasblock structure once 
> on mount and deallocate them all once on unmount. No need to use a slab 
> cache. The merit of the slab cache is very fast allocations, and we will 
> not make use of this property anyway. No need to use slab cache here at all.

One of its merits is fast allocation, yes.

Others are less external fragmentation and lower-order memory
allocations.

Say, you need about 65k for your erase blocks.  With slab, you need to
allocate roughly 17 pages of 4k each, plus slab overhead.  With
kmalloc, you allocate 128k.  That's nearly twice what you need.

With slab, you allocate order-0 pages.  With kmalloc you allocate
order-5 pages.  Ask Martin J Bligh about high-order allocations if you
want to hear some spooky stories.

Going from kmalloc to vmalloc makes things even worse.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
