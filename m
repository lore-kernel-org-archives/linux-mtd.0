Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Md02m-0005rQ-51
	for linux-mtd@lists.infradead.org; Mon, 17 Aug 2009 11:06:32 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KOI00LMTPILSG@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 17 Aug 2009 20:06:21 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KOI000UTPIK5Z@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 17 Aug 2009 20:06:21 +0900 (KST)
Date: Mon, 17 Aug 2009 16:13:43 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: [PATCH] [OneNAND] OTP support re-implementation 0/1
To: linux-mtd@lists.infradead.org
Message-id: <8446686E3F0D47DBADA638B6B346FA6A@sisodomain.com>
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

OneNAND supports OTP (One Time Programmable) feature.

OTP is an extra block provided on the OneNAND memory chip,
which can not be erased after issue of OTP command.

OTP support Implementation in the Current OneNAND Driver is not serving the purpose of  locking
the OTP Block.
This patch provides a Re-Implementation of OTP support in OneNAND driver.

It also provides the following additional features:-
1. 1st Block in OneNAND can be permanently locked using OTP.
2. Both OTP Block and the 1st Block can together be locked using OTP.

The patch is attached in the mail that follows.

Regards,
Amul Kumar Saha 
