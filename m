Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rv4Y-0004IZ-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 06:09:10 +0100
Received: from cs2875-45.austin.rr.com ([24.28.75.45] helo=localhost.localdomain)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rv4W-0004IT-00
	for mtd@infradead.org; Tue, 24 Apr 2001 06:09:09 +0100
Received: from troche.org (IDENT:root@matrix [127.0.0.1])
	by localhost.localdomain (8.11.0/8.11.0) with ESMTP id f3O57le03623
	for <mtd@infradead.org>; Tue, 24 Apr 2001 00:07:48 -0500
Message-ID: <3AE50A23.F1A27F2E@troche.org>
Date: Tue, 24 Apr 2001 00:07:47 -0500
From: Edmund Troche <edmund@troche.org>
Reply-To: edmund@troche.org
MIME-Version: 1.0
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Problem compiling under Linux 2.4.3
References: <716A7F62A194D41195AB001083FC3AE4426A62@inlmx1.inl.intersil.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just got the latest CVS code and after doing the "patchin.sh" to my source tree I
can't build. Doing a make depend also fails.
This is what I get from make depend:

make[4]: Leaving directory `/usr/src/linux-2.4.3/drivers/misc'
make -C mtd fastdep
make[4]: Entering directory `/usr/src/linux-2.4.3/drivers/mtd'
make[4]: Makefile: No such file or directory
make[4]: *** No rule to make target `Makefile'.  Stop.
make[4]: Leaving directory `/usr/src/linux-2.4.3/drivers/mtd'
make[3]: *** [_sfdep_mtd] Error 2
make[3]: Leaving directory `/usr/src/linux-2.4.3/drivers'
make[2]: *** [fastdep] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.3/drivers'
make[1]: *** [_sfdep_drivers] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.3'
make: *** [dep-files] Error 2

I looked into the /usr/src/linux-2.4.3/drivers/mtd/Makefile file and it was empty.
This file is softlinked to /usr/src/mtd/kernel/Makefile. My /usr/src/linux
directory is actually softlinked to /usr/src/linux-2.4.3.


Running make xconfig returns the following:

[root@matrix linux]# make xconfig
rm -f include/asm
( cd include ; ln -sf asm-i386 asm)
make -C scripts kconfig.tk
make[1]: Entering directory `/usr/src/linux-2.4.3/scripts'
cat header.tk >> ./kconfig.tk
./tkparse < ../arch/i386/config.in >> kconfig.tk
-: 249: unable to open drivers/mtd/Config.in
make[1]: *** [kconfig.tk] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.3/scripts'
make: *** [xconfig] Error 2
[root@matrix linux]#

The file  /usr/src/mtd/kernel/Config.in, which is softlinked to
/usr/src/linux/drivers/mtd/Config.in is also empty.

I've done this before in previous kernels (2.2.X and 2.4.2) and it worker. Did I
miss something? Thanks in advance for your help.


Edmund Troche










To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
