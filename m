Received: from [66.135.34.142] (helo=cadenux.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3j6T-0001yK-Rs
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 22:01:34 +0000
Received: from spudrun (unknown [200.12.238.168])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by cadenux.com (Postfix) with ESMTP id 512C43A005F
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Mar 2004 22:49:38 +0000 (UTC)
From: Greg Nutt <greg.nutt@cadenux-support.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1079561643.3882.93.camel@spudrun>
Mime-Version: 1.0
Date: Wed, 17 Mar 2004 16:14:04 -0600
Content-Transfer-Encoding: 7bit
Subject: Formatting INFTL
Reply-To: greg.nutt@cadenux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, list,

I am trying to bring up MTD on a 32MB Millenium Plus DoC
(MB2811-D32-V3).  After a couple of days of suffering and terminology
shock, I think I am getting close.  Using the current MTD snapshot on an
ARM9 Linux 2.4.20, I am getting the following:

  INFTL: inftlcore.c $Revision: 1.1.2.1 $, inftlmount.c $Revision:
1.1.2.1 $
  ...
  DiskOnChip Millennium Plus found at address 0xC000000
  Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB
3,3V)
  1 flash chips found. Total DiskOnChip size: 32 MiB
  mtd: Giving out device 1 to DiskOnChip Millennium Plus
  INFTL: could not find valid boot record?
  INFTL: could not mount device
  ...

My question:  It appears that need I need to provide an INFTL format for
the DoC.  Can someone explain how to do that?  I would be greatly
appreciative.

I recall reading in this list that Greg Ungerer had a modified version
of nftl_format that would do this job.  Is this available to the public
somewhere?  Or, if the modification to ntfl_format are trivial, can
someone explain them?

Thanks in advance.

Gregory Nutt
-- 
Greg Nutt <greg.nutt@cadenux-support.com>
Cadenux, LLC
