Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KknhX-0005I2-Bo
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 22:28:15 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8UMSCtL015060
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 15:28:12 -0700
To: linux-mtd@lists.infradead.org
Subject: UBIFS sync question
MIME-Version: 1.0
Message-ID: <OFD58EAD0A.B5E12235-ON882574D4.007AC780-882574D4.007B6DB9@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 30 Sep 2008 15:28:10 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

We've run into a side effect that we think is probably a design choice in 
UBIFS, but we want to make sure before we start trying to troubleshoot a 
"bug".  What we do is open an existing  file in a UBIFS formated UBI 
volume on a NAND flash, add a few lines to it, close the file, then 
WITHOUT un-mounting the file system, reboot the box (simulating a power 
outage).  When the box reboots and we look at the file, it's zero length 
and has no contents.  I suspect it's because UBIFS does less frequent 
syncs than say ext2 for performance reasons, and we're just losing the 
contents of the file because there's no sync before the reboot.

Is this correct or do we need to start digging for something broken?

Thanks.

Bruce
