Received: from virtualro.ic.ro ([194.102.78.138])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JZOm-0004vi-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 12:40:20 +0100
Received: from localhost (jani@localhost)
	by virtualro.ic.ro (8.9.3/8.9.3) with ESMTP id OAA12006
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2001 14:46:59 +0300
Date: Mon, 9 Jul 2001 14:46:59 +0300 (EEST)
From: Jani Monoses <jani@astechnix.ro>
To: linux-mtd@lists.infradead.org
Subject: jffs min_free_space
Message-ID: <Pine.LNX.4.10.10107091439240.12001-100000@virtualro.ic.ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

if minfreespace is erase_size <<2 does that mean that if the sector
size in the flash is 128K the fs must necessarily be larger that 512K?
I had a 512k fs and it wouldn-t create new file (ENOSP) only when I
changed minfreespace to two sectors size.

Another Q:
I grepped through the mtd sources and I didn-t find a place where flash
blocks are unlocked explicitly.mtd->unlock is only called AFAICT in
mtdchar but nowhere in mtdblock.So both jffs and jffs2 give EROFS when
trying to write.I made ugly hacks to work around it but I was hoping there
is a cleaner way andI overlooked something.The flash chips is 28FxxxC3
so it boots with all blocks software locked.

Thanks,
Jani.
