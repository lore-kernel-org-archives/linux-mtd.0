Received: from e6.ny.us.ibm.com ([32.97.182.106])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARcd0-0000s9-2F
	for <linux-mtd@lists.infradead.org>; Wed, 03 Dec 2003 19:25:38 +0000
Received: from northrelay02.pok.ibm.com (northrelay02.pok.ibm.com
	[9.56.224.150])
	by e6.ny.us.ibm.com (8.12.10/8.12.2) with ESMTP id hB3JNODA577558
	for <linux-mtd@lists.infradead.org>; Wed, 3 Dec 2003 14:23:24 -0500
Received: from d01ml605.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	hB3JNNdm176560
	for <linux-mtd@lists.infradead.org>; Wed, 3 Dec 2003 14:23:23 -0500
In-Reply-To: <E1ARVfo-0008Nd-AS@pentafluge.infradead.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
From: Joan Dyer <joandy@us.ibm.com>
Message-ID: <OF34791286.BF457C19-ON85256DF1.0068ECB2-85256DF1.006A57CA@us.ibm.com>
Date: Wed, 3 Dec 2003 14:23:20 -0500
Content-Type: text/plain; charset="US-ASCII"
Subject: Probs with port to 2.4.18
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would appreciate a clue or two.

I have ported jffs2 to 2.4.18 making minimal changes to the kernel that I 
need to work with.  This was intended to get the newer garbage collection 
working on our (older) kernel.

I had first asked about write failures (mtd/chips/cfi_cmdset_0002) and 
took the current, updated, version of this file.  I get a timeout on the 
write (timeout vals increased) with the "Wacky" message (unable to decode 
failure state). 

However what seems to be the underlying problem is a non-coordinated 
write, while/during erase.   With my port, wbuf.c (which references the 
erase_completion lock) is not used. 

Should I protect the write in writev.c with a call on the lock? 

Is there any output or information that I can provide?   Here is a portion 
of dmesg:

inocache for ino #29631 is all gone now. Freeing
Removed nodes in range 0x00190000-0x001a0000 from ino #29632
inocache for ino #29632 is all gone now. Freeing
Removed nodes in range 0x00190000-0x001a0000 from ino #29633
inocache for ino #29633 is all gone now. Freeing
Removed nodes in range 0x00190000-0x001a0000 from ino #29634
inocache for ino #29634 is all gone now. Freeing
Removed nodes in range 0x00190000-0x001a0000 from ino #29635
Erase completed successfully at 0x00190000
MTD do_write_oneword(): Wacky!  Unable to decode failure status 
uWriteTimeout=1001  GUESSDELAYT=100
MTD do_write_oneword(): 0x00186524(0x00001985): 0x0000ffff 0x0000ffff 
0x0000ffff  0x0000ffff
Write3 of 48 bytes at 0x00186524 failed. returned -5, retlen 0
jffs2_write_dirent returning node at c3803970
Write4: Not marking the space at 0x00186524 as dirty because the flash 
driver returned retlen zero
raw: next_in_ino=c3803980, nextphys=00000000, flashoff=186524, totlen=30
Verifying erase at 0x00190000
Writing erased marker to block at 0x00190000
jffs2_erase_pending_blocks completed

In order to produce this I've run an app that keeps writing to flash, very 
small files, writing a temp then renaming it.
