Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fm65-0005iO-00
	for mtd-list@infradead.org; Sat, 22 Jul 2000 00:20:49 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Fm62-0005iI-00
	for mtd@infradead.org; Sat, 22 Jul 2000 00:20:47 +0100
Message-ID: <3978DFBA.175899F2@evoserve.com>
Date: Sat, 22 Jul 2000 07:41:46 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: Finn Hakansson <finn.hakansson@axis.com>
CC: "mtd@infradead.org" <mtd@infradead.org>
Subject: jffs_file_write
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

How do we handle these:

  Appending to an existing file. What fields must be updated with what?
We write a new inode right? What values should I place in the raw inode
struct?

  Rewriting file? Writing a file?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
