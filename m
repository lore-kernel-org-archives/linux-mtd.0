Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131r3c-0002dP-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 14:48:44 +0100
Received: from gizmo.adis.on.ca ([216.211.97.50])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 131r3a-0002dJ-00
	for mtd@infradead.org; Tue, 13 Jun 2000 14:48:42 +0100
Received: from develop.knet.on.ca (knet-32.knet.on.ca [216.211.97.32])
	by gizmo.adis.on.ca (8.9.3/8.9.3) with ESMTP id IAA31724
	for <mtd@infradead.org>; Tue, 13 Jun 2000 08:48:05 -0500
Date: Tue, 13 Jun 2000 08:48:05 -0500 (CDT)
From: Adi Linden <adi@adis.on.ca>
To: mtd@infradead.org
Subject: Re: M-Systems Disk-On-Chip driver 
In-Reply-To: <29645.960882264@cygnus.co.uk>
Message-ID: <Pine.LNX.4.10.10006130846590.4290-100000@develop.knet.on.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Hmmm... So are there some really easy instructions on how to build the
driver? Then I will give it a try!

TTYL,
Adi

On Tue, 13 Jun 2000, David Woodhouse wrote:

> 
> adi@adis.on.ca said:
> > Is the kernel driver for the doc devices working? I haven't tried mtd
> > in a while but I'd really like to replace the IGEL driver with
> > something open source.
> 
> It works fine in read-only mode. Some problems have been reported in write 
> mode, but I haven't been able to reproduce them.
> 
> It's not yet very efficient in write mode, but it ought to work.
> 
> --
> dwmw2
> 
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
