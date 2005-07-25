From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Mon, 25 Jul 2005 14:42:25 +0200
Message-ID: <000001c59116$4f4e80a0$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Jffs2 space problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

	I have a problem with my jffs2 partition.
I'm using mtd5 (size = 64 x 8 = 512kb).
I eraseall the partition but if I do the df command I see that it is 100%
used ...?!?!?

/>
/> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00010000 00008000 "boot loader (64K)"
mtd1: 00010000 00010000 "boot data (64K)"
mtd2: 000c0000 00010000 "kernel (768K)"
mtd3: 00020000 00010000 "user data 00 (128K)"
mtd4: 00080000 00010000 "root fs (512K)"
mtd5: 00080000 00010000 "user Jffs2 (512K)"
/> eraseall /dev/mtd5
MTD_open
MTD_ioctl
Erasing 64 Kibyte @ 0 --  0 % complete.MTD_ioctl
Erasing 64 Kibyte @ 10000 -- 12 % complete.MTD_ioctl
Erasing 64 Kibyte @ 20000 -- 25 % complete.MTD_ioctl
Erasing 64 Kibyte @ 30000 -- 37 % complete.MTD_ioctl
Erasing 64 Kibyte @ 40000 -- 50 % complete.MTD_ioctl
Erasing 64 Kibyte @ 50000 -- 62 % complete.MTD_ioctl
Erasing 64 Kibyte @ 60000 -- 75 % complete.MTD_ioctl
Erasing 64 Kibyte @ 70000 -- 87 % complete.MTD_ioctl
Erased 512 Kibyte @ 0 -- 100% complete.
MTD_close
/> df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rom4                  512       512         0 100% /
/dev/ram0                  987         7       980   1% /var
/dev/mtdblock5             512       512         0 100% /mnt
/>



Any Help?

	Thanks!

Massimo.
