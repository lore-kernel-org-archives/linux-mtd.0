Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WxL1-0001wY-00
	for mtd-list@infradead.org; Thu, 07 Sep 2000 09:47:15 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WxKz-0001wS-00
	for mtd@infradead.org; Thu, 07 Sep 2000 09:47:14 +0100
Message-ID: <39B756F3.7D89AB9A@arcom.co.uk>
Date: Thu, 07 Sep 2000 09:50:59 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: jffs_mknod: bogus imode when creating sockets
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Creating sockets on JFFS results in
    jffs_mknod: bogus imode (nnnn)
messsages.

In jffs_mknod() in inode-v22.c the code that checks if the inode is a
socket has been commented out.  Everything works fine as it is can I
just uncommented out the socket check?

David Vrabel

ps. What's a imode? :->



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
