Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14slUN-0001i6-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 14:07:19 +0100
Received: from finch-post-10.mail.demon.net ([194.217.242.38])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14slUM-0001i0-00
	for mtd@infradead.org; Thu, 26 Apr 2001 14:07:18 +0100
Received: from activesilicon.demon.co.uk ([212.228.31.28] helo=activesilicon.co.uk)
	by finch-post-10.mail.demon.net with esmtp (Exim 2.12 #1)
	id 14slUA-0002sS-0A
	for mtd@infradead.org; Thu, 26 Apr 2001 13:07:06 +0000
Received: from p90nt4 (p90nt4.activesilicon.co.uk [192.168.1.64])
	by activesilicon.co.uk (8.11.3/8.11.3) with SMTP id f3QD6tm23680
	for <mtd@infradead.org>; Thu, 26 Apr 2001 14:06:55 +0100
Message-ID: <01C0CE5A.276D58F0.chris.read@activesilicon.co.uk>
From: Chris Read <chris.read@activesilicon.co.uk>
Reply-To: "chris.read@activesilicon.co.uk"
	 <chris.read@activesilicon.co.uk>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Power blackouts and brownouts
Date: Thu, 26 Apr 2001 14:06:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Does anyone know what actually happens to a flash chip when the power 
starts to fail during an erase or a write cycle? We are all trying to write 
code which can recover when abruptly halted at any point, but can all the 
devices which we are using claim the same?

I have noticed that several flash devices have a power on reset line; most 
however do not. Whilst I appreciate that flash devices are not fully static 
like SRAM or EPROM, and therefore must have some way of initialising in a 
known state at power up; most devices appear to not need this external 
signal. My hypothesis is therefore that this line may be more for abruptly 
stopping any internal state machine during the first stages of a brown-out 
whilst there is still sufficient power available to do so.

Any thoughts?

Chris Read




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
