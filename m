Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12U7M0-0000tB-00
	for mtd-list@infradead.org; Sun, 12 Mar 2000 12:20:16 +0000
Received: from geisha.cendio.se ([193.180.23.107] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12U7Ly-0000t5-00
	for mtd@infradead.org; Sun, 12 Mar 2000 12:20:15 +0000
Received: from biffen.cendio.se (IDENT:alex@biffen.cendio.se [193.180.23.11])
	by geisha.cendio.se (8.9.3/8.9.3) with ESMTP id NAA17733
	for <mtd@infradead.org>; Sun, 12 Mar 2000 13:20:10 +0100
Received: from localhost (alex@localhost)
	by biffen.cendio.se (8.8.7/8.8.7) with SMTP id NAA08878
	for <mtd@infradead.org>; Sun, 12 Mar 2000 13:20:10 +0100
Date: Sun, 12 Mar 2000 13:20:10 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: More comments
Message-ID: <Pine.LNX.3.96.1000312130417.7628A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Ok. I've worked some more with mtd now.

What is the reason for having the read and write ops not always read/write
the number of bytes you specify? (I guess that this is what the size_t
*retlen argument means.)

What concurrency assumptions does mtd make? Since the ops can sleep
(could be waiting for a sector erase to finish) there must be some kind of
locking. Who does the locking? What is "int *lock" in struct mtd? (and
shouldn't it be a semaphore or a spinlock?) Which operations can be called
from interrupt-context?

/ Alex







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
