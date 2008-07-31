Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOel0-0008Cd-EV
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 20:28:18 +0000
Message-ID: <4892205F.2080005@billgatliff.com>
Date: Thu, 31 Jul 2008 15:28:15 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: David Brown <mtd@davidb.org>
Subject: Re: Node CRC failures in latest mainline git?
References: <48913EA3.9080603@billgatliff.com>
	<20080731045624.GA24431@old.davidb.org>
In-Reply-To: <20080731045624.GA24431@old.davidb.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brown wrote:
> On Wed, Jul 30, 2008 at 11:25:07PM -0500, Bill Gatliff wrote:
> 
>> Were I more competent with git, I would figure out how to bisect down to the
>> patch that caused the problem.  That's still a bit out of my skillset at the
>> moment, unfortunately--- I've done bisects successfully in the past, but for
>> some reason I just can't get git to play along this time...
> 
> I just recently asked a question on the git mailing list, and Linus replied
> with these instructions for bisecting through a merge.  Basically, you
> create a temporary branch where you flatten the merge, using rebase, and
> then bisect that.
> 
>    # create a test-branch with the 'remote' side of the merge
>    git checkout -b test-branch merge^2
> 
>    # rebase that remote side on top of the local side
>    git rebase merge^


I have no idea what all that would be doing, I still don't grok the syntax for
commits and deltas, and "rebase" in particular always scares me.  :)

Here's what I'm trying:

$ git-checkout -b test-branch 9ee08c2df47c10ba624ff05a6c0f2500748bcb69^2
$ git rebase 9ee08c2df47c10ba624ff05a6c0f2500748bcb69^

It leaves me here:

First, rewinding head to replay your work on top of it...
Applying [MTD] [NOR] Remove cfi_cmdset_0001.c erase suspend fixup typo
Applying [MTD] [NOR] Support for M50FLW080A and M50FLW080B
Applying [MTD] [NOR] Add support for AMD AM29SL800D[BT] NOR flash chips
Applying [MTD] [NOR] Add support for flash chips with ID in bank other than 0
Applying [MTD] [NOR] Add support for Eon EN29SL800B[BT] NOR flash chips
Applying [MTD] [NAND] fix 2 "unused variable" warnings in cafe_nand.c
Applying [MTD] [NAND] excite_nandflash: simplify code using ARRAY_SIZE() macro.
Applying [MTD] use list_for_each_entry() in add_mtd_device()
Applying [MTD] use list_for_each_entry() in del_mtd_device()
Applying [MTD] DataFlash: fix bug - ATMEL AT45DF321D spi flash card fails to be
copied to (v2)
Applying [MTD] DataFlash: use proper types
Applying [MTD] [OneNAND] Check the ECC status first instead of controller
Applying [MTD] [NAND] nandsim: fix size bug
Applying [MTD] [NAND] nandsim: fix overridesize
Applying [MTD] [NAND] nandsim: allow for 64-bit size
Applying MTD/JFFS2: remove CVS keywords
error: drivers/mtd/maps/mtx-1_flash.c: does not exist in index
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merged drivers/mtd/devices/block2mtd.c
Auto-merged drivers/mtd/ftl.c
Auto-merged drivers/mtd/maps/Kconfig
Auto-merged drivers/mtd/maps/Makefile
CONFLICT (delete/modify): drivers/mtd/maps/mtx-1_flash.c deleted in HEAD and
modified in MTD/JFFS2: remove CVS keywords. Version MTD/JFFS2: remove CVS
keywords of drivers/mtd/maps/mtx-1_flash.c left in tree.
Auto-merged drivers/mtd/maps/pcmciamtd.c
Auto-merged drivers/mtd/maps/uclinux.c
Auto-merged drivers/mtd/mtdchar.c
Auto-merged drivers/mtd/redboot.c
Auto-merged include/linux/mtd/map.h
Auto-merged include/linux/mtd/mtd.h
Auto-merged include/linux/mtd/nand.h
Failed to merge in the changes.
Patch failed at 0016.

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".



Poking at it more now.  Does it look like I'm on the right track, at least?


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
