Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Vw7N-0003Ty-00
	for mtd-list@infradead.org; Mon, 04 Sep 2000 14:16:57 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13Vw7L-0003Ts-00
	for mtd@infradead.org; Mon, 04 Sep 2000 14:16:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39AF00C6.DA335C86@mvista.com> 
References: <39AF00C6.DA335C86@mvista.com>  <39AC4D1F.BFBEEA21@mvista.com> <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <9503.967625312@cygnus.co.uk> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: mtd@infradead.org
Subject: Re: MTD support for 8x16 devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 04 Sep 2000 14:16:50 +0100
Message-ID: <19439.968073410@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ahennessy@mvista.com said:
>  Ok, I will do that.  I also just found out  that I need to subscribe
> to the mtd-cvs list to follow what is being checked in? 

Yep. I did have that going to the main list at one point, but people 
apparently prefer to have it separated.


ahennessy@mvista.com said:
>  The other product has a single strata chip (8x16 variety) set in byte
> mode so the bus width is 1.  The cfi ident info is requested at
> address 0xaa and read starting at 0x20 so this is new code that I've
> added.   I'll  merge my code to make use of the new define
> CFI_DEVICETYPE_X8 which I'm assuming was added for this purpose?

Dunno. That was added after I last looked at the CFI probe code.


ahennessy@mvista.com said:
> Sooo,  I need to do the extra logic outside the driver level. ;) 

See (and probably rename) util/doc_loadbios

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
