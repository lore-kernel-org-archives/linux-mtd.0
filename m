Received: from pop3.galileo.co.il ([199.203.130.130] helo=galileo5.galileo.co.il)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Q7yP-0002d7-00
	for <linux-mtd@lists.infradead.org>; Sun, 22 Dec 2002 15:25:02 +0000
Received: from pc22 ([10.2.1.73])
	by galileo5.galileo.co.il (8.12.6/8.12.6) with SMTP id gBMFsxP5002993
	for <linux-mtd@lists.infradead.org>; Sun, 22 Dec 2002 17:54:59 +0200 (GMT-2)
From: "Ilan Pollak" <ilanp@galileo.co.il>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS linker error in kernel 2.4.19
Date: Sun, 22 Dec 2002 18:00:20 +0200
Message-ID: <PKEDKBLDKFHINBMPOMCHCEBMCHAA.ilanp@galileo.co.il>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi List,
i'm porting uClinux 2.4.19-uc1 patched with today's (Dec. 21, 2002) MTD
snapshot.
If i'm choosing to compile JFFS2 i get this linking problem:

arm-elf-ld -p -X -T arch/armnommu/vmlinux.lds
arch/armnommu/kernel/head-armv.o arch/armnommu/kernel/init_task.o
init/main.o init/version.o init/do_mounts.o \
        --start-group \
        arch/armnommu/kernel/kernel.o arch/armnommu/mm/mm.o
arch/armnommu/mach-firefox/firefox.o kernel/kernel.o mmnommu/mmnommu.o
fs/fs.o ipc/ipc.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
drivers/net/net.o drivers/media/media.o drivers/mtd/mtdlink.o \
        net/network.o \
        arch/armnommu/lib/lib.a
/home/ilanp/uClinux-dist/linux-2.4.x/lib/lib.a
/usr/local/lib/gcc-lib/arm-elf/2.95.3/libgcc.a \
        --end-group \
        -o linux
fs/fs.o: In function `jffs2_compress':
fs/fs.o(.text+0x4d728): undefined reference to `jffs2_rtime_compress'
fs/fs.o: In function `jffs2_decompress':
fs/fs.o(.text+0x4d7d0): undefined reference to `jffs2_rtime_decompress'
make[1]: *** [linux] Error 1

any ideas ?
thanks,
ilan.
