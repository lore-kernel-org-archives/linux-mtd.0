Received: from crowe.psilongbeach.com ([63.168.124.5])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196CsA-00011X-CU
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 18:08:30 +0100
Received: from psilongbeach.com (localhost.localdomain [127.0.0.1])
	by crowe.psilongbeach.com (8.12.5/8.12.5) with ESMTP id h3HH8ZZ8023259
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 12:08:35 -0500
Message-ID: <3E9EDF93.9070700@psilongbeach.com>
Date: Thu, 17 Apr 2003 12:08:35 -0500
From: crowe@psilongbeach.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: CVS patch breaks zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi I'm new to the list
I'm designing with the Altera EPXA10.
I got the CVS version of mtd and applied the patch
patchin.sh -c -j /home/crowe/aacSpva/linux-2.4.17_zlibBusted

I did a
make clean
make dep
make bzImage then died with make modules (mtd stuff is configured for modules)

Here is a snippit of what happened
make modules
....
make[1]: Entering directory `/home/crowe/aacSpva/linux-2.4.17_zlibBusted/lib'
arm_920t_le-gcc -D__KERNEL__ -I/home/crowe/aacSpva/linux-2.4.17_zlibBusted/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2  -fno-strict-aliasing -fno-common -fno-common -pipe -g 
-mapcs-32 -march=armv4 -mtune=arm9tdmi -mshort-load-bytes -msoft-float -DMODULE   -DEXPORT_SYMTAB -c 
zlib.c
zlib.c:72: `deflate' undeclared here (not in a function)
zlib.c:72: initializer element is not constant
...
a whole bunch of errors and warnings
...
ending with
zlib.c:5374: `adler32' used prior to declaration
zlib.c:5374: warning: `adler32' was previously implicitly declared to return `int'
make[1]: *** [zlib.o] Error 1
make[1]: Leaving directory `/home/crowe/aacSpva/linux-2.4.17_zlibBusted/lib'
make: *** [_mod_lib] Error 2

Any Ideas on what I did wrong?
Thanks
Mike


-- 
Mike Crowe
crowe@psilongbeach.com
