Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rTpw-0000Xx-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 01:04:16 +0100
Received: from [62.178.143.33] (helo=gatekeeper.home.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14rTpu-0000Xr-00
	for mtd@infradead.org; Mon, 23 Apr 2001 01:04:15 +0100
From: "Erwin Authried" <eauth@softsys.co.at>
To: <mtd@infradead.org>
Subject: Makefile for 2.0
Date: Mon, 23 Apr 2001 01:28:31 +0200
Message-ID: <000001c0cb83$f2a185c0$6401a8c0@home.at>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I just tried to compile the rearranged sources
with the 2.0 kernel, it seems that the Makefile
doesn't support 2.0 anymore. There are no .o files
produced, besides an empty mtdlink.o. What's the 
purpose of GNUmakefile?

-Erwin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
