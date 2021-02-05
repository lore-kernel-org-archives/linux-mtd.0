Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85928C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026F064DF6
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026F064DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LejZfJo2My3O73OLiZTMHv+N5YPjlaLUOcHVa9f5liI=; b=KWkGY55MK/ux4dWS242cW/W5n6
	oo4zlQkejE5D9RSkEDNiQfliA49XkI47+bSloX3iXz7TdsCRll3CudONNFJhTG5HcN6eJf92QaYqI
	325H2IaKeWAABKcXOUat9AfVwjXmhBlyPs/IBLlybAPYoYe2MPe4RIinYfWlYVG/VffYWAR0Xnnn7
	y83zfZQmEfFFJX6pR3vY1aGKvRU0DEzsU0aZEIvNraQJmtsgQyopgrY0qKW45+kB9Dp0m6Ht/jPyv
	ySmPYhg5+/7hAJefsIqRvrF8Sak8Q53DdFNU3ncPQBffHuUFdH+q8uuyc0n7yJZ8+MOJh0IXe1bSo
	497ZyTgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81Xh-0003oE-0I; Fri, 05 Feb 2021 13:53:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81Xe-0003mg-1e
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612533177; x=1644069177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yXFj/yQEcFvcy6InZXdmBwNt8d4tBVYQlHOFM8p4OSE=;
 b=CIvGMJ77CxG+ue+vvLznWX/P0H4y8RHtvi44hinco7KwhDnGw1XEmOxI
 NONZKVfUVVn9lW/fg2r6WuEes0du7DqiWH25d4xMUbtgxsYw0SsJW1CyB
 2imZvejM7sranY7ILOcFi6NpehQw0nmtGKoesG3FvqGN/cbpB+pZGv6Os
 PizLsWVfKh+4iEa80R98RKG9vqC6TomKN7O+Nm/3J1zcP0mnuGDJvX7SZ
 Ws0X56AV0mr5ESjXxmOl5Wr+puJrv28T6dNzYSdG+XrO0yz3rdCtNP5PT
 WpWRtCIikCe68jFEE7kUCoQID+6GJoRdKZxarr1QNsY/MoCKtTiFK/Hhj g==;
IronPort-SDR: YgX4M0MGVxH0VOIOkSsNai1MpDPgzRNucUeYtYiYRbiaoeqiZL2xjjNlcEGmb6QVF7UUhH8DqR
 Uhu+RGMY2wx53XtkBf6pHZKS5g32ucAhJY8ldBT8xd7GqyHySSqAP1iCfxz1GL4xXmOVp3BzRn
 1Vx36d/DkRv1rkbOEE0MvzbD91lN91auHwL4/igSxOjWLdbW7XYzSVyx2+/r/h/wHs/2+UfjII
 VT5lAMrClmWBqdwJdGfP2CGiVeMU7Mqdpd5SG6q2JAOPxW98XtrfNLm8vaphJ/KQy+iXlobl7U
 m+U=
X-IronPort-AV: E=Sophos;i="5.81,155,1610434800"; d="scan'208";a="43074440"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Feb 2021 06:52:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 5 Feb 2021 06:52:56 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 5 Feb 2021 06:52:54 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Takahiro.Kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH 1/2] mtd: spi-nor: core: Advance erase after the erase cmd has
 been completed
Date: Fri, 5 Feb 2021 15:52:52 +0200
Message-ID: <20210205135253.675793-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_085258_238417_20FACD7F 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Wait for the erase cmd to complete and then advance the erase.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..bcaa161bc7db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1618,12 +1618,12 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 			if (ret)
 				goto destroy_erase_cmd_list;
 
-			addr += cmd->size;
-			cmd->count--;
-
 			ret = spi_nor_wait_till_ready(nor);
 			if (ret)
 				goto destroy_erase_cmd_list;
+
+			addr += cmd->size;
+			cmd->count--;
 		}
 		list_del(&cmd->list);
 		kfree(cmd);
@@ -1704,12 +1704,12 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			if (ret)
 				goto erase_err;
 
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-
 			ret = spi_nor_wait_till_ready(nor);
 			if (ret)
 				goto erase_err;
+
+			addr += mtd->erasesize;
+			len -= mtd->erasesize;
 		}
 
 	/* erase multiple sectors */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
