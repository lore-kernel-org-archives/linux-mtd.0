Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a6Yl-00005d-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 04:23:31 +0100
Message-ID: <00f801c2390a$d956dd40$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <tglx@linutronix.de>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <6562.1028118221@redhat.com> <10399.1028120646@redhat.com> <0H04006C5M7GUI@smtp-out.bhp.t-online.de>
Subject: Re: do i have to "eraseall" first?
Date: Thu, 1 Aug 2002 11:23:47 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

dear all,

the only different config settings is CONFIG_JFFS2_FS_NAND
but there is no "CONFIG_JFFS2_FS_NAND" in source of jffs2/mtd here!!
(i'm using lastest jffs2/mtd source from cvs)
please help

i also tryed:
cp -r * /mnt/bla
but still get "magic bitmask not found" while re-mounting(umount/mount)
jffs2

where to get a version of eraseall that will set "jffs2 formatted" info in
the OOB area?

thanks in advanced!:)

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "David Woodhouse" <dwmw2@infradead.org>; "??" <kevin@gv.com.tw>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, August 01, 2002 2:33 AM
Subject: Re: do i have to "eraseall" first?


> On Wednesday, 31. July 2002 15:04, David Woodhouse wrote:
> > kevin@gv.com.tw said:
> > >  now it report many "magic bitmask not found" do i have to do
> > > something like "eraseall /dev/mtdblock1" before "cp test.img /dev/
> > > mtdblock1"?
> >
> > Yes. eraseall /dev/mtd1. I don't remember how you are supposed to write
the
> > images so the ECC is correct. Thomas?
> cp test.img /dev/mtdblock1 should write ecc correct, if it's configured
> correctly. See
> http://www.linux-mtd.infradead.org/tech/nand.html
>
> But eraseall does not set the block is erased and "jffs2 formatted" info
in
> the OOB area, which leads to "magic bitmask not found".
>
> We decided some time ago, that erase, invoked from the shell, _CANNOT_ do
> this on it's own, because it will not know, which filesystem is going to
be
> mounted.
>
> The information is set, when erase is controlled by jffs2.
>
> The only safe way to do it, is
> cd yourstuff
> cp -r * /mnt/bla
>
> or you tell your bootloader to do it.
>
> --
> Thomas
> ___________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
