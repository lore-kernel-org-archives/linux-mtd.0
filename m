Received: from [203.196.146.243] (helo=Mistralsoftware.com)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g4tk-0006Y7-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 15:22:09 +0000
Received: from skumar [192.168.13.30]
	by mistralsoftware.com [192.168.10.12]
	with SMTP (MDaemon.PRO.v5.0.0.R)
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 21:04:34 +0530
Message-ID: <000901c2cc64$586adef0$1e0da8c0@skumar>
From: "Skumar" <skumar@mistralsoftware.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 4 Feb 2003 21:14:47 +0530
MIME-Version: 1.0
Subject: not able to build linux image
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,
i am working on linux 2.4.18 kernel
i have patched it with mtd-snapshot-20030121.
by running sp patchin.sh -j (path to linux kernel)

when i run bzImage i ma getting following error

 make zImage
scripts/split-include include/linux/autoconf.h include/config
gcc -D__KERNEL__ -I/home/skumar/remove/linux/include -Wall -Wstrict-prototyp
es -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i686   -DKBUILD_BASENAME=main -c -
o init/main.o init/main.c
In file included from /home/skumar/remove/linux/include/linux/fs.h:317,
                 from
/home/skumar/remove/linux/include/linux/capability.h:17,
                 from /home/skumar/remove/linux/include/linux/binfmts.h:5,
                 from /home/skumar/remove/linux/include/linux/sched.h:9,
                 from /home/skumar/remove/linux/include/linux/mm.h:4,
                 from /home/skumar/remove/linux/include/linux/slab.h:14,
                 from /home/skumar/remove/linux/include/linux/proc_fs.h:5,
                 from init/main.c:15:
/home/skumar/remove/linux/include/linux/jffs2_fs_i.h:22: field `fragtree'
has incomplete type
In file included from /home/skumar/remove/linux/include/linux/fs.h:693,
                 from
/home/skumar/remove/linux/include/linux/capability.h:17,
                 from /home/skumar/remove/linux/include/linux/binfmts.h:5,
                 from /home/skumar/remove/linux/include/linux/sched.h:9,
                 from /home/skumar/remove/linux/include/linux/mm.h:4,
                 from /home/skumar/remove/linux/include/linux/slab.h:14,
                 from /home/skumar/remove/linux/include/linux/proc_fs.h:5,
                 from init/main.c:15:
/home/skumar/remove/linux/include/linux/jffs2_fs_sb.h:8:29:
linux/workqueue.h: No such file or directory
In file included from /home/skumar/remove/linux/include/linux/fs.h:693,
                 from
/home/skumar/remove/linux/include/linux/capability.h:17,
                 from /home/skumar/remove/linux/include/linux/binfmts.h:5,
                 from /home/skumar/remove/linux/include/linux/sched.h:9,
                 from /home/skumar/remove/linux/include/linux/mm.h:4,
                 from /home/skumar/remove/linux/include/linux/slab.h:14,
                 from /home/skumar/remove/linux/include/linux/proc_fs.h:5,
                 from init/main.c:15:
/home/skumar/remove/linux/include/linux/jffs2_fs_sb.h:92: field `wbuf_task'
has incomplete type
make: *** [init/main.o] Error 1

why?

regards
sharath
