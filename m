Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Pi9v-0003S0-00
	for mtd-list@infradead.org; Fri, 18 Aug 2000 10:09:51 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13Pi9u-0003Ru-00
	for mtd@infradead.org; Fri, 18 Aug 2000 10:09:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <399CF6F1.4622CF44@arcom.co.uk> 
References: <399CF6F1.4622CF44@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS oopses on mount 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Aug 2000 10:09:47 +0100
Message-ID: <26879.966589787@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  Possibly a message of interest 

> jffs_garbage_collect_now(): free_size == 0. This is BAD. 

I sincerely hope that the latest CVS sources fix this problem. We've been 
chasing it for days, and we _think_ it's fixed.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
