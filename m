Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgOQ5-00025c-Bs
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 19:44:38 +0000
Received: by fxm26 with SMTP id 26so416746fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Aug 2009 12:44:31 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 26 Aug 2009 22:44:31 +0300
Message-ID: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
Subject: Creating an ext3 partition on an mtd device
From: Mark Ryden <markryde@gmail.com>
To: linux-mtd@lists.infradead.org
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

Hello,

I want to create an ext2 partition on an mtd device.

The is the output of cat /proc/mtd
dev:    size   erasesize  name

 mtd0: 00100000 00040000 "UBoot"
 mtd1: 00400000 00040000 "UImage"
 mtd2: 7fb00000 00040000 "Root"
 mtd3: 00800000 00010000 "spi0.0"


 I tried to create a partition with fdisk /dev/mtdblock2
 The device is /dev/mtdblock2p1
 but: mkfs.ext3 /dev/mtdblock2p1  fails

 What should I do ? Is it right in this case to use fdisk at all ?

Regards,
Mark Ryden
