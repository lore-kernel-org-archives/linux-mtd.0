Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132urd-000312-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 13:04:45 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 132urc-00030w-00
	for mtd@infradead.org; Fri, 16 Jun 2000 13:04:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006161357500.32189-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10006161357500.32189-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org,
  =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@matrox.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Jun 2000 13:05:13 +0100
Message-ID: <19871.961157113@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> 
>  Btw. Do you want any help merging these? 

Yes please.

I'm being confused by a more fundamental problem ATM. 

include/linux/mtd/mtd.h includes <linux/module.h> because it needs to use 
try_inc_mod_count(). 

Unfortunately, this means I get:

intrep.o(.modinfo+0x0): multiple definition of `__module_kernel_version'
jffs_fm.o(.modinfo+0x0): first defined here
inode-v22.o(.modinfo+0x0): multiple definition of `__module_kernel_version'
jffs_fm.o(.modinfo+0x0): first defined here
make[1]: *** [jffs.o] Error 1


Defining __NO_VERSION__ before including module.h, and then undefining it 
afterwards, isn't right because that would mean that it doesn't get 
processed correctly if the main file later includes module.h and _does_ 
want __module_kernel_version to be defined by it.

I suspect that for now I'm just going to cheat and define try_inc_mod_count 
myself, but that's hardly ideal.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
