Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1357Wm-0004jq-00
	for mtd-list@infradead.org; Thu, 22 Jun 2000 15:00:20 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1357Wl-0004jk-00
	for mtd@infradead.org; Thu, 22 Jun 2000 15:00:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39521C80.DE405C7A@techno.spb.ru> 
References: <39521C80.DE405C7A@techno.spb.ru> 
To: maxs@techno.spb.ru
Cc: mtd@infradead.org
Subject: Re: [Fwd: [Fwd: Using MTD drivers with Ampro CoreModule/p5e]] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 15:01:59 +0100
Message-ID: <8410.961682519@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


maxs@techno.spb.ru said:
>  nftl.c:435: case label does not reduce to an integer constant 

That's because of a gcc bug. There's a workaround in the CVS version - use
that instead of the tarball.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
