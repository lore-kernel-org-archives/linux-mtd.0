Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D32FC25B74
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2024 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3wYugpmLdoqCZDs7EWJBzjdU1RsJYq7IBSMPnkG8XY=; b=A2i3eWDvNRopgP
	+aYMPENo7tDSHxOdKroDMYhLzO6r9/JhvpztEl1UW3MNHrS5MvkcNzo781r9e4vMjpfIlkFrIvtfj
	6efvx8rZ9gXKYeBdcC70KYFIJpFnjaW3YuyFbswm6hgGNqtrrr/QWFdnAWfKO41uINZ8Af0d9PetV
	S349ia1tgjv091o3q+3PNbZ6rHdrYVT4WiFygTqxPdIJB3KjY1+qT/MEKqXC4P2Zru9ibHmZogsy/
	Ouih4RnqAn0QD853/i+6zPuvxRq/LrQe1gW6/VhR1eRTbGyhF8DrdmpR5lFy7Ul7b2qzthd4yUGng
	eXLD0tmp3wL9/BX+KSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASTg-00000008in7-2Qln;
	Fri, 24 May 2024 10:48:48 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASTd-00000008imO-0LaC
	for linux-mtd@lists.infradead.org;
	Fri, 24 May 2024 10:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=XnHOZTboN5OTwdIemrSwwrhUVtTgTRnbOpmll+xdbq8=; b=OU
	OH6FebB9ONxaEPIN3X72PJziyhGvFFDaI56CshSB3JcU6mJ1KA6KN7kJLKYc40aSIaAApkRBjPaYz
	XpO9kqV8SiPwr4gir02/KnBocONuYh3q1QXmmbaO2jwkpaj8hPYvISrLQRPXZA8fwvHwaRGV4Zc78
	8mx6ppJ1q+hCAbwuhZj5tkGa9Jq5dQsFzVF5Es+6afSt9J7xTZihGlGkM/TcdlzxA3jD6b7CEFe73
	xUrKLSdz/JxlD9ASxIYmjh44yAcpOC1ci+zmdGe+uECMWY3Yu77uu3XZ6GCzfBhVaJ/DCVri8NG4t
	ktcwKDpn1r6U25YLesY9g8SlUJO7MMlA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sASTZ-000NW0-1Z; Fri, 24 May 2024 12:48:41 +0200
Received: from [80.62.117.110] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sASTY-000A7e-0N;
	Fri, 24 May 2024 12:48:40 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 24 May 2024 12:48:29 +0200
Subject: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
MIME-Version: 1.0
Message-Id: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com>
X-B4-Tracking: v=1; b=H4sIAHxwUGYC/x3MQQqAIBBA0avErBuwKbG6SrSInGqgLJRCCO+et
 Hx8+C8E9sIB+uIFz48EOV1GVRYwb5NbGcVmAylqlKYGj2n2p5OIRyS916S0xUXifQVsW+KOmK2
 xBvLg8pzLPx/GlD6XBE69bAAAAA==
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716547714; l=5608;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=RyPBKjhs2B2FMaCXDi0sdHu6QypxmUdfSBuOzq+5ztk=;
 b=Py5GghDXeVNWQiRSqR1BACGiLtBIFfZygQT3MvFtwsAbX7LwnpFXrNuDLspoQwL29P95+vctC
 hqH8mpoE6hCDV7ZjGYtNqzHOTtgNZ89ybHVptsxQbsmMebf8N0fVLt/
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27285/Fri May 24 10:30:55 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_034845_614722_EFCD78E2 
X-CRM114-Status: GOOD (  20.87  )
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

Macronix engineers apparantly do not understand the purpose of having
an ID actually identify the chip and its capabilities. Sigh.

The original Macronix SPI NOR flash that identifies itself as 0xC22016
with RDID was MX25L3205D. This chip does not support SFDP, but does
support the 2READ command (1-2-2).

When Macronix announced EoL for MX25L3205D, the recommended
replacement part was MX25L3206E, which conveniently also identifies
itself as 0xC22016. It does not support 2READ, but supports DREAD
(1-1-2) instead, and supports SFDP for discovering this.

When Macronix announced EoL for MX25L3206E, the recommended
replacement part was MX25L3233F, which also identifies itself as
0xC22016. It supports DREAD, 2READ, and the quad modes QREAD (1-1-4)
and 4READ (1-4-4). This also support SFDP.

So far, all of these chips have been handled the same way by the Linux
driver. The SFDP information have not been read, and no dual and quad
read modes have been enabled.

The trouble begins when we want to enable the faster read modes. The
RDID command only return the same 3 bytes for all 3 chips, so that
doesn't really help.

But we can take advantage of the fact that only the old MX25L3205D
chip does not support SFDP, so by triggering the old initialization
mechanism where we try to read and parse SFDP, but has a fall-back
configuration in place, we can configure all 3 chips to their optimal
configurations.

With this, MX25L3205D will get the faster 2READ command enabled,
speading up reads. This should be safe.

MX25L3206E will get the faster DREAD command enabled. This should also
be safe.

MX25L3233F will get all of DREAD, 2READ, QREAD and 4READ enabled. In
order for this to actually work, the WP#/SIO2 and HOLD#/SIO3 pins must
be correctly wired to the SPI controller.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
I only have access to boards with MX25L3233F flashes, so haven't been
able to test the backwards compatibility. If anybody has boards with
MX25L3205D and/or MX25L3206E, please help test this patch. Keep an eye
for read performance regression.

It is worth nothing that both MX25L3205D and MX25L3206E are
end-of-life, and is unavailable from Macronix, so any new boards
featuring a Macronix flash with this ID will likely be using
MX25L3233F.
---
 drivers/mtd/spi-nor/macronix.c | 60 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..c1e64ee3baa3 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,63 @@
 
 #include "core.h"
 
+/*
+ * There is a whole sequence of chips from Macronix that uses the same device
+ * id. These are recommended as EoL replacement parts by Macronix, although they
+ * are only partly software compatible.
+ *
+ * Recommended replacement for MX25L3205D was MX25L3206E.
+ * Recommended replacement for MX25L3206E was MX25L3233F.
+ *
+ * MX25L3205D does not support RDSFDP. The other two does.
+ *
+ * MX25L3205D supports 1-2-2 (2READ) command.
+ * MX25L3206E supports 1-1-2 (DREAD) command.
+ * MX25L3233F supports 1-1-2 (DREAD), 1-2-2 (2READ), 1-1-4 (QREAD), and 1-4-4
+ * (4READ) commands.
+ *
+ * In order to trigger reading optional SFDP configuration, the
+ * SPI_NOR_DUAL_READ|SPI_NOR_QUAD_READ flags are set, seemingly enabling 1-1-2
+ * and 1-1-4 for MX25L3205D. The other chips supporting RDSFDP will have the
+ * correct read commands configured based on SFDP information.
+ *
+ * As none of the other will enable 1-1-4 and NOT 1-4-4, so we identify
+ * MX25L3205D when we see that.
+ */
+static int
+mx25l3205d_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*                          DREAD  2READ  QREAD  4READ
+	 *                          1-1-2  1-2-2  1-1-4  1-4-4
+	 * Before SFDP parse          1      0      1      0
+	 * 3206e after SFDP parse     1      0      0      0
+	 * 3233f after SFDP parse     1      1      1      1
+	 * 3205d after this func      0      1      0      0
+	 */
+	if ((params->hwcaps.mask & SNOR_HWCAPS_READ_1_1_4) &&
+	    !(params->hwcaps.mask & SNOR_HWCAPS_READ_1_4_4)) {
+		/* Should be MX25L3205D */
+		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
+					  0, 0, 0, 0);
+		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_4;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
+					  0, 0, 0, 0);
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
+					  0, 4, SPINOR_OP_READ_1_2_2,
+					  SNOR_PROTO_1_2_2);
+	}
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l3205d_fixups = {
+	.late_init = mx25l3205d_late_init,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -61,7 +118,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x20, 0x16),
 		.name = "mx25l3205d",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &mx25l3205d_fixups
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x17),
 		.name = "mx25l6405d",

---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240524-macronix-mx25l3205d-fixups-882e92eed7d7

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
