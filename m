Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MByb-0000T1-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 18:52:57 +0000
Date: Wed, 11 Dec 2002 20:23:02 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: <linux-mtd@lists.infradead.org>
cc: Jochen Schaeuble <psionic@psionic.de>
Subject: slram and buffer cache
Message-ID: <Pine.LNX.4.31.0212112004250.12431-100000@www.optixsoft.de>
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

Hi,

I have a custom board with 32MB SDRAM, 16MB Flash and 512K SRAM here. I
use the slram driver to access the SRAM (which isn't used otherwise by
the kernel). I created an 512K ext2 fs image and copied it to the SRAM
using an mtd char dev. I was able to mount this SRAM area as a mtd block
device (using mtdblock_ro) and read/write files to the ext2 fs.

My problem is the buffer cache for the block devices. I do not want
write operations to the SRAM being delayed. What can I do to avoid that
? I searched for some hours today but to no avail.

[maybe OT for this list]
How is this problem solved for "normal" ram disks ?

Regards
Tobias
