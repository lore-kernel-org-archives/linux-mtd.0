Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9VMk-0000zi-Km
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 03:33:43 +0000
Received: by gwaa12 with SMTP id a12so1986469gwa.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 20:33:41 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 May 2010 23:33:41 -0400
Message-ID: <m2y771cded01005042033w12660100y983c4710b68b8fa3@mail.gmail.com>
Subject: failue on compiling mtd tree
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I fetched latest code from mtd-2.6 tree. Now I met an issue in below.

  AS      arch/arm/boot/compressed/lib1funcs.o
  AS      arch/arm/boot/compressed/piggy.gzip.o
  LD      arch/arm/boot/compressed/vmlinux
`.LANCHOR0' referenced in section `.text' of
arch/arm/boot/compressed/misc.o: defined in discarded section `.data'
of arch/arm/boot/compressed/misc.o
`.LANCHOR0' referenced in section `.text' of
arch/arm/boot/compressed/misc.o: defined in discarded section `.data'
of arch/arm/boot/compressed/misc.o
make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
make: *** [zImage] Error 2

I remember this issue is fixed in arm tree. Could mtd-2.6 tree be
synced with latest code?

Thanks
Haojian
