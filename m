Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jjVUr00EWoj10dmclZiGoQJu7SxWSIHhVo0wEbkSuso=; b=R2ktok79/c8u3w
	PWBHmU2jHVX+1xdguISC+LYcqcv74UlezaGUYbJPWFoifx9MDxZOsE3FTAxD1/yU0CdQB7IM+RDc1
	s3L4MyRogP9ojH1D/Jl2XIqV/Uj4/LaUhNIkffwOws/hGD+9o9qWnHvyCuf+UzsToX08nS7iJGpdM
	cCQtSMT8Sa2j8NMga0PK9Ki4BfApXUYyjvU2cvWtKpCC9s6TXrIjLwx5VKyo2cfqEKLJDVFkRtJck
	R9FGxItc3fWPEUWLhwDa2NwKJHWE7aX4IPPizUmpsxSBjHtilzJkFAzPQ9noRlJ8v3F5Dk48An7le
	m7YWiZ218hiySUstRZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx4rz-00DRRT-4i; Tue, 14 Dec 2021 10:17:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx4ru-00DROB-Ax
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 10:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639477030; x=1671013030;
 h=from:to:cc:subject:date:message-id;
 bh=okFUusOHzj8BtPwDsu4IVgGs5T42rJjBSOStK76pAaQ=;
 b=nMiOT8uNr/ilc2qDaknWIAa+IGzmx//Y2H2goqOQAn6lpAhzYTrPjAl2
 M4xN8soTxsVnq+BhHmBvEEAeJ+AsFgdNj76R3fe6rFdhdnxwe+eiLgC44
 q3GmL5T9Tip+ocvejfb0q3rUnxgtteOXRHSmyCPTAV+/wUN/gvUqDfwxi 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Dec 2021 02:16:55 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Dec 2021 02:16:55 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg01-blr.qualcomm.com with ESMTP; 14 Dec 2021 15:46:36 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id E5B3A52F4; Tue, 14 Dec 2021 15:46:34 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: dianders@chromium.org, tudor.ambarus@microchip.com, michael@walle.cc,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stummala@codeaurora.org, vbadigan@codeaurora.org,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 sartgarg@codeaurora.org, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Date: Tue, 14 Dec 2021 15:46:31 +0530
Message-Id: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_021710_486106_D9CEB487 
X-CRM114-Status: UNSURE (   9.91  )
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
	Added space before name of the flash part as suggested by Doug.

Changes since V2:
	Updated chip name as w25q512nwm as suggested by Doug.
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 96573f6..42d5800 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024,
+			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
