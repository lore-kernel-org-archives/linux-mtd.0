Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12nGVB-0000Pz-00
	for mtd-list@infradead.org; Thu, 04 May 2000 08:56:53 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12nGVA-0000Ps-00
	for mtd@infradead.org; Thu, 04 May 2000 08:56:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200005032221.SAA10825@home.welcomehome.org> 
References: <200005032221.SAA10825@home.welcomehome.org> 
To: Paonia Ezrine <paonia@home.welcomehome.org>
Cc: mtd@infradead.org
Subject: Re: read only 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 May 2000 09:00:56 +0100
Message-ID: <24367.957427256@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


paonia@home.welcomehome.org said:
> I am looking to use the DOC or similar with lrp. Is there a way to set
> the device to read only mode so that no one can hack with it. I dont
> mean a software setting but a hardware one. Also which DOC or similar
> would people project for this application. Porlby need 2-20 megs. 

Not in hardware AFAIK - at least not simply by cutting control lines - 
you'd have to have some intelligence in between your system bus and the 
DiskOnChip. (logic: when the host writes to location 0x1004 in the device, 
you ensure that bit 3 (WP) is _always_ set - mask it in if the host didn't 
set it.)

However, it's quite feasible to cut out the write capability in the device
driver, so that an attacker would have to load his own driver for it if he 
wanted to write to it. That would probably be enough for your purposes.

I've been intending to do that for a while now anyway - as it would mean I
could mark the write support as experimental.

In fact, read-only support is all I'd really want people to use the MTD 
DiskOnChip driver for right now.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
