Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91zN-0000PR-P5
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 18:02:34 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5II2Xge019773
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 11:02:33 -0700
To: linux-mtd@lists.infradead.org
Subject: Bug in nand_default_block_markbad in nand_base.c?
MIME-Version: 1.0
Message-ID: <OF5751FC90.43D3F6BC-ON8825746C.006290E8-8825746C.006319E6@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 18 Jun 2008 11:02:29 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure but I may have found a problem in nand_default_block_markbad. 
 First thing the function does is update the RAM BBT if it exists, then it 
checks to see if there's a flash BBT.  If there is it updates the flash 
BBT and returns otherwise it marks the block bad in the flash and returns. 
 Shouldn't it ALWAYS mark the block bad regardless of if there's a flash 
BBT?

Bruce
