Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136r32-0001m0-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 09:48:48 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 136r2v-0001lu-00
	for mtd@infradead.org; Tue, 27 Jun 2000 09:48:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000626225302.29267B-100000@white.priv.deltatee.com> 
References: <Pine.LNX.3.96.1000626225302.29267B-100000@white.priv.deltatee.com> 
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Jun 2000 09:51:00 +0100
Message-ID: <26144.962095860@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Could you also add bank_size? 

Do we really need it? I turned my previous question around - why does the
_map_ driver need to know about it? 

You've said, and I agree, that the map driver won't necessarily know the 
size of the chips within the area, so it can't know how the aliases are 
arranged and remap the space itself. 

So the flash probe code needs to work that out for itself, and as 
soon as the cfi_check_chipalias() function does something other than 
'return 0' that'll be fine. Presumably you have something similar.

Having worked out where each chip starts in the map, and recorded its start 
address in the per-chip data structure, why does the flash driver need to 
tell the map about it? Why not just use the 'correct' addresses?

> Both oct and vmax are 8bit devices so your FIXME is wrong. Everything
> using mapped before this has to be 8 bit because the JEDEC driver didn't
> support any higher. 

Fixed. Thanks.

>  Also, while you are changing things, can you widen the name feild in
> the mtd_info to about 100 chars? I want to plunk detection info in
> there too. 

Hmmm. How about a char * ?


jgg@deltatee.com said:
>  Should probably also use the named initializers the rest of the
> kernel is moving to for these big structs.

You mean a static initialiser that ends up in the data segment rather than 
kmalloc'd? What does it do for us?

I was aware of the netdev name changes - but that changed from a char * to 
a constant-length char[] to allow name changes to work without overflowing 
the original string.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
