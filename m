Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H0zF-0007bE-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 10:26:53 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H0zC-0007b6-00
	for mtd@infradead.org; Tue, 25 Jul 2000 10:26:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397D52D7.B0CC9270@arcom.co.uk> 
References: <397D52D7.B0CC9270@arcom.co.uk>  <Pine.LNX.4.21.0007211711440.22633-100000@alpha1.cygnus.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Intel Extended Command set in 8x mode 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 10:26:22 +0100
Message-ID: <31452.964517182@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  2_by_8?  What is the first number supposed to mean?

The number of chips which are interleaved together. The second number is 
obviously the width of each chip. Hopefully, the two multiplied together 
match the bus_width parameter of the 'map'.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
