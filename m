Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695F7C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0D42173C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ISktPxRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0D42173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kyiw60VOG4pqwD0/zHxNlb2WXGcvYFSHlH7R9B/jmdQ=; b=ISktPxRl85beyu
	Uu3U7DHKsqtXWgAAUeuYYfHn6oPSRfFv1zkfgH2z7/2cAFoPh8cTyjij8tvTEkpLTumht1LakYq70
	UCrRZy47bZpUldtm312GO+Yw4SW/CAf/EWX39qUHY1SoCaK094Jrhw3lNhoWl65RC/NG/6byTTJgy
	l6MuX6usJl6TgDJSMnvh24c84MyWrNvkksX+zKCp8tTAAMYWt6sEueHQrp3WTsATIgIqNOqaeTbC2
	hvlaEyx9I/TfmoMyCPSTjJg5DvzN+AXUXV4ko7lKLaLdzheW8UK5Uj6UuE3iIRQTGyF0wHnuGZa7b
	FHIjHs/cVgPu1XfNPXsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaHo-0007yS-21; Tue, 26 Feb 2019 10:48:32 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaHg-0007ou-W1
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 10:48:26 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003717273.MSG 
 for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2019 11:48:11 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 26
 Feb 2019 11:48:10 +0100
Received: from flavio-x.asem.intra (172.16.17.161) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
 Transport; Tue, 26 Feb 2019 11:48:10 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark
 Brown <broonie@kernel.org>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] mtd: devices: add ACPI support for non-jedec m25p80
Date: Tue, 26 Feb 2019 11:48:08 +0100
Message-ID: <1551178088-6615-2-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551178088-6615-1-git-send-email-f.suligoi@asem.it>
References: <1551178088-6615-1-git-send-email-f.suligoi@asem.it>
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0207.5C75196B.0066, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_024825_213666_73C84F48 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Flavio Suligoi <f.suligoi@asem.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For the x86 machines a m25p80-compatible device have to be declared using
an ACPI table (which can be directly a part of the BIOS ACPI tables).

In this case it is necessary to add the device in the "of_device_id" structure
list, to permit the device name matching by the ACPI kernel functions.

This is an example of a SSDT table for the Everspin mr25h40:

DefinitionBlock ("mr25h40.aml", "SSDT", 5, "ASEMsp", "MR25H40", 1)
{
	External (_SB.SPI1, DeviceObj)

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
				"\\_SB.SPI1",      	// SPI host controller
				0,			// Must be 0
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
}

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v1: - first patch version

 drivers/mtd/devices/m25p80.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c4a1d04..b5c7db8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -312,9 +312,64 @@ MODULE_DEVICE_TABLE(spi, m25p_ids);
 static const struct of_device_id m25p_of_table[] = {
 	/*
 	 * Generic compatibility for SPI NOR that can be identified by the
-	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
+	 * JEDEC READ ID opcode (0x9F). Use this (jedec,spi-nor), if possible.
+	 *
+	 * The list of all flash devices is instead necessary in x86 machines,
+	 * to use a "non-jedec device" inside the ACPI BIOS tables.
 	 */
 	{ .compatible = "jedec,spi-nor" },
+	{ .compatible = "s25sl064a" },
+	{ .compatible = "w25x16" },
+	{ .compatible = "m25p10" },
+	{ .compatible = "m25px64" },
+	{ .compatible = "at25df321a" },
+	{ .compatible = "at25df641" },
+	{ .compatible = "at26df081a" },
+	{ .compatible = "mx25l4005a" },
+	{ .compatible = "mx25l1606e" },
+	{ .compatible = "mx25l6405d" },
+	{ .compatible = "mx25l12805d" },
+	{ .compatible = "mx25l25635e" },
+	{ .compatible = "mx66l51235l" },
+	{ .compatible = "n25q064" },
+	{ .compatible = "n25q128a11" },
+	{ .compatible = "n25q128a13" },
+	{ .compatible = "n25q512a" },
+	{ .compatible = "s25fl256s1" },
+	{ .compatible = "s25fl512s" },
+	{ .compatible = "s25sl12801" },
+	{ .compatible = "s25fl008k" },
+	{ .compatible = "s25fl064k" },
+	{ .compatible = "sst25vf040b" },
+	{ .compatible = "sst25vf016b" },
+	{ .compatible = "sst25vf032b" },
+	{ .compatible = "sst25wf040" },
+	{ .compatible = "m25p40" },
+	{ .compatible = "m25p80" },
+	{ .compatible = "m25p16" },
+	{ .compatible = "m25p32" },
+	{ .compatible = "m25p64" },
+	{ .compatible = "m25p128" },
+	{ .compatible = "w25x80" },
+	{ .compatible = "w25x32" },
+	{ .compatible = "w25q32" },
+	{ .compatible = "w25q32dw" },
+	{ .compatible = "w25q80bl" },
+	{ .compatible = "w25q128" },
+	{ .compatible = "w25q256" },
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
 	{}
 };
 MODULE_DEVICE_TABLE(of, m25p_of_table);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
