Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12zgVC-0008W9-00
	for mtd-list@infradead.org; Wed, 07 Jun 2000 15:08:14 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12zgVB-0008W3-00
	for cvs-notify@infradead.org; Wed, 07 Jun 2000 15:08:13 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel nftl.c'
Message-Id: <E12zgVB-0008W3-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 07 Jun 2000 15:08:13 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv32712

Modified Files:
	nftl.c 
Log Message:
Added a notice regarding the legal status of the patent issues.
M-Systems have now granted us a licence to use the patented algorithms in
NFTL on DiskOnChip products, so I've stuck in a notice to that effect
which is basically copied from the existing notice in the FTL code.

i.e.:
/*
  LEGAL NOTE: The NFTL format is patented by M-Systems.  They have
  granted a licence for its use with their DiskOnChip products:

    "M-Systems grants a royalty-free, non-exclusive license under
    any presently existing M-Systems intellectual property rights
    necessary for the design and development of NFTL-compatible
    drivers, file systems and utilities to use the data formats with, 
    and solely to support, M-Systems' DiskOnChip products"

  A signed copy of this agreement from M-Systems is kept on file by
  Red Hat UK Limited. Or it will be as soon as it arrives. 
*/



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
