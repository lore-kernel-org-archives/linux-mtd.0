Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U3Xx-0005BA-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 09:48:37 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13U3Xv-0005B4-00
	for mtd@infradead.org; Wed, 30 Aug 2000 09:48:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39AC4D1F.BFBEEA21@mvista.com> 
References: <39AC4D1F.BFBEEA21@mvista.com>  <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: mtd@infradead.org
Subject: Re: MTD support for 8x16 devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 30 Aug 2000 09:48:32 +0100
Message-ID: <9503.967625312@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ahennessy@mvista.com said:
>  Has any of this already been checked in recently?  And what is the
> procedure?

Stéphane already pointed you at the latest CVS. If you want write access, 
let me have a SSH public key and a sample of your work :)

Can you confirm the mapping of the flash chips - you've got two interleaved
16-bit devices ('2_by_16') but you can only actually access them a byte at 
a time? What is the CPU? What happens if you _do_ try to read a whole word 
instead of only a byte?



ahennessy@mvista.com said:
>  I'm also thinking about different ways for the partition sizes to be
> set outside of physmap.c.   - any opinions?   Perhaps board specifics
> should be contained in a header file and be set via menuconfig or
> command line or ?

I think it's probably best to keep it in a header file or in physmap.c 
itself. The driver can default to no partitioning, and we can set up some
#defines at the beginning which allow people to change it as they see fit.


ahennessy@mvista.com said:
> 4.   I need to implement a char device where the customer wants to
> write to the flash and have all the erase details handle by the
> driver.  They want to simply do a dd into the device. 

No. Erase is a single ioctl() call, or a single invocation of the 
'eraseall' utility. The customer is wrong. :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
