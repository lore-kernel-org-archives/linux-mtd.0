Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wZyc-0001Gn-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 01:06:02 +0000
Date: Thu, 16 Nov 2000 20:18:32 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Erwin Authried <eauth@softsys.co.at>,
        "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: block device for 2.0
In-Reply-To: <Pine.LNX.4.30.0011162343080.5514-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.30.0011162016000.5921-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 16 Nov 2000, David Woodhouse wrote:

> On Thu, 16 Nov 2000, Erwin Authried wrote:
>
> > I thought it might be best to have the choice between the
> > old, uncached block block driver (for uClinux) or the new driver
> > as a configuration option. Are there any better ideas?
>
> Makes sense. How about having CONFIG_MTD_BLOCK and CONFIG_MTD_BLOCK_RW
> just like we currently have for NFTL?

Why not the other way around, i.e. CONFIG_MTD_BLOCK and CONFIG_MTD_BLOCK_RO?
The read-only one is more the "special case" than the read-write one...


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
