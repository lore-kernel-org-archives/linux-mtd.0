Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mzvb-0006UW-00
	for mtd-list@infradead.org; Wed, 03 May 2000 15:15:03 +0100
Received: from ncc1.infomail.es ([194.224.53.134] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12mzva-0006UQ-00
	for mtd@infradead.org; Wed, 03 May 2000 15:15:02 +0100
Date: Wed, 03 May 2000 16:16:26 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: Re: next step
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E12mzva-0006UQ-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Hi!

I've run fdisk on the DOC. I create the partition, and when I press 'w' to
write changes to disk, it says:

Calling ioctl() to re-read partition table.
No Virtual Unit Chains available for folding. Failing request
Cannot make free space.
NFTL_writeblock(): Cannot find block to write to
end_request: I/O error, dev 5d:00 (nftl), sector 1
 nftla:<5>ll_rw_block: device 5d:00: only 512-char blocks implemented
(1024)
 unable to read partition table
 nftla:<5>ll_rw_block: device 5d:00: only 512-char blocks implemented
(1024)
 unable to read partition table
Syncing disks.
..

I forgot to mention that there was (yes there was because I guess I've
dropped it) a DOS system on the DOC.

I'm using the patched lilo

What's wrong?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
