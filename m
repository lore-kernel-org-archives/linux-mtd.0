Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtRol-0007rI-5E
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 10:05:05 -0400
Date: Sat, 7 Aug 2004 15:04:58 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Linux Kernel List <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
Message-ID: <20040807150458.E2805@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: 
Subject: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not sure exactly what caused this, but it happened while logging in
(after fixing the previous two reported problems - the first by backing
out the last change to redboot.c and the second by commenting out
ri->usercompr in fs/jffs2/read.c.)

Slab corruption: start=c1e39474, len=64
Redzone: 0x5a2cf071/0x5a2cf071.
Last user: [<c032ca10>](cfi_intelext_erase_varsize+0x58/0x64)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 4f 6b
Prev obj: start=c1e39428, len=64
Redzone: 0x5a2cf071/0x5a2cf071.
Last user: [<c02c767c>](jffs2_garbage_collect_deletion_dirent+0x80/0x8c)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
Next obj: start=c1e394c0, len=64
Redzone: 0x170fc2a5/0x170fc2a5.
Last user: [<c03514f8>](neigh_hh_init+0x64/0x11c)
000: 00 00 00 00 03 00 00 00 08 00 00 00 0e 00 00 00
010: 00 b0 34 c0 00 00 08 00 2b 95 1d 7b 00 c0 1b 00

Due to tail call optimisation, its difficult to work out exactly what's
going on, but the first seems to be a kfree call from the erase callback
(possibly jffs2_erase_callback).  The second function is the call to
jffs2_free_full_dirent() in jffs2_garbage_collect_deletion_dirent().

Any ideas?  I haven't been able to reproduce (presumably because the
erase succeeded, and we didn't need to re-erase again.)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
