Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111YT7-0005NK-00
	for mtd@infradead.org; Tue, 6 Jul 1999 17:53:18 +0100
Date: Tue, 6 Jul 1999 10:53:04 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
Reply-To: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
In-Reply-To: <E111YGy-00060f-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990706104855.17432A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 6 Jul 1999, David Woodhouse wrote:

> gotit. It has a FAT filesystem on it - raw. Use dd to get rid of the BIOS at 
> the beginning, and the partition table, and it mounts quite nicely with 
> loopback.

How interesting. I wonder if the flash is any different.. Let me get back
to you in a week when the guy that knows a bit more about these boards
comes back.

Speading of partitions, It would be really nice to be able to have
partitions built into the upper mtd layers. Every one of my devices has a
partition of some sort and most of them are unmarked :<

I am thinking it would be fairly simply to make the upper layer mtd stuff
accept some sort of argument to specify the partition sizes would work,
but it sounds a bit ugly to implement. I need this to happen at boot time,
and others need it to happen at card insertion time (from the CIS block I
think)...
 
Thanks,
Jason





To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
