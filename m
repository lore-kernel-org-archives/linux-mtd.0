Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147zcn-0003Sl-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 12:42:41 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147zcm-0003Sf-00
	for mtd@infradead.org; Mon, 18 Dec 2000 12:42:41 +0000
Message-ID: <3A3E07C4.22A3F127@arcom.co.uk>
Date: Mon, 18 Dec 2000 12:49:08 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: JFFS: rmdir wierdness 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

# mkdir a
# ls
a
# rmdir a
# ls
# mkdir a
mkdir: a: File exists

Also

# mkdir b
# touch b/a
# rm b/a
# rmdir b
rmdir: b: Directory not empty

rmdir() thinks `b' still has children (I think).

This was done with the latest CVS with kernel 2.2.18.

David Vrabel.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
