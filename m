Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14UWsw-000626-00
	for mtd-list@infradead.org; Sun, 18 Feb 2001 16:40:30 +0000
Date: Sun, 18 Feb 2001 19:49:23 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: Jonas Holmberg <jonas.holmberg@axis.com>,
        "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: mtdpart.o 
In-Reply-To: <14778.982321693@redhat.com>
Message-ID: <Pine.LNX.4.21.0102181947510.15064-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 16 Feb 2001, David Woodhouse wrote:
> >  I've got a problem since it was removed: How can I include mtdpart.o
> > in my kernel if I wan't to do a do_cfi_probe() and then add partitions
> > with add_mtd_partitions()? 
> 
> The way it's done ATM is to include with the map driver:
> 
> obj-$(CONFIG_MTD_SBC_MEDIAGX)   += sbc_mediagx.o mtdpart.o
> obj-$(CONFIG_MTD_ELAN_104NC)    += elan-104nc.o mtdpart.o
> obj-$(CONFIG_MTD_SA1100)        += sa1100-flash.o mtdpart.o

Which is not possible if you want to place the map driver in another
directory..

I'd rather do it in the config.in and have a separate CONFIG for the
partition support, but as we found out before, it's really boring to fix
that config.in for all the cases that need the mtdpart support
:) Something for Jonas!

-BW



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
