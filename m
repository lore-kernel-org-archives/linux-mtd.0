Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Lrox-0003sH-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 19:12:35 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
Date: Thu, 25 Jan 2001 12:56:07 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICKEMKCEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <17667.980447607@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> my version), can you first make it printk a message when, so you 
> know it's 
> actually _found_ the ANAND header, and then find each instance of 'goto 
> ReplUnitTable' and make it print the reason if/when it triggers, rather 
> than just doing so silently.

Done

>Please define ECC_DEBUG at the beginning of doc2000.c

Done

Okay.  I'm recompiling.  I will report back after it's done.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
