Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZYXf-0001NW-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 13:55:03 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZYXb-0001NQ-00
	for mtd@infradead.org; Thu, 14 Sep 2000 13:55:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBLLDBMLGONJHPHHEKGEMLCHAA.ajlennon@arcom.co.uk> 
References: <NEBBLLDBMLGONJHPHHEKGEMLCHAA.ajlennon@arcom.co.uk> 
To: "Alex J Lennon" <ajlennon@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: sbc-mediagx 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 13:54:46 +0100
Message-ID: <11598.968936086@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ajlennon@arcom.co.uk said:
>  FlashFx implements VBF to support block access to the media and to
> provide wear levelling amongst other things (I believe). The "Variable
> Block Flash" component is *not* a filesystem. It simply translates
> logical sector requests to physical flash locations. 

Similar in principle, then, if not in implementation, to FTL.
A kind of pseudo-filesystem which is used to emulate a block device.

Does it use the concepts which are patented by M-Systems? I believe that 
the patents in this area are extremely broad, and cover almost all obvious
methods of implementing wear levelling. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
