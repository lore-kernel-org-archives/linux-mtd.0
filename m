Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B0FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EwZsYt7FN93YC40D/21DLKVmeYVH/oyyA3ebcEOdQdQ=; b=krSl1sXylclsXS
	SY1TzQ7jF0QdJgx/4a3Kt7gvhSRf+gefketJ6zNJZckOot0t8H2eaePpYodQM+oNa5JanxMnBGS2y
	I0P6QO+zno20kUuF+sDizycsWH4qUtBApeGaUm2IlnoANh28LHPY1x2S17E+7BNIZmsDQKxEjJHCL
	Fq1tTdsZMNXKHlq6bnk0ru1zWgGgL7/HJHxr6DERu2VILxLAzZyQJ75ojnHMotBW1naYfsoYGrU20
	G8BE7Zm4URsK4obLJbiHjYGVy9GD7qZTuejerycsq/G1Qa4MSaVXsMJ2x9d9gRIJMCAjGBpAKEjqF
	EC0g5Unyf0lrGrknE9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUA8-00AOKM-ML; Thu, 20 Jan 2022 09:55:24 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUA5-00AOGC-Pg
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 09:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642672522; x=1674208522;
 h=from:to:cc:subject:date:message-id;
 bh=nehZ2/Kj/bi/H40TUSBt5PDmvxHq+7M7Ek53ZM5zGgo=;
 b=DgcAe5gmHei/riYq/Q0xE+gHLWQrlrGWQ3xiOwnBEKpMSxn8w0LEtbLh
 7pUHUJ4m2Z+PFSGb1zLjYkzUEzHk10MuymY7UpcSbjE6pYejraecrf/SO
 t8QcrpLnMvzkCj7olj44jui+NonvrHuPYoAlXCzJYcyt4gowxHfPvqIEG c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 01:55:18 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Jan 2022 01:55:16 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg02-blr.qualcomm.com with ESMTP; 20 Jan 2022 15:24:55 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id 64610566F; Thu, 20 Jan 2022 15:24:54 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: dianders@chromium.org, tudor.ambarus@microchip.com, michael@walle.cc,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stummala@codeaurora.org, vbadigan@codeaurora.org,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 sartgarg@codeaurora.org, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V4] mtd: spi-nor: winbond: Add support for winbond chip
Date: Thu, 20 Jan 2022 15:24:51 +0530
Message-Id: <1642672491-30067-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_015521_888691_823329EA 
X-CRM114-Status: GOOD (  10.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for winbond W25Q512NW-IM chip.

Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---

Changes since V1:
	- Added space before name of the flash part as suggested by Doug.

Changes since V2:
	- Updated chip name as w25q512nwm as suggested by Doug.

Changes since V3:
	- Updated flash_info flags passing according to below patch
	 https://lore.kernel.org/all/20211207140254.87681-7-tudor.ambarus@microchip.com/
	 As suggested by Tudor Ambarus.
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 675f32c..c4be225 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
 			      SPI_NOR_DUAL_READ) },
+	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
