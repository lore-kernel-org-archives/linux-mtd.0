Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17x8pm-0004wm-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2002 17:28:18 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: Carlos Mateo <otepas@yahoo.es>, Mark Meade <mark@lakeshoremicro.com>,
   linux-mtd@lists.infradead.org
Subject: Re: Newbie with DOC2000
Date: Thu, 3 Oct 2002 18:28:09 +0200
References: <20021003161000.41499.qmail@web13605.mail.yahoo.com>
In-Reply-To: <20021003161000.41499.qmail@web13605.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200210031828.09766.hno@marasystems.com>
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

You only need the MSYS firmware installed in the DOC if you want to boot from 
the DOC or access it from DOS as a DOS drive..

For Linux use you should probably consider installing the GRUB based DOC 
firmware...

The EBDA error is related to having a too old LILO version I think. Have never 
used LILO in a DOC system, only GRUB. The current CVS versions of GRUB works 
fine in systems having a MSYS DOC firmware installed.

Regards
Henrik


Carlos Mateo wrote:
> Mark,
> My system log says:
>
> M_Systems DiskOnChip driver. (C) 1999 Machine Vision
> Holdings, Inc.
> Using configured probe address 0xd000
> Possible DiskOnChip with unknown ChipID 63 found at
> 0xd000
> M-Systems NAND Flash Translation layer driver.  (C)
> 1999 MVHI
> $Id:nftl.c, v 1.57 2000/12/01 17:51:54 dwww2 Exp $
>
> I have noticed that I can only boot when there is no
> firmware in the DOC.  When I use the firmware (5.1.2)
> for linux, I cannot boot, because when lilo tries to
> take control, I get a "EBDA too big" error.
>
>  --- Mark Meade <mark@lakeshoremicro.com> escribió: >
> Carlos,
>
> > What does your system log say?  Run dmesg and see if
> > the DoC was detected
> > correctly, and if the nftl driver found any
> > partitions.
> >
> > Also check your /dev entries for nftla: nftla should
> > be 93,0; /dev/nftla1
> > should be 93,1.. etc.
> >
> > Mark
> >
> > Carlos Mateo wrote:
> > > I am trying to access a DOC2000, but I failed so
> >
> > far.
> >
> > > I am using kernel 2.4.4.  I have recompiled it
> >
> > with
> >
> > > DOC support (M-Sys DOC200, Direct char device
> >
> > access
> >
> > > to MTD devices, FTL support, NTFL support and
> >
> > write
> >
> > > support for NTFL).
> > > The kernel boots fine, but I am not able to do
> > > anything with the DOC (fdisk, mke2fs...).
> > >
> > > Any hints on what I should do?
> > >
> > > Thank you
>
> _______________________________________________________________
> Yahoo! Messenger
> Nueva versión: Webcam, voz, y mucho más ¡Gratis!
> Descárgalo ya desde http://messenger.yahoo.es
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
