Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14axTF-0005es-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 10:16:33 +0000
Received: from [62.178.143.33] (helo=gatekeeper.home.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14axTE-0005em-00
	for mtd@infradead.org; Thu, 08 Mar 2001 10:16:32 +0000
Message-ID: <01C0A7B2.55455BC0@omnibook.home.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: reset/read mode cmd for AMD compatible flash
Date: Thu, 8 Mar 2001 09:29:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In cfi-probe.c, it seems that the command 0xff is used to switch the flash
into read mode. I have studied several datasheets of AMD compatible flash
(AMD29F160, Fujitsu MB29F160, Atmel AT49BV160...), and they specify
0xf0 as the reset mode command. Can anybody please enlighten me?

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
