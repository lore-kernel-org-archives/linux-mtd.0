Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12s81q-0005Ql-00
	for mtd-list@infradead.org; Wed, 17 May 2000 18:54:42 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12s81p-0005Qf-00
	for mtd@infradead.org; Wed, 17 May 2000 18:54:41 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id LAA14759
	for <mtd@infradead.org>; Wed, 17 May 2000 11:58:20 -0600
Date: Wed, 17 May 2000 11:58:20 -0600 (MDT)
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Subject: DoC2k_init problem
Message-ID: <Pine.LNX.4.21.0005171150570.14754-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The problem seems to be that on line 392 of doc2000,

old = (struct DiskOnChip *)old->nextdoc->priv;

old->nextdoc is NULL.  What I don't seem to understand is why this old
list is being searched at all.  It should only be searched if doc2klist is
not NULL, and I see no reason why it should be non-NULL on system bootup,
unless it's static initializer isn't actually working, or a buffer is
being overrun somewhere.

Anyone know what might be going on here?

Patrick



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
