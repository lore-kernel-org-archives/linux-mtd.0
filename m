Received: from chello080110132030.102.11.vie.surfer.at
	([80.110.132.30] helo=mail.hurricane.at ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0Oy7-0003hN-Su
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 17:55:12 +0000
Date: Mon, 8 Mar 2004 18:52:07 +0100 (CET)
From: Matthias Gorjup <mgorjup@norik.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.10.10403081736410.3052-100000@mail.hurricane.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Compiling kernel 2.4.20 with the latest snapshot of mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have troubles crosscompiling compiling kernel 2.4.20 with the latest
snapshot of mtd,
taken
from the mtd CVS repository. I apply the patch by invoking script
sh patchin.sh /home/gorjup/temp/linux but I get errors when compiling.
Here are the errors:

compr_zlib.c:64: parse error before `jffs2_zlib_init'
compr_zlib.c:65: warning: return-type defaults to `int'
compr_zlib.c: In function `jffs2_zlib_init':
compr_zlib.c:66: warning: implicit declaration of function `vmalloc'
compr_zlib.c:66: warning: assignment makes pointer from integer without a
cast
compr_zlib.c:72: warning: assignment makes pointer from integer without a
cast
compr_zlib.c:75: warning: implicit declaration of function `vfree'
make[3]: *** [compr_zlib.o] Error 1
make[3]: Leaving directory
`/home/gorjup/temp/linux-2.4.20/fs/jffs2'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory
`/home/gorjup/temp/linux-2.4.20/fs/jffs2'
make[1]: *** [_subdir_jffs2] Error 2
make[1]: Leaving directory
`/home/gorjup/tempB/linux-2.4.20/fs'
make: *** [_dir_fs] Error 2


Any suggestion welcome...

Matthias Gorjup
Norik Systems
www.norik.com
