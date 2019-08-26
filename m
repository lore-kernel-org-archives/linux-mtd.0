Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC43C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE952070B
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJI1CG7K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="d0UV2kUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE952070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2tGTSHilSU+oCWSF2FLBPuuArru/RjePorReOKTpNY=; b=SJI1CG7KQlQl7r
	EBAXeEbGk09qIYGzGwrgaH5NAXbN7garmQVpZFgoOljQqQU7SlVoe8AvUPURPbcricQ0MKGxMfv6+
	S7Uhq78I7fNEbiyuxq7ZZtcEi8Xvwh6Gj/KS8e56f2ObZtt8/S60Bd6arR7teFLFjrxp2AlQfTFOH
	dVyhDzA7AcHFe0XkMSt3LBp/RC0UwG4fx+gHxAawNme6kjit0zgn5zwVL+o9Cm8EMiNNimOpi0mVS
	uFlyJmsGSW/rywGiaSLA8v6UH+sP26Faei8du8rKMlv3RMupozUlUPpxa/xpBUrv98a3Zj9KNP3LM
	maM2ZrdGUjcI3ishfaDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Di4-0007rY-Rk; Mon, 26 Aug 2019 12:02:56 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Dhh-0007Kd-Ex
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:02:34 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: dcYuw4CfiRfV4fU3cdqCFt+uyPsqpwXxmMgx3X55AB0fBGZOCz7NkKxvg79wCw2L0+di1ouavS
 Q2aXeUrJlSri1jRpDODR59Sy10b575zUJ7B4Eqj+2YiYxZjUUlCe+lW7ACR69wln0dbhaUU0ek
 qEAo4SKWSY0rAIhQN/JRP5cc55iPANWjy/5xnxrdhkvJVdWvWdfBF+aSi/P2AO2+PgloAm+T6S
 2z3mbojBP7EqdLKb3myS9e33W33zAAoXUl6WJ2Unbbk1sCkEI7ID/QknNmeyBBJ8H5P4feDP4Q
 ahc=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46519431"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:02:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:02:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 05:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP4lgrbXwSSo5JMkbcNcOBQHhfrv4tkzCVbsL402MvXiy1xDgqphEWGnc930ghjMQPBF/JU8Ixo9ZtdQcXc/loDJLRYO7auCT2+qxyPdk5v6OpejNvNDCiVJHSGYHzv5W/5tB1Nfv2DySAxHkPj9Voaaop1PEESJqTW3G7e0teCH2WPwOeV2q9kVIxcAdypwtSsvP2SCSjU8Zsw7fiWajz35MirVz1RLutJ7bp01Si3XH5rvW61u9CTDW70ybigXPyiE8w+eZWbCsZ8zeXg4YK+GUuqkIZM6cmdFeKNr5R01JJypDZCCMMASxiF5Q0/xHBxDosn2SJhBE6iNuqZ6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83cqgcTg75/sj6NnDtNIK6PZ+w7EoY0HKjhL3s4E+o=;
 b=N7B+95U9b6j5O7azaOkA6si9bNpVgD/wH1CuLF/bPu+UQKdmLopW4Sv2c+0vKi8pKvnu3z7M3g2YXTasRsTVtnhY3W7HJaSsLIjLsXHb6PZXPg2IMrJLKKVjNEAEnIrY3bgeCBxUjyY+pFXzhTsY8wHlzq+M6bMCVR76QLs0SkOxOilRnN14OQ0ifuGNzerKk3EbW3lbz0wA83IivhUZJNV6sv2LQTnLDWvxpXLogWXH0tzwXBEPfPOIR+1SihzQN8PeFjuEGNB2gNAGzKqfi5djjOHgWJ/K/cBc3ZT6NKvuNSKHtpXdH8DVch2buGu/J7vBRQjPXaio+VcP4EHEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83cqgcTg75/sj6NnDtNIK6PZ+w7EoY0HKjhL3s4E+o=;
 b=d0UV2kUxVn7dR4AIIis5kzrBiqR11KwMIZTHtXTAKmcOtkvcfmOAtAz4/f/23LLc5caxnTRfGB8Szdvbx6mWx+n/zOD32h+bEkbOYYif/f/uZ5lqKsS2pk3QMD6VHrG+qYwxh4oAv6PGJ+i+8Qmi80TvvR12ut83KZWj70SDsdY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3776.namprd11.prod.outlook.com (20.178.251.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:02:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:02:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/20] mtd: spi-nor: Add spansion_post_sfdp_fixups()
Thread-Topic: [PATCH v3 12/20] mtd: spi-nor: Add spansion_post_sfdp_fixups()
Thread-Index: AQHVXAYczdJpBguov0Ko2oukUYQ6yg==
Date: Mon, 26 Aug 2019 12:02:19 +0000
Message-ID: <20190826120206.15025-3-tudor.ambarus@microchip.com>
References: <20190826120206.15025-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120206.15025-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0041.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 763bb891-d445-4a93-8199-08d72a1d3ec4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3776; 
x-ms-traffictypediagnostic: MN2PR11MB3776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3776B2314E6CD9CEA604F8B2F0A10@MN2PR11MB3776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(81166006)(81156014)(8676002)(1076003)(2201001)(2501003)(256004)(26005)(7736002)(99286004)(66066001)(2906002)(54906003)(76176011)(52116002)(316002)(186003)(50226002)(8936002)(66476007)(66556008)(64756008)(66946007)(66446008)(110136005)(53936002)(2616005)(36756003)(25786009)(5660300002)(386003)(305945005)(6506007)(102836004)(3846002)(6116002)(446003)(11346002)(478600001)(4326008)(86362001)(6436002)(6486002)(6512007)(14454004)(71200400001)(71190400001)(107886003)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3776;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yMcNr8k3IaAk0arD4a9WjU+fVSPbMlJ/um4oLCdFHVlb48FKSmFrsr4b3LdR1TKnIjCIouMhSDR6oEmqf0Z5Fs5w3ExnEjmb1jDqPlWpuKSVPnRWRPMHsAGNDbODOURNVPQMC6eN+yE7lcfZdr7adWAwksF+R4eRGBUbBhzUOCXpDpVp5ypY5V5taDeiryeWzQAlFeoRAozmNz90VATCPNv13x31ac+Lrt8sEiq5dbZUyiIFt+vyCEXRZ4/RX32InYZ2Kjz8vT5SWMM0McLR549vER8x+D8G390uTbldBf9OJTZrOI7jsDXHtHtTp5LykhxWfEbz1808IoAS7uGIbBFel2Mc2P5im0hW3MMOYE6zg0QYoXj3pLV26/niMA8M/UNvA6FvPut/fPVm0FCeDtee22AV2yI2FtihzPRSHI4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 763bb891-d445-4a93-8199-08d72a1d3ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:02:19.4586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85aiWZ6g7THeLcaxQq3BR8OKj7TU6o9X9O2PQziWAx5Y0n0lAT40mlEP3+fQ5vEpoWtpG/eU52eCAugpP+kINKSBsRtMp7Ve49bSNQTG9hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050233_558126_8015C1BC 
X-CRM114-Status: GOOD (  10.72  )
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
