Received: from rwcrmhc11.comcast.net ([204.127.198.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFmmh-0001nd-Jo
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 05:22:59 +0100
From: "Bob Coggeshall" <rdcjr@cogwheel.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 19 Apr 2004 21:22:56 -0700
Message-ID: <GLEEJIHFPNJCEDMIAPLKKEFGEAAA.rdcjr@cogwheel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mtdchar.c:509: too few arguments to function `devfs_mk_dir'
Reply-To: rdcjr@cogwheel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was working with mtd-snapshot-20040329 w/no problems.

just checked mtd out using cvs (it's monday, 19-apr)

Now I get this.

This is with linux 2.4.22-pre8 with DEV_FS turned on
(I think it has something to do with it).

(make modules)

ppc_8xx-gcc -D__KERNEL__ -I/home/coggs/skyl/projects/ep852-misc/kernels/ep-linux-kernel-feb2004/include -Wall -Wstrict-prototypes -W
no-trigraphs -O2 -f
no-strict-aliasing -fno-common -g -ggdb -fno-schedule-insns -fno-schedule-insns2 -fomit-frame-pointer -I/home/coggs/skyl/projects/ep
852-misc/kernels/ep
-linux-kernel-feb2004/arch/ppc -fsigned-char -msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring -DMODULE  -nostdin
c -iwithprefix incl
ude -I /home/opt/embedded/tools/usr/lib/gcc-lib/ppc-linux/2.95.4/include -DKBUILD_BASENAME=mtdchar  -c -o mtdchar.o mtdchar.c
mtdchar.c: In function `mtd_notify_add':
mtdchar.c:480: warning: implicit declaration of function `devfs_mk_cdev'
mtdchar.c: In function `mtd_notify_remove':
mtdchar.c:494: warning: implicit declaration of function `devfs_remove'
mtdchar.c: In function `init_mtdchar':
mtdchar.c:509: warning: passing arg 1 of `devfs_mk_dir' from incompatible pointer type
mtdchar.c:509: too few arguments to function `devfs_mk_dir'

Bob C.
rdcjr at cogwheel dot com
