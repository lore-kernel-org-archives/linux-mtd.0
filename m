Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12h9GO-000461-00
	for mtd-list@infradead.org; Mon, 17 Apr 2000 12:00:20 +0100
Received: from ncc3.infomail.es ([194.224.53.142] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12h9GN-00045r-00
	for mtd@infradead.org; Mon, 17 Apr 2000 12:00:19 +0100
Message-ID: <38FAEE26.24075503@tsai.es>
Date: Mon, 17 Apr 2000 12:57:42 +0200
From: Rodrigo Moya <rmoya@tsai.es>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>
Subject: no success
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi all!

I've put the MTD drivers into the kernel, and I'm booting linux from the
ZIP drive. Once it boots, I try to access the nftl* devices with fdisk,
but I've got always the same error about:

could not open /dev/nftl*

What am I doing wrong?

I'm using the 1.23 version of nftl.c, as David said this was the last
one which worked, but with the current CVS version of this file the
results are the same.

Cheers


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
