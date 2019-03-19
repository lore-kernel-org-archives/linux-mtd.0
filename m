Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B3BC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B8320835
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2rY7edK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="mlEP9r9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B8320835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJE7+kEesDt1PO3IVvlnyw+VL8epH1SuoglEAwLkz08=; b=G2rY7edKlo0NJ+
	SSre+/7l+cC6pJ03Gow5W65wfsOQVJ/1VMrzS1KlGe9nO2nchwG57OLyMzmcwnee/RFWAGq5MvZof
	8lIEiTGThUCDz7cnx99akbDDHKZ8POCE+o+QMUxTjGT8tnv4RseHf0AnKKPfBzM69imYaWVMqsHch
	XWTyl9L16YD7V8AAcME7xSrQOPG0p2Z6A5NaiFofcDl/Zz8+RH8Lz7ukakmdFOTVgmPCuHhWR8YMb
	ARYccv2Mbsc6sEY3aAWFwVWa4O+Q2jTWc4Ankga/FfDKsphFd+r1JZff9ldUrd6DIlaDxim/BulVr
	ctX3m/n3y4Q+r36iiMow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6I3S-0003yL-Ec; Tue, 19 Mar 2019 16:57:34 +0000
Received: from mail-eopbgr10104.outbound.protection.outlook.com
 ([40.107.1.104] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6I3E-0003Xx-Qy
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Pbziw8a4YVZKweOhGF99YFhVvW7EFJvmZngt4S9f68=;
 b=mlEP9r9G3jkyG4MMQVLbNAA5yVzQjVAdeXskyWMoD6mZGY9IkAFbLEmQuGKXwgYfPs5KxJmKSfUG1A5DGwdqu8s9wKVNWSifsFYyrCf/uJJi0EUZw/C8l63jl8u/1+hYlZTVP+d8NpBRjbvAj8jauziR7G4oyxhK8dNmYU+oUkI=
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83) by
 AM6PR07MB4968.eurprd07.prod.outlook.com (20.177.197.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.16; Tue, 19 Mar 2019 16:57:14 +0000
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996]) by AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 16:57:14 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Index: AQHU3nTN8SIBR3/6HEWWJ/3V4b8R5A==
Date: Tue, 19 Mar 2019 16:57:14 +0000
Message-ID: <20190319165651.23695-3-alexander.sverdlin@nokia.com>
References: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
 <20190319165651.23695-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319165651.23695-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.180]
x-mailer: git-send-email 2.20.1
x-clientproxiedby: HE1PR09CA0066.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::34) To AM6PR07MB5221.eurprd07.prod.outlook.com
 (2603:10a6:20b:6a::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d96a498-16b0-49c4-b063-08d6ac8beffc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR07MB4968; 
x-ms-traffictypediagnostic: AM6PR07MB4968:
x-microsoft-antispam-prvs: <AM6PR07MB4968FCDC350878E6EEBC5F8B88400@AM6PR07MB4968.eurprd07.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(11346002)(71200400001)(446003)(6506007)(386003)(102836004)(186003)(71190400001)(26005)(76176011)(2616005)(305945005)(476003)(7736002)(97736004)(1076003)(52116002)(486006)(6486002)(6436002)(14454004)(50226002)(86362001)(8936002)(25786009)(36756003)(2501003)(81166006)(6916009)(68736007)(54906003)(316002)(81156014)(8676002)(5660300002)(99286004)(6512007)(66066001)(53936002)(2906002)(14444005)(256004)(6116002)(3846002)(5640700003)(4326008)(2351001)(478600001)(106356001)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4968;
 H:AM6PR07MB5221.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RrdGy9HIa8bL3wWAGBm8keAzDFDesjH5Dab55hfsvDdYW8Av/7Cj0PJAu9LBOi7sESKkE2xw/dKeidoyAeBlJ1OMod6202o2WhvCdUEr4dlLnhv1mL2tMH3xFmZP7roReS1M0sF4bOvKa1SllcZrJwVxObv5P1uzvscVqVFAq9CJZKYcF3d7k2ORFrtsBDfKZc2ILNqB4+Bexc0qqs0KSidxpbNdl26vZgcLwsroSJWQ5ZPdWDh4Gu02xmqjxg9OKPxZMDyygxCNSwv5m8o2fFCNs+D/pUgtHlo/fSXhSol1XpJrDUNbiT0rsg8YXLsxQ93SGx7Ei/yJqdmCH3BCNVXWN/Th9D0bFfTMJ8GND2TXvevGePkpeJt6HzZtB74lNHv3Qkggsj88CBnXRwBR28WaBnGYYZyxgIDxaDC+0T0=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d96a498-16b0-49c4-b063-08d6ac8beffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:57:14.8121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_095721_191506_95BBEE7E 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, "Sverdlin,
 Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Optimize erase time by always using biggest erase size for given erase
request. Do it by removing "sector"-at-a-time erase code.
spi_nor_erase_multi_sectors() seems to be mature enough to handle all
the cases better.

For the above to work backwards-compatible regarding 4-bytes commands
spi_nor_set_4byte_opcodes() has to prepare them always, independent of
spi_nor_has_uniform_erase() flag.

Remainder check in spi_nor_erase() becomes superfluous because
spi_nor_erase_multi_sectors() performs it anyway.

The trigger for this change was n25q128a13: enabling SECT_4K increased
erase time of 128k block from 1.763s to 11.335s.

Fixes: 4607777c71 ("mtd: spi-nor: add subsector flag to n25q128a")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 46 ++++++-----------------------------
 1 file changed, 7 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c3598f0571cc..a25324a52eae 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -434,6 +434,10 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
+	struct spi_nor_erase_map *map = &nor->erase_map;
+	struct spi_nor_erase_type *erase;
+	int i;
+
 	/* Do some manufacturer fixups first */
 	switch (JEDEC_MFR(nor->info)) {
 	case SNOR_MFR_SPANSION:
@@ -450,16 +454,9 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
 
-	if (!spi_nor_has_uniform_erase(nor)) {
-		struct spi_nor_erase_map *map = &nor->erase_map;
-		struct spi_nor_erase_type *erase;
-		int i;
-
-		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
-			erase = &map->erase_type[i];
-			erase->opcode =
-				spi_nor_convert_3to4_erase(erase->opcode);
-		}
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		erase = &map->erase_type[i];
+		erase->opcode = spi_nor_convert_3to4_erase(erase->opcode);
 	}
 }
 
@@ -978,18 +975,11 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	u32 addr, len;
-	uint32_t rem;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
-	if (spi_nor_has_uniform_erase(nor)) {
-		div_u64_rem(instr->len, mtd->erasesize, &rem);
-		if (rem)
-			return -EINVAL;
-	}
-
 	addr = instr->addr;
 	len = instr->len;
 
@@ -1021,28 +1011,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (ret)
 			goto erase_err;
 
-	/* REVISIT in some cases we could speed up erasing large regions
-	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
-	 * to use "small sector erase", but that's not always optimal.
-	 */
-
-	/* "sector"-at-a-time erase */
-	} else if (spi_nor_has_uniform_erase(nor)) {
-		while (len) {
-			write_enable(nor);
-
-			ret = spi_nor_erase_sector(nor, addr);
-			if (ret)
-				goto erase_err;
-
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto erase_err;
-		}
-
 	/* erase multiple sectors */
 	} else {
 		ret = spi_nor_erase_multi_sectors(nor, addr, len);
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
