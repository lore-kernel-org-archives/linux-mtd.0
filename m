Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19joZH-0000ph-VW
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 00:16:44 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19joYr-0006QF-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 01:16:17 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Mon, 04 Aug 2003 16:16:28 -0700
Message-ID: <m3r841814j.fsf@bfnet.com>
References: <m3ispeb4cp.fsf@bfnet.com> <200308041040.11475.tglx@linutronix.de>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: zlib patch doesn't take?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas> zlib.h is obviously not updated.
Thomas> Can you provide the output of ./patchin.sh ?

I went ahead and manually copied mtd/include/linux/* to my
linux/include/linux directory, and made again.  Unfortunately, I still
get the same errors.

For reference, here is the output of patchin.sh again.

$ ./patchin.sh -c -j /home/build/linux
Patching /home/build/linux
Include Filesytems: yes
Zlib-Patch needed: yes
Method: Copy
Can we start now ? [y/N]y

Patching MTD
drivers/mtd
drivers/mtd/chips
drivers/mtd/devices
drivers/mtd/maps
drivers/mtd/nand
include/linux/mtd
Patching JFFS(2)
fs/jffs
fs/jffs2
include/linux
Patching ZLIB
lib/zlib_deflate
lib/zlib_inflate
patching file lib/Makefile
Hunk #1 succeeded at 20 (offset 1 line).
Patching done
Please update Documentation/Configure.help from /home/build/mtd/Documentation/Configure.help
$

Here are the errors I got after copying all the include files and
building in the kernel directory:

/home/dave/C/perforce/source/deschutes/buildroot-M14.0-X225/build_mipsel/staging_dir/bin/mipsel-uclibc-gcc -I /home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0-200308041105/include/asm/gcc -D__KERNEL__ -I/home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0-200308041105/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -G 0 -mno-abicalls -fno-pic -mips2 -Wa,--trap -pipe  -DLINUX_RAM_START=0x80100000  -DKBUILD_BASENAME=zlib  -DEXPORT_SYMTAB -c zlib.c
zlib.c:72: error: `deflate' undeclared here (not in a function)
zlib.c:72: error: initializer element is not constant
zlib.c:72: error: (near initialization for `__ksymtab_deflate.value')
zlib.c:73: error: `deflateInit_' undeclared here (not in a function)
zlib.c:73: error: initializer element is not constant
zlib.c:73: error: (near initialization for `__ksymtab_deflateInit_.value')
zlib.c:74: error: `deflateInit2_' undeclared here (not in a function)
zlib.c:74: error: initializer element is not constant
zlib.c:74: error: (near initialization for `__ksymtab_deflateInit2_.value')
zlib.c:75: error: `deflateEnd' undeclared here (not in a function)
zlib.c:75: error: initializer element is not constant
zlib.c:75: error: (near initialization for `__ksymtab_deflateEnd.value')
zlib.c:76: error: `deflateSetDictionary' undeclared here (not in a function)
zlib.c:76: error: initializer element is not constant
zlib.c:76: error: (near initialization for `__ksymtab_deflateSetDictionary.value')
zlib.c:77: error: `deflateCopy' undeclared here (not in a function)
zlib.c:77: error: initializer element is not constant
zlib.c:77: error: (near initialization for `__ksymtab_deflateCopy.value')
zlib.c:78: error: `deflateReset' undeclared here (not in a function)
zlib.c:78: error: initializer element is not constant
zlib.c:78: error: (near initialization for `__ksymtab_deflateReset.value')
zlib.c:79: error: `deflateParams' undeclared here (not in a function)
zlib.c:79: error: initializer element is not constant
zlib.c:79: error: (near initialization for `__ksymtab_deflateParams.value')
zlib.c:80: error: `deflateOutputPending' undeclared here (not in a function)
zlib.c:80: error: initializer element is not constant
zlib.c:80: error: (near initialization for `__ksymtab_deflateOutputPending.value')
zlib.c:81: error: `inflate' undeclared here (not in a function)
zlib.c:81: error: initializer element is not constant
zlib.c:81: error: (near initialization for `__ksymtab_inflate.value')
zlib.c:82: error: `inflateInit_' undeclared here (not in a function)
zlib.c:82: error: initializer element is not constant
zlib.c:82: error: (near initialization for `__ksymtab_inflateInit_.value')
zlib.c:83: error: `inflateInit2_' undeclared here (not in a function)
zlib.c:83: error: initializer element is not constant
zlib.c:83: error: (near initialization for `__ksymtab_inflateInit2_.value')
zlib.c:84: error: `inflateEnd' undeclared here (not in a function)
zlib.c:84: error: initializer element is not constant
zlib.c:84: error: (near initialization for `__ksymtab_inflateEnd.value')
zlib.c:85: error: `inflateSetDictionary' undeclared here (not in a function)
zlib.c:85: error: initializer element is not constant
zlib.c:85: error: (near initialization for `__ksymtab_inflateSetDictionary.value')
zlib.c:86: error: `inflateSync' undeclared here (not in a function)
zlib.c:86: error: initializer element is not constant
zlib.c:86: error: (near initialization for `__ksymtab_inflateSync.value')
zlib.c:87: error: `inflateReset' undeclared here (not in a function)
zlib.c:87: error: initializer element is not constant
zlib.c:87: error: (near initialization for `__ksymtab_inflateReset.value')
zlib.c:88: error: `inflateIncomp' undeclared here (not in a function)
zlib.c:88: error: initializer element is not constant
zlib.c:88: error: (near initialization for `__ksymtab_inflateIncomp.value')
zlib.c:89: error: `adler32' undeclared here (not in a function)
zlib.c:89: error: initializer element is not constant
zlib.c:89: error: (near initialization for `__ksymtab_adler32.value')
zlib.c:750: warning: function declaration isn't a prototype
zlib.c: In function `deflateInit_':
zlib.c:755: warning: implicit declaration of function `deflateInit2_'
zlib.c: At top level:
zlib.c:763: warning: function declaration isn't a prototype
zlib.c: In function `deflateInit2_':
zlib.c:807: error: structure has no member named `zalloc'
zlib.c:807: error: structure has no member named `opaque'
zlib.c:822: error: structure has no member named `zalloc'
zlib.c:822: error: structure has no member named `opaque'
zlib.c:823: error: structure has no member named `zalloc'
zlib.c:823: error: structure has no member named `opaque'
zlib.c:824: error: structure has no member named `zalloc'
zlib.c:824: error: structure has no member named `opaque'
zlib.c:828: error: structure has no member named `zalloc'
zlib.c:828: error: structure has no member named `opaque'
zlib.c:835: warning: implicit declaration of function `deflateEnd'
zlib.c:845: warning: implicit declaration of function `deflateReset'
zlib.c: At top level:
zlib.c:850: warning: function declaration isn't a prototype
zlib.c: In function `deflateSetDictionary':
zlib.c:865: warning: implicit declaration of function `adler32'
zlib.c: At top level:
zlib.c:893: warning: function declaration isn't a prototype
zlib.c: In function `deflateReset':
zlib.c:898: error: structure has no member named `zalloc'
zlib.c:898: error: structure has no member named `zfree'
zlib.c: At top level:
zlib.c:923: warning: function declaration isn't a prototype
zlib.c: In function `deflateParams':
zlib.c:944: warning: implicit declaration of function `deflate'
zlib.c: At top level:
zlib.c:1000: warning: function declaration isn't a prototype
zlib.c:1137: warning: function declaration isn't a prototype
zlib.c: In function `deflateEnd':
zlib.c:1152: error: structure has no member named `zfree'
zlib.c:1152: error: structure has no member named `opaque'
zlib.c:1153: error: structure has no member named `zfree'
zlib.c:1153: error: structure has no member named `opaque'
zlib.c:1154: error: structure has no member named `zfree'
zlib.c:1154: error: structure has no member named `opaque'
zlib.c:1155: error: structure has no member named `zfree'
zlib.c:1155: error: structure has no member named `opaque'
zlib.c:1157: error: structure has no member named `zfree'
zlib.c:1157: error: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:1167: warning: function declaration isn't a prototype
zlib.c: In function `deflateCopy':
zlib.c:1180: error: structure has no member named `zalloc'
zlib.c:1180: error: structure has no member named `opaque'
zlib.c:1186: error: structure has no member named `zalloc'
zlib.c:1186: error: structure has no member named `opaque'
zlib.c:1187: error: structure has no member named `zalloc'
zlib.c:1187: error: structure has no member named `opaque'
zlib.c:1188: error: structure has no member named `zalloc'
zlib.c:1188: error: structure has no member named `opaque'
zlib.c:1189: error: structure has no member named `zalloc'
zlib.c:1189: error: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:1219: warning: function declaration isn't a prototype
zlib.c:3116: warning: function declaration isn't a prototype
zlib.c:3132: warning: function declaration isn't a prototype
zlib.c: In function `inflateEnd':
zlib.c:3136: error: structure has no member named `zfree'
zlib.c:3140: error: structure has no member named `zfree'
zlib.c:3140: error: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:3148: warning: function declaration isn't a prototype
zlib.c: In function `inflateInit2_':
zlib.c:3170: error: structure has no member named `zalloc'
zlib.c:3170: error: structure has no member named `opaque'
zlib.c:3192: error: `adler32' undeclared (first use in this function)
zlib.c:3192: error: (Each undeclared identifier is reported only once
zlib.c:3192: error: for each function it appears in.)
zlib.c: At top level:
zlib.c:3207: warning: function declaration isn't a prototype
zlib.c:3219: warning: function declaration isn't a prototype
zlib.c:3351: warning: function declaration isn't a prototype
zlib.c: In function `inflateSetDictionary':
zlib.c:3360: error: `adler32' used prior to declaration
zlib.c: At top level:
zlib.c:3383: warning: function declaration isn't a prototype
zlib.c:3392: warning: function declaration isn't a prototype
zlib.c: In function `inflate_blocks_reset':
zlib.c:3711: error: structure has no member named `zfree'
zlib.c:3711: error: structure has no member named `opaque'
zlib.c: In function `inflate_blocks_new':
zlib.c:3736: error: structure has no member named `zalloc'
zlib.c:3736: error: structure has no member named `opaque'
zlib.c:3738: error: structure has no member named `zalloc'
zlib.c:3738: error: structure has no member named `opaque'
zlib.c:3740: error: structure has no member named `zfree'
zlib.c:3740: error: structure has no member named `opaque'
zlib.c: In function `inflate_blocks':
zlib.c:3868: error: structure has no member named `zalloc'
zlib.c:3868: error: structure has no member named `opaque'
zlib.c:3894: error: structure has no member named `zfree'
zlib.c:3894: error: structure has no member named `opaque'
zlib.c:3933: error: structure has no member named `zfree'
zlib.c:3933: error: structure has no member named `opaque'
zlib.c:3961: error: structure has no member named `zfree'
zlib.c:3961: error: structure has no member named `opaque'
zlib.c: In function `inflate_blocks_free':
zlib.c:4032: error: structure has no member named `zfree'
zlib.c:4032: error: structure has no member named `opaque'
zlib.c:4033: error: structure has no member named `zfree'
zlib.c:4033: error: structure has no member named `opaque'
zlib.c: In function `huft_build':
zlib.c:4356: error: structure has no member named `zalloc'
zlib.c:4356: error: structure has no member named `opaque'
zlib.c: In function `inflate_trees_fixed':
zlib.c:4536: error: structure has no member named `zalloc'
zlib.c:4537: error: structure has no member named `zfree'
zlib.c:4538: error: structure has no member named `opaque'
zlib.c: In function `inflate_trees_free':
zlib.c:4593: error: structure has no member named `zfree'
zlib.c:4593: error: structure has no member named `opaque'
zlib.c: In function `inflate_codes_new':
zlib.c:4687: error: structure has no member named `zalloc'
zlib.c:4687: error: structure has no member named `opaque'
zlib.c: In function `inflate_codes_free':
zlib.c:4864: error: structure has no member named `zfree'
zlib.c:4864: error: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:5170: warning: function declaration isn't a prototype
zlib.c:5374: warning: function declaration isn't a prototype
zlib.c:5374: error: `adler32' used prior to declaration
zlib.c:5374: warning: `adler32' was previously implicitly declared to return `int'
make[4]: *** [zlib.o] Error 1
make[4]: Leaving directory `/home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0-200308041105/lib'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0-200308041105/lib'
make[2]: *** [_dir_lib] Error 2
make[2]: Leaving directory `/home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0-200308041105'
make[1]: *** [dep] Error 2
make[1]: Leaving directory `/home/dave/C/perforce/source/deschutes/kernel'
make: *** [/home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0/vmlinux] Error 2
