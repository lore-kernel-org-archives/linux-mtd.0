Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H6XL-0000dr-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 16:22:27 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H6XG-0000dg-00
	for mtd@infradead.org; Tue, 25 Jul 2000 16:22:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397DB4F2.B01E5856@evoserve.com> 
References: <397DB4F2.B01E5856@evoserve.com> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: driver for Am29F080B 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 16:22:00 +0100
Message-ID: <7924.964538520@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rogelio@evoserve.com said:
> Which drivers should I use for the Am29F080B?  Its an on board flash
> array of an old box. Anyone using that chip on this list? 

Jason's JEDEC code should drive it, I think. I've just dumped in place the 
code he sent me without merging some of the changes he made to the struct 
mtd_info, so it may take all of five minutes to get it to compile.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
