Received: from idcmail-mo1so.shaw.ca ([24.71.223.10]
	helo=pd2mo1so.prod.shaw.ca)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3Jl3-0002LD-Sy
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 23:48:10 +0000
Received: from pd3mr2so.prod.shaw.ca
	(pd3mr2so-qfe3.prod.shaw.ca [10.0.141.178]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0K1V00EIZ0S9VID0@l-daemon> for
	linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 17:48:09 -0600 (MDT)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd3mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0K1V00MN00S81110@pd3mr2so.prod.shaw.ca> for
	linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 17:48:09 -0600 (MDT)
Received: from [192.168.0.107] ([70.73.70.241])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0K1V003PB0S8LDU0@l-daemon> for
	linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 17:48:08 -0600 (MDT)
Date: Mon, 02 Jun 2008 17:48:04 -0600
From: Mandeep Ahuja <ahuja@aksysnetworks.com>
Subject: Cannot compile latest mtd with 2.6.10
To: linux-mtd@lists.infradead.org
Message-id: <484486B4.3070605@aksysnetworks.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I recently check out the 'mtd' module from CVS. I have kernel 2.6.10 for 
mips malta board. I ran the patchkernel.sh script and then tried to 
compile my kernel.

I ran into this
 CHK     include/linux/version.h
make[1]: `arch/mips/kernel/offset.s' is up to date.
 CHK     include/asm-mips/offset.h
 CHK     include/linux/compile.h
 CHK     usr/initramfs_list
 CC      drivers/mtd/mtdcore.o
drivers/mtd/mtdcore.c:28: warning: type defaults to `int' in declaration 
of `DEFINE_MUTEX'
drivers/mtd/mtdcore.c:28: warning: parameter names (without types) in 
function declaration
drivers/mtd/mtdcore.c:28: warning: data definition has no type or 
storage class
drivers/mtd/mtdcore.c:31: error: `mtd_table_mutex' undeclared here (not 
in a function)
drivers/mtd/mtdcore.c:31: error: initializer element is not constant
drivers/mtd/mtdcore.c:31: error: (near initialization for 
`__ksymtab_mtd_table_mutex.value')
drivers/mtd/mtdcore.c: In function `add_mtd_device':
drivers/mtd/mtdcore.c:50: warning: implicit declaration of function 
`mutex_lock'
drivers/mtd/mtdcore.c:68: warning: implicit declaration of function 
`mutex_unlock'
drivers/mtd/mtdcore.c: At top level:
drivers/mtd/mtdcore.c:31: error: __ksymtab_mtd_table_mutex causes a 
section type conflict
make[2]: *** [drivers/mtd/mtdcore.o] Error 1
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

Looks like some mutex problem, but the 2.6.10 does not have mutexes. How 
do I get around this problem?

Would appreciate any help
thanks
Mandeep
