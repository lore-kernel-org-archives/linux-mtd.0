Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Wdqi-0002U6-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:03:12 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403E63F4C@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: RE: Applying MTD to 2.2.x kernel, with more info 
Date: Tue, 14 Aug 2001 09:02:57 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi again,

sorry to bother you again. The patch help me to go a little further, but it
does not compile all the way through ... I have added the compile output
after my message ...

An other question, do you know wich option I have to set to support this
flash :

	Flash STMicroelectronics Part number M58LW064A150N1T, package
TSOP-56
	manufacturer code = 0x20h
	device code = 0x17h

For the moment its not the important part ... I have to be able to compile
the kernel with MTD support after that I will find wich params I need to
make it to work ... but for the moment I cant compile the driver. For the
moment I have added the CFI support and I have set the debug level to 3
thats all.



Output ::


/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586 -DUTS_MACHINE='"i386"' -c -o init/version.o
init/version.c
make -C  kernel
make[1]: Entering directory `/usr/src/linux-2.2.18/kernel'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.18/kernel'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.18/kernel'
make[1]: Leaving directory `/usr/src/linux-2.2.18/kernel'
make -C  drivers
make[1]: Entering directory `/usr/src/linux-2.2.18/drivers'

<... SNIP ...>

make -C mtd
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd'
make -C chips
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make -C maps
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make -C devices
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make -C nand
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/nand'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/nand'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/nand'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/nand'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd'
make -C scsi
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/scsi'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/scsi'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/scsi'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/scsi'

<... SNIP ...>

make -C  arch/i386/lib
make[1]: Entering directory `/usr/src/linux-2.2.18/arch/i386/lib'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.18/arch/i386/lib'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.18/arch/i386/lib'
make[1]: Leaving directory `/usr/src/linux-2.2.18/arch/i386/lib'
/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -E -C -P
-I/usr/src/linux/include -imacros
/usr/src/linux/include/asm-i386/page_offset.h -Ui386 arch/i386/vmlinux.lds.S
>arch/i386/vmlinux.lds
ld -m elf_i386 -T /usr/src/linux/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
	--start-group \
	arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o
fs/fs.o ipc/ipc.o \
	fs/filesystems.a \
	net/network.a \
	drivers/block/block.a drivers/char/char.o drivers/misc/misc.a
drivers/net/net.a drivers/scsi/scsi.a drivers/cdrom/cdrom.a
drivers/pci/pci.a drivers/video/video.a \
	/usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/i386/lib/lib.a \
	--end-group \
	-o vmlinux
init/main.o: In function `do_basic_setup':
init/main.o(.text.init+0xdc9): undefined reference to `init_mtd'
make: *** [vmlinux] Error 1






Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: August 13, 2001 7:54 PM
> To: Patrick Allaire
> Cc: Vipin Malik; linux-mtd@lists.infradead.org
> Subject: Re: Applying MTD to 2.2.x kernel, with more info 
> 
> 
> 
> It _should_ all work in 2.2, even as modules. But I don't 
> test it often. I 
> really ought to verify it and fix the bits which break, then 
> feed it to Alan 
> for 2.2.next.
> 
> 
> pallaire@gameloft.com said:
> > 		chipreg.c: In function `do_map_probe':
> > 		chipreg.c:67: parse error before `do'
> 
> 67:	if (!drv && !request_module(name)) {
> 
> 2.2 defines request_module as do{}while(0) ifndef 
> CONFIG_KMOD. Which is 
> broken.
> 
> Index: include/linux/kmod.h
> ===================================================================
> RCS file: /inst/cvs/linux/include/linux/kmod.h,v
> retrieving revision 1.3
> diff -u -r1.3 kmod.h
> --- include/linux/kmod.h	2000/12/04 15:09:02	1.3
> +++ include/linux/kmod.h	2001/08/13 23:53:05
> @@ -13,7 +13,10 @@
>  #else
>  #include <linux/errno.h>
>  
> -#define request_module(x) do {} while(0)
> +static inline int request_module(const char *name)
> +{
> +	return -EINVAL;
> +}
>  static inline int exec_usermodehelper(char *program_path, 
> char *argv[], char *envp[])
>  {
>          return -EACCES;
> 
> 
> --
> dwmw2
> 
> 
