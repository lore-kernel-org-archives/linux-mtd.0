Received: from ithilien.qualcomm.com ([129.46.51.59])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AC6f3-00053o-4d
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 01:15:37 +0100
Received: from sabrina.qualcomm.com (sabrina.qualcomm.com [129.46.61.150])
	h9M0ES4t005647	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Oct 2003 17:14:28 -0700 (PDT)
Received: from NAEXFE03.na.qualcomm.com (naexfe03.qualcomm.com [172.30.32.23])
	h9M0EQ0N019323	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Oct 2003 17:14:26 -0700 (PDT)
From: hking <hking@qualcomm.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 21 Oct 2003 17:14:24 -0700
MIME-Version: 1.0
Message-Id: <200310211714.24503.hking@qualcomm.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: zlib compilation failed
Reply-To: hking@qualcomm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I took the most recent snap shot of mtd and tried to compile it.
It stopped at the zlib.c.  I have kernel 2.4.18.
Any clue?  Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
make[2]: Entering directory `/root/CX_working_dir/mykernel/kernel/lib'
ppc_82xx-gcc -D__KERNEL__ -I/root/CX_working_dir/mykernel/kernel/include =
-Wall=20
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer=20
-fno-strict-aliasing -fno-common=20
-I/root/CX_working_dir/mykernel/kernel/arch/ppc -fsigned-char -msoft-floa=
t=20
-pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring  =20
-DKBUILD_BASENAME=3Dzlib  -DEXPORT_SYMTAB -c zlib.c
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
zlib.c:76: (near initialization for `__ksymtab_deflateSetDictionary.value=
')
zlib.c:77: `deflateCopy' undeclared here (not in a function)
zlib.c:77: initializer element is not constant
zlib.c:77: (near initialization for `__ksymtab_deflateCopy.value')
zlib.c:78: `deflateReset' undeclared here (not in a function)
zlib.c:78: initializer element is not constant
zlib.c:78: (near initialization for `__ksymtab_deflateReset.value')
zlib.c:79: `deflateParams' undeclared here (not in a function)
zlib.c:79: initializer element is not constant
zlib.c:79: (near initialization for `__ksymtab_deflateParams.value')
zlib.c:80: `deflateOutputPending' undeclared here (not in a function)
zlib.c:80: initializer element is not constant
zlib.c:80: (near initialization for `__ksymtab_deflateOutputPending.value=
')
zlib.c:81: `inflate' undeclared here (not in a function)
zlib.c:81: initializer element is not constant
zlib.c:81: (near initialization for `__ksymtab_inflate.value')
zlib.c:82: `inflateInit_' undeclared here (not in a function)
zlib.c:82: initializer element is not constant
zlib.c:82: (near initialization for `__ksymtab_inflateInit_.value')
zlib.c:83: `inflateInit2_' undeclared here (not in a function)
zlib.c:83: initializer element is not constant
zlib.c:83: (near initialization for `__ksymtab_inflateInit2_.value')
zlib.c:84: `inflateEnd' undeclared here (not in a function)
zlib.c:84: initializer element is not constant
zlib.c:84: (near initialization for `__ksymtab_inflateEnd.value')
zlib.c:85: `inflateSetDictionary' undeclared here (not in a function)
zlib.c:85: initializer element is not constant
zlib.c:85: (near initialization for `__ksymtab_inflateSetDictionary.value=
')
zlib.c:86: `inflateSync' undeclared here (not in a function)
zlib.c:86: initializer element is not constant
zlib.c:86: (near initialization for `__ksymtab_inflateSync.value')
zlib.c:87: `inflateReset' undeclared here (not in a function)
zlib.c:87: initializer element is not constant
zlib.c:87: (near initialization for `__ksymtab_inflateReset.value')
zlib.c:88: `inflateIncomp' undeclared here (not in a function)
zlib.c:88: initializer element is not constant
zlib.c:88: (near initialization for `__ksymtab_inflateIncomp.value')
zlib.c:89: `adler32' undeclared here (not in a function)
zlib.c:89: initializer element is not constant
zlib.c:89: (near initialization for `__ksymtab_adler32.value')
zlib.c:750: warning: function declaration isn't a prototype
zlib.c: In function `deflateInit_':
zlib.c:755: warning: implicit declaration of function `deflateInit2_'
zlib.c: At top level:
zlib.c:763: warning: function declaration isn't a prototype
zlib.c: In function `deflateInit2_':
zlib.c:807: structure has no member named `zalloc'
zlib.c:807: structure has no member named `opaque'
zlib.c:822: structure has no member named `zalloc'
zlib.c:822: structure has no member named `opaque'
zlib.c:823: structure has no member named `zalloc'
zlib.c:823: structure has no member named `opaque'
zlib.c:824: structure has no member named `zalloc'
zlib.c:824: structure has no member named `opaque'
zlib.c:828: structure has no member named `zalloc'
zlib.c:828: structure has no member named `opaque'
zlib.c:835: warning: implicit declaration of function `deflateEnd'
zlib.c:845: warning: implicit declaration of function `deflateReset'
zlib.c: At top level:
zlib.c:850: warning: function declaration isn't a prototype
zlib.c: In function `deflateSetDictionary':
zlib.c:865: warning: implicit declaration of function `adler32'
zlib.c: At top level:
zlib.c:893: warning: function declaration isn't a prototype
zlib.c: In function `deflateReset':
zlib.c:898: structure has no member named `zalloc'
zlib.c:898: structure has no member named `zfree'
zlib.c: At top level:
zlib.c:923: warning: function declaration isn't a prototype
zlib.c: In function `deflateParams':
zlib.c:944: warning: implicit declaration of function `deflate'
zlib.c: At top level:
zlib.c:1000: warning: function declaration isn't a prototype
zlib.c:1137: warning: function declaration isn't a prototype
zlib.c: In function `deflateEnd':
zlib.c:1152: structure has no member named `zfree'
zlib.c:1152: structure has no member named `opaque'
zlib.c:1153: structure has no member named `zfree'
zlib.c:1153: structure has no member named `opaque'
zlib.c:1154: structure has no member named `zfree'
zlib.c:1154: structure has no member named `opaque'
zlib.c:1155: structure has no member named `zfree'
zlib.c:1155: structure has no member named `opaque'
zlib.c:1157: structure has no member named `zfree'
zlib.c:1157: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:1167: warning: function declaration isn't a prototype
zlib.c: In function `deflateCopy':
zlib.c:1180: structure has no member named `zalloc'
zlib.c:1180: structure has no member named `opaque'
zlib.c:1186: structure has no member named `zalloc'
zlib.c:1186: structure has no member named `opaque'
zlib.c:1187: structure has no member named `zalloc'
zlib.c:1187: structure has no member named `opaque'
zlib.c:1188: structure has no member named `zalloc'
zlib.c:1188: structure has no member named `opaque'
zlib.c:1189: structure has no member named `zalloc'
zlib.c:1189: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:1219: warning: function declaration isn't a prototype
zlib.c:3116: warning: function declaration isn't a prototype
zlib.c:3132: warning: function declaration isn't a prototype
zlib.c: In function `inflateEnd':
zlib.c:3136: structure has no member named `zfree'
zlib.c:3140: structure has no member named `zfree'
zlib.c:3140: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:3148: warning: function declaration isn't a prototype
zlib.c: In function `inflateInit2_':
zlib.c:3170: structure has no member named `zalloc'
zlib.c:3170: structure has no member named `opaque'
zlib.c:3192: `adler32' undeclared (first use in this function)
zlib.c:3192: (Each undeclared identifier is reported only once
zlib.c:3192: for each function it appears in.)
zlib.c: At top level:
zlib.c:3207: warning: function declaration isn't a prototype
zlib.c:3219: warning: function declaration isn't a prototype
zlib.c:3351: warning: function declaration isn't a prototype
zlib.c: In function `inflateSetDictionary':
zlib.c:3360: `adler32' used prior to declaration
zlib.c: At top level:
zlib.c:3383: warning: function declaration isn't a prototype
zlib.c:3392: warning: function declaration isn't a prototype
zlib.c: In function `inflate_blocks_reset':
zlib.c:3711: structure has no member named `zfree'
zlib.c:3711: structure has no member named `opaque'
zlib.c: In function `inflate_blocks_new':
zlib.c:3736: structure has no member named `zalloc'
zlib.c:3736: structure has no member named `opaque'
zlib.c:3738: structure has no member named `zalloc'
zlib.c:3738: structure has no member named `opaque'
zlib.c:3740: structure has no member named `zfree'
zlib.c:3740: structure has no member named `opaque'
zlib.c: In function `inflate_blocks':
zlib.c:3868: structure has no member named `zalloc'
zlib.c:3868: structure has no member named `opaque'
zlib.c:3894: structure has no member named `zfree'
zlib.c:3894: structure has no member named `opaque'
zlib.c:3933: structure has no member named `zfree'
zlib.c:3933: structure has no member named `opaque'
zlib.c:3961: structure has no member named `zfree'
zlib.c:3961: structure has no member named `opaque'
zlib.c: In function `inflate_blocks_free':
zlib.c:4032: structure has no member named `zfree'
zlib.c:4032: structure has no member named `opaque'
zlib.c:4033: structure has no member named `zfree'
zlib.c:4033: structure has no member named `opaque'
zlib.c: In function `huft_build':
zlib.c:4356: structure has no member named `zalloc'
zlib.c:4356: structure has no member named `opaque'
zlib.c: In function `inflate_trees_fixed':
zlib.c:4536: structure has no member named `zalloc'
zlib.c:4537: structure has no member named `zfree'
zlib.c:4538: structure has no member named `opaque'
zlib.c: In function `inflate_trees_free':
zlib.c:4593: structure has no member named `zfree'
zlib.c:4593: structure has no member named `opaque'
zlib.c: In function `inflate_codes_new':
zlib.c:4687: structure has no member named `zalloc'
zlib.c:4687: structure has no member named `opaque'
zlib.c: In function `inflate_codes_free':
zlib.c:4864: structure has no member named `zfree'
zlib.c:4864: structure has no member named `opaque'
zlib.c: At top level:
zlib.c:5170: warning: function declaration isn't a prototype
zlib.c:5374: warning: function declaration isn't a prototype
zlib.c:5374: `adler32' used prior to declaration
zlib.c:5374: warning: `adler32' was previously implicitly declared to ret=
urn=20
`int'
make[2]: *** [zlib.o] Error 1
make[2]: Leaving directory `/root/CX_working_dir/mykernel/kernel/lib'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/root/CX_working_dir/mykernel/kernel/lib'
make: *** [_dir_lib] Error 2
--=20
Howard King L-333R
858-658-5244
