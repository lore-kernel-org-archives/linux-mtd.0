Received: from c27.h061013091.is.net.tw ([61.13.91.27] helo=mail.thyme.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fsOZ-0005t3-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 00:56:36 +0000
Message-ID: <001201c1bf2b$c49e6b60$1902a8c0@infoserve.is.net.tw>
Reply-To: =?big5?B?p/Wr2K71?= <leehiram@giga.net.tw>
From: =?big5?B?p/Wr2K71?= <hiram@thyme.com.tw>
To: <linux-mtd@lists.infradead.org>
Subject: I need your help .
Date: Wed, 27 Feb 2002 09:12:04 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
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

Hi ..
Mr. Woodhouse .
My name is HiramLee .
I living in Taiwan .
I read your data on  http://www.linux-mtd.infradead.org/doc2000.html this
web side .
And I tried to put the disk-on-chip function in my linux kernel .
That is my process below .
1. cd /usr/src/linux
2. make menuconfig
3. Turn on "NTFL support " ,"M-Systems Disk-On-Chip 2000 and Millennium"
    ," Loopback device support " and " RAM disk support " in the kernel (not
a module)
   and what I need ...

4. make dep
5. make clean
6. make bzImage
7. make modules
8. make modules_install
9. copy the bzImage file to the /boot then setup the lilo and reboot
10.  mknod /dev/fla b 62 0   (make a doc device node)

The Kernel is working very well but there is a boot message show up about
the disk-on-chip when loading the kernel .
"DiskOnChip Millennium found at address 0xD8000
  Flash chips found : Manufacturer ID:98,Chip ID:E6 (Toshiba TC58V64AFT/DC)
 1 flach chips found. Total DiskOnChip size:8MiB"
"M-Systems NAND Flash Translation Layer Driver .(c) 1999 MVHI
$Id: nftlcore.c ,v 1.73 2001/06/09 01:09:43 dwmw2 Exp$
Sorry, we don,t support UnitSizeFactor of !=1 yet
Sorry, we don,t support UnitSizeFactor of !=1 yet
Could not find valid boot record
Could not mount NFTL device"

Could you answer me what this message mean ??
I try on kernel-2.4.2 and 2.4.8 version thay both have this problem .
I can't  mount my disk on chip device (Computer say "Unable to open device
/dev/fla")
Could you teach me what can I do .
And my disk on chip could work .
                                  Please    Thank you very much

                                                                   HiramLee
