Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KcAq-0000c6-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 08:45:44 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13KcAn-0000c0-00
	for mtd@infradead.org; Fri, 04 Aug 2000 08:45:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <398A226D.8E19BF9F@sis.com.tw> 
References: <398A226D.8E19BF9F@sis.com.tw>  <20000802134851.A2924@localhost> <3988F8D2.FD1AB1E2@sis.com.tw> <20000803125852.A1378@localhost> 
To: Ollie Lho <ollie@sis.com.tw>
Cc: Ciro Cattuto <ciro@prosa.it>, mtd@infradead.org
Subject: Re: DOC2000 & NFTL problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Aug 2000 08:45:25 +0100
Message-ID: <3136.965375125@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ollie@sis.com.tw said:
>  EraseMark not present in unit 511: 0
> The DoC is not properly nftl_formatted, or the OOB areas are broken or
> not correctly accessed by doc2000.c

... or setting the EraseMark to zero means it's a bad block, and we don't 
handle bad blocks yet. That's unlikely, though, given the number of times 
it's happening.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
