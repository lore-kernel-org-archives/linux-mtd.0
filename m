Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZXyV-0001Em-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 13:18:43 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZXyU-0001Eg-00
	for mtd@infradead.org; Thu, 14 Sep 2000 13:18:42 +0100
Message-ID: <39C0C312.44F942D2@arcom.co.uk>
Date: Thu, 14 Sep 2000 13:22:42 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Latest mtdchar.c breaks with 2.2.17
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just updated mtdchar.c to 1.10 and it fails to compile with kernel
2.2.17 complaining about a nonexistant owner field in mtd_fops (line
372).

It compiles fine without it.

Is it a 2.4.x thing?

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
