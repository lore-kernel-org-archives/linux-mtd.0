Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGUvo-0000cF-KP
	for linux-mtd@lists.infradead.org; Sun, 01 May 2011 11:35:21 +0000
Received: by wwb39 with SMTP id 39so3915615wwb.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 May 2011 04:35:18 -0700 (PDT)
Message-ID: <4DBD4572.5040508@gmail.com>
Date: Sun, 01 May 2011 13:35:14 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: help request, jffs2 fs files get lost
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

i am looking for some help on an issue with jffs2: i can create jffs2 fs, mount, store edit/write some files, unmount, 
but in a next mount i find no more files/dirs.

MTD probe detect correctly my flash, the chip allows erase sectors of 4KB, or blocks of 64KB. MTD shows correctly a 0x1000 erase size.

/ # / # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00010000 00001000 "Colilo (64K)"
mtd1: 002f0000 00001000 "Kernel+ROMfs (3008K)"
mtd2: 00100000 00001000 "JFFS2 (1024K)"  <--- want to use this partition only as jffs2 to store non volatile data
mtd3: 0009d000 00001000 "ROMfs"


So from uClinux, i try to prepare the jffs2 fs:

# eraseall /dev/mtd2
erased 1024 Kibyte @ 0 -- 100% complete.

cat /dev/mtd2    i see the flash has been cleared

then i create a folder "backup" in /var with some files and try to crete the jffs2 fs:

mkfs.jffs2 -d backup -o jffs2.img

cp /deV/mtd2 jffs2.img

Then i just mount/umount the device, but i get often the issue decribed.

Any help is really appreciated.

many thanks
angelo
