Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lCJk-0005kv-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 17:09:04 +0100
Message-ID: <3ACC986E.DE2F4C61@echostar.com>
Date: Thu, 05 Apr 2001 10:08:14 -0600
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
        "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Proc stuff
References: <3ACBA4C2.DDED5432@echostar.com> <27773.986474836@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> ian.nelson@echostar.com said:
> > I need some extra bits added to the proc/mtd.  For the product I'm
> > building we want to have things from the flash registers like the
> > Device ID and "AMD flash"
>
> Those aren't particularly generic bits of information - why do you think
> they should be present at that level? That kind of detail is reported in the
> boot messages, not in /proc/mtd. Does your eth0 device provide a way to find
> out which chipset it is?

Actually, it does now.    I thought about parsing the log or dmesg but we're
turning logging off in the product because it's unneeded disk I/O and disk I/O
is critical.  I was looking at the IDE directory under proc and there is an
entry for your southbridge/IDE controller and some other specific things so
that  I can dig around in /proc/ide and know exactly what drives and
IDE controllers I've got on the system.


> Perhaps we could make the CFI drivers put slightly more informative
> information in the 'name' field, but that doesn't work nicely if you have
> partitions which override the original name.

We could, I was just offering to try and do a complete job if someone else
wants or needs anything in there.  During our manufacturing test we need to
specifically identify each and every part of our hardware and so I've been
stuffing that into /proc.  I will do it that way for our particular kernel and
code but if I can write something that will be helpful to others I want to do
that.

Maybe the solution is to create a /proc/mtd directory and then have a few
different files in there which can either be generic or specific.  There are
other places in the kernel that do this so it's un unprecedented.  /proc is
nice and easy to read so you can build scripts and simple things to read it.
An ioctl could also work.

Ian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
