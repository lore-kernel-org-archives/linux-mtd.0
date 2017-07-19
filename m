Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXqL3-0000uv-Kr
 for linux-mtd@lists.infradead.org; Wed, 19 Jul 2017 14:52:35 +0000
Received: by mail-oi0-x233.google.com with SMTP id 191so2815626oii.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2017 07:52:13 -0700 (PDT)
MIME-Version: 1.0
From: Pankaj Pandey <pankaj.embedded@gmail.com>
Date: Wed, 19 Jul 2017 20:21:51 +0530
Message-ID: <CAOdCjQvoL9Dezquv09FNy-GTpumVPbXB8yf7-VQ7E0tyno3pTA@mail.gmail.com>
Subject: nand on-die ecc for jffs2
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found below mentioned patches to support on-die ecc for micron nand
flash which are working fine for me.

Thomas Petazzoni (5):
  dt-bindings: mtd: document new "on-die" nand-ecc-mode
  mtd: nand: add core support for on-die ECC
  mtd: nand: export nand_{read,write}_page_raw()
  mtd: nand: add support for Micron on-die ECC
  mtd: nand: fsmc_nand: handle on-die ECC case

But regarding on-die ecc for jffs2 rootfilesystem I am getting
below error when trying to untaring the rootfs on mounted nand flash
mtd partition.

[  120.103222] jffs2: mtd->read(0x44 bytes from 0x8c80030) returned ECC error
[  120.118055] jffs2: mtd->read(0x22 bytes from 0x8c80074) returned ECC error

Steps I have followed to format and untaring the rootfs.

# flash_erase /dev/mtd11 0 0
Erasing 128 Kibyte @ b7e0000 -- 100 % complete

# mount -t jffs2 /dev/mtdblock11 /media
# cd /media
# cp /home/root/rootfs.tar.gz .
# tar -xvzf rootfs.tar.gz

Please suggest any pointer to fix this issue.  TIA !!

Regards,
Pankaj Pandey
