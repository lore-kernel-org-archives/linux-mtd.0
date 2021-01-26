Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C992C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 14:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1526E22EBF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 14:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1526E22EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ros/DpJzBe3F5DWJD/d3ZgLRpUmW48FL8QnRP1nGT0c=; b=QyCkLCoRa0qWtQRfqTcY6lqNjy
	s5nEgfMjevZWB9bU5oIfYWRv3xILH/2ea8xG6CSVIih68kZKAR9nYgJx0r8X5F9x2DnNWX4c/+twC
	aFBIYon9Nmu99vvorrCd4nM33gZIshIGjHd5MaEH1sf8dusLzfc0t4LQXpmrKAesWX8Su/ZeqO5+v
	86z8msbGC8KDeJuhP/9JJ/me3XOqLE4/C5eNUNx2hAnazQzzSIdu2meXxothemNg9+EO4pCHqOntB
	WXufUFQMch/jQ0D+mhGVM2c9oL157at8kHwYak7gP7VkM1gz3YSuL9X8oryig1jgtgYhksEURO2iq
	IWYOX0WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4PTh-0004Bh-MX; Tue, 26 Jan 2021 14:37:57 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4PTe-0004AJ-Il
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 14:37:55 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 6.5.2) with ESMTP id SG000733461.MSG 
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2021 15:37:50 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 Jan 2021 15:37:50 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 26 Jan 2021 15:37:50 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1] mtd: spi-nor: add ACPI support for non-JEDEC SPI-NOR
Date: Tue, 26 Jan 2021 15:37:48 +0100
Message-ID: <20210126143748.1546187-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F15.6010293E.00A0, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_093754_762023_C6FA3379 
X-CRM114-Status: GOOD (  13.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Flavio Suligoi <f.suligoi@asem.it>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In a x86 machine, an additional device can be described
inside the BIOS ACPI tables.
For example, an I2C GPIO expander, a LED, etc.,
can be successfully declared in ACPI, so that the related
device driver can start automatically at the boot.

But for the SPI NOR devices, the ACPI description works
for JEDEC-compatible devices only.

For example, an Everspin MR25H40 MRAM device (non-JEDEC
compatible), declared using the following table,
does not work:

    Scope (\_SB.SPI1)
    {
        Device (NVR0)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "Everspin MR25H40 MRAM")
            Name (_CRS, ResourceTemplate () {
                SpiSerialBus (
                1,                      // Chip select
                PolarityLow,            // Chip select is active low
                FourWireMode,           // Full duplex
                8,                      // Bits per word is 8 (byte)
                ControllerInitiated,    // Don't care
                10000000,               // 10 MHz
                ClockPolarityLow,       // SPI mode 0 ClockPolarityLow
                ClockPhaseFirst,        // SPI mode 0 ClockPhaseFirst
                "\\_SB.SPI1",           // SPI host controller
                0,                      // Must be 0
                ResourceConsumer,
                ,
                )
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"compatible", "mr25h40"},
                }
            })
        }
    }

To enable the detection of a non-JEDEC device described
in a BIOS ACPI table, it is necessary to add its id name
in the spi_nor_of_table structure.
With this change, all the SPI NOR devices (JEDEC and
non-JEDEC) can be detected by the kernel (and the above
example of ACPI table finally works).

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/mtd/spi-nor/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6ae7d4c2d2b6..b6fb8b15c439 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3755,6 +3755,19 @@ static const struct of_device_id spi_nor_of_table[] = {
 	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
 	 */
 	{ .compatible = "jedec,spi-nor" },
+	{ .compatible = "m25p05-nonjedec" },
+	{ .compatible = "m25p10-nonjedec" },
+	{ .compatible = "m25p20-nonjedec" },
+	{ .compatible = "m25p40-nonjedec" },
+	{ .compatible = "m25p80-nonjedec" },
+	{ .compatible = "m25p16-nonjedec" },
+	{ .compatible = "m25p32-nonjedec" },
+	{ .compatible = "m25p64-nonjedec" },
+	{ .compatible = "m25p128-nonjedec" },
+	{ .compatible = "mr25h128" },
+	{ .compatible = "mr25h256" },
+	{ .compatible = "mr25h10" },
+	{ .compatible = "mr25h40" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
