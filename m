Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168vRI-0005c0-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 03:31:12 +0000
Received: from gromit.house (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with ESMTP id fAS3Zls15577
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 22:35:48 -0500
Subject: Using JFFS2 as root FS on CF
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 27 Nov 2001 22:42:36 -0500
Message-Id: <1006918956.9840.2.camel@gromit.house>
Mime-Version: 1.0
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

I'm going fishing.

I have a 16MB compact flash card divided into two partitions, /dev/hda1
and /dev/hda2. I formatted hda1 with ext2 to serve as /boot. hda2
contains a JFFS2 image and will be / ... once I get it to mount.

I've got jffs2, mtdblock and blkmtd compiled into the kernel.

Does someone have a recipe for booting a kernel (2.4.13 or 2.4.16) with
this type of setup and having it mount the jffs2 fs as /?


-M
