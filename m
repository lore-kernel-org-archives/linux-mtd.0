Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BvhF-00039r-00
	for mtd-list@infradead.org; Tue, 11 Jul 2000 09:47:17 +0100
Received: from ncc1.infomail.es ([194.224.53.134] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13BvhE-00039l-00
	for mtd@infradead.org; Tue, 11 Jul 2000 09:47:16 +0100
Date: Tue, 11 Jul 2000 10:43:34 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: no success
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E13BvhE-00039l-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi all!

It's me again with my strange problems. I've finally successfully run lilo
on the DOC, and reboot, and now I get a normal LILO prompt (not as the
other day, where I was getting strange characters in the LILO prompt), but:

LILO boot:
Loading linux................
Uncompressing Linux... Ok, booting the kernel

and it stops there!

When running lilo, there was no error messages (I even run it with -v -v to
see all messages, and everything seemed ok)

When I run this kernel booting linux from DOS and from a ZIP drive, the DOC
is detected and everything seems fine. So, I don't know where the problem
is.

I've run rdev also on the device with the kernel.

Thanks



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
