Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eHis-0007i4-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 14:58:10 +0100
Message-ID: <39D1FF35.68F6B84@cotw.com>
Date: Wed, 27 Sep 2000 09:07:49 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: "Woodhouse, David" <dwmw2@infradead.org>, MTD List <mtd@infradead.org>
Subject: Question on 'doc_read_ecc'...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

If I am understanding things correctly, in 'doc_read_ecc' we
prevent the caller from reading across a 512 byte boundary and
that they cannot read more than 512 bytes at a time. Is this
correct for DoC2xxx devices and should it be the case for NAND
devices as well? I believe that for NAND devices it makes sense
since VFS and filesystems on average assume a 512 byte sector
size. Just looking for agreement on my thought process.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
