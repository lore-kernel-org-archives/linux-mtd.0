Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zaru-0000jZ-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:51:50 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Zart-0000jT-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:51:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000327164003.31589G-100000@fafner.axis.se> 
References: <Pine.LNX.3.96.1000327164003.31589G-100000@fafner.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: Scott Anderson <sanders@mvista.com>,
    Alexander Larsson <alex@cendio.se>, mtd@infradead.org,
    SeokKuon Kwon <kwonsk@mutech.co.kr>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 15:51:49 +0100
Message-ID: <9932.954168709@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  The flash is not divided into blocks in our JFFS. The flash is
> logically a single circular append-only file (but with random access
> of course). Wear-leveling comes implicitely in that model, since the
> log-file is circular. 

When you append to your circular log, you end up eating your tail. What if the 
erase block you're about to 'eat' doesn't contain any data that needs to be 
changed. Do you leave it alone and skip it, or do you erase it anyway?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
