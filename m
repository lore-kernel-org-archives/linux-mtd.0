Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111Ylr-0005Og-00
	for mtd@infradead.org; Tue, 6 Jul 1999 18:12:39 +0100
Date: Tue, 6 Jul 1999 11:12:32 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
In-Reply-To: <E111YYJ-0006Bm-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990706110958.17583A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 6 Jul 1999, David Woodhouse wrote:

> What do you mean? If you want multiple filesystems on a single piece of flash, 
> aren't you better off using a single FTL and making standard partitions on 
> that, rather than splitting the MTD into multiple flash filesystems?

I don't want to use FTL, and FFS2 doesn't have a clean way to search for
its header and there isn't any mechanism for supporting two FFS2
filesystems. The AMD uForCE board has a 8meg of flash structured something
like this: 
 bios
 QNX FFS2 FS
 QNX OS image
 WinCE FFS2 FS

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
