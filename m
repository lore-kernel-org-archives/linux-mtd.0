Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ci0v-0004KL-QI
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 09:51:54 +0100
Message-Id: <5.1.1.6.0.20030716101901.026acca0@192.168.2.1>
Date: Wed, 16 Jul 2003 10:51:58 +0200
To: tglx@linutronix.de
From: llandre <r&d@wawnet.biz>
In-Reply-To: <200307151945.33907.tglx@linutronix.de>
References: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
 <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Help to understand error messages (MTD on Samsung NAND
  chips)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >- bash-2.05# eraseall /dev/mtd0
> > Erasing 16 Kibyte @ 0 --  0 % complete.
> > eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> > Erasing 16 Kibyte @ 4000 --  0 % complete.
> > eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> > Erasing 16 Kibyte @ 8000 --  0 % complete.
>
>This message comes either, if you try to erase a bad block, which is not
>likely, as all your blocks would be bad or the erasefunction is not
>successful
>
>Do you use the latest CVS code ?
>If yes, there were a lot of changes in NAND the last few days.

Hi Thomas,

thanks for your quick response. I downloaded and applied the latest=20
snapshot (2003-07-15) but, after that, I can't build my own low-level=20
driver, derived it from Marius Gr=F6ger's edb7312.c, anymore :-(
I have a very strange error about the __init end __exit keywords?!?!
Besides, I had a look at the new MTD's sources and I saw that some=20
functions changed the formal parameteres (for example nand_scan).
Here is the errors:

make[4]: Entering directory=20
`/Progetti/chameleon/sw/linuxppc_2_4_devel/drivers/mtd/nand'
ppc-linux-gcc -D__KERNEL__=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/include=20
-I/usr/local/eldk/ppc_4xx/usr/lib/gcc-lib/ppc-linux/2.95.4/include -Wall=20
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common=20
-fomit-frame-pointer -g -fno-schedule-insns -fno-schedule-insns2=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/arch/ppc -fsigned-char=20
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring=20
-Wa,-m405   -nostdinc -iwithprefix include=20
-DKBUILD_BASENAME=3Dnand  -DEXPORT_SYMTAB -c nand.c
ppc-linux-gcc -D__KERNEL__=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/include=20
-I/usr/local/eldk/ppc_4xx/usr/lib/gcc-lib/ppc-linux/2.95.4/include -Wall=20
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common=20
-fomit-frame-pointer -g -fno-schedule-insns -fno-schedule-insns2=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/arch/ppc -fsigned-char=20
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring=20
-Wa,-m405   -nostdinc -iwithprefix include=20
-DKBUILD_BASENAME=3Dnand_ecc  -DEXPORT_SYMTAB -c nand_ecc.c
ppc-linux-gcc -D__KERNEL__=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/include=20
-I/usr/local/eldk/ppc_4xx/usr/lib/gcc-lib/ppc-linux/2.95.4/include -Wall=20
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common=20
-fomit-frame-pointer -g -fno-schedule-insns -fno-schedule-insns2=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/arch/ppc -fsigned-char=20
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring=20
-Wa,-m405   -nostdinc -iwithprefix include=20
-DKBUILD_BASENAME=3Dnand_ids  -DEXPORT_SYMTAB -c nand_ids.c
ppc-linux-gcc -D__KERNEL__=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/include=20
-I/usr/local/eldk/ppc_4xx/usr/lib/gcc-lib/ppc-linux/2.95.4/include -Wall=20
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common=20
-fomit-frame-pointer -g -fno-schedule-insns -fno-schedule-insns2=20
-I/Progetti/chameleon/sw/linuxppc_2_4_devel/arch/ppc -fsigned-char=20
-msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring=20
-Wa,-m405   -nostdinc -iwithprefix include=20
-DKBUILD_BASENAME=3Dppchameleon  -c -o ppchameleon.o ppchameleon.c
ppchameleon.c:146: parse error before `ppchameleon_init'
ppchameleon.c:147: warning: return-type defaults to `int'
ppchameleon.c: In function `ppchameleon_init':
ppchameleon.c:192: warning: assignment from incompatible pointer type
ppchameleon.c:199: too few arguments to function `nand_scan'
ppchameleon.c:215: structure has no member named `data_cache'
ppchameleon.c:216: structure has no member named `data_cache'
ppchameleon.c:223: structure has no member named `cache_page'
ppchameleon.c: At top level:
ppchameleon.c:249: warning: type defaults to `int' in declaration of=20
`module_init'
ppchameleon.c:249: warning: parameter names (without types) in function=20
declaration
ppchameleon.c:249: warning: data definition has no type or storage class
ppchameleon.c:254: parse error before `ppchameleon_cleanup'
ppchameleon.c:255: warning: return-type defaults to `int'
ppchameleon.c: In function `ppchameleon_cleanup':
ppchameleon.c:267: structure has no member named `data_cache'
ppchameleon.c:271: warning: control reaches end of non-void function
ppchameleon.c: At top level:
ppchameleon.c:272: warning: type defaults to `int' in declaration of=20
`module_exit'
ppchameleon.c:272: warning: parameter names (without types) in function=20
declaration
ppchameleon.c:272: warning: data definition has no type or storage class
ppchameleon.c:139: warning: `ppchameleon_device_ready' defined but not used
make[4]: *** [ppchameleon.o] Error 1
make[4]: Leaving directory=20
`/Progetti/chameleon/sw/linuxppc_2_4_devel/drivers/mtd/nand'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory=20
`/Progetti/chameleon/sw/linuxppc_2_4_devel/drivers/mtd/nand'
make[2]: *** [_subdir_nand] Error 2
make[2]: Leaving directory=20
`/Progetti/chameleon/sw/linuxppc_2_4_devel/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory=
 `/Progetti/chameleon/sw/linuxppc_2_4_devel/drivers'
make: *** [_dir_drivers] Error 2


Any suggestions?


Best regards,

llandre
