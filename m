Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOVj8-0006LR-Tk
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 12:58:51 +0000
Received: by iwn3 with SMTP id 3so771464iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jun 2010 05:58:50 -0700 (PDT)
Subject: UBIFS mount failure on NOR flash
From: Philby John <pjohn@mvista.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 15 Jun 2010 18:29:39 +0530
Message-Id: <1276606779.20001.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: pjohn@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Platform: Cavium CN5020
Filesystem: UBIFS
Flash Type: NOR
Flash Size: 8MB
Partition Details Kernel Log:
Creating 2 MTD partitions on "phys_mapped_flash":
0x000000000000-0x000000700000 : "Octeon BOOT partition"
0x000000700000-0x000000800000 : "Octeon test partition"


$mount -t ubifs ubi1:test /mnt/nor
UBIFS error (pid 851): init_constants_early: too few LEBs (12), min. is 17
mount: wrong fs type, bad option, bad superblock on ubi1:test,
       missing codepage or helper program, or other error
       (for several filesystems (e.g. nfs, cifs) you might
       need a /sbin/mount.<type> helper program)
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


But JFFS2 is able to mount the same partition flawlessly. Shouldn't
UBIFS be able to do the same? What I would like to know is, is this the
expected behavior or a bug? If its a bug I would like to look into it.

Thanks and regards,
Philby
