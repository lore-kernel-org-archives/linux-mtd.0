Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Po4q-0004Zj-00
	for mtd-list@infradead.org; Fri, 18 Aug 2000 16:29:00 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Po4p-0004Zd-00
	for mtd@infradead.org; Fri, 18 Aug 2000 16:28:59 +0100
Message-ID: <399D56A2.BAAFB307@arcom.co.uk>
Date: Fri, 18 Aug 2000 16:30:42 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org, jffs-dev@axis.org
Subject: Can't change permissions (etc) of FIFOs on JFFS.
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Attempting to change permissions and times of FIFOs in JFFS results in
    jffs_notify_change(): Invalid inode number = nnn

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
