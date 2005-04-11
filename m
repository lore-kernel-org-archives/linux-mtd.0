Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DL5hN-0005u1-7s
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 16:39:58 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j3BKdxTY015548
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 16:39:59 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j3BKdxNK235220
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 16:39:59 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j3BKdxw9022967
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 16:39:59 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0504111600540.28647@localhost.localdomain>
References: <Pine.LNX.4.61.0504111600540.28647@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 11 Apr 2005 15:39:57 -0500
Message-Id: <1113251997.7500.5.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: why can i select both PHYSMAP and MULTI_PHYSMAP?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-11 at 16:04 -0400, Robert P. J. Day wrote:
>   patched my 2.6.11.7 kernel tree with the latest mtd CVS to get the
> mphysmap.c and i'm a bit confused.  in the
> 
>   Mapping drivers for chip access -->
> 
> menu, i can apparently select, simultaneously,
> 
>   <*> CFI Flash device in physical memory map
>   <*> multiple CFI Flash devices in physical memory map
> 
> this seems contradictory, especially since i can deselect the first
> while still select the second.  am i misreading what these mean?  or
> is this some non-intuitive stuff to be backward-compatible?

Joern (the author) is on vacation so I'll try to answer for him.

I don't believe mphysmap precludes the use of physmap.  They are
entirely separate drivers and should be able to be used as such.  For
example, you could map one chip with physmap, and 3 others with
mphysmap.

That isn't the typical intended usage though.  Normally you would use
mphysmap to map all of the chips on a board.  If you only had one chip,
you could still use mphysmap.  It's sort of backward-compatible that way
I suppose.

If mphysmap proves to be useful and stable (it is fairly new), then
maybe it can eventually replace physmap.  Until then, I suppose it's
safest to leave both there.

josh
