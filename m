Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYJQ-0002Xa-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:26:44 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <kd@flaga.is>, <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Tue, 17 Apr 2001 18:26:03 +0200
Message-ID: <000901c0c75b$18f38de0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <2093.987522793@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Great!!

Wish I had the board here so I could bore you with even more questions :-)
But I will have to wait several weeks ...

    Jocke

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, April 17, 2001 17:53
To: joakim.tjernlund@lumentis.se
Cc: kd@flaga.is; mtd@infradead.org
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 



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
