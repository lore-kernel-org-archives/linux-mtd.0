Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1370mm-0003vB-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 20:12:40 +0100
Received: from tmmi197-073.telusvelocity.net
	([209.115.197.73] helo=wakko.deltatee.com ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 1370mk-0003v5-00
	for mtd@infradead.org; Tue, 27 Jun 2000 20:12:39 +0100
Date: Tue, 27 Jun 2000 12:47:51 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c' 
In-Reply-To: <26144.962095860@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000627124319.12137A-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 27 Jun 2000, David Woodhouse wrote:

> You've said, and I agree, that the map driver won't necessarily know the 
> size of the chips within the area, so it can't know how the aliases are 
> arranged and remap the space itself. 

The map driver is the only driver that knows what the eletrical connection
is, if it knows the banks are 4 meg apart then it has to communicate that
up. The only thing this is used for is detection, the detector can jump
to the next bank start and do all of the banks. The only other option is
to probe every block int the mapping region looking for bank starts, which
is gross since the information is available.

> Hmmm. How about a char * ?

That might be best.
 
> jgg@deltatee.com said:
> >  Should probably also use the named initializers the rest of the
> > kernel is moving to for these big structs.
> 
> You mean a static initialiser that ends up in the data segment rather than 
> kmalloc'd? What does it do for us?

No, the C99 named member initializers for structs:

struct foo = {name: "Hello",size: 1024};

Makes those big initializers readable.

Jason




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
