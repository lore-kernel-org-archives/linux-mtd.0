From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Thu, 28 Jul 2005 18:20:26 +0200
Message-ID: <000501c59390$435ae050$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: 
Subject: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have an AM29LV160DB flash cip :
	snds100map flash device: 200000 at 1000000
	Search for id:(01 2249) interleave(1) type(2)
	Found: AMD AM29LV160DB
	Physically mapped flash of SNDS100: Found 1 x16 devices at 0x0 in
16-bit mode
	number of JEDEC chips: 1
	Creating 6 MTD partitions on "Physically mapped flash of SNDS100":
	0x00000000-0x00010000 : "boot loader (64K)"
	0x00010000-0x00020000 : "boot data (64K)"
	0x00020000-0x000e0000 : "kernel (768K)"
	0x000e0000-0x00100000 : "user data 00 (128K)"
	0x00100000-0x001a0000 : "root fs (512K)"
	0x001a0000-0x00200000 : "user Jffs2 (512K)"


After the mount command :  />mount -t jffs2 /dev/mtdblock5 /mnt

I receive the following msg:

	Newly-erased block contained wod xxxx at offset xxxx
	Newly-erased block contained wod xxxx at offset xxxx

And the command />df tell me that all the blocks of the partition are =
used :
0 available.

I tryed to compile "flash_eraseall" under my uClinux-2.4.29, but I did't
have success.

I cleared the flash using my Flash programmer, but the situation is the
same.

Can someone help me on finding the cause of this messages?

Thanks!

	Massimo.
