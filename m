From: eric.dejonc@thales-e-transactions.com (Eric DEJONC)
Date: Mon, 31 Mar 2003 16:27:12 +0200
Subject: mtd devices inaccessible
Message-ID: <3E885040.41874936@thales-e-transactions.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I'm sorry to ask so many question but,
I hadn't made a clean, that's why I got a stange error, but now, I can't
compile the new kernel:
missing mtdlink.o
        I had to modify the makefile of the drivers/mtd and remove the
ifeq($below25),y) but I have a 2.5.6.2 kernel.

then when I boot, I have this:

Probe at base[0x00](0x00000000) past the end of the map(0xffffffff)
Probe at base[0x00](0x00000000) past the end of the map(0xffffffff)
Probe at base[0x00](0x00000000) past the end of the map(0xffffffff)
CFI: Found no SA1100 flash device at location zero


and mtd devices are not accessible.

Where could be my error
