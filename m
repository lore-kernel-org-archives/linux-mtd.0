Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rd6U-0003Q9-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 10:57:58 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rd6T-0003Q3-00
	for mtd@infradead.org; Mon, 23 Apr 2001 10:57:57 +0100
Message-ID: <006701c0cbd3$85868ee0$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: <mtd@infradead.org>
Subject: Fw: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 12:58:10 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello Robert!
Thank You very much for Your help.
I worked with kernel 2.2.18 but could not achieve a success.
Now I use Linux kernel 2.4.0 and latest version MTD from CVS. After booting
in /proc/mtd I see :
dev:    size   erasesize  name
mtd0: 00800000 00040000 "SC520CDP Flash Bank #0"
mtd1: 00800000 00040000 "SC520CDP Flash Bank #1"

Das ist fantastik!

Now I must place a kernel to a flash and booting from it.
What steps should be undertaken to reach that result?

Thank You for any help.

Alexander Melichenko.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
