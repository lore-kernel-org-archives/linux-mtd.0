Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UX5E-0003Ax-00
	for mtd-list@infradead.org; Thu, 31 Aug 2000 17:20:56 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13UX5D-0003Aq-00
	for mtd@infradead.org; Thu, 31 Aug 2000 17:20:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <151C6E876B0@mamao.cetuc.puc-rio.br> 
References: <151C6E876B0@mamao.cetuc.puc-rio.br>  <1512880772E@mamao.cetuc.puc-rio.br> 
To: miguel@cetuc.puc-rio.br
Cc: mtd@infradead.org, Ciro Cattuto <ciro@prosa.it>
Subject: Re: GRUB on DOC: 2Mb issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 31 Aug 2000 17:20:48 +0100
Message-ID: <14431.967738848@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


miguel@cetuc.puc-rio.br said:
> 
>    Well, I will not have time to do it in the next few days anyway.
> But  maybe Ciro will want to implement it.
>  

I just committed it - it's working on 512-byte devices. I see no reason why 
it shouldn't work on 256-byte devices if I copied Ciro's code correctly.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
