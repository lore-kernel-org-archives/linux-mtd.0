Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJhh7-0003Bh-4X
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 11:35:17 +0000
Received: by mail-wg0-f45.google.com with SMTP id x12so6184840wgg.28
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 04:34:55 -0700 (PDT)
Received: from [192.168.0.2]
 (host223-232-dynamic.41-79-r.retail.telecomitalia.it. [79.41.232.223])
 by mx.google.com with ESMTPSA id cx5sm49748840wjb.8.2014.08.19.04.28.26
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Tue, 19 Aug 2014 04:28:26 -0700 (PDT)
Message-ID: <53F334D9.5030902@gmail.com>
Date: Tue, 19 Aug 2014 13:28:25 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI, no sub-pages support
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

i am running UBI/UBIFS on a TI AM1808 / OPAM-L cpu, MT29F1G08 NAND and
kernel 3.5.1.

MT29F1G08 has 128KB pages, and 2048B PEB's.

After first attempt to create UBI/UBIFS image using 512B sub-pages, i
had several UBI errors, so i realized sub-pages are not supported in the
OMAP-L driver at this kernel version (seems to start to be supported
form 3.10.x).

So i prepare the image from buildroot without subpage now, with these
settings:

      [ ] jffs2 root filesystem
      [*] ubifs root filesystem
      (0x1f000) UBI logical erase block size
      (0x800) UBI minimum I/O size
      (1024) Maximum LEB count
         ubifs runtime compression (gzip)  --->
         Compression method (no compression)  --->
      [*]   Embed into an UBI image
      (0x20000) UBI physical erase block size
      (0)     UBI sub-page size

buildroot/output/host/usr/sbin/mkfs.ubifs --space-fixup -d
buildroot/output/target -e 0x1f000 -c 1024 -m 0x800 -x zlib -o
buildroot/output/images/rootfs.ubifs


buildroot/output/host/usr/sbin/ubinize -o
buildroot/output/images/rootfs.ubi -m 0x800 -p 0x20000 ubinize.cfg

I executed both mtd-utils "runtest.sh" and integck, and had no issues.
Could you maybe confirm this settings are correct and i am not going
trough issues using the fs ?

Another question is: is there a UBI performance loss using pages as
minimal I/O (no subpages) or i can consider it insignificant ?

Many Thanks
Angelo Dureghello
