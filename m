Received: from bavaria.muenchen.pop.de
	([195.30.254.66] helo=fallback.pop.de ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kPxX-0000EK-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 15:07:43 +0100
Received: from mail.jena.pop.de ([195.222.197.3])
	by fallback.pop.de with esmtp (Exim 3.20 #1)
	id 17kPxS-0004vT-00
	for linux-mtd@lists.infradead.org; Thu, 29 Aug 2002 16:07:39 +0200
Received: from goepel2.jena.provi.de (goepel2.jena.provi.de [195.222.197.91])
	by mail.jena.pop.de (8.9.3/8.9.3) with ESMTP id QAA26742
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 16:07:02 +0200
Received: from goepel.com (goepel109.goepel [172.16.1.109])
	by goepel2.jena.provi.de (8.10.0/8.10.0) with ESMTP id g7TE70221247
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 16:07:00 +0200
Message-ID: <3D6E2A8D.4000502@goepel.com>
Date: Thu, 29 Aug 2002 16:07:09 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: 2.4.18-rmk7 + CVS jffs2 ld error (zlib)
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

hello...

i know this was discussed some times ago in the list but i'read the old 
threads but no success.
i have kernel 2.4.18-rmk7 and i would like to build it with jffs2 from 
latest CVS. i have patched /patches/patchin.sh with patch from Henrik 
Nordstrom posted today, and applied on the kernel sources. on building i 
get lots of errors at the final linking:

arm/tools/chain/bin/arm-uclibc-ld -p -X -T arch/arm/vmlinux.lds 
arch/arm/kernel/head-armv.o arch/arm/kernel/init_task.o init/main.o 
init/version.o --start-group arch/arm/kernel/kernel.o arch/arm/mm/mm.o 
arch/arm/mach-sa1100/sa1100.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o 
drivers/serial/serial.o drivers/char/char.o drivers/block/block.o 
drivers/misc/misc.o drivers/net/net.o drivers/media/media.o 
drivers/mtd/mtdlink.o net/network.o arch/arm/nwfpe/math-emu.o 
arch/arm/lib/lib.a /usr/arm/krnl-2.4.18-rmk7/lib/lib.a --end-group -o 
vmlinux

fs/fs.o: In function `jffs2_zlib_compress':
fs/fs.o(.text+0x2ab58): undefined reference to `zlib_deflateInit_'
fs/fs.o(.text+0x2abb0): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x2abbc): undefined reference to `zlib_deflateEnd'
fs/fs.o(.text+0x2ac3c): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x2ac78): undefined reference to `zlib_deflateEnd'
fs/fs.o: In function `jffs2_zlib_decompress':
fs/fs.o(.text+0x2ad4c): undefined reference to `zlib_inflateInit_'
fs/fs.o(.text+0x2ad78): undefined reference to `zlib_inflate'
fs/fs.o(.text+0x2ad98): undefined reference to `zlib_inflateEnd'
fs/fs.o: In function `jffs2_garbage_collect_thread':
fs/fs.o(.text+0x363a0): undefined reference to `set_user_nice'
fs/fs.o: In function `jffs2_zlib_init':
fs/fs.o(.text.init+0x16b8): undefined reference to 
`zlib_deflate_workspacesize'
fs/fs.o(.text.init+0x16d8): undefined reference to 
`zlib_inflate_workspacesize'
fs/fs.o(.text.init+0x1700): undefined reference to 
`zlib_inflate_workspacesize'
fs/fs.o(.text.init+0x1720): undefined reference to 
`zlib_deflate_workspacesize'
make: *** [vmlinux] Error 1



so i grepped around in the list archive and found a possible solution to 
remove compr_zlib.o from COMPR_OBJS in jffs2/Makefile. Now after 
rebuilding i get:


/arm/tools/chain/bin/arm-uclibc-ld -p -X -T arch/arm/vmlinux.lds 
arch/arm/kernel/head-armv.o arch/arm/kernel/init_task.o init/main.o 
init/version.o --start-group arch/arm/kernel/kernel.o arch/arm/mm/mm.o 
arch/arm/mach-sa1100/sa1100.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o 
drivers/serial/serial.o drivers/char/char.o drivers/block/block.o 
drivers/misc/misc.o drivers/net/net.o drivers/media/media.o 
drivers/mtd/mtdlink.o net/network.o arch/arm/nwfpe/math-emu.o 
arch/arm/lib/lib.a /usr/arm/krnl-2.4.18-rmk7/lib/lib.a --end-group -o 
vmlinux

fs/fs.o: In function `jffs2_compress':
fs/fs.o(.text+0x29fac): undefined reference to `jffs2_zlib_compress'
fs/fs.o: In function `jffs2_decompress':
fs/fs.o(.text+0x2a0b4): undefined reference to `jffs2_zlib_decompress'
fs/fs.o: In function `jffs2_garbage_collect_thread':
fs/fs.o(.text+0x36040): undefined reference to `set_user_nice'
fs/fs.o: In function `init_jffs2_fs':
fs/fs.o(.text.init+0x1868): undefined reference to `jffs2_zlib_init'
fs/fs.o(.text.init+0x18a4): undefined reference to `jffs2_zlib_exit'
make: *** [vmlinux] Error 1

i tried also to apply the patches from 
ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib on top of 
my kernel but this is something tricky...

so i would like to know if someone has a fast workaround ???

thanks in advance ... Michael Palme
