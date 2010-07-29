Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeRKN-0006oy-Tc
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 11:31:09 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L6B00IJWHBS3680@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:04 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L6B00802HBNYF@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:04 +0900 (KST)
Date: Thu, 29 Jul 2010 17:00:59 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH][MTD][MTD-UTILS]MTD Utility for Runtime Partioning Support
To: linux-mtd@lists.infradead.org
Message-id: <000201cb2f11$8782b1f0$968815d0$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, 'David Woodhouse' <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

We are releasing MTD runtime partitioning support in MTD. We will release two
Patches(1. MTD Utils Patch 2. Kernel patch for adding IOCTLs).

For detailed understanding of runtime partitioning utility please refer below:


mtd utility - mtdpart

Functionality:
   MTD partition utility parses user partitions from the command shell.
   ioctls in kernel are used to create(MTDPARTITIONCREATE),
   delete(MTDPARTITIONDELETE),merge(MTDPARTITIONMERGE) and
   for changing permissions(MTDPARTITIONSETPERMISSION)
   of MTD partitions.


Features:
Enables to partition MTD devices on runtime by providing user following 
 options,

 a. Creating MTD Partition on registered MTD device.
    creates runtime partition on MTD device and parent partition will be
    deleted. If user partitions size is less than parent partition size
    "FREE" partition is created with read-write permission with remaining
    size.
	Syntax -- mtdpart c /dev/mtd4
        Prompts user for number of partitions and each partition information.

 b. Deleting the existing MTD Partition.
    	Syntax -- mtdpart d /dev/mtd7
              Deletes MTD partition 7.
  
 c. Merging two adjacent MTD Partitions.
	Syntax -- mtdpart j /dev/mtd4 /dev/mtd5
               Merges MTD partition 4 and 5.
     
 d. Changing the permission of MTD Partition. 
	Syntax -- mtdpart p /dev/mtd4 wr
               Changes MTD partition 4 permission to read-write.   
      Syntax -- mtdpart p /dev/mtd4 ro
               Changes MTD partition 4 permission to read-only.   


Note: Non-contiguous partitions are not handled in creating partition.
      Non-contiguous MTD partition permission can be changed and can be 
      deleted.	

TODO:
   1.Need to implement storing and restoring of the user created 
     MTD partitions on POR(PowerOnReset).
   2.To handle Non-contiguous MTD Partitions.


Assumptions:
  1. /dev/mtd0 is used as entry point, hence this node should be untouched.
  2. Supports only two MTD partitions to be merged.
    

Regards
Rohit HS & Vivek Dalal
