Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pXnC-00029r-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 16:53:26 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pXnB-00029l-00
	for mtd@infradead.org; Tue, 17 Apr 2001 16:53:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000601c0c756$47018250$0a01a8c0@Win1> 
References: <000601c0c756$47018250$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: kd@flaga.is, mtd@infradead.org
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 16:53:13 +0100
Message-ID: <2093.987522793@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
>  I can place them at any physical(almost) address since they are
> connected to the cpu's Chip Select logic. I figure I will place them
> somewhere high starting at 0xf8000000. I can also make the address
> space linear(no holes between the banks).

> Now, can I just define WINDOW_ADDR 0xf8000000 and WINDOW_SIZE
> 0x8000000 and specifiy my partitions without worrying about flash bank
> boundries? (In my dreams or ...) 

That should work.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
