Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1434Ep-0005fu-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 22:37:35 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1434EU-0005fj-00
	for mtd@infradead.org; Mon, 04 Dec 2000 22:37:28 +0000
Date: Tue, 5 Dec 2000 08:36:59 +1000
Message-Id: <200012042236.IAA16219@singularity.tronunltd.com>
To: mtd@infradead.org
Subject: Problems with r/w on mtdblock0
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: 
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



  Have I done something wrong to get this error?

    bash# dd if=/dev/zero of=/dev/mtdblock0 bs=512 count=1
    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
    dd: /dev/mtdblock0: Input/output error
    1+0 records in
    0+0 records out

    bash# /bin/dd if=/dev/mtdblock0 of=/dev/null bs=512 count=1
    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
    /bin/dd: /dev/mtdblock0: Input/output error
    0+0 records in
    0+0 records out


  I have no problems reading and writing to nftla on my DoC Millennium ... just
not the block device.

  NB: I'm trying to use the block device, because dd'ing to the first and second
512bytes of the character device, while appearing successful,  does not "stick".
A hexdump immediately after a dd shows no sign of the dd data.

  Note, too, that dd'ing to a non existent DoC yields a different error;
    bash# /bin/dd if=/dev/mtdblock1 of=/dev/null bs=512 count=1
    /bin/dd: /dev/mtdblock1: No such device

    brw-r--r--   1 root     root      31,   0 Dec  4 20:14 /dev/mtdblock0
    brw-r--r--   1 root     root      31,   1 Dec  4 20:14 /dev/mtdblock1


Erm;
    bash# cat  /proc/mtd
    mtd0: 00800000 "DiskOnChip Millennium"

is that supposed to be the memory location for the DoC ?


Boot process  (My DoC drivers are compiled internally to the kernel, *not* as modules)
    Initializing MTD Layer
    M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
    DiskOnChip Millennium found at address 0xDC000
    Flash chip found: Manufacture ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
    1 flash chips found. Total DiskOnChip size: 8 Mbytes




--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
