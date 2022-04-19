Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDB8C43217
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P45KfpV4GSrafVI6UNNXmXssW0qDkyf0AWy30OS+bWw=; b=s5P6SO5XOWOXtl
	UYp/zcHACRpQGa/XnUPfX0SlVGMZVAWEnyntaWxVIQ7OSROewA1FgLllwKZTx5c7WvBM/qTrNS0Uq
	qTDhyxziIlsyidkcY61MjLqa59cFCwSInoqvJqSiuMRULDcWLguVu6Vp5VMs3sV7keFUDiMG5wz8g
	/z8xXao3qWgB508hTlermftqAG6Y2HQWyjXg8l44HQKyyFC+CBhBWCKwt14wP5BUW9jeZT9FXQJWd
	1Pm+qI0W8UDGzVlbj6nKcFXANPYeu/EHzlCvlSodR87x87Vzy/sCmNiG4aX4oPs/8C0kopKTKYBfS
	XyUfhHZLWYptwWA6mP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngo3T-003uqQ-E9; Tue, 19 Apr 2022 13:38:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnH4-003bVj-1v
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 12:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650372486; x=1681908486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1X9awyF3a4vyt2lDQ5ed4FWG2F9+dRdS2YYhOa7R7BI=;
 b=ptqx13/9Bl2FsqTQ153ZPBjznyS99OcTTRHfO5wAarEbnJZQk2cVu/BA
 E6BQT/bEZshB/o4TXMJOvpgos0PglqkFNynlkLP/NbK+qNrwCEJ6z0vTN
 KiI+K2fMfnYXHiqe8ECXa5kZi2p5dp6BP1rHCb9FvBXQNS1FBFttnb84W
 6S17YepviJXop11p1J86ToW8WYA7vINjJG4gcd7sCnYd/uc250INbusod
 KyMetPe931MTucdsmnlzyR88KbFbincGm78ms3fuvHehAs48uM3bg/RnG
 BwYyEBCq7NSt2X797F47dMRzGpWKqLTwOSlds7J05VLtnA8lZUAw5JBPF g==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="153063854"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 05:48:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 05:48:04 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 19 Apr 2022 05:48:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <david.oberhollenzer@sigma-star.at>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [mtd-www][PATCH] doc: nand: Add note about CONFIG_MTD_CHAR
Date: Tue, 19 Apr 2022 15:48:01 +0300
Message-ID: <20220419124801.74288-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_054806_319938_0B3BB5D1 
X-CRM114-Status: GOOD (  10.84  )
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

mtdchar module was merged in mtdcore a long time ago. Add a comment about
JFFS2 CONFIG_MTD_CHAR requirement.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 doc/nand.xml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/doc/nand.xml b/doc/nand.xml
index 70bd4b4..ebd1255 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -315,7 +315,6 @@ maintainer to include it</p>
 if one of these settings is missing.</p>
 				
 <p>CONFIG_MTD=y<br />
-CONFIG_MTD_CHAR=y<br />
 CONFIG_MTD_NAND=y<br />
 CONFIG_MTD_NAND_YOURBOARD=y<br />
 CONFIG_JFFS2_FS=y<br />
@@ -323,6 +322,9 @@ CONFIG_JFFS2_FS_DEBUG=0<br />
 CONFIG_JFFS2_FS_NAND=y</p>
 </div>
 
+<p>mtdchar module was merged in mtdcore in kernel v3.10. Older kernels should
+set CONFIG_MTD_CHAR=y in order that JFFS2 to work on NAND.</p>
+
 <p>Note that mounting a JFFS2 filesystem doesn't require using mtdblock. It's
 possible to mount a rootfs using the MTD device on the "root=" bootargs as
 "root=mtd2" or "root=mtd:name_of_device".</p>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
