From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Thu, 13 Feb 2003 09:59:27 +0100
Subject: sharp memory leak
In-Reply-To: <1045072520.12666.53.camel@tubarao>
References: <1045072520.12666.53.camel@tubarao>
Message-ID: <20030213085927.GA25431@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 12 February 2003 10:55:20 -0700, Thayne Harbaugh wrote:
> 
> I've been sitting on some patches for a while and have not sent them
> in.  I saw Jorn send in the patch for the missing cfi_cmdset_0020 and
> decided that I need to get my submissions in befor Jorn sends all of
> them in.

At least you allowed me to fix my own bug. I submitted cfi_cmdset_0020
a while ago and forgot the Makefile line. Darn!

> Here's just one - it's a memory leak in the sharp driver.  It's not huge
> and will likely never leak, but it needs to be there to balance the
> kmalloc().

Leak exists and fix is correct. It may also be worthwhile to do the
following instead:
	mtd = kmalloc
	if (!mtd)
		goto out1;
	sharp = kmalloc
	if (!sharp)
		goto out2;
	width = kmalloc
	if (!width)
		goto out3;
	...
	return mtd;
out3:
	kfree(width);
out2:
	kfree(sharp);
out1:
	kfree(mtd);
	return NULL;

Dunno, this is not a perfect candidate for that strategy, but it might
be slightly more obvious. You decide.

J?rn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
