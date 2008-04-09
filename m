Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jjiwm-0005zK-Ug
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 22:39:17 +0000
Received: from edison2.selinc.com (localhost [127.0.0.1])
	by duster.selinc.com (Spam Firewall) with ESMTP id C139F121ABAB
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Apr 2008 15:39:13 -0700 (PDT)
Received: from edison2.selinc.com (edison2.ad.selinc.com [10.100.0.115]) by
	duster.selinc.com with ESMTP id TtRQnaMfrWSvwA91 for
	<linux-mtd@lists.infradead.org>;
	Wed, 09 Apr 2008 15:39:13 -0700 (PDT)
To: linux-mtd@lists.infradead.org
Subject: mtd->size revisited
MIME-Version: 1.0
Message-ID: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 9 Apr 2008 15:39:12 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I asked about this a few weeks ago, came up with an alternative solution, 
but that solution came up against a 30% performance hit on accessing my 
flash, so we're back to a kernel change.  Let me recap a bit.  The issue I 
have is that I'm trying to put together a NAND flash driver for an 8GiB 
part.  The struct mtd_info->size field is a u_int32_t, which is not big 
enough to hold 0x200000000 (i.e., 8GiB).  The question I originally asked 
was "am I understanding this correctly and is it an issue for anyone else" 
and got the answer "it's either a bug or an enhancement depending on your 
viewpoint, patches welcome".

Well, I'm willing to try and change this, but I'm still learning my way 
around the kernel and have no where near the abilities of the folks who 
orginally wrote this stuff.  Before I take this on, my employer (who 
understandably wants the most bang for thier buck :-\ ) wants to know how 
long it's going to take.  My answer is a confidant "duhhhhhhhhhh".  What 
I'm looking for is a ballpark guestimate from someone familiar with MTD as 
to how long it would take them to change struct mtd_info->size to a 
u_int64_t, test it, and deal with ripple affects.

I know that just changing it isn't all that's involved.  I've alredy gone 
through some of the pain of changing 32-bit division to 64-bit shifts and 
masks.  A larger concern of mine is ripple effects.  I know that this 
field is referenced in a lot of places, most of which are pretty benign, 
and others that are less so.  A good example is in .../mtd/mtdblock.c 
where this happens: dev->size = mtd->size >> 9.  I don't know right off 
the top of my head what struct mtd_blktrans_dev->size is used for, but I 
can pretty well bet that a 64-bit value shifted right by nine ain't gonna 
fit.  So then this ripples into making changes to mtd_blktrans_dev.  Wow. 
This could end up going a long way.  Plus, I know there are a couple of 
drivers that make use of this field and I expect that if I make this 
change, I'll be responsible for makeing the changes to the drivers. 
However, I can't test those changes since I don't have the HW.  How is 
that going to be received by the community and the maintainers of those 
drivers?

So, as I said, I'm willing to tackle this, but I need to get a sense of 
how long it's going to take me.  I need an idea of how long it would take 
someone with experiance with MTD and I can then translate that (roughly :) 
 ) into how long it should take me.  I also need guidence on how to deal 
with things that I can't test.

Thanks for any help and direction.

Bruce
