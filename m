Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18QCMh-000325-00
	for <linux-mtd@lists.infradead.org>; Sun, 22 Dec 2002 20:06:23 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H7J00LPOFWZBC@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 22 Dec 2002 21:36:36 +0100 (MET)
Date: Sun, 22 Dec 2002 21:33:53 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS linker error in kernel 2.4.19
In-reply-to: <200212221921.58531.tglx@linutronix.de>
To: Ilan Pollak <ilanp@galileo.co.il>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212222133.53928.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <PKEDKBLDKFHINBMPOMCHCEBMCHAA.ilanp@galileo.co.il>
 <200212221921.58531.tglx@linutronix.de>
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

On Sunday 22 December 2002 19:21, Thomas Gleixner wrote:
> On Sunday 22 December 2002 17:00, Ilan Pollak wrote:
> > Hi List,
> > i'm porting uClinux 2.4.19-uc1 patched with today's (Dec. 21, 2002) MTD
> > snapshot.
> > If i'm choosing to compile JFFS2 i get this linking problem:
> >
> > arm-elf-ld -p -X -T arch/armnommu/vmlinux.lds
> > arch/armnommu/kernel/head-armv.o arch/armnommu/kernel/init_task.o
> > init/main.o init/version.o init/do_mounts.o \
> >         --start-group \
> >         arch/armnommu/kernel/kernel.o arch/armnommu/mm/mm.o
> > arch/armnommu/mach-firefox/firefox.o kernel/kernel.o mmnommu/mmnommu.o
> > fs/fs.o ipc/ipc.o \
> >          drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
> > drivers/net/net.o drivers/media/media.o drivers/mtd/mtdlink.o \
> >         net/network.o \
> >         arch/armnommu/lib/lib.a
> > /home/ilanp/uClinux-dist/linux-2.4.x/lib/lib.a
> > /usr/local/lib/gcc-lib/arm-elf/2.95.3/libgcc.a \
> >         --end-group \
> >         -o linux
> > fs/fs.o: In function `jffs2_compress':
> > fs/fs.o(.text+0x4d728): undefined reference to `jffs2_rtime_compress'
> > fs/fs.o: In function `jffs2_decompress':
> > fs/fs.o(.text+0x4d7d0): undefined reference to `jffs2_rtime_decompress'
> > make[1]: *** [linux] Error 1
>
> Did you use the patchin script ?
> If no, use it.
> If yes, maybe it's not compatible with uclinux. Check if the Makefile in
> lib is patched with the patch in mtd-source/lib
Sorry, I answered a private mail in parallel. Please check the Makefile in 
fs/jffs2 if it contains a entry to link compr_rtime.o

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
