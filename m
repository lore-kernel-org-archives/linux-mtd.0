Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Hlo-00063P-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 14:20:48 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137Hln-00063J-00
	for mtd@infradead.org; Wed, 28 Jun 2000 14:20:47 +0100
Received: from cygnus.co.uk (IDENT:dwmw2@localhost [127.0.0.1])
	by passion.cygnus.co.uk (8.9.3/8.9.3) with ESMTP id OAA31465
	for <mtd@infradead.org>; Wed, 28 Jun 2000 14:23:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: CFI flash in a PC?
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 28 Jun 2000 14:23:35 +0100
Message-ID: <31462.962198615@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm trying to find a way of putting CFI flash chips into a PC, just to make 
my life easier for the development stage - I'm getting extremely tired of 
having to download an entire kernel to the embedded ARM board I'm testing 
on, and write it to the flash chips it boots from, every time I want to 
change a line of code.

Unfortunately, I can't find an easy way of doing it.

I thought M-Systems used to produce an ISA board which had NOR flash on it, 
but it's missing from their website, presumed discontinued.

Anyone have any ideas where I can find preferably an ISA or PCI board with 
CFI flash chips on it, or failing that an IA32 single board computer with 
flash built-in and a network interface? UK suppliers preferred but not 
essential.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
