Received: from proxy.ipv6.6wind.com ([194.250.197.211] helo=proxy.6wind.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuoPB-0001s0-3n
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2004 04:24:18 -0400
Received: from eagle.6wind.com (givenchy.6wind.com [212.234.238.114])
	by proxy.6wind.com (Postfix) with ESMTP id 30E45803
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Aug 2004 10:24:13 +0200 (CEST)
Received: from [127.0.0.1] (unknown [10.16.0.192])
	by eagle.6wind.com (Postfix) with ESMTP id 192E4228
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Aug 2004 10:24:13 +0200 (CEST)
Message-ID: <4119D7B0.8080105@6wind.com>
Date: Wed, 11 Aug 2004 10:24:16 +0200
From: Yann Rapaport <yann.rapaport@6wind.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 and NAND smartmedia card
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I am currently working on installing a JFFS2 filesystem on an ARM 
system, using a Samsung NAND Smartmedia device and 2.4.20 kernel from 
montavista 3.1.

I succeed in mouting the partition and installing my filesystem in it 
using the following commands:
root:/# mount -t jffs2 /dev/mtdblock1 /mnt
root:/# cp -r /usr/admin/* /mnt

My aim is now to create my filesystem using mkfs.jffs2. When mounting 
the partition, I get ECC, CRC and magic bitmask errors.
root:/# mkfs.jffs2 -r /usr/admin -s 512 -e 16384 -b -o /dev/mtd1
root:/# mount -t jffs2 /dev/mtdblock1 /mnt
mtd->read(0x400 bytes from 0x0) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0xe001, 0x0000002c) 
has invalid CRC 0xa026b584 (calculated 0xa026b184)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 
0xa026 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 
0x4119 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 
0x0404 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 
0xe158 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 
0x5121 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000200: 
0x0801 instead
etc.

It seems that the OOB data is damaged...
Do you have any idea of what happens?

Thanks in advance!

-- 
Yann
