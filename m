Received: from [212.172.122.16] (helo=qmail.root.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17s6ML-0005zu-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2002 19:49:05 +0100
Received: from unknown (HELO warp.root.at) ([212.172.122.2]) (envelope-sender <pit@root.at>)
          by qmail.root.at (qmail-ldap-1.03) with SMTP
          for <linux-mtd@lists.infradead.org>; 19 Sep 2002 20:49:03 +0200
Subject: 2.2.17 + mtd (current cvs) problems
From: Karl Pitrich <pit@root.at>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Sep 2002 20:49:03 +0200
Message-Id: <1032461343.3579.383.camel@warp.root.at>
Mime-Version: 1.0
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

hi.

i took a vanilla 2.2.17, used patchin.sh to apply mtd-2.2.17.patch and
make necessary links.

a) i had to change some #includes, ie. for spinlock.h which is expected
in include/linux but resides in include/asm.

b) i applied yhis patch found on the mailinglist because of compile
error.

include/linux/kmod.h

-#define request_module(x) do {} while(0)
+static inline int request_module(const char *name)
+{
+       return -EINVAL;
+}


c) now, my current 'make zImage' error is as follows. (see below)

recursive grepping for daemonize() yields no match.
as far as i can see, 'thread_sem' is reasonably defined.
any help greatly appreciated.

/ karl


gcc version 2.96 20000731

make[3]: Entering directory
`/home/pit/embedded/kernel/linux/drivers/mtd'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-fr
ame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386
-DCPU=386   -c
 -o mtdblock.o mtdblock.c
mtdblock.c:470: warning: type defaults to `int' in declaration of
`DECLARE_MUTEX
_LOCKED'
mtdblock.c:470: warning: parameter names (without types) in function
declaration
mtdblock.c: In function `mtdblock_thread':
mtdblock.c:503: `thread_sem' undeclared (first use in this function)
mtdblock.c:503: (Each undeclared identifier is reported only once
mtdblock.c:503: for each function it appears in.)
mtdblock.c: In function `cleanup_mtdblock':
mtdblock.c:654: `thread_sem' undeclared (first use in this function)
mtdblock.c:662: array subscript is not an integer
mtdblock.c: At top level:
mtdblock.c:667: warning: type defaults to `int' in declaration of
`module_init'
mtdblock.c:667: warning: parameter names (without types) in function
declaration
mtdblock.c:667: warning: data definition has no type or storage class
mtdblock.c:668: warning: type defaults to `int' in declaration of
`module_exit'
mtdblock.c:668: warning: parameter names (without types) in function
declaration
mtdblock.c:668: warning: data definition has no type or storage class
mtdblock.c:51: warning: `mtdblock_lock' defined but not used
mtdblock.c:470: warning: `DECLARE_MUTEX_LOCKED' declared `static' but
never defi
ned
mtdblock.c:651: warning: `cleanup_mtdblock' defined but not used
