Received: from mlbmx2.corp.harris.com ([137.237.90.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164cBE-0000fF-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 06:08:48 +0000
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921BCED0@ranmx1.ran.harris.com>
From: "Walser, Martin" <mwalser@harris.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: not able to do a mke2fs on a doc
Date: Fri, 16 Nov 2001 01:17:18 -0500
MIME-Version: 1.0
Content-Type: text/plain
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

I've successfully installed a DOC (16MB).

fdisk now shows a partition table

Disk /dev/nftla: 16 heads, 2 sectors, 1020 cylinders
Units = cylinders of 32 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1      1020     16319   83  Linux


But when I try to do a mke2fs /dev/nftla1 the system hangs.

I also tried a mkdosfs /dev/nftla1 and this works.


Any ideas?

regards
Martin
