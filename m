Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136Sam-0006Ep-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 07:42:00 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 136Sak-0006Ej-00
	for mtd@infradead.org; Mon, 26 Jun 2000 07:41:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000625165745.15303B-100000@white.priv.deltatee.com> 
References: <Pine.LNX.3.96.1000625165745.15303B-100000@white.priv.deltatee.com> 
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Compile problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 26 Jun 2000 07:44:18 +0100
Message-ID: <25306.962001858@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Having not looked at it, shouldn't the DOC access be regulated to a
> lower level driver, like we have for the other flash stuff? If I were
> to slap a DOC on an ARM board here it would probably have quite
> different access (32 bit for one thing).  

Urgh. You might be right. Which is a shame because the current map setup 
doesn't handle the type of access that the DiskOnChip requires very nicely. 
Where it's reading 512 consecutive bytes out of the same port on the ASIC, 
it'd be 512 indirect function calls in a tight loop. Maybe we need an extra 
method in the map object if we're going to do that.

Lets try to avoid it for a while - presumably anyone who adds a DiskOnChip 
to an ARM system will do the same thing, so the ReadDOC and WriteDOC macros 
can be defined accordingly for ARM systems, and we'll bury our head in the 
sand for a little longer until some nutter comes up with a second method 
for a given architecture and we can no longer ifdef it. :)


jgg@deltatee.com said:
> I did add two new things to the struct map to make this possible:
>   unsigned bus_width;

Good point.

>   unsigned long bank_size;   // Bytes in a bank. size = bank_size*bank_count 

> So if you have less than 4 meg of chips you end up with spaces between
> them and the driver has to advoid them and probe differently.  

I have the same - 16Mb at 0x0, 16Mb at 0x2000000. But it's aliases, not 
spaces between them - just to make it more interesting. (And I was told it 
wouldn't be like that, so when I erased the 'second' chip at 0x1000000 I 
was actually erasing the firmware... :) 

I changed the VM setup to present them to the CPU contiguously. If that wasn't
possible, I'd have done the mask-and-shift necessary in the map driver. Is
it really necessary for the user to know about it? Surely it's just a
physical detail of the wiring?




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
