Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ADYI-0006gc-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 16:26:58 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ADYG-0006gU-00
	for mtd@infradead.org; Thu, 06 Jul 2000 16:26:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3962EBC0.F16A20AF@evoserve.com> 
References: <3962EBC0.F16A20AF@evoserve.com> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: mtd@infradead.org
Subject: Re: jffs super block 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 16:26:53 +0100
Message-ID: <2280.962897213@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rogelio@evoserve.com said:
>  I have been trying to use jffs on DOC but i just cant get it to
> mount. 

You'll need to modify the doc2000 driver to be slightly better-behaved 
first. Currently, it refuses to do any writes which aren't 512-byte page 
aligned, and 512 bytes long, because it's only ever been used by the NFTL 
code so far. 

Once we've done that, JFFS looks like it ought to work OK, but remember that 
the DiskOnChip has NAND flash, and JFFS was designed to work on NOR flash. 

It looks to me as if it should be OK, but it's not tested on NAND flash yet.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
