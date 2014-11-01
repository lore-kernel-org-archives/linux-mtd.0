Received: from mail-la0-f53.google.com ([209.85.215.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkS5n-0002tR-3E
 for linux-mtd@lists.infradead.org; Sat, 01 Nov 2014 06:23:19 +0000
Received: by mail-la0-f53.google.com with SMTP id mc6so7148077lab.26
 for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2014 23:22:54 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 1 Nov 2014 11:52:54 +0530
Message-ID: <CAE4N0aPLgMoJ+S6DrykPRJTGAfNg+5Etdz6USywrvZztBfi7Xw@mail.gmail.com>
Subject: JFFS2 Error: File Partitally or remove after remount partition
From: Shailesh Panchal <shailesh.panchal@matrixcomsec.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

I am facing problem related to JFFS2 file system. In system has two jffs2
partition one mount as rootfs and second one as data.

When I put and file (size is 10MB)in rootfs or data partition using FTP and
reboot the system. In next reboot file size change (3MB) etc. If i write
small file and reboot  the system the file is not available in next power
on.

If i runt the MTD test driver on board it get success.

Can give me any input for that. waiting for replay

Linux kernel version is 3.2.26.
Custom board using MIndspeed processor. NAND Flash 256 MB.


Regards,
shailesh
