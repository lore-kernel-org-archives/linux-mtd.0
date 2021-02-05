Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28096C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:54:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B341E64FC6
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B341E64FC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C0ZF/nKwnNd9JMnURhtxNUK0Iw3yDLLztY4oiLIpAgQ=; b=E/O9k/uUXnA4/ifik0JP26eR9
	fAsKC1xISLtPTdtgm2bMGCSDHImhQiNk2ys0GMg6iGWGu/n0fbGhE7m6k/IisVOETKQzcZLS74iM/
	kMGwBvDtZPlvxkaRXuVSmiNn2iASLQAOosXJB3bZjH7mRVvrTohJiHTZLvSNXUjMxEOVCLtQsFaGI
	+r/npDYIV7779TiJiIXf6i4pRSStZBBBd0Ss71T7ZLS1RFW2BiM/19eM54WMUCt1qRe1NNHhJ9dun
	wD5CgVdI3W3dX6wDE8Z8OdKdUTckK2xfeL55f2PUNx0ZXh/22Al86t5qjbf0YMJKzlpg41RGB57ru
	xkSaBiDWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81YR-00044X-JH; Fri, 05 Feb 2021 13:53:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81Xg-0003nz-Bj
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612533180; x=1644069180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6KEwzymtXFqmnAlGpSQgTzF8vEry5JGTqNgDxxRxmIU=;
 b=mDMlY/2WDI2yCH8ps5SWVqlXy1CIsfMfIAitqCeewH6XEEzqBMxNMcHY
 rcssGRkz+664u7mFvmFxbjHoSRP0bt/UCbovM8VfQoUUqLj+Ose9lU16M
 TNeJ+Z7+bXZYrL+egwHLS0Xd9uJ94Xmnh9BsGsama1Zkx5b1gY/ludZte
 +gwiCGE4aRc0d0cdja9nf95of5Om6bg1Ws/Acurlvgmn4nChkGbi2oO/+
 tvxNkHcqmctOtxYE7M/LZ214WfrZmka2poInVxwhh3LRgszpzvqsLXtGN
 jPT56m/fWYgbvJeLtnNVwPrY/5pDE9nX1Y0M5TrKPuUh6v0/IPCOZjTLW A==;
IronPort-SDR: y+maKmez/7/dyTnc2dtjCVkaY5DwwnlJ7ERVyGljZpRhLWRQb+JYhdwQWuXdp3NvZI8whVtCHN
 kEn/lbfVYpDVNFuoRhf4jb7GmxqHZpq7TUCFxp26j/POt5NzOkLwmpvweHVRtQfOLq6Cy88IaH
 t4YNKXxBRgolUS1+AlaxKDBaA5H2KJlOxc/2FFU37nXW8G618ailSquxPKPnHIy+/V4xN78XLb
 m5CBg+r3zQ7+ri7igj4zGrE0HtFg+1X7XWocJjQmLA4cmF2MHKBVQq1F0Fu/nZIaUHiEFEX+gk
 B90=
X-IronPort-AV: E=Sophos;i="5.81,155,1610434800"; d="scan'208";a="105561347"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Feb 2021 06:52:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 5 Feb 2021 06:52:58 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 5 Feb 2021 06:52:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Takahiro.Kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH 2/2] mtd: spi-nor: core: Add dbg msg for
 spi_nor_erase_multi_sectors()
Date: Fri, 5 Feb 2021 15:52:53 +0200
Message-ID: <20210205135253.675793-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205135253.675793-1-tudor.ambarus@microchip.com>
References: <20210205135253.675793-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_085300_592009_F30AD7F5 
X-CRM114-Status: UNSURE (   8.49  )
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

Useful when debugging non-uniform erase.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bcaa161bc7db..7401c60b53e6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1622,6 +1622,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 			if (ret)
 				goto destroy_erase_cmd_list;
 
+			dev_dbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %d\n",
+				cmd->size, cmd->opcode, cmd->count);
+
 			addr += cmd->size;
 			cmd->count--;
 		}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
