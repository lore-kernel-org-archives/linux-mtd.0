Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4gosQzTKA4O69NcOAz7pDt+elkGbnxSDto5+iV9F1mU=; b=jWR+dSgt2zJfVP
	Ep3lbUNZbqhFW4HBcO1gtW5cHr8VJI61yaBKK16qt9Og3iVQbB/LPtQdPobXYLGz2Hvlpse0sqrSL
	zz5FxwK0P5HAGeWvn1rZdlEQgklbLYUKj8KFQBU0O6T0eZLCejGxjTrijc72cB89NrqGhdmEz0SDN
	dVVjMyPZQNjrnxT2f5Q58yABep2DjrjNeHA7TlmjfTqKUSKIc36hyki7sAXxyd0X85YMVMRXPY+Hb
	9mdd21T5txmrdyAXUUKYC/9BYFDlxAjh449yVwWUYvCDjRUOpngP+mjxY5IF2339PasmtsWReIksM
	tO+dsMsvA2GloeTSSsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHWdw-00FSyd-FJ; Tue, 08 Feb 2022 19:59:16 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHWdu-00FSy0-DQ
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 19:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644350354; x=1675886354;
 h=from:to:cc:subject:date:message-id;
 bh=kK9GFhaLkKmCzRm4YHc+FKL5dh0/iSAsETrpcjUA5sU=;
 b=Rri3qUQR1idHRmA1HWajyag0gcNJcpboCoS70X4UtlblKlV2Zsdq9RXm
 aO/c/Nw3AUhfBmTWTd7MnTBAv70CF2LDUT3b9qJFUAXqi0SiuKbvqbbel
 jc/JB6RnlQjZLA5CveJPLhp4MTTdZNuuoJM4CTosEjN3XIjaP5t9p78Oc 0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 11:59:13 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 08 Feb 2022 11:59:11 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg01-blr.qualcomm.com with ESMTP; 09 Feb 2022 01:28:53 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id AF6325758; Wed,  9 Feb 2022 01:28:51 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: dianders@chromium.org, tudor.ambarus@microchip.com, michael@walle.cc,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_stummala@quicinc.com, quic_vbadigan@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V5] mtd: spi-nor: winbond: Add support for winbond chip
Date: Wed,  9 Feb 2022 01:28:50 +0530
Message-Id: <1644350330-8809-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_115914_531961_0A736266 
X-CRM114-Status: GOOD (  10.45  )
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
	- Updated flash_info flags passing according to below patch.

Changes since V4:
	- Added OTP support for SPI card as suggested by Michael Walle.
	- Updated SFDP flags passing as suggested by Pratyush Yadav.
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 675f32c..315b9f6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
 			      SPI_NOR_DUAL_READ) },
+	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		PARSE_SFDP
+		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
