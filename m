Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Iydi-0001dL-00
	for mtd-list@infradead.org; Wed, 17 Jan 2001 19:53:02 +0000
Received: from hall.mail.mindspring.net ([207.69.200.60])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Iydh-0001dF-00
	for mtd@infradead.org; Wed, 17 Jan 2001 19:53:01 +0000
Received: from nexus-tech.net (pool-63.52.1.28.atln.grid.net [63.52.1.28])
	by hall.mail.mindspring.net (8.9.3/8.8.5) with ESMTP id OAA23949
	for <mtd@infradead.org>; Wed, 17 Jan 2001 14:52:48 -0500 (EST)
Message-ID: <3A65F6B3.B7842663@nexus-tech.net>
Date: Wed, 17 Jan 2001 14:46:59 -0500
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: Newbie: more questions
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I got the mail archives, but I still have a few questions (then,
hopefully, I'll be quiet for a while).

1) What is the difference between JFFS and JFFS2?

2) Is NAND flash supported by JFFS? Is NAND flash supported by the
character device?

3) Can the filesystem be limited to using only part of a device? For
example, can I write a compressed image to a well-known area in flash 
(that the boot is aware of) and prevent the fs from using this? Does
this apply to both NOR and NAND flash?

4) How are different blocks/sectors within a device accessed by the
character device? Do I use different device minors or do I seek to an
address?

Thanks for your help, Kyle.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
