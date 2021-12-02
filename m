Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F62C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 06:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfa866aMSlaEA+8pKSHZ1wNAAAa0qA9Iib/CKK/amcY=; b=gyug7wQ+cOUkhu
	HHyCu6hFDMx7lxCgpY1gOeRZRBY5xNc+MvlM0kmoBupLJicRR/D3a5RCmZ9JhH8cfzEcnjxQBjLiY
	KYArtR0ZppGkAYYhtei4p5TGndVZIWAruYcmjUu8iVKp/vNJgjQ+sA3lbPNCPS5kRiPfJ2qb1W+MB
	536Lkhl4kfYHZ+3LsbYEdVfnXsnN4KuyVQD/+Dai+AQ+YaCPfQmp5Sma4rCI1kZurMNR5GRr13Emm
	C3nGQtTWROeS/QXIpZ1Bj37HtphcM8j0QbH30Kaf/UaMJF4CPhbincRi9X7ySNQT8AD0Bg0wgKYdK
	7zHR+F+peKLNTo4iu2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msfjv-00B6it-L6; Thu, 02 Dec 2021 06:38:43 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msfjt-00B6gd-60
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 06:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638427121; x=1669963121;
 h=from:to:cc:subject:date:message-id;
 bh=3g+eUVzpsgrN7jH+hXE6d4OUhX4I1HGrua57aZsyv40=;
 b=u3iEwaQx6QdXo1MQPR9eG/HM8u6KWlt6IG8JGUb7FC+5mNzCatJyQNah
 974OvLFtHFEsin6uatuBa8YTryBYxP0wlvA5GbV2W7KzbsbHM6R2hjX6B
 8j7tta+S3waGaPJgvHpO+eW1hM7hUvMTqV+RbXxD1TfaVaHyYrhw/i7gs E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 01 Dec 2021 22:38:35 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Dec 2021 22:38:34 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg01-blr.qualcomm.com with ESMTP; 02 Dec 2021 12:08:16 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id 8FBEF48F7; Thu,  2 Dec 2021 12:08:15 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stummala@codeaurora.org, vbadigan@codeaurora.org,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 sartgarg@codeaurora.org, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V2] mtd: spi-nor: winbond: Add support for winbond chip
Date: Thu,  2 Dec 2021 12:08:12 +0530
Message-Id: <1638427092-9139-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_223841_341568_FA375FC4 
X-CRM114-Status: GOOD (  10.36  )
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
Changes since V1:
	Added space before name of the flash part as suggested by Doug.
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 96573f6..44f19f2 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
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
