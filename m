Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cpIa-0003cX-00
	for mtd-list@infradead.org; Sat, 23 Sep 2000 14:25:00 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cpIY-0003cP-00
	for mtd@infradead.org; Sat, 23 Sep 2000 14:24:58 +0100
Message-ID: <39CCB16B.976D39AF@cotw.com>
Date: Sat, 23 Sep 2000 08:34:35 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: JFFS List <jffs-dev@axis.com>, MTD List <mtd@infradead.org>
Subject: Humble question on actual journalling mechanism...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Greetings again.

I have been reading the JFFS code solid for the past two days
now. I am about 1/4 the way through 'intrep.c' which is just
huge. The function that I am currently looking at is
'jffs_insert_node'. I must humbly ask for how the underlying
journaling/versioning works. In the explanation, if the
manipulation of the members in the 'jffs_node' structure with
regards to versioning could be explained, that would be great.

All the other files were easy to understand because it was just
the basic calls for working with the flash and providing the
upper level functions for superblock and inode interfacing with
the kernel's VFS layer. 'intrep.c' is where the core is really
at and I would appreciate some simple understanding.

Yes, I did look through the MTD archives. No, I did not look
through the JFFS mailing list archives because they do not seem
to exist anywhere off of the Axis page or anywhere else for
that matter. I also apologize for the cross-post.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
