Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Hr5Q-0002oF-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 19:46:04 +0000
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de [10.0.0.13])
	by mail.berlin.imc-berlin.de (8.12.3/8.12.3) with ESMTP id gATIIYLT016897
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 19:18:34 +0100
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id VAA07076
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 21:16:35 +0100 (CET)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3DE7CB23.5535F5E6@imc-berlin.de>
Date: Fri, 29 Nov 2002 21:16:35 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: undefined reference to 'crc32' ?
Content-Type: text/plain; charset=us-ascii
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

Hi there,

I am using linux 2.4.20 on a powerpc platform. 

I just pulled the recent CVS, run patchin.sh on it and tried to build a new
kernel image.
But I get load of these:

ppc_8xx-ld -T arch/ppc/vmlinux.lds -Ttext 0xc0000000 -Bstatic
arch/ppc/kernel/head_8xx.o init/main.o init/version.o init/do_mounts.o \
        --start-group \
        arch/ppc/kernel/kernel.o arch/ppc/platforms/platform.o arch/ppc/mm/mm.o
arch/ppc/lib/lib.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o
arch/ppc/math-emu/math-emu.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
drivers/net/net.o drivers/media/media.o drivers/ide/idedriver.o
drivers/mtd/mtdlink.o drivers/pcmcia/pcmcia.o drivers/macintosh/macintosh.o
arch/ppc/8xx_io/8xx_io.o \
        net/network.o \
        /home/scholz/Projekte/linuxppc-2.4.20/lib/lib.a \
        --end-group \
        -o vmlinux
fs/fs.o: In function `jffs2_symlink':
fs/fs.o(.text+0x69194): undefined reference to `crc32'
fs/fs.o(.text+0x69194): relocation truncated to fit: R_PPC_REL24 crc32
fs/fs.o(.text+0x691b4): undefined reference to `crc32'
fs/fs.o(.text+0x691b4): relocation truncated to fit: R_PPC_REL24 crc32
fs/fs.o(.text+0x691c8): undefined reference to `crc32'
fs/fs.o(.text+0x691c8): relocation truncated to fit: R_PPC_REL24 crc32
fs/fs.o(.text+0x6933c): undefined reference to `crc32'
fs/fs.o(.text+0x6933c): relocation truncated to fit: R_PPC_REL24 crc32
fs/fs.o(.text+0x69388): undefined reference to `crc32'
fs/fs.o(.text+0x69388): relocation truncated to fit: R_PPC_REL24 crc32
fs/fs.o(.text+0x6939c): more undefined references to `crc32' follow
fs/fs.o: In function `jffs2_symlink':
....


What could that be? 
crc32.o got build...

> ls -l fs/jffs2/crc32.o
-rw-r--r--    1 scholz   devel        1736 Nov 29 21:07 fs/jffs2/crc32.o

Thanks,

Steven
