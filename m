Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qJ21-0002AW-00
	for mtd-list@infradead.org; Mon, 30 Oct 2000 17:47:37 +0000
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13qJ1z-0002AQ-00
	for mtd@infradead.org; Mon, 30 Oct 2000 17:47:35 +0000
Message-ID: <39FDC4B2.A52F5D8A@cotw.com>
Date: Mon, 30 Oct 2000 12:57:54 -0600
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>, JFFS List <jffs-dev@axis.com>
Subject: Write support with JFFS and NAND now working...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Greetings.

I thought I would let people know that write support is now
working with JFFS and NAND flash. I was able to do 'cp', 'mv'
and 'rm' with no problems. I could mount/umount and the
changes made to the filesystem worked. SPECIAL NOTE: Process
synchronization has not been implemented i.e. spinlocks and
waitqueues. It is NOT currently process/thread safe. I will
have this implemented hopefully by the end of the day or
early tomorrow morning my time. Enjoy.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
