From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Wed, 12 Mar 2003 02:30:10 -0500
Subject: Problems building contents of snapshot 3-9-2003
Message-ID: <001b01c2e869$37224c80$bda6580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello from Gregg C Levine
Well, I am now closer to my working problem's solution. But now a new
problem, or problems has surfaced. And here's a C&P of the problems:
Script started on Tue Mar 11 23:06:53 2003
root at drwho4:/usr/src/mtd# make

make -C /usr/src/linux-2.4.20 SUBDIRS=3D/usr/src/mtd/kernel modules

make[1]: Entering directory `/usr/src/linux-2.4.20'

make -C  /usr/src/mtd/kernel CFLAGS=3D"-D__KERNEL__
-I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -pipe
-mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE -DMODVERSIONS
-include /usr/src/linux-2.4.20/include/linux/modversions.h"
MAKING_MODULES=3D1 modules

make[2]: Entering directory `/usr/src/mtd/kernel'

make[2]: *** No rule to make target `modules'.  Stop.

make[2]: Leaving directory `/usr/src/mtd/kernel'

make[1]: *** [_mod_/usr/src/mtd/kernel] Error 2

make[1]: Leaving directory `/usr/src/linux-2.4.20'

make: *** [all] Error 2

root at drwho4:/usr/src/mtd# exit
Script done on Tue Mar 11 23:07:14 2003

Script started on Tue Mar 11 23:09:35 2003
root at drwho4:/usr/src/mtd/util# make

gcc -I../include -O2 -Wall -Wstrict-prototypes -Wshadow   -c -o
crc32.o crc32.c

In file included from crc32.c:42:

crc32.h:8: parse error before `crc32_table'

crc32.h:8: warning: type defaults to `int' in declaration of
`crc32_table'

crc32.h:8: warning: data definition has no type or storage class

crc32.h:13: parse error before `crc32'

crc32.h:13: parse error before `val'

crc32.h:14: warning: return-type defaults to `int'

crc32.h:14: warning: function declaration isn't a prototype

crc32.h: In function `crc32':

crc32.h:15: `ss' undeclared (first use in this function)

crc32.h:15: (Each undeclared identifier is reported only once

crc32.h:15: for each function it appears in.)

crc32.h:16: `len' undeclared (first use in this function)

crc32.h:17: `val' undeclared (first use in this function)

crc32.h:19: warning: control reaches end of non-void function

crc32.c: At top level:

crc32.c:44: parse error before `crc32_table'

crc32.c:44: warning: type defaults to `int' in declaration of
`crc32_table'

crc32.c:97: warning: data definition has no type or storage class

make: *** [crc32.o] Error 1

root at drwho4:/usr/src/mtd/util# exit


Script done on Tue Mar 11 23:09:42 2003

That was captured as a script file, as is. I have no real idea what
they are talking about. Can any of you, advise?
-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
