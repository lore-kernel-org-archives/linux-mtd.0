Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtR5m-0007ew-SF
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 09:18:35 -0400
Date: Sat, 7 Aug 2004 14:18:29 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Linux Kernel List <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
Message-ID: <20040807141829.D2805@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: 
Subject: [BUG] 2.6.8-rc3 jffs2 unable to read filesystems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following two messages sum up the problem:

JFFS2 compression type 0x5a06 not avaiable.
Error: jffs2_decompress returned -5

It appears that a jffs2 change committed on July 15th has caused recent
2.6.8-rc kernels to be incompatible with jffs2 filesystems modified by
previous kernel versions.

The "new format" jffs2 filesystem uses both "compr" and "usercompr"
of the jffs2_raw_inode structure, whereas previous implementations
left "usercompr" uninitialised and thus contains random data.

This can be seen by tracing through the code from jffs2_alloc_raw_inode()
and noticing that previous implementations do not initialise this field -
AFAICS kmem_cache_alloc() does not guarantee that memory returned by
this function will be initialised.

Therefore, recent 2.6.8-rc kernels must _NOT_ use this field if they
wish to remain compatible with existing jffs2 filesystems.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
