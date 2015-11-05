Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuPQV-0006Gd-JW
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 18:38:24 +0000
Received: from rus19.rsint.net ([10.0.33.19])
 by amu315.rsint.net (Totemo SMTP Server) with SMTP ID 87
 for <linux-mtd@lists.infradead.org>;
 Thu, 5 Nov 2015 19:38:40 +0100 (CET)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: jffs2: Excess summary entries
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF1A12855F.4E78FEFE-ONC1257EF4.004CEFDC-C1257EF4.00663F07@rohde-schwarz.com>
Date: Thu, 5 Nov 2015 19:36:47 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We ran into a problem with jffs2 where the filesystem became unusable 
after some specific MTD failures; summary was enabled, write buffering was 
disabled:

1. For some reason, mtd_writev() returned -EINTR and *retlen == 0. No 
INODE data was written to flash, but jffs2_flash_direct_writev() still 
added a summary entry, by jffs2_sum_add_kvec(). Actually, this happened 
twice in a row:

        jffs2: Write of 4164 bytes at 0x00ec5b88 failed. returned -4, 
retlen 0
        jffs2: Not marking the space at 0x00ec5b88 as dirty because the 
flash driver returned retlen zero
        jffs2: Write of 4164 bytes at 0x00ec5b88 failed. returned -4, 
retlen 0
        jffs2: Not marking the space at 0x00ec5b88 as dirty because the 
flash driver returned retlen zero

2. When rebooting after the summary data was written to flash (including 
the two excess entries), we got the following messages:

        jffs2: error: (79) jffs2_link_node_ref: Adding new ref c3048d18 at 
(0x00ec5b88-0x00ec6bcc) not immediately after previous 
(0x00ec5b88-0x00ec5b88)
        jffs2: error: (79) jffs2_link_node_ref: Adding new ref c3048d20 at 
(0x00ec5b88-0x00ec6000) not immediately after previous 
(0x00ec5b88-0x00ec5b88)
        ...
        jffs2: warning: (79) jffs2_sum_scan_sumnode: Free size 0xffffdf78 
bytes in eraseblock @0x00ec0000 with summary?

        jffs2: Checked all inodes but still 0x2088 bytes of unchecked 
space?
        jffs2: No space for garbage collection. Aborting GC thread

The excess entries added up to "unchecked space", so that 
jffs2_garbage_collect_pass() returned -ENOSPC.

3. Since garbage collection was off, the flash filled up over time until 
the filesystem could no longer be modified (can't add or write to files, 
can't even delete files -- "No space left on device"). Basically, we were 
bricked.

Here are the solutions I have considered so far:

The minimal solution would be to check *retlen == 0 in 
jffs2_flash_direct_writev() and jffs2_flash_direct_write() before running 
jffs2_sum_add_kvec().

        if (jffs2_sum_active() && *retlen) {
                ...
                res = jffs2_sum_add_kvec(...)
                ...
        }

The general failure case, though, is (ret != 0 || *retlen != len), where 
'ret' is the return code of mtd_writev(), and 'len' is the data size to be 
written. When write buffering is enabled, jffs2_flash_writev() in wbuf.c 
skips the summary entry in this case; perhaps we should do this in 
writev.c as well?

        if (jffs2_sum_active() && !ret && *retlen == len) {
                ...
                res = jffs2_sum_add_kvec(...)
                ...
        }

I ran some quick tests, simulating write failures, and it seems that 
adding the summary entry doesn't harm when *retlen != 0 [so the minimal 
solution would suffice]. This is because the calling function will reserve 
the node space, marking it as dirty, and there is no confusion about 
unchecked space.

On the other hand, running the same quick tests _without_ adding the 
summary entry didn't seem to harm either [so the general solution would 
work as well]. It is entirely possible that I have overlooked something, 
though.

Any opinions on that? When in doubt, I would provide a patch for the 
minimal solution, changing as little as possible. However, it may make 
sense to go for the general solution to be consistent with write 
buffering.

Best regards,
Thomas Betker
