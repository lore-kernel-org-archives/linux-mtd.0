Received: from ns2.arlut.utexas.edu ([146.6.211.1])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj0W7-0006eR-Ub
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 18:22:24 +0000
From: "Matthew S. McClintock" <mattsm@arlut.utexas.edu>
To: Mark Richards <markr@massmicro.com>
In-Reply-To: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
References: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
Content-Type: text/plain
Message-Id: <1074622804.4726.0.camel@chuck.arlut.utexas.edu>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 12:20:05 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got the same problem. I just edited out the offending lines since they
did not effect me. I was unable to determine the problem by looking at
the contents of the file.

Matthew

On Tue, 2004-01-20 at 12:04, Mark Richards wrote:
> David,
> 
> This may now be better referenced under a different subject line perhaps,
> but here goes...
> 
> I set up a fresh source tree in order that I might enable SYSRQ and build
> with the very latest MTD drivers.
> 
> 1. Got latest via CVS
> 2. In the mtd/patches/ directory, ran:
>   sh patchin.sh /usr/src/linux 
> 3. Then put in my current .config file into /usr/src/linux (link to my new
> source tree) and ran make xconfig.
> 
> The following happened:
> [root@localhost linux]# make xconfig
> rm -f include/asm
> ( cd include ; ln -sf asm-i386 asm)
> make -C scripts kconfig.tk
> make[1]: Entering directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> cat header.tk >> ./kconfig.tk
> ./tkparse < ../arch/i386/config.in >> kconfig.tk
> drivers/mtd/chips/Config.in: 14: unknown command
> make[1]: *** [kconfig.tk] Error 1
> make[1]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> make: *** [xconfig] Error 2
> 
> It appeared that something was mangled by running patchin.  So I created a
> new tree and first ran make xconfig, which worked fine, then applied patchin
> and then ran make xconfig again.  
> 
> Here's the sequence:
> 
> 
> [root@localhost linux]# make xconfig
> rm -f include/asm
> ( cd include ; ln -sf asm-i386 asm)
> make -C scripts kconfig.tk
> make[1]: Entering directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -c -o tkparse.o
> tkparse.c
> gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -c -o tkcond.o
> tkcond.c
> gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -c -o tkgen.o tkgen.c
> gcc -o tkparse tkparse.o tkcond.o tkgen.o
> cat header.tk >> ./kconfig.tk
> ./tkparse < ../arch/i386/config.in >> kconfig.tk
> echo "set defaults \"arch/i386/defconfig\"" >> kconfig.tk
> echo "set ARCH \"i386\"" >> kconfig.tk
> cat tail.tk >> kconfig.tk
> chmod 755 kconfig.tk
> make[1]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> wish -f scripts/kconfig.tk
> [root@localhost linux]# cd ../mtd
> [root@localhost mtd]# ls
> boot     drivers  grub     INSTALL  Makefile            patches
> COPYING  ffs2     html     kernel   mtd-jffs-HOWTO.txt  README
> CVS      fs       include  lib      obsolete            util
> [root@localhost mtd]# cd patches
> [root@localhost patches]# sh patchin.sh /usr/src/linux
> Patching /usr/src/linux
> Include Filesytems: no
> Zlib-Patch needed: no
> Method: Link
> Can we start now ? [y/N]y
> 
> Patching MTD
> drivers/mtd
> drivers/mtd/chips
> drivers/mtd/devices
> drivers/mtd/maps
> drivers/mtd/nand
> include/linux/mtd
> Patching done
> Please update Documentation/Configure.help from
> /usr/src/mtd/Documentation/Configure.help
> [root@localhost patches]# cd ../linux
> bash: cd: ../linux: No such file or directory
> [root@localhost patches]# cd ../..
> [root@localhost src]# cd linux
> [root@localhost linux]# make xconfig
> rm -f include/asm
> ( cd include ; ln -sf asm-i386 asm)
> make -C scripts kconfig.tk
> make[1]: Entering directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> cat header.tk >> ./kconfig.tk
> ./tkparse < ../arch/i386/config.in >> kconfig.tk
> drivers/mtd/chips/Config.in: 14: unknown command
> make[1]: *** [kconfig.tk] Error 1
> make[1]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/scripts'
> make: *** [xconfig] Error 2 [root@localhost linux]#
> 
> 
> Is it something I'm missing?  My kernel sources are the 2.4.24 (latest).
> 
> 
> Mark Richards
> 
> 
> > -----Original Message-----
> > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > Sent: Tuesday, January 20, 2004 09:07
> > To: Mark Richards
> > Cc: linux-mtd@lists.infradead.org
> > Subject: Re: MTD - DOC 2000 freezes on umount
> > 
> > On Mon, 2004-01-19 at 21:23 -0500, Mark Richards wrote:
> > > I've been through several good learning experiences getting my
> > development
> > > system set up to work with a DOC 2000 for an embedded project.  I've
> > finally
> > > settled on a RedHat 7.2 distribution and the 2.4.24 kernel.  All worked
> > well
> > > with the MTD drivers in several other setups: RedHat 9, Mandrake 9.2,
> > but
> > > for reasons I can't yet fathom, the MTD drivers seem a bit unstable in
> > this
> > > particular kernel.
> > >
> > > Most frequently when I perform a umount /mnt/doc (doc being the mount
> > point)
> > > the shell session freezes (the umount command does not return a prompt).
> > 
> > Hit SysRq-P and/or SysRq-T to see precisely where it's locked up.
> > 
> > 
> > > I tried in one kernel build to apply the latest sources to my source
> > tree
> > > using the instructions (and the shell script) but this caused a compile
> > > failure.
> > 
> > Insufficient information to diagnose.
> > 
> > --
> > dwmw2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Matthew S. McClintock <mattsm@arlut.utexas.edu>
