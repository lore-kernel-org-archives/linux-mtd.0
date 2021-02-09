Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9270DC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 11:12:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385A964E4B
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 11:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385A964E4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qv7JFHDUk8G/X4YS5f8/9btFrgvDfQK564Wo1XHgg2I=; b=bEv0G1aYr+Nni2QV2AaIk3OErU
	veVodPj0O7Sfx3phBzfQtOIB4Tk/emRujTu0KUPmQ+ZlMFWRjte3MtimCZ5jMQoCt3TTp57Fr9rja
	WLg+/E1zvofk6GKPkAStRN3+QlzGGadwZtqCeqbggzZTWk2l2fhh5LALRx61OkYylDOU+oiSRqLT+
	ClJhGlKpWwtapz+w7fqCkM1vi5dnxlWxnHfffm7K5FG+FFzzeDCiDSnRAekmetsfZjkG+nrPzD7TQ
	YR+xYN7X8nX4JUyGfo2up5c8RMc7Bd0566nrBd/yn+vAY0VuPru4OCmJDetR6Lsn9aEm5FQLuvw9p
	AaE+eZuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Qvs-0007l3-Dq; Tue, 09 Feb 2021 11:11:48 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Qvp-0007ka-I8
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 11:11:46 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2021 03:11:42 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Feb 2021 03:11:40 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg01-blr.qualcomm.com with ESMTP; 09 Feb 2021 16:41:23 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 85D0E211AC; Tue,  9 Feb 2021 16:41:22 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
Date: Tue,  9 Feb 2021 16:41:19 +0530
Message-Id: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_061145_730576_29A397CA 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for gd25lb256e. This device tested on IPQ5018
platform with dd from/to the flash for read/write respectly,
and mtd erase for erasing the flash.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 447d84b..8f1e7ec 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -50,6 +50,9 @@ static const struct flash_info gigadevice_parts[] = {
 			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
 			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		.fixups = &gd25q256_fixups },
+	{ "gd25lb256e", INFO(0xc86719, 0, 64 * 1024, 512,
+			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			  SPI_NOR_4B_OPCODES) },
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
