Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165WFa-0006C2-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 18:01:02 +0000
Received: from gromit.house (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with ESMTP id fAII6Hs27405
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 13:06:18 -0500
Subject: second "mount" hangs
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 18 Nov 2001 13:11:34 -0500
Message-Id: <1006107094.1391.46.camel@gromit.house>
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

Hi,

I mounted a JFFS2 filesystem stored on a 16MB partition on a zip disk,
using mtdblock and blktmd. I accidentally typed "mount /mnt/flash"
rather than "umount /mnt/flash", and "mount" is now hung. Unkillable.
/mnt/flash is still mounted and usable, but not unmountable. It seems I
will have to reboot to umount the filesystem. I can't even eject the zip
disk.

-Michael
