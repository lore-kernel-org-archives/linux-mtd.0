Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13F2Oh-0006y0-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 23:32:59 +0100
Received: from ip-151-191.gw.total-web.net ([209.186.151.191] helo=150.81.192.20)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13F2Og-0006xu-00
	for mtd@infradead.org; Wed, 19 Jul 2000 23:32:59 +0100
From: "Matt Hortman" <mbhortman@ieee.org>
Date: Wed, 19 Jul 2000 18:33:41 -0400
To: mtd@infradead.org
Subject: using int 13h to access DOC
Message-ID: <20000719183341.B26693@khayman.mavrik.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi guys...

Shoot this down: Since the M-Sys firmware in the DOC simply installs
an int 13h handler, why not use it to access the DOC using "bios"
calls.  I realize that the kernel probably overwrites that handler but
that could be fixed.  I don't know, however, about using a real-mode
interrupt from a device driver.  It seems too simple to work.  What
have I overlooked?

thanks,

-Matt



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
