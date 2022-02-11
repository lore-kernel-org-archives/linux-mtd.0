Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07714C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 09:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M7Ao0soBAYpnqwPOiaebico1jJ1OkOMvCBhFsvKqjXk=; b=La7c6WTUyJLnhr
	u+DKr4aId41+9SA9zHsPg4+FrbUb3NjW0ytp6ywnN8RhTET12ON7VLSLkiCQOBYFDBgSzzszxSS80
	ez+QLKb+5NUUksmbN4NFaAnxRxWJ1A7CEAo+9qpkiE4BQpYsu+V6kjIi90xNHJClvfktWEm9lKgGT
	HUGCXHGeRsT6xpc4CFKik90aRBiBDvkPeJLHVCUW0za/tOOZ900uRS5NLS8nbmV+EngSdPe1mJUqM
	+TAY4XVpt8dF1wq7Bo6JZ8jRF6t6rnK/uOVJptL4t3GPolPrUVQsEsRCO9TKFjjntBmVZE+E4Nzxx
	6a0YbpC72M5/ictZl0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIS8k-006KRh-RB; Fri, 11 Feb 2022 09:22:54 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIS8i-006KQl-U0
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 09:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644571373; x=1676107373;
 h=from:to:cc:subject:date:message-id;
 bh=uA2i1mughdRhhDjbb2ENH21e2dlT+e2Pom7qGofKmI8=;
 b=XknPgs+rSmkGEThVZopW+sTXIv5zY2oLnbcAt8qVbY+rEHSEaBDbeKP4
 292S/ZYRNsi4jLa5eAn1lCq2tug6KVx2Cp/BzquW3piGWDtUJQbpJPz5k
 EKuhpKAL2T7Epz1biRjjqOx6FkHLbc5WDJomqXitcfzjC+zMilqtTa+V5 o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 01:22:51 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Feb 2022 01:22:51 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Feb 2022 14:52:31 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
 id B0CB756EE; Fri, 11 Feb 2022 14:52:30 +0530 (IST)
From: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To: dianders@chromium.org, tudor.ambarus@microchip.com, michael@walle.cc,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_stummala@quicinc.com, quic_vbadigan@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V6] mtd: spi-nor: winbond: Add support for winbond chip
Date: Fri, 11 Feb 2022 14:52:29 +0530
Message-Id: <1644571349-29649-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_012253_044001_C85BE39A 
X-CRM114-Status: GOOD (  10.78  )
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
