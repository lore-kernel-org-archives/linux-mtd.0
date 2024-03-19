Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4827AC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXUFeQXo5rc/m++aFgZBtXwh37iQTWU1JBu3oqksBWA=; b=HoqTC+0M36WUyL
	u1kcqSrQEpN+x0pEN+nL84y/M/1BqAbBUgdBP3nG8GanMNhPRFFMJTQCUAwOH/E4W8vojRJzGLARq
	i0JY+ieQRMjrYVRuKphJRjSgwxp0ZpOD+7ZMeSQ6hrYuxd+gXEDGcx6TFIn3G6QwSTxmuXOHCWaHV
	pkwCZUKZtzd0okZVQ/2ZIYp7xHG1n1YccTpCe/mFYY4v+lcu2r4ivZEP3NHNvSY+ecvUh2HJRgiFw
	yzxFkO+PqDVFbTrK34/xf59fYLvCYgF5IQU4wpNiNjfnRWh+xBf25y1ALtGS1KwBLPDjimo+GYpsG
	ZeIIqZCPGvY9+/XoDpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUy4-0000000BxH8-0N7j;
	Tue, 19 Mar 2024 08:37:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUy1-0000000BxGe-31Tm;
	Tue, 19 Mar 2024 08:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710837425; x=1742373425;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KxEovkRLfcOBJo8sLybFppNre+BC/0BqX5kv7PHyjYY=;
  b=L8demYDL6h1gOEcEYAHw+yj/9X/bN2HWLRu4wQDlVVqkOj1IgdCILyKm
   PRLCSFIhfHSJvsvZeOKeN4dikJEbQq2fduEooSri+Tv7sfeTXgdHIN0ye
   gIAyGpX8j7hNhFhFoHlfGEaYt2nNRtzuUWWF3aWNir6YCmIyqFXrya6O+
   kOKzZEKmdzS/77kddisRNQDBeNCWidf8MPN2hljptkmknvi8TNwR8nK//
   vMuHWIL8zbbvfPql07wbAm9xvwX+rgbTO9QcOY7xBrCqiiAceU7fBsW4r
   yXmAyldZXkOESD/40svMtc8YWtdgi9C3oTH9yWtYgGVEjc+E0KUfGYVPE
   Q==;
X-CSE-ConnectionGUID: nAyssGQoRB+MEbN67pDo4w==
X-CSE-MsgGUID: 66fYV4QuQzi8PbUn7UuNOQ==
X-IronPort-AV: E=Sophos;i="6.07,136,1708412400"; 
   d="scan'208";a="19571076"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 01:37:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 01:36:37 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 01:36:34 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <balamanikandan.gunasundar@microchip.com>, <Hari.PrasathGE@microchip.com>
Subject: [PATCH] MAINTAINERS: update maintainer for microchip nand and pmecc drivers
Date: Tue, 19 Mar 2024 14:06:20 +0530
Message-ID: <20240319083620.88181-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_013705_789372_B7963CDC 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Update myself as maintainer for microchip nand and pmecc drivers.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82896c3e0559..46c177aa2b60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14394,8 +14394,9 @@ F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 F:	drivers/media/platform/microchip/microchip-csi2dc.c
 
 MICROCHIP ECC DRIVER
+M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
 L:	linux-crypto@vger.kernel.org
-S:	Orphan
+S:	Supported
 F:	drivers/crypto/atmel-ecc.*
 
 MICROCHIP EIC DRIVER
@@ -14500,8 +14501,9 @@ S:	Maintained
 F:	drivers/mmc/host/atmel-mci.c
 
 MICROCHIP NAND DRIVER
+M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
 L:	linux-mtd@lists.infradead.org
-S:	Orphan
+S:	Supported
 F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 F:	drivers/mtd/nand/raw/atmel/*
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
