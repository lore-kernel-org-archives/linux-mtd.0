Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cD2q-0007gO-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 23:43:16 +0100
Message-ID: <3D505134.47477658@esteem.com>
Date: Tue, 06 Aug 2002 15:44:04 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
   MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Need help getting JFFS2 working with kernel 2.4.19
References: <3D4FFA9B.2C693A02@esteem.com>  <3D4EDA18.C77AEDA@esteem.com> <25573.1028653616@redhat.com> <3D5028B7.22893B6E@esteem.com>
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

Conn Clark wrote:
> 
> David Woodhouse wrote:
> >
> > clark@esteem.com said:
> > >
> > >       I figured it out. The jffs2 zlib was conflicting with the zlib used
> > > bye ppp compresion. I just had to remove zlib.o from the COMPR_OBJS
> > > definition in the Makefile.
> >
> > There's a better fix in 2.4.20-pre2 and at
> > ftp.kernel.org:/pub/linux/kernel/people/dwmw2/shared-zlib/
> >
> > Get the latest patch (2.4.19-pre10) and it should apply to most 2.4 kernels.
> >
> > --
> > dwmw2
> 
> I take it that this patch wasn't submitted to Marcelo or Marcelo didn't get
> it integrated the final 2.4.19 then?
> 
> Is there anything else I need to do or will the patch fix everything?
> 
> Thanks
> 
>         Conn
> 

I applied the patch and now it won't compile again.


here is what the compiler pukes out.

ppc_8xx-ld -T arch/ppc/vmlinux.lds -Ttext 0xc0000000 -Bstatic
arch/ppc/kernel/head_8xx.o init/main.o init/version.o init/do_mounts.o \
	--start-group \
	arch/ppc/kernel/kernel.o arch/ppc/mm/mm.o arch/ppc/lib/lib.o kernel/kernel.o mm/mm.o
fs/fs.o ipc/ipc.o arch/ppc/math-emu/math-emu.o \
	 drivers/char/char.o drivers/block/block.o drivers/misc/misc.o drivers/net/net.o
drivers/media/media.o drivers/mtd/mtdlink.o drivers/pcmcia/pcmcia.o
drivers/macintosh/macintosh.o arch/ppc/8xx_io/8xx_io.o \
	net/network.o \
	/192esrc/area51/linux-2.4.19/lib/lib.a \
	--end-group \
	-o vmlinux
fs/fs.o: In function `zlib_compress':
fs/fs.o(.text+0x42c30): undefined reference to `zlib_deflateInit_'
fs/fs.o(.text+0x42c30): relocation truncated to fit: R_PPC_REL24 zlib_deflateInit_
fs/fs.o(.text+0x42cd4): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x42cd4): relocation truncated to fit: R_PPC_REL24 zlib_deflate
fs/fs.o(.text+0x42ce4): undefined reference to `zlib_deflateEnd'
fs/fs.o(.text+0x42ce4): relocation truncated to fit: R_PPC_REL24
zlib_deflateEndfs/fs.o(.text+0x42d4c): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x42d4c): relocation truncated to fit: R_PPC_REL24 zlib_deflate
fs/fs.o(.text+0x42d58): undefined reference to `zlib_deflateEnd'
fs/fs.o(.text+0x42d58): relocation truncated to fit: R_PPC_REL24
zlib_deflateEndfs/fs.o: In function `zlib_decompress':
fs/fs.o(.text+0x42e24): undefined reference to `zlib_inflateInit_'
fs/fs.o(.text+0x42e24): relocation truncated to fit: R_PPC_REL24 zlib_inflateInit_
fs/fs.o(.text+0x42e80): undefined reference to `zlib_inflate'
fs/fs.o(.text+0x42e80): relocation truncated to fit: R_PPC_REL24 zlib_inflate
fs/fs.o(.text+0x42ea4): undefined reference to `zlib_inflateEnd'
fs/fs.o(.text+0x42ea4): relocation truncated to fit: R_PPC_REL24
zlib_inflateEndfs/fs.o: In function `jffs2_zlib_init':
fs/fs.o(.text.init+0x1868): undefined reference to `zlib_deflate_workspacesize'
fs/fs.o(.text.init+0x1868): relocation truncated to fit: R_PPC_REL24
zlib_deflate_workspacesize
fs/fs.o(.text.init+0x1890): undefined reference to `zlib_deflate_workspacesize'
fs/fs.o(.text.init+0x1890): relocation truncated to fit: R_PPC_REL24
zlib_deflate_workspacesize
fs/fs.o(.text.init+0x18a8): undefined reference to `zlib_inflate_workspacesize'
fs/fs.o

Blah Blah Blah.

I take it there are still a few more things I must do?

here is some additional info on my system.
My processor is a PPC MPC850.
My flash chip 1 intel 28F320C3B 16 bit mode

Thanks

	Conn
-- 

*****************************************************************
  If you live at home long enough, your parents will move out.
 (Warning they may try to sell their house out from under you.)
*****************************************************************

Conn Clark
Engineering Stooge				clark@esteem.com
Electronic Systems Technology Inc.		www.esteem.com

Stock Ticker Symbol				ELST

"clark@esteem.com" Copyright 2000 By Electronic Systems Technology
 This email address may be used to communicate to Conn Clark
 provided it is not being used for advertisement purposes, unless
 prior written consent is given. This email address may not be 
 sold under any circumstances. All other rights reserved.
