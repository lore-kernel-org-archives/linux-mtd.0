Received: from dns.vivotek.com ([211.21.25.250] helo=vivotek2.vivotek.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GElfR-0004Wz-Pf
	for linux-mtd@lists.infradead.org; Sun, 20 Aug 2006 12:40:39 +0100
Received: from [127.0.0.1] ([192.168.2.227]) (authenticated bits=0)
	by vivotek2.vivotek.com (8.13.1/8.13.1) with ESMTP id k6LAPuVE016941
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2006 18:25:56 +0800
Message-ID: <44C0AC2D.9090408@csie.nctu.edu.tw>
From: Rey Cheng <rhjeng@csie.nctu.edu.tw>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ALLFF blocks seems to be added to erase pending list at booting-time
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sun, 20 Aug 2006 11:40:41 -0000

Hi all,

I have two machine.

In machine #1,
I use mkfs.jffs2 to create its flash file system image.
# mkfs.jffs2 -r /mnt/flash -o jffs2.img

To burn the image on machine #2,
I erase machine #2's flash file system.
And write the image on machine #2.

I use mtd_debug to erase the flash, the flash is 1MB and the image is
about 700K.
# mtd_debug erase /dev/mtd1 0 0x100000
# mtd_debug write /dev/mtd1 0 705136 ./jffs2.img

Then I reboot the system.
Because I erased the entire flash memory, and only 700K bytes were written.
The "ALLFF" blocks are added to erase pending list, and jffs2 tries to
mark the blocks clean at boot time.
But I put the system init scripts in the flash file system.
Therefore the "erasing" and "reading" occurs in the same time.
Looks like a race condition.

I solve the problem by umount and mount the flash file system after
witting image on machine #2.
Then the "ALLFF" blocks will be erased before rebooting the system.

Is there any other solution?
Thank you.

Rey.
