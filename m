Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12VFOR-00008o-00
	for mtd-list@infradead.org; Wed, 15 Mar 2000 15:07:27 +0000
Received: from terminus.dnttm.ro ([193.226.98.11] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12VFOL-00008h-00
	for mtd@infradead.org; Wed, 15 Mar 2000 15:07:23 +0000
Received: from ibox (ppp105.dnttm.ro [193.231.207.110])
	by terminus.dnttm.ro (8.9.3/8.9.3) with ESMTP id RAA08986
	for <mtd@infradead.org>; Wed, 15 Mar 2000 17:06:41 +0200
Received: from 192.168.0.5 by ibox ([192.168.0.1] running VPOP3) with SMTP for <mtd@infradead.org>; Wed, 15 Mar 2000 17:06:38 +0200
Message-ID: <001801bf8e8f$dd50f0c0$0500a8c0@cores.ro>
From: "Marius Bogoevici" <marius_bogoevici@electronic.cores.ro>
To: "MTD mailing list" <mtd@infradead.org>
Subject: Compile-time errors
Date: Wed, 15 Mar 2000 17:05:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

While compiling the mtd-20000131 with a  a 2.3.47 kernel I have received the
following messages:

make -C /usr/src/linux SUBDIRS=/usr/src/mtd-20000131/ffs2 modules
make[1]: Entering directory `/usr/src/linux-2.3.47'
make -C  /usr/src/mtd-20000131/ffs2
CFLAGS="-D__KERNEL__ -I/usr/src/linux-2.3.47/include -D__SMP__ -Wall -Wstric
t-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe   -DCPU=686
 -march=i686 -DMODULE" MAKING_MODULES=1 modules
make[2]: Entering directory `/usr/src/mtd-20000131/ffs2'
gcc -D__KERNEL__ -I/usr/src/linux-2.3.47/include -D__SMP__ -Wall -Wstrict-pr
ototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe   -DCPU=686 -ma
rch=i686 -DMODULE   -c -o super.o super.c
super.c: In function `ffs2_read_super':
super.c:1003: too many arguments to function `d_alloc_root'
super.c: In function `ffs2_readpage':
super.c:1222: structure has no member named `offset'
super.c:1224: structure has no member named `offset'
super.c:1272: structure has no member named `offset'
super.c:1280: structure has no member named `offset'
super.c:1281: structure has no member named `offset'
super.c:1283: structure has no member named `offset'
super.c: In function `ffs2_file_write':
super.c:1674: warning: implicit declaration of function `update_vm_cache'
super.c: At top level:
super.c:1736: warning: initialization from incompatible pointer type
super.c:1739: warning: excess elements in struct initializer after
`ffs2_file_inode_operations'
super.c:1740: warning: excess elements in struct initializer after
`ffs2_file_inode_operations'
super.c:1741: warning: excess elements in struct initializer after
`ffs2_file_inode_operations'
super.c:1779: warning: excess elements in struct initializer after
`ffs2_dir_inode_operations'
super.c:1780: warning: excess elements in struct initializer after
`ffs2_dir_inode_operations'
super.c:1781: warning: excess elements in struct initializer after
`ffs2_dir_inode_operations'
super.c:1801: warning: excess elements in struct initializer after
`ffs2_link_inode_operations'
super.c:1802: warning: excess elements in struct initializer after
`ffs2_link_inode_operations'
super.c:1803: warning: excess elements in struct initializer after
`ffs2_link_inode_operations'
super.c:1813: `chrdev_inode_operations' undeclared here (not in a function)
super.c:1813: initializer element for `ffs2_inoops[5]' is not constant
super.c:1841: warning: function declaration isn't a prototype
super.c:1855: warning: function declaration isn't a prototype
make[2]: *** [super.o] Error 1
make[2]: Leaving directory `/usr/src/mtd-20000131/ffs2'
make[1]: *** [_mod_/usr/src/mtd-20000131/ffs2] Error 2
make[1]: Leaving directory `/usr/src/linux-2.3.47'
make: *** [all] Error 2

I require a little help with this. Thanks in advance !

-- Marius Bogoevici
CoRES Alarm, SA




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
