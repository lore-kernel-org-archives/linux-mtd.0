Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Ayw-0001Fq-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 17:25:22 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Ayo-0001Fk-00
	for mtd@infradead.org; Wed, 29 Nov 2000 17:25:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <44632C76B97BD211AF6B00805FADCAB202D738E3@exchange.saltaire.pace.co.uk> 
References: <44632C76B97BD211AF6B00805FADCAB202D738E3@exchange.saltaire.pace.co.uk> 
To: Simon Wood <Simon.Wood@pace.co.uk>
Cc: "'wear-hard@haven.org'" <wear-hard@haven.org>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: M-System DOC Millennium with MTD. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Nov 2000 17:24:33 +0000
Message-ID: <28915.975518673@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Simon.Wood@pace.co.uk said:
> 2). insmod'ed the modules (without any options) in the following order
> -
> 	nftlmount
> 	mtdcore
> 	nftl
> 	docprobe
> 	docecc
> 	doc2001 

Load docprobe last. We are going to merge the code so you only have to load 
nftl.o and the DiskOnChip driver (we'll probably call it doc200x.o) and 
then it won't matter what order you load them in. Not quite yet though.

Simon.Wood@pace.co.uk said:
>  3). Tried to 'mount /dev/nftla /floppy' and got error 'mount: /dev/
> nftla has wrong major or minor number'.

It hasn't found the DiskOnChip. mount(8) ought to give you a better error 
than that though.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
