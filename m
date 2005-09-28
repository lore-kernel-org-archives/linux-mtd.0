Received: from www.itv-con.net ([203.125.253.66] helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKWT6-0008Ck-ER
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 03:37:49 -0400
Received: from yahoo.com.sg (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id j8S7XVfu023277
	for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2005 15:33:31 +0800
Message-ID: <433A474A.8040502@yahoo.com.sg>
Date: Wed, 28 Sep 2005 15:33:30 +0800
From: Chen Zhigao <banyan8@yahoo.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Compiling Errors of map_funcs.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks,

I try to enable support MTD device under MontaVista 3.1 for our Intel 
IXP425 demo board. However, I got some errors when compiling the MTD 
driver of the intel-ixdp4xx-arm_xscale_be Linux Support Package. I would 
appreciate it if you could give me some pointer. Below is what I did.

#make ixdp425_config		// use default settings for IXP425
#make dep
#make zImage
<snip>
xscale_be-gcc -mbig-endian -D__KERNEL__ 
-I/home/banyan/mykernel/linux-2.4.20_mvl31/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -Os -fno-strict-aliasing -fno-common 
-Uarm -pipe -mapcs -mno-sched-prolog -mapcs-32 -D__LINUX_ARM_ARCH__=5 
-mcpu=xscale -mtune=xscale -mshort-load-bytes -msoft-float   -nostdinc 
-iwithprefix include -DKBUILD_BASENAME=ixp425  -c -o ixp425.o ixp425.c
ixp425.c:35:1: warning: "B0" redefined
/home/banyan/mykernel/linux-2.4.20_mvl31/include/asm/termbits.h:88:1: 
warning: this is the location of the previous definition
ixp425.c:75: error: unknown field `read16' specified in initializer
ixp425.c:75: warning: initialization from incompatible pointer type
ixp425.c:76: error: unknown field `copy_from' specified in initializer
ixp425.c:76: warning: initialization makes integer from pointer without 
a cast
ixp425.c:77: error: unknown field `write16' specified in initializer
ixp425.c:77: warning: initialization makes integer from pointer without 
a cast
ixp425.c:84: warning: return type defaults to `int'
make[4]: *** [ixp425.o] Error 1

I add "CONFIG_MTD_COMPLEX_MAPPINGS=y" into .config to enable the 
definition of the "read16", "copy_from" and etc. fields. And "make dep; 
make zImage" again.

xscale_be-gcc -mbig-endian -D__KERNEL__ 
-I/home/banyan/mykernel/linux-2.4.20_mvl31/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -Os -fno-strict-aliasing -fno-common 
-Uarm -pipe -mapcs -mno-sched-prolog -mapcs-32 -D__LINUX_ARM_ARCH__=5 
-mcpu=xscale -mtune=xscale -mshort-load-bytes -msoft-float   -nostdinc 
-iwithprefix include -DKBUILD_BASENAME=map_funcs  -DEXPORT_SYMTAB -c 
map_funcs.c
map_funcs.c:81: error: parse error before "do"
map_funcs.c:95: error: `simple_map_init' undeclared here (not in a function)
map_funcs.c:95: error: initializer element is not constant
map_funcs.c:95: error: (near initialization for 
`__ksymtab_simple_map_init.value')


I can not figure out these errors, particularly line 81. Any comment and 
suggestion will be highly appreciated.


Regards,
Zhigao
