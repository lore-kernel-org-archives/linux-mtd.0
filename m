Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZafT-0000ew-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:38:59 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZafS-0000eq-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:38:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000327162945.26529A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000327162945.26529A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: New release of MTD code pending. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 15:38:58 +0100
Message-ID: <9873.954167938@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  Sure, but there are some architecture changes that should be done
> before that. (The ones we discussed last week). 

Definitely. I'm going through the FTL code first - to remind myself of how it 
actually works. Then I'll get round to making the changes we talked about.

As it is, I haven't actually looked at some of this code in three years. For 
example, I had no clue how the async erases worked until I just reread it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
