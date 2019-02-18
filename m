Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDFAC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 12:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A6221479
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 12:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcH8tN4R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A6221479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wago.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6V27kZK7/JJagapNXgcRVI3G/AxQgJd37e7+wC8wfAE=; b=VcH8tN4Rb8LAJ/
	mhVWaVvQqXxOXvZEBSHly1UBCs4taZgRyACil9i04I5jNZQAUYXKTOaRmDlwICWXPJbAsEeC2yeZ6
	YAj6h43W4dYUlX9vuNPg17QELw0E1zw6f9Mtg/28cEFcfR8u51K25xtx9bKqAXkjSU8VV9dtsd63L
	zGCCGJwbmgeG9+H4+8l+3mTfVwgrWZC+d+AEKombE4yxJphVhP8gaeyxGdDi9eF07eh5NpzZSdIGs
	zR4GJjcc21mrCSfG3oIePBFU4kivqbAHr+tB503EO1Zx2rabI7ZbQBpo00GCackeWQh4irtBFDcr7
	DTfMSUank4xLWTJyKMtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvi6q-0001A1-Ft; Mon, 18 Feb 2019 12:33:20 +0000
Received: from mail1.bemta25.messagelabs.com ([195.245.230.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvi6m-00019H-PM
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 12:33:18 +0000
Received: from [46.226.53.50] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.eu-west-1.aws.symcld.net id F2/F0-27207-EF5AA6C5;
 Mon, 18 Feb 2019 12:33:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+JIrShJLcpLzFFi42K5+XbnJt1/S7N
 iDLZ8V7fY3bSM3YHRY/OS+gDGKNbMvKT8igTWjBOL5rIX3FGu2LXpEnMD4wLlLkYuDiGBZ4wS
 t3ftYoNwfjFKLNp4BcqZwyhx5PBbli5GTg42AXmJKbuPAiU4OEQElCV+/IsFCTMLSEu82bUVr
 ERYwEHizoR2RhBbBMh+cPgGE4StJzFx4y9GkFYWAVWJL4cyQcK8AtYS6/c9BithFJCV2LDhPD
 PESHGJW0/mg8UlBAQkluyBiEsIiEq8fPyPFWSMqEC4xM01jBBhBYmGrXvZIWxDiVXTDrBA2EC
 X9axjg7BNJQ7fPMwC0sosoCmxfpc+xCZzifa9fUwQtqLElO6H7BCXCUqcnPkEbIyQgIrE3b4t
 UOM1JR4s3ww10l5i+vurUJfZSBz62wq3avXHOywTGGVnIXlmFsLmWUg2z0KyeRaSzQsYWVcxW
 iQVZaZnlOQmZuboGhoY6BoaGukaGQCxibleYpVusl5qqW55anGJrqFeYnmxXnFlbnJOil5eas
 kmRmB6SCk49X0H45IV6YcYJTmYlER5lRZkxQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4BVYApQ
 TLEpNT61Iy8wBJiqYtAQHj5II79PFQGne4oLE3OLMdIjUKUZdjrcHn89lFmLJy89LlRLnnQUy
 QwCkKKM0D24ELGleYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawcyhSczrwRu0yugI5iAj
 ljLmQFyREkiQkqqgbGp0vZvP7tWc+TaMref8U9P/OEwLJjgmaZTq1tYND/Y7+ZktU+TD8v2H/
 38eEa3WkraH9f0kqQPhtdy9RI2TN8a5KIZn3+pZl7E+V2HykUbmMU+/V0atPlP1r1TG2sSlkm
 073L/6u04zaCi3G2VWa4cZ8FsY8Zgl65A9daHHxqeV3MUZh8SUGIpzkg01GIuKk4EAORDALyV
 AwAA
X-Env-Sender: Heinrich.Toews@wago.com
X-Msg-Ref: server-11.tower-302.messagelabs.com!1550493182!1972044!1
X-Originating-IP: [217.237.185.178]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15836 invoked from network); 18 Feb 2019 12:33:02 -0000
Received: from unknown (HELO mail.wago.com) (217.237.185.178)
 by server-11.tower-302.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 18 Feb 2019 12:33:02 -0000
Received: from SVEX01009.wago.local (10.1.103.227) by SVEX01010.wago.local
 (10.1.103.228) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Mon, 18 Feb
 2019 13:33:01 +0100
Received: from SVEX01005.wago.local (10.1.101.121) by SVEX01009.wago.local
 (10.1.103.227) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.1531.3 via Frontend
 Transport; Mon, 18 Feb 2019 13:33:01 +0100
Received: from SVEX01008.wago.local ([169.254.4.220]) by SVEX01005.wago.local
 ([169.254.1.40]) with mapi id 14.03.0415.000;
 Mon, 18 Feb 2019 13:33:01 +0100
From: <Heinrich.Toews@wago.com>
To: <linux-mtd@lists.infradead.org>
Subject: mtd: mchp23k256: How to follow a more generic approach?
Thread-Topic: mchp23k256: How to follow a more generic approach?
Thread-Index: AQHUx4YW9WCII7mMYUC2iYT0KpFxjQ==
Date: Mon, 18 Feb 2019 12:33:01 +0000
Message-ID: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-originating-ip: [10.1.103.231]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
x-pp-proceessed: 8707ce24-8c4e-4a04-80f2-2a31f9152b06
Content-ID: <B3E26DE53C42894B8323F28C44AE3EB0@WAGO.com>
MIME-Version: 1.0
X-KSE-ServerInfo: SVEX01010.wago.local, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-PP-Proceessed: 3501de6a-633d-491f-8a4a-2b9665cb6ea9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_043316_965444_85DA9B51 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Oleg.Karfich@wago.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi altogether,

I'm using currently the CONFIG_MTD_MCHP23K256 driver to access an 
ANV32AA1W 1Mb Serial SPI nvSRAM from Anvo-Systems Dresden.

I did some changes to the driver as seen below to make it work.


diff --git a/drivers/mtd/devices/mchp23k256.c 
b/drivers/mtd/devices/mchp23k256.c
index 9d8306a..6140973 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -28,6 +28,7 @@ struct mchp23k256_flash {
  };

  #define MCHP23K256_CMD_WRITE_STATUS    0x01
+#define MCHP23K256_CMD_WREN            0x06
  #define MCHP23K256_CMD_WRITE           0x02
  #define MCHP23K256_CMD_READ            0x03
  #define MCHP23K256_MODE_SEQ            BIT(6)
@@ -40,13 +41,14 @@ static int mchp23k256_write(struct mtd_info *mtd, 
loff_t to, size_t len,
         struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
         struct spi_transfer transfer[2] = {};
         struct spi_message message;
-       unsigned char command[3];
+       unsigned char command[4];

         spi_message_init(&message);

         command[0] = MCHP23K256_CMD_WRITE;
-       command[1] = to >> 8;
-       command[2] = to;
+       command[1] = to >> 16;
+       command[2] = to >> 8;
+       command[3] = to;

         transfer[0].tx_buf = command;
         transfer[0].len = sizeof(command);
@@ -73,14 +75,15 @@ static int mchp23k256_read(struct mtd_info *mtd, 
loff_t from, size_t len,
         struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
         struct spi_transfer transfer[2] = {};
         struct spi_message message;
-       unsigned char command[3];
+       unsigned char command[4];

         spi_message_init(&message);

         memset(&transfer, 0, sizeof(transfer));
         command[0] = MCHP23K256_CMD_READ;
-       command[1] = from >> 8;
-       command[2] = from;
+       command[1] = from >> 16;
+       command[2] = from >> 8;
+       command[3] = from;

         transfer[0].tx_buf = command;
         transfer[0].len = sizeof(command);
@@ -104,17 +107,18 @@ static int mchp23k256_read(struct mtd_info *mtd, 
loff_t from, size_t len,
  /*
   * Set the device into sequential mode. This allows read/writes to the
   * entire SRAM in a single operation
+ *
+ * CHANGE: Enable Write Mode in the device
   */
  static int mchp23k256_set_mode(struct spi_device *spi)
  {
         struct spi_transfer transfer = {};
         struct spi_message message;
-       unsigned char command[2];
+       unsigned char command[1];

         spi_message_init(&message);

-       command[0] = MCHP23K256_CMD_WRITE_STATUS;
-       command[1] = MCHP23K256_MODE_SEQ;
+       command[0] = MCHP23K256_CMD_WREN;

         transfer.tx_buf = command;
         transfer.len = sizeof(command);
@@ -147,7 +151,7 @@ static int mchp23k256_probe(struct spi_device *spi)
         flash->mtd.type         = MTD_RAM;
         flash->mtd.flags        = MTD_CAP_RAM;
         flash->mtd.writesize    = 1;
-       flash->mtd.size         = SZ_32K;
+       flash->mtd.size         = SZ_128K;
         flash->mtd._read        = mchp23k256_read;
         flash->mtd._write       = mchp23k256_write;


What would be the best approach to add a more generic solution to the 
kernel in order to be able to address different SPI SRAM devices?

Thanks.


Greetings,

	Heinrich Toews
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
