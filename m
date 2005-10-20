Received: from over.ny.us.ibm.com ([32.97.182.150] helo=pokfb.esmtp.ibm.com)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ESbYX-0006xQ-06
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 15:38:10 +0100
Received: from e35.co.us.ibm.com (e35.boulder.ibm.com [9.17.249.45])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id j9KEbrNo017980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 10:37:53 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9KEbWuV010482
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 10:37:32 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9KEcQtE533768
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 08:38:26 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j9KEbWDK017089
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 08:37:32 -0600
Received: from sig-9-65-70-134.mts.ibm.com (sig-9-65-70-134.mts.ibm.com
	[9.65.70.134])
	by d03av04.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j9KEbV6d017000
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 08:37:31 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 20 Oct 2005 09:37:33 -0500
Message-Id: <1129819053.4219.10.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Support for Extended Query Table version 1.4 was added to
cfi_cmdset_0001.c recent.  For the most part it works, however I'm
seeing it detect an incorrect number of hardware partitions on an Intel
P30 chip.  Adding some debug printks showed it reported 7, which is
incorrect for this chip.

Digging through the code, I noticed the following lines:

		/* Burst Read info */
		extra_size += (extp->MinorVersion < '4') ? 6 : 5;

I think the values to be used are reversed here.  Version 1.4 of the
extended query table shows that the Burst Read info spans 6 bytes,
whereas the above code results in a value of 5 being used.  This also
accounts for the incorrect 7 value I'm seeing, since the last byte of
the burst read info is 7.

Nico, could you confirm whether this is a bug or not?

thx,
josh
