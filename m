Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B861C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Drys3jscGHo5BflOklglayFPMOGQ6/pR7JJJ4PtVqPo=; b=B4XcFw1aEdKpbb
	rJDYLS35ocNHrPjWAI83DguFdutgnaQjuq4TxiC3uHKOSj0I379bcZ4bo3w8aZt6A9OzBIut0vAzU
	X3B/Tfl4YZe+HwlKZeU617O/FHagX3qGP8q4E91va2B5EoY71YVX7aZfP/+vJeh0goYqf075SCvyF
	b4HE0fZl9C+a7HqYV+Q7XN5qfNkHJTRFt56evqlonGXqq6DppoAAO3hRoOloJMtGSbefoIFA2Hitq
	IKCZ2deY6mQ38vqpuMu/QDx5+JkGMySxcUk7sD5z65k74IW2RzSlCkyOr3q4hPXaVSWXt39j/b3eB
	eCaVB9IbI+yoNWuJmYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIU2h-006rpB-RW; Fri, 11 Feb 2022 11:24:47 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIU2f-006rnw-08
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 11:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578685; x=1676114685;
 h=from:to:cc:subject:date:message-id;
 bh=pnboiIqagzkUgX7gMqnob/kf1E4vUX6Gf/GqNGQx2Cs=;
 b=gqBPtyE5v5SZRabBXv+WOemHrqA+rFxyy4bs0P8w57M+ahe9KdUVFKNE
 9gkK6fZsx2VhY4+pUb2Sr51Uu5mydSv6jEmJRVZdsVXq3MeaemDZ5xruN
 ywuc+WOYiRop04EdtMPAQPqQup+q3bPk2DQz4em/QaOTXHQ00ukXg0msz U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:24:44 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Feb 2022 03:24:42 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg01-blr.qualcomm.com with ESMTP; 11 Feb 2022 16:54:24 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id 2075E589A; Fri, 11 Feb 2022 16:54:23 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: dianders@chromium.org, tudor.ambarus@microchip.com, michael@walle.cc,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_stummala@quicinc.com, quic_vbadigan@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Date: Fri, 11 Feb 2022 16:54:21 +0530
Message-Id: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_032445_097592_9663560A 
X-CRM114-Status: GOOD (  11.39  )
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
localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
spi16.0/spi-nor/jedec_id
ef8020

localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
spi16.0/spi-nor/manufacturer
winbond

localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
spi16.0/spi-nor/partname
w25q512nwm

localhost / # hexdump /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
i16/spi16.0/spi-nor/sfdp
0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
0000030 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
00000d0 0aff fff0 ff21 ffdc
00000d8

localhost / # md5sum /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
16/spi16.0/spi-nor/sfdp
106d89d6c049110bc94c01517cb4ce24 /sys/bus/platform/devices/soc@0/88dc000.spi/
spi_master/spi16/spi16.0/spi-nor/sfdp

Changes since V1:
	- Added space before name of the flash part as suggested by Doug.

Changes since V2:
	- Updated chip name as w25q512nwm as suggested by Doug.

Changes since V3:
	- Updated flash_info flags passing according to below patch.

Changes since V4:
	- Added OTP support for SPI card as suggested by Michael Walle.
	- Updated SFDP flags passing as suggested by Pratyush Yadav.

Changes since V5:
	- Reordered flags passing info for spi nor as suggested by
	  Michael Walle.
	- Added SFDP dump info in commit as suggested by Michael Walle.

Changes since V6:
	- Updated commit subject and added md5sum in commit as suggested
	  by Michael Walle.
	- Reordered flags passing info for spi nor which has missed in
	  V5 patch as suggested by Michael Walle.
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 675f32c..6fde2ac 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
 			      SPI_NOR_DUAL_READ) },
+	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
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
