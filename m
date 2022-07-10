Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386C7C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Jul 2022 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8PmH42GgAGs7b1J0mtQ0CHYbnxGCgY5fpeHVDiLbOi8=; b=NL/d/i4jRL6FG9
	2jsBWfdAGcjKbE80WPKEebywzEWzkmxlj5BPCiK/3pg6VSBv1yxKjy0zGuTCuBniDryU4o+NMl022
	RivMoB/XtY9fKV5yg81pvlb7zF9KRNLRHleBo4ocFAV2HfdEAGc3lP3tNlNks6Suu4K4vfZ1Ow9lQ
	QXSMHkXd9LOmmg294cTQoQe3ry1kRnXkHglxfFxu1je/dZEXN+bsJWW8ARqs+eTreHYhKi8DxfBHj
	KLbXi2ZaSjtygvwDyOanHk0Rl/WwCOVufxhL0psCA3Bpr4b1remZswnc27evHyGCzX6O0gWeZ1Pbw
	uptcHmkvOhzyveSHIrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYNW-00C6rq-KN; Sun, 10 Jul 2022 14:57:46 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYNT-00C6pY-Lo
	for linux-mtd@lists.infradead.org; Sun, 10 Jul 2022 14:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657465064; x=1689001064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lcyjCDje10SpJWNiPBkba8dsUZ24Y1DlZacBkm+rx+E=;
  b=hD3ZQEWznFf8BqK3g303iQARZYhr9s0DBHwoUb+YjcGglZU3Rkb7B3mz
   KzVqrNG4IzzJPunn6DQPJaOgYgReUJ29mL1DbatfHJ58IzYQBaBIZVGdr
   kxe74wT/F6gJLTsnQOC1066QcGQJ89BRLwaKEhLIhxUes/bAIB4u78VVd
   g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 Jul 2022 07:57:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 07:57:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 10 Jul 2022 07:57:36 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 10 Jul
 2022 07:57:36 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>
CC: Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
	<clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Date: Sun, 10 Jul 2022 07:57:21 -0700
Message-ID: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_075743_787855_6AF19DE4 
X-CRM114-Status: UNSURE (   9.17  )
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

Add support for Winbond W25Q512NW-IQ/IN

datasheet:
https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf

Test result on AST2600 SoC's SPI controller:
$ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/jedec_id
ef6020

$ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/manufacturer
winbond

$ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/partname
w25q512nwq

$ hexdump /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/sfdp
0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
00000d0 0aff fff0 ff21 ffdc
00000d8

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ffaa24055259..d6f1a3b7267e 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -133,6 +133,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
 			      SPI_NOR_DUAL_READ) },
+	{ "w25q512nwq", INFO(0xef6020, 0, 64 * 1024, 1024)
+		PARSE_SFDP
+		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
 		PARSE_SFDP
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
