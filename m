Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCADDCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEE3214D9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIcQdZWO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QBdLPNwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AEE3214D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQHYdv1CPlgSm9qWw0FLCBi5NhK3LGwOOlQPCB4NN0A=; b=QIcQdZWO0mgl+P
	aPk750hVW51vJr+vNz21q98KEd9y788AmubHBpeNvk49EgqXlkoOtHIUVUbzRg7cSJgUVMh8xaVDu
	QRixJP1w/8fIf3m5faxsMt8AShsSrFoTtIqpziDuUBe+csPOcp/5/54fdpwCOXR8x6tNATKiSOx7y
	oGS/db9OFhHpJ8HkMTqXuIGwzPSf9WZ7gfhEEh0QrPVRUYVemjfru4rSC5ZeklF8vqHHbvI3V1Y+U
	cCrTvx4Oirz/E35DaX5zZYxcdu+XBp0jyJ0yPGyGw5ftac9pGmlzxbJ9/QsZ+U2YpTesFWcRk5q70
	yFhiDL2fIlp3fv30s0VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPVi-0003YF-6h; Tue, 29 Oct 2019 11:18:02 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUk-0002Ys-Qw
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:05 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: U0QU2MGCIVl1fzsYe64Gro823obTXuw28E4PZqgc7rmtoy8eryhLzsLHi5mytDMMh8BqnEtD08
 MsOjfDDpESN5Ah1HHcoU2wg5WJtTHP3B6pm2AE5BdS4HBUfb0bG6n4YqjMbbbhLDHhbfiYp68w
 Yh4L68LwKHMCZi3mVsKxabz2zT3NRYKlpXih86+a+YNlz8kOJ6vlzBCCWe+vcHtDI8LYBPO6Id
 AnF+yvb8jdDeSjLQV2HRM0PumhtYf62/pwGdhDhkkPVZOQqrakWZJYwkZGGtu17ylk1wQwwW6Q
 OUA=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54794528"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:16:51 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEYpSACBtFMpze2YQRUQFYuMdhfungrCfD8QLcL0MpMA+KyKW217Vedc2N2Od2OHwR0B3QifN9BE4rrqgBjGNwBCdU/pTXmdBDiV8r8C8gIHUZJkuIx2m7pry1rQNHQOBrGLBnkPJkbsgEpWcAplkDqayDGLis91xlskNOXdlAzHE1Zp1lnWjO0Ul4S4wiaSW9M1+Hlo4TpeuDvJKB7FW9h5SLynE5nJjm5wCF7KHItBJYd1ygER572jDo4imoUma7Gstwv5ZODLvRzUN8Ae3lvHXOtih9Iyy0vOG+76DLIztcd14n2r2rtYYe6MeKTTEmlg4qPrBVLePk2qcZbwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyV1TUej2St0d8Tu2sYvUg4eoH8lthIgHLUs59NsBoI=;
 b=IcSSjWY3/uagwHTC9PMzIukX69ps7JZcSkouXX4L7WLzGJAisynhWnoeBphvHnE0c97UtN5G0+gjnUth74EFOBDgje56cyefQIyHqFrAf8Pe5PK4RNMK6HZ1DnhwAp+rvdV18y23XbtlAiKs6ThJgPt02Iu9xp6Jyl8uA4ap8bPQrUJi++UYtf44rEs9cyGBskqPPLK+06SeXCPgjUTIxiJYO6hpJKtpB5R9HQ8ajeIWO4k/bgvZ5ZpQvrW2RzZAxOq+HxTEJrNEA+7YJKrvWrSp8X62zP5pef7F3BfYQmJF6+CEi6iGdNYHg2yIi6I8ox7Xe8P5Y5d8VXj53d/Ndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyV1TUej2St0d8Tu2sYvUg4eoH8lthIgHLUs59NsBoI=;
 b=QBdLPNwDtMc4GcwXTmTj+7XTlOjhYZ4Mf6zuuVlUSKP/dFuU7Pb9g80Psmlhyauqr9Q9Z7y6014d6IqaQj1azekOWZKmUOizG5pVwZ2qhoSzhQ3Q55fr/M1CHXslJUgC1fK/Vb0PQNgFdhC7XADfDDGP6MUOsLhCqn1hMToOBEo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3712.namprd11.prod.outlook.com (20.178.253.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:16:49 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:16:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 01/32] mtd: spi-nor: Prepend spi_nor_ to all Reg Ops methods
Thread-Topic: [PATCH v3 01/32] mtd: spi-nor: Prepend spi_nor_ to all Reg Ops
 methods
Thread-Index: AQHVjkpbEAWn0W/WNUW6ZfmVSIdQEA==
Date: Tue, 29 Oct 2019 11:16:49 +0000
Message-ID: <20191029111615.3706-2-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c880d6e-8d55-49f6-f867-08d75c617de8
x-ms-traffictypediagnostic: MN2PR11MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3712999EACD134541245E6EDF0610@MN2PR11MB3712.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(107886003)(6512007)(316002)(110136005)(4326008)(2201001)(305945005)(6436002)(54906003)(7736002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6486002)(5660300002)(36756003)(86362001)(11346002)(446003)(8936002)(81156014)(81166006)(50226002)(2616005)(186003)(476003)(256004)(478600001)(8676002)(25786009)(14454004)(486006)(66066001)(2501003)(30864003)(26005)(99286004)(386003)(76176011)(52116002)(1076003)(102836004)(14444005)(71200400001)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3712;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUEJN+I7Blhfw8Oxa58PTPL5LZjkb8cmeS/u1TnsniaI3PDcAk9NXEVivpS+wLwuhNV/kPOb5AomGoSplzFVi53ZkThA6FWNZTgJh+grkyFysTbxo9uVCyQ+blQ0TbVM8yeeb2HHMydd3fGDla0sf/+9F5aZg3AK0IXtwprvLXR0mfrQZ/tps3jZghBYGvspKQBieVY4j+ile2EAnF+jS9uIHjJmRTtIm/UicmY/vBUG+ZJXCJvh+qbZXfVl/siOXluJo57zI3gfVDIsv/2AE8UmXLDRMRGSsL4B/tFT3ZR/Ywmk7Rv3SDmcIru/2TcbgnXXDM1TJrRvG83wNdnCPH2OzX5c2UkVTDQCxTxxx1pjIsW5168HUczTp3uJ4evpAyRTBvmdtKI+hwexzA+DV2V8tAjbbmvCJ7O2u75chol4hS0TY7DA3DJyYwk1zl2S
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c880d6e-8d55-49f6-f867-08d75c617de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:16:49.2226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSbyhDV45DNBeW+yrUiCI0aXtzHozFl2pBbDB7qIVHTOwp5CwahaYkexUukJPeI9dzlYHVENqMFOJdGr1mjaOJax3VHEbPybuHJVmhLUF4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041702_997627_CAC18CC4 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

All the core functions should begin with "spi_nor_".

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 110 +++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a6f9f833c862..aca8245fb6c4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -393,7 +393,7 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
  * Return the status register value.
  * Returns negative if error occurred.
  */
-static int read_sr(struct spi_nor *nor)
+static int spi_nor_read_sr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -423,7 +423,7 @@ static int read_sr(struct spi_nor *nor)
  * Return the status register value.
  * Returns negative if error occurred.
  */
-static int read_fsr(struct spi_nor *nor)
+static int spi_nor_read_fsr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -453,7 +453,7 @@ static int read_fsr(struct spi_nor *nor)
  * location. Return the configuration register value.
  * Returns negative if error occurred.
  */
-static int read_cr(struct spi_nor *nor)
+static int spi_nor_read_cr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -482,7 +482,7 @@ static int read_cr(struct spi_nor *nor)
  * Write status register 1 byte
  * Returns negative if error occurred.
  */
-static int write_sr(struct spi_nor *nor, u8 val)
+static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
 {
 	nor->bouncebuf[0] = val;
 	if (nor->spimem) {
@@ -503,7 +503,7 @@ static int write_sr(struct spi_nor *nor, u8 val)
  * Set write enable latch with Write Enable command.
  * Returns negative if error occurred.
  */
-static int write_enable(struct spi_nor *nor)
+static int spi_nor_write_enable(struct spi_nor *nor)
 {
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -521,7 +521,7 @@ static int write_enable(struct spi_nor *nor)
 /*
  * Send write disable instruction to the chip.
  */
-static int write_disable(struct spi_nor *nor)
+static int spi_nor_write_disable(struct spi_nor *nor)
 {
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -644,9 +644,9 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 	ret = macronix_set_4byte(nor, enable);
-	write_disable(nor);
+	spi_nor_write_disable(nor);
 
 	return ret;
 }
@@ -700,9 +700,9 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 	 * Register to be set to 1, so all 3-byte-address reads come from the
 	 * second 16M. We must clear the register to enable normal behavior.
 	 */
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 	ret = spi_nor_write_ear(nor, 0);
-	write_disable(nor);
+	spi_nor_write_disable(nor);
 
 	return ret;
 }
@@ -752,7 +752,7 @@ static int spi_nor_clear_sr(struct spi_nor *nor)
 
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int sr = read_sr(nor);
+	int sr = spi_nor_read_sr(nor);
 	if (sr < 0)
 		return sr;
 
@@ -786,7 +786,7 @@ static int spi_nor_clear_fsr(struct spi_nor *nor)
 
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
-	int fsr = read_fsr(nor);
+	int fsr = spi_nor_read_fsr(nor);
 	if (fsr < 0)
 		return fsr;
 
@@ -864,7 +864,7 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
  *
  * Returns 0 if successful, non-zero otherwise.
  */
-static int erase_chip(struct spi_nor *nor)
+static int spi_nor_erase_chip(struct spi_nor *nor)
 {
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
@@ -1215,7 +1215,7 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 	list_for_each_entry_safe(cmd, next, &erase_list, list) {
 		nor->erase_opcode = cmd->opcode;
 		while (cmd->count) {
-			write_enable(nor);
+			spi_nor_write_enable(nor);
 
 			ret = spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1270,9 +1270,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		unsigned long timeout;
 
-		write_enable(nor);
+		spi_nor_write_enable(nor);
 
-		if (erase_chip(nor)) {
+		if (spi_nor_erase_chip(nor)) {
 			ret = -EIO;
 			goto erase_err;
 		}
@@ -1298,7 +1298,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
 		while (len) {
-			write_enable(nor);
+			spi_nor_write_enable(nor);
 
 			ret = spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1319,7 +1319,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			goto erase_err;
 	}
 
-	write_disable(nor);
+	spi_nor_write_disable(nor);
 
 erase_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
@@ -1328,12 +1328,13 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 }
 
 /* Write status register and ensure bits in mask match written values */
-static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
+static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
+				      u8 mask)
 {
 	int ret;
 
-	write_enable(nor);
-	ret = write_sr(nor, status_new);
+	spi_nor_write_enable(nor);
+	ret = spi_nor_write_sr(nor, status_new);
 	if (ret)
 		return ret;
 
@@ -1341,7 +1342,7 @@ static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
 	if (ret)
 		return ret;
 
-	ret = read_sr(nor);
+	ret = spi_nor_read_sr(nor);
 	if (ret < 0)
 		return ret;
 
@@ -1447,7 +1448,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	status_old = read_sr(nor);
+	status_old = spi_nor_read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
@@ -1509,7 +1510,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) < (status_old & mask))
 		return -EINVAL;
 
-	return write_sr_and_check(nor, status_new, mask);
+	return spi_nor_write_sr_and_check(nor, status_new, mask);
 }
 
 /*
@@ -1527,7 +1528,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	status_old = read_sr(nor);
+	status_old = spi_nor_read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
@@ -1592,7 +1593,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) > (status_old & mask))
 		return -EINVAL;
 
-	return write_sr_and_check(nor, status_new, mask);
+	return spi_nor_write_sr_and_check(nor, status_new, mask);
 }
 
 /*
@@ -1606,7 +1607,7 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int status;
 
-	status = read_sr(nor);
+	status = spi_nor_read_sr(nor);
 	if (status < 0)
 		return status;
 
@@ -1670,11 +1671,11 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
  * second byte will be written to the configuration register.
  * Return negative if error occurred.
  */
-static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
+static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 {
 	int ret;
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -1719,21 +1720,21 @@ static int macronix_quad_enable(struct spi_nor *nor)
 {
 	int ret, val;
 
-	val = read_sr(nor);
+	val = spi_nor_read_sr(nor);
 	if (val < 0)
 		return val;
 	if (val & SR_QUAD_EN_MX)
 		return 0;
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 
-	write_sr(nor, val | SR_QUAD_EN_MX);
+	spi_nor_write_sr(nor, val | SR_QUAD_EN_MX);
 
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		return ret;
 
-	ret = read_sr(nor);
+	ret = spi_nor_read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
 		dev_err(nor->dev, "Macronix Quad bit not set\n");
 		return -EINVAL;
@@ -1758,7 +1759,8 @@ static int macronix_quad_enable(struct spi_nor *nor)
  * some very old and few memories don't support this instruction. If a pull-up
  * resistor is present on the MISO/IO1 line, we might still be able to pass the
  * "read back" test because the QSPI memory doesn't recognize the command,
- * so leaves the MISO/IO1 line state unchanged, hence read_cr() returns 0xFF.
+ * so leaves the MISO/IO1 line state unchanged, hence spi_nor_read_cr() returns
+ * 0xFF.
  *
  * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
  * memories.
@@ -1772,12 +1774,12 @@ static int spansion_quad_enable(struct spi_nor *nor)
 
 	sr_cr[0] = 0;
 	sr_cr[1] = CR_QUAD_EN_SPAN;
-	ret = write_sr_cr(nor, sr_cr);
+	ret = spi_nor_write_sr_cr(nor, sr_cr);
 	if (ret)
 		return ret;
 
 	/* read back and check it */
-	ret = read_cr(nor);
+	ret = spi_nor_read_cr(nor);
 	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
 		dev_err(nor->dev, "Spansion Quad bit not set\n");
 		return -EINVAL;
@@ -1805,7 +1807,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 	int ret;
 
 	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
+	ret = spi_nor_read_sr(nor);
 	if (ret < 0) {
 		dev_err(nor->dev, "error while reading status register\n");
 		return -EINVAL;
@@ -1813,7 +1815,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 	sr_cr[0] = ret;
 	sr_cr[1] = CR_QUAD_EN_SPAN;
 
-	return write_sr_cr(nor, sr_cr);
+	return spi_nor_write_sr_cr(nor, sr_cr);
 }
 
 /**
@@ -1836,7 +1838,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	int ret;
 
 	/* Check current Quad Enable bit value. */
-	ret = read_cr(nor);
+	ret = spi_nor_read_cr(nor);
 	if (ret < 0) {
 		dev_err(dev, "error while reading configuration register\n");
 		return -EINVAL;
@@ -1848,19 +1850,19 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	sr_cr[1] = ret | CR_QUAD_EN_SPAN;
 
 	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
+	ret = spi_nor_read_sr(nor);
 	if (ret < 0) {
 		dev_err(dev, "error while reading status register\n");
 		return -EINVAL;
 	}
 	sr_cr[0] = ret;
 
-	ret = write_sr_cr(nor, sr_cr);
+	ret = spi_nor_write_sr_cr(nor, sr_cr);
 	if (ret)
 		return ret;
 
 	/* Read back and check it. */
-	ret = read_cr(nor);
+	ret = spi_nor_read_cr(nor);
 	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
 		dev_err(nor->dev, "Spansion Quad bit not set\n");
 		return -EINVAL;
@@ -1926,7 +1928,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	/* Update the Quad Enable bit. */
 	*sr2 |= SR2_QUAD_EN_BIT7;
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 
 	ret = spi_nor_write_sr2(nor, sr2);
 	if (ret < 0) {
@@ -1964,15 +1966,15 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	int ret;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 
-	ret = read_sr(nor);
+	ret = spi_nor_read_sr(nor);
 	if (ret < 0) {
 		dev_err(nor->dev, "error while reading status register\n");
 		return ret;
 	}
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 
-	ret = write_sr(nor, ret & ~mask);
+	ret = spi_nor_write_sr(nor, ret & ~mask);
 	if (ret) {
 		dev_err(nor->dev, "write to status register failed\n");
 		return ret;
@@ -2004,7 +2006,7 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	u8 *sr_cr =  nor->bouncebuf;
 
 	/* Check current Quad Enable bit value. */
-	ret = read_cr(nor);
+	ret = spi_nor_read_cr(nor);
 	if (ret < 0) {
 		dev_err(nor->dev,
 			"error while reading configuration register\n");
@@ -2018,7 +2020,7 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	if (ret & CR_QUAD_EN_SPAN) {
 		sr_cr[1] = ret;
 
-		ret = read_sr(nor);
+		ret = spi_nor_read_sr(nor);
 		if (ret < 0) {
 			dev_err(nor->dev,
 				"error while reading status register\n");
@@ -2026,7 +2028,7 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 		}
 		sr_cr[0] = ret & ~mask;
 
-		ret = write_sr_cr(nor, sr_cr);
+		ret = spi_nor_write_sr_cr(nor, sr_cr);
 		if (ret)
 			dev_err(nor->dev, "16-bit write register failed\n");
 		return ret;
@@ -2602,7 +2604,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	write_enable(nor);
+	spi_nor_write_enable(nor);
 
 	nor->sst_write_second = false;
 
@@ -2641,14 +2643,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 	nor->sst_write_second = false;
 
-	write_disable(nor);
+	spi_nor_write_disable(nor);
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		goto sst_write_err;
 
 	/* Write out trailing byte if it exists. */
 	if (actual != len) {
-		write_enable(nor);
+		spi_nor_write_enable(nor);
 
 		nor->program_opcode = SPINOR_OP_BP;
 		ret = spi_nor_write_data(nor, to, 1, buf + actual);
@@ -2659,7 +2661,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto sst_write_err;
-		write_disable(nor);
+		spi_nor_write_disable(nor);
 		actual += 1;
 	}
 sst_write_err:
@@ -2711,7 +2713,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
-		write_enable(nor);
+		spi_nor_write_enable(nor);
 		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
