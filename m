Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139OZD-0006mF-00
	for mtd-list@infradead.org; Tue, 04 Jul 2000 10:00:31 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 139OZC-0006m9-00
	for mtd@infradead.org; Tue, 04 Jul 2000 10:00:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <s961b546.043@mail.pel.dk> 
References: <s961b546.043@mail.pel.dk> 
To: "Arnold Christensen" <AKC@pel.dk>
Cc: mtd@infradead.org
Subject: Re: FOUND IT + how to fix, Was: Using MTD + cfi_probe with RPXLite ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Jul 2000 10:04:26 +0100
Message-ID: <8930.962701466@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


AKC@pel.dk said:
> cfi_probe couldn't detect the flash on the RPXLite because it only has
> x32 access, which means A30,A31 isn't connected to the flash. So to
> detect the flash and get information from it all address' needs *4,
> eg.   0xAA becomes 0x2a8.

> After the flash is detected in cfi_probe_new_chip, all the address'
> needs *2  

> There must be a better way than touching up the code by hand ;-)

Try the rpxlite map driver which I've added to the CVS tree. If it doesn't 
work, let me have a patch for it.

There's also a 'physmap' driver for normal physical mappings of flash 
chips, which require ioremap() to get a virtual mapping - unlike nora.c 
which has a virtual mapping set up for it by the kernel's VM init code.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
