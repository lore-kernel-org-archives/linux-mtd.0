Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sBOW-0005qL-00
	for mtd-list@infradead.org; Wed, 17 May 2000 22:30:20 +0100
Date: Wed, 17 May 2000 15:33:52 -0600 (MDT)
From: Patrick Higgins <phiggins@transzap.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Write support
Message-ID: <Pine.LNX.4.21.0005171506400.17790-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I've finally gotten everything to compile and boot correctly, but now I
find that write support seems to have some problems.  The first is that I
can't mount the filesystem read-write in the first place--I have to mount
it read-only and then remount it read-write.  I suspect this is
intentional.  However, after remounting read-write, I start getting these
types of messages:

end_request: I/O error, dev 5d:01 (unknown), sector 4
end_request: I/O error, dev 5d:01 (unknown), sector 10
end_request: I/O error, dev 5d:01 (unknown), sector 12
end_request: I/O error, dev 5d:01 (unknown), sector 536


I find that if I create a file, it will show up in ls output until a round
of "end_request: I/O error" messages show up, after which point it will no
longer appear, but I am still able to cat the file correctly.

The driver also detects two Disk on Chips, although I only have one, as
seen in the following console output:

Main: Initialising MTD Drivers                                               
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.          
Possible DiskOnChip with unknown ChipID C3 found at 0xc8000                  
DiskOnChip 2000 found at address 0xD8000                                     
3 flash chips found. Total DiskOnChip size: 24 Mb                            
DiskOnChip 2000 found at address 0xDA000                                     
3 flash chips found. Total DiskOnChip size: 24 Mb                            
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI                 
$Id: nftl.c,v 1.29 2000/05/04 08:41:52 dwmw2 Exp $                           
NFTL capacity reduced for geometry reasons from bba0 to bb80 sectors         
Partition check:                                                             
 nftla: nftla1                                                               
NFTL capacity reduced for geometry reasons from bba0 to bb80 sectors         
 nftlb: nftlb1                                                               


Am I missing anything obvious?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
