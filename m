Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D7DC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452296105A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 452296105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKyYMNI9IY/dk3yydJ25HcfM1En44/dFkajbNd7pfck=; b=0jLZBoOUn+V4Sb
	OgCfF3Od0qrAjSvncP0NUsD9BF4QH2JxYKWNCrvfVajlbDbv7qysnsDuXArKy/7sFAlf787sse0Nu
	zNxiWIVhLdIlMRuiVEOcDMw0aS+Zim/+yZu7VMt+DbDDS/cl1qu7S8cB21nbvCDGJX8XzC7Bd5qHU
	MuXShUXkulWV6W43KrLewTVMJRB8JPPk51eM05LSY8+A55Q4nwbWrufymUkDtY3aoZz6cWyaxubHk
	q8T1NxU1tkAual04hMip+/CWyrRlIsZ5f4PWo6DSkF5AQ9w4pLp69prap6rZnT9N7T8Y+3yn8O1Ws
	I1DOmSHoqck/Hx5bQFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F9F-00DIX0-Ek; Tue, 27 Jul 2021 04:56:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5C-00DHPH-Tu; Tue, 27 Jul 2021 04:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361567; x=1658897567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP7fz944bHICjJ92Ef9vR4tInkb8gSiyADZFnhZEnBI=;
 b=QZD7tVSwrW/ZgfKHwYMQFNXTNvtqN7B2pS7YjCmI7+7hronAQxYlVjst
 ib8hDOs8veRep3YnQBhV7iMaJPvr1HSWkG8xfJaqBTB4t3jME7Ia8oz31
 r1auUvqYAGMXgnkStd3pWoBYL4ZEPFaa4LrtzfEMHqVweDS1xSHp83t5Y
 qddM0vWSlaIFfkAAyw+SOOa9IvFxvWUv0kjtd/OVRooY4/jukX8jazYLl
 S4T+nZWR6N7SC83YoSXBoHSwQ3ThScri5JusqQeHdtJRz3dzF1COghRGg
 eunuAqjCs3xQ3Zd4Osh6k4TmGi6m91N+gHSLaBVgF9baU4X1oZ9tceVwg g==;
IronPort-SDR: +fAk7TGFAXG8h6cEZ/q1qocn/wrZ9mpqGZ9GzbcSrNnMGVwStxBcIdKVQnbDHArFkAcE70K/KI
 4uPdHfve/YoJ3OGFe5Ya4vcDRmIJ7UJtq1GE2zd9epXwI+iMJRD4Xk1xEfCEZ5cWG7Rd6kNLPa
 puJA4vyD+7ynbFsgrtH8OMtCy3ymIbLNzeLVQhVmG4R8bt+9vBgvj7/+n1x8rnaT4vCsaN+9m/
 DH5Qv9BlbaBN7RIV1ftpAdU+z0bynCrbH1rixLrIZvFbOwE9yVYMcOoyIe91kK0eJfFs1667VY
 jQCJUSy7xdS0zwXr1E1dnkmd
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935427"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:45 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 03/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Date: Tue, 27 Jul 2021 07:51:50 +0300
Message-ID: <20210727045222.905056-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215247_029285_EBE3B05A 
X-CRM114-Status: GOOD (  13.88  )
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

Macronix has a bad habbit of reusing flash IDs. While MX25L3233F supports
RDSFDP opcode, MX25L3205D does not support it and does not recommend
issuing opcodes that are not supported ("It is not recommended to adopt
any other code not in the command definition table, which will potentially
enter the hidden mode.").

We tested the RDSFDP on the MX25L3205D and the conclusion is that the
flash didn't reply anything. Given that it is unlikely that RDSFDP will
cause any problems for the old MX25L3205D, differentiate between the two
flashes by parsing SFDP.

Tested MX25L3233F. Generated a 256 Kbyte random data and did an erase,
write, read back and compare test. The flash uses for reads
SPINOR_OP_READ_1_4_4 0xeb, for erases SPINOR_OP_BE_4K 0x20, and for writes
SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
root@sama5d2-xplained:~# find / -iname spi-nor
/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
/sys/devices/platform/ahb/ahb:apb/f8000000.spi/spi_master/spi0/spi0.0/spi-nor
/sys/bus/spi/drivers/spi-nor
root@sama5d2-xplained:~# ls -al /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
total 0
drwxr-xr-x 2 root root    0 Mar  9 14:51 .
drwxr-xr-x 6 root root    0 Mar  9 14:50 ..
-r--r--r-- 1 root root 4096 Mar  9 14:51 jedec_id
-r--r--r-- 1 root root 4096 Mar  9 14:51 manufacturer
-r--r--r-- 1 root root 4096 Mar  9 14:51 partname
-r--r--r-- 1 root root    0 Mar  9 14:51 sfdp
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c22016
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
mx25l3233f
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > mx25l3233f-sfdp
root@sama5d2-xplained:~# hexdump mx25l3233f-sfdp
0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 00c2 0401 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 01ff eb44 6b08 3b08 bb04
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2650 f99c 6477 cffe ffff ffff ffff
0000070

 drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..68f6ac060bc6 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,24 @@
 
 #include "core.h"
 
+static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
+	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = "mx25l3233f";
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l3233f_fixups = {
+	.post_bfpt = mx25l3233f_post_bfpt_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -39,7 +57,10 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SPI_NOR_PARSE_SFDP |
+			      SECT_4K)
+		/* ID collision with mx25l3233f. */
+		.fixups = &mx25l3233f_fixups },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
