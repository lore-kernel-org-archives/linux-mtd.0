Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0hil-0001QX-HL
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 10:28:58 -0400
Message-ID: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 27 Aug 2004 09:28:38 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

With kernel 2.4.27 and the snapshot patch from 8/26 (yesterday) I am getting
the following error :

make[1]: Leaving directory
`/usr/src/Lineo/current_build2/linux-2.4.27/arch/i386/lib'
ld -m elf_i386 -T
/usr/src/Lineo/current_build2/linux-2.4.27/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o init/do_mounts.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o
fs/fs.o ipc/ipc.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
drivers/net/net.o drivers/pci/driver.o drivers/mtd/mtdlink.o
drivers/net/pcmcia/pcmcia_net.o drivers/media/media.o \
        net/network.o \
        /usr/src/Lineo/current_build2/linux-2.4.27/arch/i386/lib/lib.a
/usr/src/Lineo/current_build2/linux-2.4.27/lib/lib.a
/usr/src/Lineo/current_build2/linux-2.4.27/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/mtd/mtdlink.o: In function `cfi_intelext_partition_fixup':
drivers/mtd/mtdlink.o(.text+0x76c6): undefined reference to `__ffs'
make: *** [vmlinux] Error 1


Any ideas?

-Brian
