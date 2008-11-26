Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5HFd-0008HA-MS
	for linux-mtd@lists.infradead.org; Wed, 26 Nov 2008 10:04:06 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KAX00HV0QMNWM@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 26 Nov 2008 19:03:59 +0900 (KST)
Received: from brijeshs ([107.108.214.195])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KAX00NGBQMQ5B@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 26 Nov 2008 19:04:03 +0900 (KST)
Date: Wed, 26 Nov 2008 15:37:34 +0530
From: Brijesh Singh <brij.singh@samsung.com>
Subject: UBIFS performance
To: linux-mtd@lists.infradead.org
Message-id: <B76220C07A204128A4B86AE742992E46@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; reply-type=original; charset=iso-8859-1;
	format=flowed
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  I am testing UBIFS and JFFS2 performance on OneNand with iozone utility. 
Interestingly, random read / write performance are slightly better than 
sequential read / write.
These results are consistent across multiple versions. And consistent with 
all different record length sizes.

Correct me if I am wrong, but shouldn't sequential read/write fair better 
than random read/write? Is this expected behavior? If yes,why?

Thanks and Regards,
Brijesh 
