Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C693C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A9620782
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/8eVmN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3A9620782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JqHYHuLWdEC6YJcBZ6G98G8E8IIy1PlZWGRqD3YjyYI=; b=G/8eVmN+yieYtS
	ICVwQ8UEGZLrs+Or9zDtibPHxMbM3uqn4tyCuaCstqyIpJ5JcLWvRO9b+d3uw/wrsiuUIlG2ErYJv
	d3wIQiW1rX2kLAUzy666+f55v89VD9k/cM8W3Jyy9FJqJY01OA4s1v1+HqSsjBy0yd2XHBrkuObDN
	DP/rFL104zNfZLXEnO2yEsS7yLqZUtt4NOxYNhQv9SnaIJUGvfbKlGHXK3GXAg38dnLeqAwo/IIkv
	sZCn+Ea5UhInrueuuG5Pv5jLHCN5rtSHGIjkvl9AO3WMy53lseURox0gHsWZNr5WDD9fhCvkEZWB5
	SO1QWlyja/Uq0rCm5Utg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQjcI-0003Xw-S1; Tue, 21 Apr 2020 03:30:34 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQjcG-0003WI-3Z
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 03:30:33 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 25C3C32A82285A169ACE;
 Tue, 21 Apr 2020 11:30:23 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 11:30:14 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Date: Tue, 21 Apr 2020 11:30:12 +0800
Message-ID: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_203032_316438_592044CC 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 alexander.sverdlin@nokia.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As per SFDP(JESD216D, Section 6.5.3) says of SMPT 1st DWORD, 11b of
bit[23:22] and 1111b of bit[19:16] represent variable
{address length, read latency}, which means "the {address length,
read latency} last set in memory device and this same value is used in the
configuration dectection command". Currently we use address length
and dummy byte of struct spi_nor in such conditions. But the value
are 0 as they are not set at the time, which will lead to
wrong perform of the dectection command.

As the last command is read SFDP(1S-1S-1S, the only mode we use in kernel),
with 3-byte address and 8 dummy cycles, use the same values in
variable situations to perform correct dectection command.

Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index f6038d3..27a8faa 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -624,7 +624,7 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_width;
+		return 3;
 	}
 }

@@ -641,7 +641,7 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);

 	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
-		return nor->read_dummy;
+		return 8;
 	return read_dummy;
 }

--
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
