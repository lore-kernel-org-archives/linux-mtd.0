Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1Eoe-0007F0-UK
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 21:21:25 -0500
Received: by wproxy.gmail.com with SMTP id 37so14780wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2005 18:21:17 -0800 (PST)
Message-ID: <43507b7c0502151821309e9e51@mail.gmail.com>
Date: Tue, 15 Feb 2005 20:21:17 -0600
From: Sean Kelley <sean.sweng@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1108478378.19262.603.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <43507b7c0502141847134e1e68@mail.gmail.com>
	<1108453685.22597.30.camel@baythorne.infradead.org>
	<43507b7c05021506077ab223aa@mail.gmail.com>
	<1108478378.19262.603.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Linux MTD and NFTL - Question
Reply-To: Sean Kelley <sean.sweng@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One other idea is to do a loopback-type of mechanism by placing an
image file that contains a FAT volume as a file in JFFS2, basically
using JFFS2 to replace the FTL.  The downside is that if the FAT is
meant to be RW, it will still have corruption  problems.  I would need
a scandisk utility on my embedded device to repair the FAT image!  It
is imazing the kind of hoops we jump through just so that Joe User can
plug the device into his windows machine.

Thanks for the links!

Sean   


On Tue, 15 Feb 2005 14:39:38 +0000, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2005-02-15 at 08:07 -0600, Sean Kelley wrote:
> > Thank you for your reply.  I would like to ship a product without a
> > CD.  USB mass storage allows you that option.  I am not familiar with
> > the file system profile.  Is this something similar to a PC side
> > driver which can understand JFFS2?
> 
> It's a PC side driver which can understand a file system. I haven't
> investigated it much -- all I know is what David Brownell said when I
> last said "wouldn't it be nice if...' last March:
> 
> (Message-ID: <40644FCA.8000206@pacbell.net> on linux-kernel)
> 
> On Fri, 2004-03-26 at 07:44 -0800, David Brownell wrote:
> > David Woodhouse wrote:
> > >
> > > Out of interest -- have they (or has anyone else) invented a 'file
> > > system' USB device yet? For exporting some file systems, pretending to
> > > be a block device really isn't very useful.
> >
> > There's a file system protocol used by many digital still cameras,
> > which isn't actually camera-specific.  Not MSFT-specific either.
> >
> > Originally called "Picture Transfer Protocol" (PTP) it's actually
> > more of a remote hierarchical filesystem protocol ... with an event
> > channel (handy for "new picture" or "inserted new flash memory")
> > and some built-in search capabilities ("what JPGs do you have").
> > The strangest capability was a file type tag, which isn't actually
> > that bizarre.
> >
> > As with RNDIS, and USB Mass Storage, I understand that support for
> > PTP is part of MS-Windows since about Win2K.  So a PTP gadget
> > driver would probably be a useful contribution to Linux.
> 
> A quick google shows an old host-side implementation for Linux at
> http://www.michaelminn.com/?linux/mmptp/README.html but no slave
> implmentation yet.
> 
> --
> dwmw2
> 
>
