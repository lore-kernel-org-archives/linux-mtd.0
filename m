Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F18C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7BA65017
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7BA65017
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C8QdP5s53LQ3KlJcSSKuwiRbTE2mASgLO6jOOqoIdjI=; b=JqkNWh9nIA0bFTauERlSEFt8Z
	ii68KccN+VjlDnp6Gqg0AfcLt5CFhlJsqygEWSdhgJZkKgd8aa1q0ufGxVi5kMbj82aeWYWa4LyV2
	lAExBYO8Z26ud2B1ir4132zWNy65zPXbOGXxPvYtpIpStS666x6mVEqdoHIvPS8x+GPqxAbZj5nlb
	q5axMafaZCwbVoW/HeP9taSPown+blX1ojCu9+dKyjHvd9dfPeL3WCZgS2yvGFpnAXeg/92lQbC9v
	MCOC0HH4MLdhNlCkgBG6SdPM3QlN+dcCmxTJhW/X2Ji5Y/cKJeyh6d6RNuK0/yc3M9bVLfm8aMwiU
	+dxdz2+Cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lITZn-002iRr-JO; Sat, 06 Mar 2021 09:50:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lITZf-002iQF-2a
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 09:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615024214; x=1646560214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F67KRwC5EvnpuwLQWrA/2oiNrHaxxAL/UiwBj3D0GEU=;
 b=RVYn0YBsc3fPQaSDYp3hqcH33b+SmAixCgwGrLEDUMImGIpNpVSWiDD1
 AqKfRacIlCnA/h+PBe084Q0bzn/DNHSP4A3+nz92qFgoehf1redle/e/q
 ZBGFApJissQb8Qcv5WaUPMXuZbWTpQv2FiAkrdOIkRgMKYj3Pv8oMJOvm
 6IsAW2PfxNuLRmzrZl5XyG9Tm+YAcNeOPKYi8dF9+8re0Xho8RjELg5Mf
 jF7WeWutIq47aKnqjmPN8GWh8n3Y/ELfHTvdF9SuBRlUe9ATyh0ukUtYT
 xJUvv9OvwDKzq3GVQ22IfhbTvhxjyFD1B20vJabRSpiouLH99zACRzGug A==;
IronPort-SDR: j6vwh5zVtSGoszYfxQfynJCECjNI9V1AvIb48+gPb47r5d9BcpqBDUCtIj2bb5Ya8pl4b0hR3e
 2u7zVKFikw3XULTnHEv7SOvUZJZ7tpprVOmntTvISCF6Vsbw0jOppklrz9JOuGQkN0TrV370k6
 UgVns943nW4JV3SJ8xwHAqR8JhI2r2Ka9fVYL9gsCgpIyO7R8HZIbgNTiTZvrkfUlPhssBumsf
 nRM8TbkInlj2BqLJfjh64yuc2eZgjAxT9NtaNlKn4CavIMtQBg8oSOyf9zoUaHSE8tujwotNI4
 SA8=
X-IronPort-AV: E=Sophos;i="5.81,227,1610434800"; d="scan'208";a="112202496"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Mar 2021 02:50:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 6 Mar 2021 02:50:11 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 6 Mar 2021 02:50:09 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 1/5] mtd: spi-nor: core: Advance erase after the erase cmd
 has been completed
Date: Sat, 6 Mar 2021 11:49:58 +0200
Message-ID: <20210306095002.22983-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306095002.22983-1-tudor.ambarus@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_095015_680086_7862FD8C 
X-CRM114-Status: UNSURE (   8.82  )
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

addr and len were gratuitously updated even when spi_nor_wait_till_ready()
failed. Wait for the erase cmd to complete and then advance the erase.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v2:
- update commit message
- Add R-b tag

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
