Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146aY4-0003jV-00
	for mtd-list@infradead.org; Thu, 14 Dec 2000 15:44:00 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 146aY3-0003jP-00
	for mtd@infradead.org; Thu, 14 Dec 2000 15:43:59 +0000
Message-ID: <3A38EC28.9EDC59BF@arcom.co.uk>
Date: Thu, 14 Dec 2000 15:50:00 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: JFFS: deleted files still appear in directory
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm using the lastest CVS MTD+JFFS with kernel 2.2.18 with the following
result:

# ls
# touch j
# rm j
# ls
ls: ./j: No such file or directory

It appears that readdir() (?) thinks the files exists put stat(), open()
etc. do not.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
