Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12aaxm-0000Dk-00
	for mtd-list@infradead.org; Thu, 30 Mar 2000 10:10:02 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12aaxl-0000De-00
	for mtd@infradead.org; Thu, 30 Mar 2000 10:10:01 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12aayH-0006Pb-00
	for mtd@infradead.org; Thu, 30 Mar 2000 10:10:33 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12aayG-0001eB-00; Thu, 30 Mar 2000 10:10:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Updates.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Mar 2000 10:10:32 +0100
Message-ID: <6334.954407432@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've updated the documentation now. I thought I'd said that the notify 
functions which are called to notify 'user' modules of addition and removal of 
MTD devices may not sleep.

That was a silly decision, and so I've changed it - these routines obviously 
need to call the mtd->read() routines et al to see if there's anything of 
interest on the newly-added device, which means they have to be able to sleep.

I was going to protect the MTD driver list with a spinlock but it'll have to 
be a semaphore.

I've committed an updated ftl.c to CVS, based on the latest one from David 
Hinds' PCMCIA code. It appears to be hanging in INIT_REQUEST, which is 
confusing me. Anyone want to take a look?




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
