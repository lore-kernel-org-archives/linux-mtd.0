Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lG4v-0007UK-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 21:10:01 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: ian.nelson@echostar.com, "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Proc stuff
References: <3ACC986E.DE2F4C61@echostar.com> <3ACBA4C2.DDED5432@echostar.com> <27773.986474836@redhat.com> <22237.986488421@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Apr 2001 14:09:42 -0600
In-Reply-To: David Woodhouse's message of "Thu, 05 Apr 2001 17:33:41 +0100"
Message-ID: <m31yr7ds6x.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <dwmw2@infradead.org> writes:

> ian.nelson@echostar.com said:
> >  Maybe the solution is to create a /proc/mtd directory and then have a
> > few different files in there which can either be generic or specific.
> > There are other places in the kernel that do this so it's un
> > unprecedented.  /proc is nice and easy to read so you can build
> > scripts and simple things to read it. An ioctl could also work. 
> 
> /proc is nicer, if we really have to do it. How about /proc/driver/mtd/$n,
> each one containing something along the lines of...
> 
> name: "blah"
> size: 0x1000000
> erasesize: 0x10000
> 
> The standard lines can be provided by a generic function, and we add a
> proc_filler method to the mtd_info stucture which overrides that to allow
> you to do whatever else you want.
> 
> Actually, mtdfs is probably nicer than adding yet more cruft to /proc. 

Espeically in the context of embedded systems where sometimes you want
the option to compile out as much as you can.  With /proc it is a
giant growing lump, with a mtdfs, you can include it if you need it.

Long term I think the tradeoff between a 256 line fstab for a million
in kernel filesystems you might need on a big server with everything,
versus 100+ mandatory kilobytes and growing for /proc is a good one.

Eric


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
