Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11rLub-00005N-00
	for mtd@infradead.org; Fri, 26 Nov 1999 13:59:45 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 11rLua-0008Nt-00
	for mtd@infradead.org; Fri, 26 Nov 1999 13:59:44 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11rLuZ-000689-00; Fri, 26 Nov 1999 13:59:43 +0000
To: mtd@infradead.org
Subject: RE: (Fwd) DoC2000 Kernel problems (fwd)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Nov 1999 13:59:43 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11rLuZ-000689-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


This one was caught by the spam filter, because M-Systems' mail server is in 
the ORBS blacklist. 

Sorry, I'd made an exception for them in the company's mail server as soon as I
noticed, but I forgot to do the same on infradead.org. It should be fixed now.

------- Forwarded Message

From: Oron Ogdan <Orono@m-sys.com>
To: 
Cc: MTD <mtd@imladris.mvhi.com>
Subject: RE: (Fwd) DoC2000 Kernel problems 
Date: Fri, 26 Nov 1999 13:44:46 +0200

David Woodhouse said :
> Can you do something similar? Overwriting the DoC built-in BIOS with 0xff 
> would do the trick. That's what M-Systems recommend in their latest 
> documentation, I believe - and they even give you a 'Linux firmware' file 
> which is just 48Kb of 0xff :)

You can also press Ctrl-Alt-B while the system boots and the firmware will
not be loaded.

Oron


------- End of Forwarded Message



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
