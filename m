Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cQWa-0001Se-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 14:06:52 +0100
Received: from ledzep.americas.sgi.com (ledzep.americas.sgi.com [137.38.226.97])
	by tolkor.sgi.com (8.12.2/8.12.2/linux-outbound_gateway-1.2) with ESMTP id g77D6UK3007854
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 08:06:30 -0500
Received: from archer.americas.sgi.com (archer.americas.sgi.com [137.38.88.26]) by ledzep.americas.sgi.com (SGI-SGI-8.9.3/americas-smart-nospam1.1) with ESMTP id IAA82641 for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 08:06:30 -0500 (CDT)
Received: from sgi.com (localhost [127.0.0.1]) by archer.americas.sgi.com (8.8.8/ASC-news-1.4) with ESMTP id IAA222499 for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 08:06:29 -0500 (CDT)
Message-ID: <3D511B55.6ADABE4D@sgi.com>
Date: Wed, 07 Aug 2002 08:06:29 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Hardware ECC in NAND flash driver
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I'm working on the Linux port to the Samsung S3C2410 PDA controller
(ARM 920T core with many interfaces, including a NAND flash controller,
built-in).  The 2410's NAND flash controller generates ECC codes
(3 bytes ECC per each 512 bytes data).  Are there any plans to
incorporate hardware ECC support into this driver?  Specifically,
I guess that would mean adding "hooks" so the hardware-specific
driver could handle the ECC parts   (I only had to make
a few small changes to nand.c to get this working for the 2410.)
If there's an effort underway in this area, I'd be happy to
participate in the development.

Thanks,
Steve


-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
