Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Ob9x-0003bX-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 08:29:17 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13Ob9v-0003bR-00
	for mtd@infradead.org; Tue, 15 Aug 2000 08:29:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <6011381691@mamao.cetuc.puc-rio.br> 
References: <6011381691@mamao.cetuc.puc-rio.br> 
To: miguel@cetuc.puc-rio.br
Cc: mtd@infradead.org
Subject: Re: Integrating 2000 and Millenium drivers 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Aug 2000 08:29:10 +0100
Message-ID: <2757.966324550@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


miguel@cetuc.puc-rio.br said:
> 
>     BTW, I've just begin hacking DoC last month, so forgive me if I'm
> missing some good reason why these drivers can't be merged... 

There's no particularly good reason to keep them separate if we can merge 
them without killing the performance. I split them up so that I could point 
people at doc2001.c and say 'There. Make it work if you want to'. 

Now that's done, I don't see any particular reason to keep them separate.

Code reuse is wonderful as long as it doesn't mean shitloads of conditional 
branches in the inner loop of the access functions. I think we can merge 
them without doing that, so why not?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
