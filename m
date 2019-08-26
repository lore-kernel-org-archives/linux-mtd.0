Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C81AC3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1897C217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPn6rKnW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BfKKi3BZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1897C217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2tGTSHilSU+oCWSF2FLBPuuArru/RjePorReOKTpNY=; b=jPn6rKnWDkysHb
	z+oUY+QWItgyHPznVvUyX4iDIpucupDabLOoWCfUqmuZMBg0/Y4LLwbaR0jz6PRrihh1uwUIiLOh1
	tVfoFef3EXi5Du8D++4tkGrX/jbCYQ6ziM7bqB0uSA9IJL84E4SsGl00Wzy9cGKpxjollXXNgaKsD
	mG6NtW9bEiaUMwCmvv83wl24+UNvhGH5pxr2LRkaP2er3gaVlqhgfUTAjxCw9wV4LxdnVKMeM4T9E
	KgG0Kn3gWys2J4vvRFK8VREcJIJ3nVuuDsrmlSDcJtOLindNyV8lZcd04rVtE0jylAvC1+8V5Q5IT
	7WPV+ryhYjWB4HJFQsIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DqS-0006dG-4Z; Mon, 26 Aug 2019 12:11:36 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Do4-0002j9-UM
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:09:13 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: EeimEHMz1ma+ntSSAemG7tGtmhnLGJv7VZs90oDkRE8RpEZhQzQaXoomlz7C+7dsyucj9huSr7
 7EvBFAjYgJpaB2rTspMOph4sBcC3be5t8XOToq1oNiYvHsSHUdYN7FLwnMRPuWPRCP2/L3QmYg
 lUwCqThc73NVXHAOJptqnkdw4ornplRVpE2R61yWEZ9xHWqotfP+f/f3UkCf3RXXGD8G2QYjc+
 iIaAZTS/ZtAQhqHSCyYWOflAVxBE2LXOn7dPrhNjJ9P/mJV+VpK/ilMYmJpMhdbWMGdLNQahU9
 pCE=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="43686987"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:09:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:09:05 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 26 Aug 2019 05:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4GXh5EYFUCGkhQgvTsL+QQUVgwXvyrEYGJWhCFHNbyqdtK6SW/qoIkxzw6zPg8WYNetYAq00mq9ULKrV/lGiOebQFfDIczigKFFJlQPfT/irclsouNY/sEK9jYBPTpQeDZzZzsrVflqx8EwdEvajaXfkENaA/w2B+NpLkjPdV+nF86Uekeyvhh7NYoZNUSCVAtDVWYuPSU8kSbbrbujjpJZoHsX0H/UzTsiRMl3DgRVwATW7gC1cJ6b0Xgt8ULp1qInJvwVnNSOjS88V4VmLAQ6QHZhn6vMx0nNkBeB/ECvcMd+ytvSq+8cJ0Mo+fNL9pu0g7ZTEMFfedvACg9cIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83cqgcTg75/sj6NnDtNIK6PZ+w7EoY0HKjhL3s4E+o=;
 b=D5oFQ2e5mgSkQ3/MioIPwStfUwudhC3yznlMlc8yXIBw1SVNCiRk2q/lXhAGQ0xlNYXNtqlR78NebGZ7hmqdMZjY+4kwd4KFHBlwHaDVjXGRymNzAG7vL4/V08AExJLnGOKUGVHCKKKPzLbJaXG7YcVi32kAyORj9PKsHpzD/Phb3L4nZpfKWVBP9+DduXhOJW0mhfeYSmFYP9Co4DWc9ZvAm3YcN62uAquL5OrOL+tRDvXoxQA3Nras2j3Nmc4kITqXevayb+L7qY4UR1GWQGK8E7Q6qXYSZ1E2owPkQBc4n4afR2907Rultcs5uboSrjzwtXoRZesTnEiNjFikVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83cqgcTg75/sj6NnDtNIK6PZ+w7EoY0HKjhL3s4E+o=;
 b=BfKKi3BZ6cq2d734xinZ9hStGnVR1S1CGO95RiZkXkmTXL6mQlDuMsUQuSQPjrztD52sxX/qd0tRK1eT6wC5o6ASqCvQ75blZ3iWw0l9oSYjHRjpDHfnG/hpRZcJh3YASEVjTVqQTaDx4EyjaMd0ws1IRrcwmDoVCQVyFKfzeXU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3678.namprd11.prod.outlook.com (20.178.252.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:09:04 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:09:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 12/20] mtd: spi-nor: Add spansion_post_sfdp_fixups()
Thread-Topic: [RESEND PATCH v3 12/20] mtd: spi-nor: Add
 spansion_post_sfdp_fixups()
Thread-Index: AQHVXAcHeDngrj5uK0qv/Rz830kGLw==
Date: Mon, 26 Aug 2019 12:08:54 +0000
Message-ID: <20190826120821.16351-13-tudor.ambarus@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120821.16351-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0046.eurprd09.prod.outlook.com
 (2603:10a6:802:28::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 498664ce-7e1c-417f-3bad-08d72a1e2a11
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3678; 
x-ms-traffictypediagnostic: MN2PR11MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3678F49810308E31870BB1A4F0A10@MN2PR11MB3678.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(486006)(2616005)(476003)(6666004)(107886003)(316002)(14454004)(386003)(6506007)(76176011)(99286004)(52116002)(54906003)(110136005)(478600001)(102836004)(4326008)(25786009)(36756003)(446003)(26005)(11346002)(50226002)(81156014)(66066001)(8676002)(53936002)(81166006)(8936002)(6512007)(6486002)(6436002)(3846002)(6116002)(186003)(86362001)(305945005)(2201001)(7736002)(2906002)(64756008)(66446008)(1076003)(71190400001)(5660300002)(71200400001)(256004)(66946007)(66556008)(66476007)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3678;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W7LfY43M0RA4WXiRYdlZaGDwhGh9Ava6KaYqwLUBir/nW3l0ypyIPfqSUbyeDfdrhd73cbFF6qPWDVZPbKaU71oF2OvlTvwQ96d8BjQELzQJMfD0yg0DYoHGxU1LQSftaiBgE7S/29pEhatd+NWAobENSkt8fuWFltsKG/UiirfdpHImqjWf2El1i0MZnKbYE14I3Cpgz2UakCJgei5R5e+xzrbcne1uqLjdZK6Ha6tEWkr99sPmyh91t3c7R+DLnwYd25qxLaQ0TwgMG7vmAwtnYpQaZ6sY5Zhe60agPu4EE2vZYOAR2zebGtgNl/Xe/ZOCBuHFXn07TVvxTrqizSiugjNfclko0Ok+8wH251upoBEMcNk7mv6Kp5I9VXt2lrDuD8Gkz+lpYif+PoeEqJMRlN7vd/NRiBT9hGhkxY8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 498664ce-7e1c-417f-3bad-08d72a1e2a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:08:54.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFmmyk6nvYM2nLHMp3G6R7r/owL3ibuQhRD7vsjoxXpgJMNkZQk1D2G05tY5fYrA32uTm0VcppoEAZw2FAVBcSP1p0btsUdGUzZLHKGSq9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050909_082459_FAC3D294 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: boris.brezillon@bootlin.com, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Add a spansion_post_sfdp_fixups() function to fix the erase opcode,
erase sector size and set the SNOR_F_4B_OPCODES flag.
This way, all spansion related quirks are placed in the
spansion_post_sfdp_fixups() function.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3: no changes, rebase on previous commits

 drivers/mtd/spi-nor/spi-nor.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b8caf5171ff5..c862a59ce9df 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -591,18 +591,6 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
-	/* Do some manufacturer fixups first */
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_SPANSION:
-		/* No small sector erase for 4-byte command set */
-		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = nor->info->sector_size;
-		break;
-
-	default:
-		break;
-	}
-
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
@@ -4304,6 +4292,19 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	if (mtd->size <= SZ_16M)
+		return;
+
+	nor->flags |= SNOR_F_4B_OPCODES;
+	/* No small sector erase for 4-byte command set */
+	nor->erase_opcode = SPINOR_OP_SE;
+	nor->mtd.erasesize = nor->info->sector_size;
+}
+
 /**
  * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
  * after SFDP has been parsed (is also called for SPI NORs that do not
@@ -4316,6 +4317,15 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
  */
 static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
+	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_SPANSION:
+		spansion_post_sfdp_fixups(nor);
+		break;
+
+	default:
+		break;
+	}
+
 	if (nor->info->fixups && nor->info->fixups->post_sfdp)
 		nor->info->fixups->post_sfdp(nor);
 }
@@ -4862,8 +4872,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->addr_width = 3;
 	}
 
-	if (info->flags & SPI_NOR_4B_OPCODES ||
-	    (JEDEC_MFR(info) == SNOR_MFR_SPANSION && mtd->size > SZ_16M))
+	if (info->flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
 	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
