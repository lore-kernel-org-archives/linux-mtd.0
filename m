Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIcWB-0004fj-My
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 05:56:41 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLM008RWLU9NX@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 14:56:33 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLM00FOGLU6WE@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 14:56:33 +0900 (KST)
Date: Mon, 22 Jun 2009 11:26:54 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: MLC Support in JFFS2
To: 'David Woodhouse' <dwmw2@infradead.org>
Message-id: <1C48A8694DD447A0A922790E587F7D5F@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7BIT
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Currenlty , Is there a way to use JFFS2 with MLC Memories ?

If not , Felt that any one of the following patch can be of use

1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
          - Which removes the Clean Marker.

2. http://lists.infradead.org/pipermail/linux-mtd/2008-September/023101.html
   http://lists.infradead.org/pipermail/linux-mtd/2008-September/023044.html 
          - Leaving 1page/Block , for Clean Marker.

or some other solution, which solves the standoff.   

Without MLC Support , Flex-OneNAND is unsuable with JFFS2.

With Regards
  Moorthy
