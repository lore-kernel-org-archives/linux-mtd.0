Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SFOM-0000zs-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 10:03:14 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13SFOL-0000zm-00
	for mtd@infradead.org; Fri, 25 Aug 2000 10:03:13 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <39A59519.BB89118E@redhat.com> 
References: <39A59519.BB89118E@redhat.com> 
To: root <ikinner@redhat.com>
Cc: mtd@infradead.org
Subject: Re: slram 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Aug 2000 10:03:10 +0100
Message-ID: <20653.967194190@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ikinner@redhat.com said:
>  I am attempting to use the slram module, but the ftl_format program
> crashes with a floating-point error every time. If anyone could point
> me to _any_ info on slmod.o, it would be very helpful. There seems to
> be no documentation on it, anywhere... 

Don't use slram. Use mtdram.

mtdram uses vmalloc() to allocate a chunk of memory. slram just tries to 
use it, and you have to boot your kernel with a 'mem=' option telling it 
not to use all the physical memory it finds. I think the default for slram 
is to use 64Mb at 64Mb - so you'd need to boot with 'mem=64M'.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
