Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lCkl-00060h-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 17:36:59 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14lCkg-00060b-00
	for mtd@infradead.org; Thu, 05 Apr 2001 17:36:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ACC986E.DE2F4C61@echostar.com> 
References: <3ACC986E.DE2F4C61@echostar.com>  <3ACBA4C2.DDED5432@echostar.com> <27773.986474836@redhat.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Proc stuff 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Apr 2001 17:33:41 +0100
Message-ID: <22237.986488421@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
>  Maybe the solution is to create a /proc/mtd directory and then have a
> few different files in there which can either be generic or specific.
> There are other places in the kernel that do this so it's un
> unprecedented.  /proc is nice and easy to read so you can build
> scripts and simple things to read it. An ioctl could also work. 

/proc is nicer, if we really have to do it. How about /proc/driver/mtd/$n,
each one containing something along the lines of...

name: "blah"
size: 0x1000000
erasesize: 0x10000

The standard lines can be provided by a generic function, and we add a
proc_filler method to the mtd_info stucture which overrides that to allow
you to do whatever else you want.

Actually, mtdfs is probably nicer than adding yet more cruft to /proc. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
