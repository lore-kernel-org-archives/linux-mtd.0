Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112jOA-0007RE-00
	for mtd@infradead.org; Fri, 9 Jul 1999 23:45:02 +0100
Date: Fri, 9 Jul 1999 16:44:54 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: Response from M-Systems 
In-Reply-To: <E112idz-0002jo-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990709163733.11475A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Fri, 9 Jul 1999, David Woodhouse wrote:

> I ought to have pointed out that this applies to _any_ GPL'd driver for the 
> Disk-On-Chip and NFTL, regardless of whether it's produced by M-Systems, with 
> M-Systems' specifications, or by reverse-engineering.
> 
> If we accept the premise that the patents prevent the code from being released 
> under GPL, then what are we playing at in the first place? 

I'm not sure you can actually patent and enforce the software side of a
hardware interface. Ie if we write a driver that does the proper sequence
to page, write and erase their chip they cannot take action agaist us,
unless perhaps that sequence involved lots more software control that the
AMD flash chips do.

Can you dig up the patents they actually hold on their FTL and on their
hardware interface? 

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
