Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AnteG-00034O-3U
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 06:03:00 +0000
Received: from il06exr06.mot.com (il06exr06.mot.com [129.188.137.136])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i1360W5w023117
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Feb 2004 23:00:32 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr06.mot.com (Motorola/il06exr06) with ESMTP id i1360M0A007488
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 00:00:25 -0600
From: Li Yang <leoli@motorola.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1075788182.20041.38.camel@Gundam>
Mime-Version: 1.0
Date: 03 Feb 2004 14:03:03 +0800
Content-Transfer-Encoding: 7bit
Subject: Mtd compile fails on ppc arch
Reply-To: leoli@motorola.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I updated the mtd driver in kernel through the latest snapshot.  I have
tested kernel 2.4.20 and 2.4.22.  The same parse error occurred for ppc
arch.  I have tried two cross toolchains, the results are the same.  So
it's unlikely to be cross compiler problem.  Btw: i386 compiles well.  I
looked into some code, the problem seems to be related to headers.  But
I can't figure it out.  Does anyone have a clue?

powerpc-linux-gcc -D__KERNEL__
-I/home/leo/beijing/project/pq27/linux-2.4.22/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer
-I/home/leo/beijing/project/pq27/linux-2.4.22/arch/ppc -fsigned-char
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring  
-nostdinc -iwithprefix include -DKBUILD_BASENAME=sharp  -c -o sharp.o
sharp.c
sharp.c: In function `sharp_probe':
sharp.c:115: warning: implicit declaration of function `kmalloc'
sharp.c:115: warning: assignment makes pointer from integer without a
cast
sharp.c:119: warning: assignment makes pointer from integer without a
cast
sharp.c:121: warning: implicit declaration of function `kfree'
sharp.c: At top level:
sharp.c:577: parse error before `sharp_probe_init'
sharp.c:578: warning: return-type defaults to `int'
sharp.c:586: parse error before `sharp_probe_exit'
sharp.c:587: warning: return-type defaults to `int'
sharp.c: In function `sharp_probe_exit':
sharp.c:589: warning: control reaches end of non-void function
sharp.c: At top level:
sharp.c:591: warning: type defaults to `int' in declaration of
`module_init'
sharp.c:591: warning: parameter names (without types) in function
declaration
sharp.c:591: warning: data definition has no type or storage class
sharp.c:592: warning: type defaults to `int' in declaration of
`module_exit'
sharp.c:592: warning: parameter names (without types) in function
declaration
sharp.c:592: warning: data definition has no type or storage class
make[4]: *** [sharp.o] Error 1
make[4]: Leaving directory
`/home/leo/beijing/project/pq27/linux-2.4.22/drivers/
mtd/chips'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory
`/home/leo/beijing/project/pq27/linux-2.4.22/drivers/
mtd/chips'
make[2]: *** [_subdir_chips] Error 2
make[2]: Leaving directory
`/home/leo/beijing/project/pq27/linux-2.4.22/drivers/
mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory
`/home/leo/beijing/project/pq27/linux-2.4.22/drivers'
make: *** [_dir_drivers] Error 2

Regards,
Leo
