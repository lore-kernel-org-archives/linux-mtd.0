Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1384cp-00056C-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 18:30:47 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1384ck-000566-00
	for mtd@infradead.org; Fri, 30 Jun 2000 18:30:43 +0100
Received: from cygnus.co.uk (IDENT:dwmw2@localhost [127.0.0.1])
	by passion.cygnus.co.uk (8.9.3/8.9.3) with ESMTP id SAA06076
	for <mtd@infradead.org>; Fri, 30 Jun 2000 18:33:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: CFI code.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Jun 2000 18:33:50 +0100
Message-ID: <6073.962386430@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The code for dealing with CFI Intel flash appears to be working to a certain
extent. You can download it and test it now if you're brave.

It's currently installing an 8Mb FTL filesystem on my embedded board, so 
that I can beat on it for a while.

I'll see if I can break it when I come in on Monday - by which time it'll
hopefully have finished telling me about each successful two-byte write over
a 115200 baud serial line :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
