Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15We4A-0002Vb-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:17:07 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403E63FB2@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: RE: Applying MTD to 2.2.x kernel, with more info 
Date: Tue, 14 Aug 2001 09:16:58 -0400
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

I am not sure I understand what you are telling me ... I am currently
compiling on 2.2.18 so I dont need the patch to call init_mtd ? So whot do I
need to change in mtdcore.c ?

here is the process I followed to compile the kernel :

-untar-unzip kernel 2.2.18
-made asm symbolic link
-applied the MTD patch : mtd-patch-2.2.18-20001218-2230GMT.bz2
-downloaded CVS version on MTD
-updated MTD with script : ./patchin.sh /usr/src/linux
-added your patch for the request_module
-now it hang on init_mtd ...

those problems I am having seem related to modules, but I am compiling in
the kernel.

once again thank you for your time.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: August 14, 2001 9:12 AM
> To: Patrick Allaire
> Cc: Vipin Malik; linux-mtd@lists.infradead.org
> Subject: Re: Applying MTD to 2.2.x kernel, with more info 
> 
> 
> 
> pallaire@gameloft.com said:
> > init/main.o: In function `do_basic_setup': 
> init/main.o(.text.init+0xdc9
> > ): undefined reference to `init_mtd' make: *** [vmlinux] Error 1 
> 
> 2.2.18 has the sane initcalls backported from 2.4, so you 
> don't need the 
> patch to call init_mtd(). Which is actually called init_mtd_devices() 
> afaict.
> 
> --
> dwmw2
> 
> 
