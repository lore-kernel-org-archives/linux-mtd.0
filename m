Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VYYw-0004gu-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 14:49:10 +0000
Message-ID: <3E199E9D.8A02D98F@imc-berlin.de>
Date: Mon, 06 Jan 2003 16:19:57 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Compile error in mtdblock-core...
Content-Type: text/plain; charset=us-ascii
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

Hi there,

first Happy New Year!

Second:

I just tried to compile the latest linuxppc_2_4_devel patched with the recent
CVS code of MTD using ppc's TQM860L_config.

But I get compiler errors:

ppc_8xx-gcc -D__KERNEL__
-I/opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer
-I/opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/arch/ppc
-fsigned-char -msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple
-mstring   -nostdinc -I /opt/ELDK/usr/lib/gcc-lib/ppc-linux/2.95.3/include
-DKBUILD_BASENAME=mtdblock_core  -c -o mtdblock-core.o mtdblock-core.c
In file included from
/opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blk.h:4,
                 from mtdblock-core.c:18:
/opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blkdev.h:147:
parse error before `struct'
make[3]: *** [mtdblock-core.o] Fehler 1

I can't see where this "parse error" is coming from!

Any ideas?

Thanks,

Steven
