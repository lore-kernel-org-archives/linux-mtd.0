Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sqsO-0002Wo-00
	for mtd-list@infradead.org; Fri, 19 May 2000 18:47:56 +0100
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12sqsM-0002Wi-00
	for mtd@infradead.org; Fri, 19 May 2000 18:47:55 +0100
Message-ID: <01BFC1CB.35B15840@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: more 2.0 compatibility problems
Date: Fri, 19 May 2000 19:48:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have tried to use compatmac.h from 2.3.99 to compile for 2.0, without success.
Some definitions in this file are simply wrong.

Further problems:
the functions end_that_request_first and end_that_request_last are missing.
I don't know if they can simply be copied from some recent kernel.

David's definition for __MOD_INC_USE_COUNT and __MOD_DEC_USE_COUNT in
include/linux/mtd/compatmac.h doesn't work, the usage count in 2.0 kernels is 
implemented in a different way. Is there an easy way to implement this functionality
for 2.0 kernels? 

Regarding the userspace copy problem in mtdchar.c:
If a kernel buffer is used to hold the data for flash writes, may there be problems
with some flash hardware if the write is splitted up into small chunks?

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
