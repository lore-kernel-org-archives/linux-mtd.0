Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F41C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4yLgwq2LvvDK0abjis3/0QY+2G48CvXu6/9sJzHm6c=; b=cn7HDPxj0tW5v9
	1nENFNYZAj9n9HaDqO2Hw/lxWEdcY4RjVxsckCN9UMaUYBxKx6cwwkYwi/hv5fGVV3z92R7ikA08N
	hVSzis/N8SijM1GgRkNxeG0Ea6lTDP+BSVXYkApDOWhEmpZYlhOrtBozewYWoUw7jMfW5QLCiXPIZ
	kdcoKAzdVJNnNrc5UeHGR/LsNDt18ou7KWPRKjzOSdl5gvB8rHlmWV1MtHULu2biPbszaTzG9Cisk
	YZ10ewhnh2IadIaAa9WHQV5efRoymsh/WijezZMxskxvRjdurDezYLEnmPL8I9cQrDrk1JyKHFZH0
	Te9j1k8KuMrSMoMPqJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq7P-007on8-TW; Mon, 11 Apr 2022 09:13:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq4M-007n31-QW
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649668247; x=1681204247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkkbZWjZRlH9312vjiduNujt5vMVxf/XLruKiXMySs0=;
 b=e0mLrdJ2gjKNFgIaAp1W6Rj6NISj/Sv70zJPjcSosC8db/AQp1cMCXut
 e2Ei2geyqm7VoO7lqKaBooTzwiHRLHeBfzKAJtfdpy48AX3kKl7IpWSkQ
 ffLfa/J2uPbxLXfOtx9RqFGwZhY9zAxM7P1yjRvHEGhcKe0I93pw1BqEo
 H+EjSSI7xcfzxkX3Mq+e9B+L4m5DCw8bh/1qN0f6Ev9QY67rrcbAWCG+t
 BZDMw3oKcYpvksasKPo2ROUEKrLQoCdG+3IE4Hu2Y0IHqCGQGO0DhDw+n
 4X5NNNKqsaitLzFsS5iRmfTrRTz782/1WmSTq6rTxj7lFaX34gnVFdUiV A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="159624238"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:10:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:10:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 02:10:43 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v3 3/9] mtd: spi-nor: core: Use auto-detection only once
Date: Mon, 11 Apr 2022 12:10:27 +0300
Message-ID: <20220411091033.98754-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411091033.98754-1-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_021046_905775_F6D02BB3 
X-CRM114-Status: GOOD (  11.93  )
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

In case spi_nor_match_name() returned NULL, the auto detection was
issued twice. There's no reason to try to detect the same chip twice,
do the auto detection only once.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3:                                                                             
- caller of spi_nor_get_flash_info now handles NULL and translates it to        
ENOENT.

 drivers/mtd/spi-nor/core.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b9cc8bbf1f62..b55d922d46dd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 {
 	const struct flash_info *info = NULL;
 
-	if (name)
+	if (name) {
 		info = spi_nor_match_name(nor, name);
+		if (IS_ERR(info))
+			return info;
+	}
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
-		info = spi_nor_read_id(nor);
-	if (IS_ERR_OR_NULL(info))
-		return ERR_PTR(-ENOENT);
+		return spi_nor_read_id(nor);
 
 	/*
 	 * If caller has specified name of flash model that can normally be
@@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return -ENOMEM;
 
 	info = spi_nor_get_flash_info(nor, name);
-	if (IS_ERR(info))
+	if (!info)
+		return -ENOENT;
+	else if (IS_ERR(info))
 		return PTR_ERR(info);
 
 	nor->info = info;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
