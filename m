Received: from ihemail2.lucent.com ([192.11.222.163]
	helo=ihemail2.firewall.lucent.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJGww-0004bh-Kz
	for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2003 18:39:42 +0000
Received: from ihmail.ih.lucent.com (h135-1-218-70.lucent.com [135.1.218.70])
	ESMTP id hAAIcHw18514	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Nov 2003 12:38:18 -0600 (CST)
Message-ID: <3FAFDAE9.5050506@lucent.com>
Date: Mon, 10 Nov 2003 12:37:29 -0600
From: James Solner <solner@lucent.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: zlib compilation failures
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got the most recent snapshot of the MTD and JFFS2 and try to
compile it, but it fails on the following errors. The kernel is 2.4.18.
Any ideas on whats wrong?

Thanks!


ppc_405-gcc -D__KERNEL__ -I/home/jds/PPC_DEV/WT405_LINUX/linux/include 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
-fno-strict-aliasing -fno-common -g -ggdb 
-I/home/jds/PPC_DEV/WT405_LINUX/linux/arch/ppc -fsigned-char 
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring 
-Wa,-m405   -DKBUILD_BASENAME=zlib  -DEXPORT_SYMTAB -c zlib.c
zlib.c:72: `deflate' undeclared here (not in a function)
zlib.c:72: initializer element is not constant
zlib.c:72: (near initialization for `__ksymtab_deflate.value')
zlib.c:73: `deflateInit_' undeclared here (not in a function)
zlib.c:73: initializer element is not constant
zlib.c:73: (near initialization for `__ksymtab_deflateInit_.value')
zlib.c:74: `deflateInit2_' undeclared here (not in a function)
zlib.c:74: initializer element is not constant
zlib.c:74: (near initialization for `__ksymtab_deflateInit2_.value')
zlib.c:75: `deflateEnd' undeclared here (not in a function)
zlib.c:75: initializer element is not constant
zlib.c:75: (near initialization for `__ksymtab_deflateEnd.value')
zlib.c:76: `deflateSetDictionary' undeclared here (not in a function)
zlib.c:76: initializer element is not constant
zlib.c:76: (near initialization for `__ksymtab_deflateSetDictionary.value')
zlib.c:77: `deflateCopy' undeclared here (not in a function)
zlib.c:77: initializer element is not constant
zlib.c:77: (near initialization for `__ksymtab_deflateCopy.value')
zlib.c:78: `deflateReset' undeclared here (not in a function)
zlib.c:78: initializer element is not constant
...

zlib.c: In function `inflate_codes_free':
zlib.c:4864: structure has no member named `zfree'
zlib.c:4864: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:5170: warning: function declaration isn't a prototype
zlib.c:5374: warning: function declaration isn't a prototype
zlib.c:5374: `adler32' used prior to declaration
zlib.c:5374: warning: `adler32' was previously implicitly declared to 
return `int'
make[2]: *** [zlib.o] Error 1
make[2]: Leaving directory `/home/jds/PPC_DEV/WT405_LINUX/linux/lib'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/home/jds/PPC_DEV/WT405_LINUX/linux/lib'
make: *** [_dir_lib] Error 2
Make status: 2
***** Build Failure -make bzImage *****
