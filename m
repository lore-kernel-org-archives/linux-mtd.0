Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZY14-0001Fy-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 13:21:22 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZY12-0001Fs-00
	for mtd@infradead.org; Thu, 14 Sep 2000 13:21:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39C0C312.44F942D2@arcom.co.uk> 
References: <39C0C312.44F942D2@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Latest mtdchar.c breaks with 2.2.17 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 13:21:09 +0100
Message-ID: <7170.968934069@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  It compiles fine without it.
> Is it a 2.4.x thing?

Yep. Dunno how that crept in there without an #ifdef.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
