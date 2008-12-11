Received: from mail-gx0-f14.google.com ([209.85.217.14])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAmRx-0004Mt-7E
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 14:23:33 +0000
Received: by gxk7 with SMTP id 7so464382gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Dec 2008 06:23:32 -0800 (PST)
Message-ID: <ecdd5ced0812110623g4c453931ma43cb0d9c6e079d1@mail.gmail.com>
Date: Thu, 11 Dec 2008 09:23:31 -0500
From: "Andrew Xiang" <andrewxiang@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>, anemo@mba.ocn.ne.jp,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org
Subject: power failure file corruption.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While I am reading a file(mounted as squahsfs) and writing a new file
in a jffs2 partition, power failure happened, the funny thing is that
the file I am only reading got corrupted. I don't care if the new file
is corrupt because power failure happened in the middle.

Below is a dump using jffs2dump, Is there a better utility that can
tell me more about the corruption?
         Inode      node at 0x01adaf0c, totlen 0x00001044, #ino
10, version 11192, isize  4714496, csize     4096, dsize     4096,
offset  4710400
         Inode      node at 0x01adbf50, totlen 0x00001044, #ino
10, version 11193, isize  4718592, csize     4096, dsize     4096,
offset  4714496
         Inode      node at 0x01adcf94, totlen 0x00001044, #ino
10, version 11194, isize  4722688, csize     4096, dsize     4096,
offset  4718592
         Inode      node at 0x01addfd8, totlen 0x00001044, #ino
10, version 11195, isize  4726784, csize     4096, dsize     4096,
offset  4722688
         Inode      node at 0x01adf01c, totlen 0x00000fe4, #ino
10, version 11196, isize  4730784, csize     4000, dsize     4000,
offset  4726784
         Unknown    node at 0x01ae0000, totlen 0x00000018
         Inode      node at 0x01ae0018, totlen 0x00000334, #ino
475, version   917, isize  3620864, csize      752, dsize      752,
offset  3620112
         Inode      node at 0x01ae034c, totlen 0x00000c30, #ino
460, version  3306, isize 12984320, csize     3052, dsize     3052,
offset  6878228
         Inode      node at 0x01ae0f7c, totlen 0x00001044, #ino
460, version  1747, isize  6885376, csize     4096, dsize     4096,
offset  6881280
         Inode      node at 0x01ae1fc0, totlen 0x00001044, #ino
460, version  1748, isize  6889472, csize     4096, dsize     4096,
offset  6885376
         Inode      node at 0x01ae3004, totlen 0x00001044, #ino
460, version  1749, isize  6893568, csize     4096, dsize     4096,
offset  6889472
         Inode      node at 0x01ae4048, totlen 0x00001044, #ino
460, version  1750, isize  6897664, csize     4096, dsize     4096,
offset  6893568
         Inode      node at 0x01ae508c, totlen 0x00001044, #ino
460, version  1751, isize  6901760, csize     4096, dsize     4096,
offset  6897664
Wrong data_crc at  0x01ae508c, 0x9b86b503 instead of 0xf30eb2c4
Empty space found from 0x01ae60d0 to 0x01b00000
         Unknown    node at 0x01b00000, totlen 0x00000018
         Inode      node at 0x01b00018, totlen 0x00000a9c, #ino
475, version   885, isize  3493888, csize     2648, dsize     2648,
offset  3491240
         Inode      node at 0x01b00ab4, totlen 0x00001044, #ino
475, version   886, isize  3497984, csize     4096, dsize     4096,
offset  3493888
         Inode      node at 0x01b01af8, totlen 0x00001044, #ino
475, version   887, isize  3502080, csize     4096, dsize     4096,
offset  3497984
         Inode      node at 0x01b02b3c, totlen 0x00001044, #ino
475, version   888, isize  3506176, csize     4096, dsize     4096,
offset  3502080
         Inode      node at 0x01b03b80, totlen 0x00001044, #ino
475, version   889, isize  3510272, csize     4096, dsize     4096,
offset  3506176
         Inode      node at 0x01b04bc4, totlen 0x00001044, #ino
475, version   890, isize  3514368, csize     4096, dsize     4096,
offset  3510272
         Inode      node at 0x01b05c08, totlen 0x00001044, #ino
475, version   891, isize  3518464, csize     4096, dsize     4096,
offset  3514368
         Inode      node at 0x01b06c4c, totlen 0x00001044, #ino
475, version   892, isize  3522560, csize     4096, dsize     4096,
offset  3518464
         Inode      node at 0x01b07c90, totlen 0x00001044, #ino
475, version   893, isize  3526656, csize     4096, dsize     4096,
offset  3522560
         Inode      node at 0x01b08cd4, totlen 0x00001044, #ino
475, version   894, isize  3530752, csize     4096, dsize     4096,
offset  3526656
         Inode      node at 0x01b09d18, totlen 0x00001044, #ino
475, version   895, isize  3534848, csize     4096, dsize     4096,
offset  3530752
