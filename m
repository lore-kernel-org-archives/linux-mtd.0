Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X6F1-0007gH-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 20:58:59 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
	by dummy.ddiworldwide.com (Postfix) with SMTP id 61955162F75
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 13:25:18 -0500 (EST)
Received: from plinux.ddiworldwide.com (plinux [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id EF2A7162F74
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 13:25:17 -0500 (EST)
Content-Type: text/plain;
  charset="us-ascii"
From: Frank R Callaghan <f.callaghan@ieee.org>
Reply-To: f.callaghan@ieee.org
To: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: JFFS linker error in kernel 2.4.19
Date: Fri, 10 Jan 2003 16:27:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200301101627.20417.f.callaghan@ieee.org>
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

Hi List,

I'm compiling linux 2.4.19 patched with today's CVS MTD patched
with the patching script
(that states 'no Include Filesytems: yes; Zlib-Patch needed: no)

ld -m elf_i386 -T /home/rtlinux/rtai/linux-2.4.19/arch/i386/vmlinux.lds -e 
stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o 
init/version.o init/do_mounts.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o 
fs/fs.o ipc/ipc.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o 
drivers/net/net.o drivers/media/media.o drivers/ide/idedriver.o 
drivers/mtd/mtdlink.o \
        net/network.o \
        /home/rtlinux/rtai/linux-2.4.19/arch/i386/lib/lib.a 
/home/rtlinux/rtai/linux-2.4.19/lib/lib.a 
/home/rtlinux/rtai/linux-2.4.19/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
fs/fs.o: In function `jffs2_compress':
fs/fs.o(.text+0x5fc59): undefined reference to `zlib_compress'
fs/fs.o: In function `jffs2_decompress':
fs/fs.o(.text+0x5fced): undefined reference to `zlib_decompress'
fs/fs.o(.text+0x5fd18): undefined reference to `dynrubin_decompress'
make: *** [vmlinux] Error 1


Any Ideas ?

TIA,
    Frank.
