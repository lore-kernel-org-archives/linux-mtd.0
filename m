Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14abPy-0006er-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 10:43:42 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14abPw-0006el-00
	for mtd@infradead.org; Wed, 07 Mar 2001 10:43:40 +0000
Message-ID: <01C0A6FB.DB6056E0@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: 16-bit JEDEC Flash
Date: Wed, 7 Mar 2001 11:43:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>From the comments in jedec.c I figure out that 16-bit JEDEC flash is not supported.
There are still several manufacturers that produce flash without CFI (e.g., Atmel).
If that's true, wouldn't it be better to use the already existing cfi implementation to
emulate a CFI device, instead of implementing all that stuff again for non-CFI flash?
I believe it wouldn't be much more than having a table with the JEDEC id's as an index 
that contains all the CFI parameters.

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
