Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136nRT-0001Px-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 05:57:47 +0100
Date: Mon, 26 Jun 2000 23:00:16 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
Reply-To: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c'
In-Reply-To: <E136bb9-00082G-00@infradead.org>
Message-ID: <Pine.LNX.3.96.1000626225302.29267B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 26 Jun 2000, David Woodhouse wrote:

> Update of /home/cvs/mtd/kernel
> Modified Files:
> 	cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c 

Could you also add bank_size? Both oct and vmax are 8bit devices so
your FIXME is wrong. Everything using mapped before this has to be 8 bit
because the JEDEC driver didn't support any higher.

Also, while you are changing things, can you widen the name feild in the
mtd_info to about 100 chars? I want to plunk detection info in there too.

Should probably also use the named initializers the rest of the kernel is
moving to for these big structs.

Thanks,
Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
