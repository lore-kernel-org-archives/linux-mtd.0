Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Tiky-0001S1-00
	for mtd-list@infradead.org; Fri, 16 Feb 2001 11:08:56 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Tikx-0001Rt-00
	for mtd@infradead.org; Fri, 16 Feb 2001 11:08:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E6FE4E054F02D511818E00025558B61D429E2F@cluster01.axis.se> 
References: <E6FE4E054F02D511818E00025558B61D429E2F@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: mtdpart.o 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Feb 2001 11:08:13 +0000
Message-ID: <14778.982321693@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
>  I've got a problem since it was removed: How can I include mtdpart.o
> in my kernel if I wan't to do a do_cfi_probe() and then add partitions
> with add_mtd_partitions()? 

The way it's done ATM is to include with the map driver:

obj-$(CONFIG_MTD_SBC_MEDIAGX)   += sbc_mediagx.o mtdpart.o
obj-$(CONFIG_MTD_ELAN_104NC)    += elan-104nc.o mtdpart.o
obj-$(CONFIG_MTD_SA1100)        += sa1100-flash.o mtdpart.o



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
