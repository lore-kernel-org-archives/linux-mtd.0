Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D2CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DTrJPG9TL7I7LPSGzorB5bqGAcvTcQA6z0Py+h7+GT0=; b=qXD3UzLEdl4MhF
	SI5OapMewQXHytSsyOK5DVh7WAdNbAAYYEXWE3Ffu2IM4kcomGjaN82rFFVh8HJ23ukW9LIDGBVYQ
	Tksh1GIT76LqAO5yZiopP9Ku11Wp/eK4IsGByAzyr2eDrZ58raRsxlB/5CPCuGTmMJdvS+fjn51ON
	d/r7eMtefMpuSkWr3zOInALT/aTxXNsE8nt+D/SbJElqM8Ltu+NP025ZLB3R470twLLv0168MJous
	j3/jeEpOc89OA4mWgRzdjm1v4OW+Sru8Y7NsVAqrCFnXZdOTvopmKzCjJ7VcdFNFiXkD8QKEbJIp6
	Uft61E32Na5gF2FhEeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngmuh-003Sx8-Bb; Tue, 19 Apr 2022 12:24:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngm6y-0039nh-4I
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 11:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650368016; x=1681904016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M87flXDRkEtRhPRaiGAAjGXKHbqqyxVzsAfchSEPEeA=;
 b=Tcg6rVMyhvkjr8nDzox8RNmuMFN56VvdKLZHahzr8BCp+wkwIDmre1WQ
 XCaG6DWrl1iJvfDrFwAvX1fVHn76WltqwTfTYomldeS8DjpKjkj0G0FvB
 /zrFPavPDNZRgp8WKIn3A7mIlQvtdDTmo9bkjFd4RVseU88RzvGyXX2Vb
 Jw/gO9gTpmkD7twuUxvWqDqLCtWyugU2SDeGPwyc+bc4YHkm33K6iDNdd
 Div2LRro2r6wP0362ssUz+AXxWbLlZ1/3+UlnaQBeBRH8syH6t0BR0zKO
 a+n+eiPcBpOSESm0R3X6kjb6h4B2jaCdzcUBIxI4ryYFLNI6BkkWPgwQ/ A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="170088006"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 04:33:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 04:33:34 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 19 Apr 2022 04:33:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <david.oberhollenzer@sigma-star.at>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [mtd-www][PATCH] doc: nand: Remove CONFIG_MTD_BLOCK as required
 config for JFFS2 on NAND
Date: Tue, 19 Apr 2022 14:33:31 +0300
Message-ID: <20220419113331.70150-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_043336_214111_3DBE54C0 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CONFIG_MTD_BLOCK specifies that mounting a JFFS2 filesystem doesn't
require using mtdblock. Match Kernel's description and update
documentation.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 doc/nand.xml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/doc/nand.xml b/doc/nand.xml
index 281e0e0..70bd4b4 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -316,7 +316,6 @@ if one of these settings is missing.</p>
 				
 <p>CONFIG_MTD=y<br />
 CONFIG_MTD_CHAR=y<br />
-CONFIG_MTD_BLOCK=y<br />
 CONFIG_MTD_NAND=y<br />
 CONFIG_MTD_NAND_YOURBOARD=y<br />
 CONFIG_JFFS2_FS=y<br />
@@ -324,6 +323,10 @@ CONFIG_JFFS2_FS_DEBUG=0<br />
 CONFIG_JFFS2_FS_NAND=y</p>
 </div>
 
+<p>Note that mounting a JFFS2 filesystem doesn't require using mtdblock. It's
+possible to mount a rootfs using the MTD device on the "root=" bootargs as
+"root=mtd2" or "root=mtd:name_of_device".</p>
+
 <hr size="2" />
 		
 <h2>FAQ</h2>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
