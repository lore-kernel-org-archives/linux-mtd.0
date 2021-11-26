Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E45C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nbRLcmnOHqhOgtFSAeBZmbeZ4QPHSnV4Zhu2fMxKW1s=; b=cKuIl7sI2m2IBT
	ItI+xJupOmByXBDZstdVo5E2owthtb+8NIX9YH4mXhVCgxrLaITtNmynMj7uyacJfeII3CDCd0YEt
	Ywyu1wB/18kjeFfcO4u8Woe9ssuk0I5LSVdKNFUk1MIni2ZmdJzO4K94ZT7/5RQYaOIyZDdN8ze53
	nMaMNeYmgk4SFoW06iQcCQw7d/TO2RqeN1T/vDznNZqDjiBdOAlVgkVv//yqQqOnuEGHwVSJJi+AC
	G9lFmnRHmehpiDT0bB+QeUDJwzoL1lBmP0zRBR6xfgiGgBEUawEL2MEZPKTLy+fw1HkCBnylvSmMM
	qrNNq4Ehjw3LUSScG1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqV7p-009MwS-Bw; Fri, 26 Nov 2021 06:54:25 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqV7m-009Mvo-Dp
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 06:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637909662; x=1669445662;
 h=from:to:cc:subject:date:message-id;
 bh=kLZ2yqqEVHTtwT/Cwfu/sCeyeuLoZ1HxMm+rfcqJuJ0=;
 b=ENBIEsWN7gdSs5CgS/YfgEj5ym5i2ZwDo5BPGpN9TgSrI0/ZJ+6Fx5oH
 ZGlBOD4H65BeQVi4eiyX7v2aMuENKg9Cx+RhHgJ6c9x2hLk2pPQP1ALlS
 W3+UPs7T2QrsFVygyRsCnkWdWcbiJSsndclGJtY3HeYpXhkIQMMkVg21s k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 22:54:21 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Nov 2021 22:54:20 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg02-blr.qualcomm.com with ESMTP; 26 Nov 2021 12:24:04 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id 42FB248A8; Fri, 26 Nov 2021 12:24:03 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stummala@codeaurora.org, vbadigan@codeaurora.org,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 sartgarg@codeaurora.org, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V1] mtd: spi-nor: winbond: Add support for winbond chip
Date: Fri, 26 Nov 2021 12:24:00 +0530
Message-Id: <1637909640-32232-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_225422_574563_6086803C 
X-CRM114-Status: UNSURE (   9.88  )
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
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 96573f6..cdfa2ee 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{"w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
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
