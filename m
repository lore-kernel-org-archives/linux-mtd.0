Received: from ca-ol-bordeaux-5-245.abo.wanadoo.fr ([62.161.108.245])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kMPA-0004Cn-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 10:15:28 +0100
Received: from openwide.fr (IDENT:pierre@localhost.localdomain [127.0.0.1])
	by ca-ol-bordeaux-5-245.abo.wanadoo.fr (8.9.3/8.9.3) with ESMTP id LAA28275
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 11:24:01 +0200
Message-ID: <3BAB0731.CD452A12@openwide.fr>
Date: Fri, 21 Sep 2001 11:24:01 +0200
From: Pierre Ficheux <pierre.ficheux@openwide.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Pb compiling MTD on 2.4.9, RH-7.1
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

	Hi,

	I've tried to compile MTD support in 2.4.9 kernel on a RH-7.1
distribution and I got strange compilation errors:

make -C chips modules
make[3]: Entering directory `/usr/src/linux-2.4.9/drivers/mtd/chips'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
-fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2
-march=i686 -DMODULE -DMODVERSIONS -include
/usr/src/linux-2.4.9/include/linux/modversions.h   -c -o amd_flash.o
amd_flash.c
amd_flash.c: In function `read_one_chip':
amd_flash.c:642: `do_softirq_Rf0a529b7' undeclared (first use in this
function)
amd_flash.c:642: (Each undeclared identifier is reported only once
amd_flash.c:642: for each function it appears in.)
amd_flash.c: In function `write_one_word':
amd_flash.c:742: `do_softirq_Rf0a529b7' undeclared (first use in this
function)
amd_flash.c: In function `erase_one_block':
amd_flash.c:939: `do_softirq_Rf0a529b7' undeclared (first use in this
function)
amd_flash.c: In function `amd_flash_sync':
amd_flash.c:1184: `do_softirq_Rf0a529b7' undeclared (first use in this
function)
make[3]: *** [amd_flash.o] Error 1

	I use RH-7.1 gcc (gcc version 2.96 20000731 (Red Hat Linux 7.1
2.96-81). 

	Any idea?

	Thx by advance.

-- 
Pierre FICHEUX -/- CTO OpenWide, France -\- pierre.ficheux@openwide.fr
				         http://www.ficheux.com
					 http://www.emulateur-xtel.org
More fun, more freedom, less Micro$oft
