Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ndK3-0003Sz-00
	for mtd-list@infradead.org; Fri, 05 May 2000 09:18:55 +0100
Message-ID: <3912853F.F5BC6281@zentropix.com>
Date: Fri, 05 May 2000 09:24:31 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: Paonia Ezrine <paonia@home.welcomehome.org>
CC: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: read only
References: <200005041741.NAA23266@home.welcomehome.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Paonia Ezrine wrote:
> 
> >
> > paonia@home.welcomehome.org said:
> > > I am looking to use the DOC or similar with lrp. Is there a way to set
> > > the device to read only mode so that no one can hack with it. I dont
> > > mean a software setting but a hardware one. Also which DOC or similar
> > > would people project for this application. Porlby need 2-20 megs.
> >
> > Not in hardware AFAIK - at least not simply by cutting control lines -
> > you'd have to have some intelligence in between your system bus and the
> > DiskOnChip. (logic: when the host writes to location 0x1004 in the device,
> > you ensure that bit 3 (WP) is _always_ set - mask it in if the host didn't
> > set it.)
> >
> > However, it's quite feasible to cut out the write capability in the device
> > driver, so that an attacker would have to load his own driver for it if he
> > wanted to write to it. That would probably be enough for your purposes.
> >
> > I've been intending to do that for a while now anyway - as it would mean I
> > could mark the write support as experimental.
> >
> > In fact, read-only support is all I'd really want people to use the MTD
> > DiskOnChip driver for right now.
> >
> > --
> > dwmw2
> >
> >
> I am not sure how I would update the image then. And also garentee that
> noone else can.
> Thanks
> Paonia
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
Just a couple of thoughts: 
a)	you could use two kernels, one with write support, one without and
default boot the 
	read-only one via LILO/GRUB etc. Then you could select the one with
write support on 
	boot-up when you need to. A bit wasteful on disk space and ultimatly
not very secure but it 
	would do what you want.
b)	Break the write support out into a kernel loadable module and load it
as and when required.

BTW: Should the TODO list contain 'develop the driver as a KLM'?

Best regards

Trevor.
-- 
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
