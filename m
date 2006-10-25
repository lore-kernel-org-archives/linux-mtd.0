Received: from wx-out-0506.google.com ([66.249.82.230])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gcinq-0006fv-1Z
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 09:28:23 -0400
Received: by wx-out-0506.google.com with SMTP id t11so135710wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Oct 2006 06:28:16 -0700 (PDT)
Message-ID: <aaebafb0610250621h1de9b06bg2b869149e13f0862@mail.gmail.com>
Date: Wed, 25 Oct 2006 18:51:00 +0530
From: "Babla Bunty" <babla.bunty@gmail.com>
To: jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Jffs2 Magic bitmask problem
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi all,

I always get following warning while mounting mtd partition:

Reading data from NAND FLASH without ECC is not recommended
Empty flash at 0x001f85b8 ends at 0x001f85f0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f85f0:
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f85f4:
0x0219 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f85fc:
0xaf8c instead

Following is the output of cat /proc/mtd:
dev:    size   erasesize  name
mtd0: 00030000 00004000 "NAND partition 0 : Bootloader"
mtd1: 001d0000 00004000 "NAND partition 1 : Kernel"
mtd2: 00200000 00004000 "NAND partition 2 : NAND Root"
mtd3: 07c00000 00004000 "NAND partition 3 : Romfs partition"

>From the above output,it is clear that erase size is 16K.
And i have erase the the mtd2 with following command:

flash_eraseall -j /dev/mtd/2

As jffs2 expects magic bitmask in first page of block.It seems jffs2
is trying to find magic bitmask in wrong page.
I am using 2.6.17 linux kernel .
Could somebody help ???
Regards,
Babla.
