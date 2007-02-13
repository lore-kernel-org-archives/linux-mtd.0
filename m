Received: from web52016.mail.yahoo.com ([206.190.49.248])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGwYI-00055O-Gy
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 07:14:32 -0500
Message-ID: <20070213120749.48556.qmail@web52016.mail.yahoo.com>
Date: Tue, 13 Feb 2007 04:07:49 -0800 (PST)
From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: JFFS2 Root Filesystem and Linux 2.6.19
To: linux-mtd@lists.infradead.org
In-Reply-To: <53943.37121.qm@web51903.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

The problem I was observing has resolved itself with
the release of 2.6.20 (???).

...doug

--- Doug Kehn wrote:

> Hi All,
> 
> Some additional information/clarification.
> 
> > --- Doug Kehn wrote:
> > 
> > > Hi All,
> > > 
> > > Target: ADI Coyote, Intel XScale IXP-425,
> > bigendian
> > > Source: uClinux-dist-test-20070108
> > >            Linux 2.6.19
> > >            uClibc 0.9.27
> > >            Busybox 1.0.0
> > > Toolchain: arm-linux-tools-20061213
> > >               binutils-2.16
> > >               gcc-3.4.4
> > >               glibc-2.3.3
> > >               glibc-linuxthreads-2.3.3
> > > 
> > > When the kernel is configured for a jffs2
> rootfs,
> > > some
> > > apps fail to load with either a Segment Fault or
> > > "'/lib' is not an ELF file" the first time they
> > are
> > > executed.  The second and subsequent executions
> of
> > > the
> > > same app work properly.  Attached is a sample
> boot
> > > log.  MTD and JFFS2 debugging information has
> been
> > > enabled.
> > > 
> > > If, on the other hand, the kernel is configured
> > for
> > > an
> > > initrd and the jffs2 partition is mounted with
> > > 'mount'
> > > after boot, this error does not occur.
> > > 
>  
> I should have said if the rootfs is a ramdisk,
> sorry. 
> The stock kernel command line for ADI Coyote in
> uClinux is:
>  
> CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/ram0
> initrd=0x00800000,8M mem=64M@0x00000000"
>  
> Then from the shell:
>  
> # mount -n -t jffs2 -o rw,noatime /dev/mtdblock2
> /mnt/jffs2
>  
> Then running /mnt/jffs2/bin/<app> does not produce
> the error.
> 
> I then tried an initrd with a kernel command line of
>  
> CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/ram0
> init=/linuxrc rw initrd=0x03E00000,1M
> mem=64M@0x00000000"
>  
> and a linuxrc of
>  
> #!/bin/sh
> echo"initrd: mounting jffs2 rootfs
> mkdir /jffs2
> mount -n -t jffs2 -o rw,noatime /dev/mtdblock2
> /jffs2
> echo "initrd: starting rootfs"
> cd /jffs2
> [ -d initrd ] || mkdir initrd
> pivot_root . initrd
> exec chroot . /sbin/init <dev/console >dev/console
> 2>&1
>  
> The error still occurs with this scheme.
>  
> > > I've posted to the uClibc group and the uClinux
> > > group.
> > >  My posts to these groups contain additional
> > detail
> > > as
> > > well as additional traces (included as
> > attachments).
> > > 
> > > I thought it easier to provide links (see below)
> > > than
> > > to include all the information here.  If this is
> > not
> > > the case, I'll compile all the information in to
> > one
> > > big post here.
> > > 
> > > The uClibc thread is -- Bummer: could not find!
> > >
> >
>
http://www.uclibc.org/lists/uclibc/2007-January/017086.html
> > > 
> > > The uClinux thread is --
> > uClinux-dist-test-20070108:
> > > Problems with jffs2 rootfs
> > >
> >
>
http://mailman.uclinux.org/pipermail/uclinux-dev/2007-January/041699.html
> > > 
> > > Any assistance will be appreciated.
> > > 
> > > Thanks,
> > > ...doug
> > > 
> > 
> > 
> > 
> >  
> > 
> 
> 
>  
>
____________________________________________________________________________________
> Food fight? Enjoy some healthy debate 
> in the Yahoo! Answers Food & Drink Q&A.
>
http://answers.yahoo.com/dir/?link=list&sid=396545367
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 



 
____________________________________________________________________________________
We won't tell. Get more on shows you hate to love 
(and love to hate): Yahoo! TV's Guilty Pleasures list.
http://tv.yahoo.com/collections/265 
