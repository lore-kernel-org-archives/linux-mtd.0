Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EG4n-0007WF-00
	for mtd-list@infradead.org; Thu, 04 Jan 2001 19:29:29 +0000
Message-ID: <3A54CF86.7F7B46B7@mvista.com>
Date: Thu, 04 Jan 2001 11:31:18 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: ahennessy@mvista.com, mtd@infradead.org
Subject: mtdchar.c and vmalloc
References: <3.0.6.32.20010104184851.0082a4e0@popmail.libero.it> <10818.978631074@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

During  stress testing,  I ran into a data corruption problem that  went away
after I changed vmalloc to
kmalloc  in mtd_read and mtd_write functions (mtdchar.c).   I added a loop to
the code so that malloc size
doesn't exceed the kmalloc maximum of 128k bytes.
Seems to work fine now.

Does this make sense? Anyone else see this problem?   Any opinions if this is
an ok solution until
kiovec or something else is implemented?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
