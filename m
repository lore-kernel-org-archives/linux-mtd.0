Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7230C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 703122339D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCaZyq5j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="R61999iO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 703122339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aFV+MShhHxqaAYcbpOmOvs60fTnjdi0uwsPMbSifyY=; b=qCaZyq5ja1czwg
	nygMqV4Y1cXschZVCWq2ybIXBG0Ibc+qkhm91qAmeJiLGhbS6UJCbYvnAUfpHkJbIVL47tKs9v7HD
	tG3lqEC5+D59E6RieMVmBwSgqk20cDofTq+0rk5JRdBVFnbxPMBQj0DKgxKKnJ8xgfqYPWBsuzbXB
	ZbGHIh7XD1XK5iHjXhgMtyDAnAg5UUuNfPc6RTHdhthCROJb7XNCiELvJgDPD/AXUMVJEcwPZxZFY
	Qd7LgaLVvgFizfOf9mc9bcHJ5j8xI59NwfzEC2RyNvtll3i6DPBKxD2dWqG9akwhTxmzxiaJ80oVW
	go8voHxaoUMlF20arb/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Bso-0001iH-HP; Fri, 23 Aug 2019 15:53:46 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Bsh-0001XE-Nr
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 15:53:41 +0000
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
IronPort-SDR: GTzxIOdwWNIN3ljmEw/b5UKxNew9XhdpjqaAeOB5lkTkIeYkW5+VZhqthZO8ezOfrZKjMsx7q0
 8Ausc0E5A9AVD0y3ryEQBHKUJXJpRpDrPjmIkq9HmmMHxt9uRzxh8J6urly21h6hWQl8v3cAkH
 wf9kmzUuFUIFkLLVbMuwEO8S1B72cbbJTBX9N8ZT7nezzgXuuX6v8dYStkv/gXX7mirYIuJCPc
 l8Wcs8oLWGKOzYA5KNUS7nDR8QxO+REgKtVxjP72p9mpbdq51d8/74H6KhxTAR+baVt7jKfpAC
 6Tc=
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="46398674"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 08:53:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 08:53:38 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 23 Aug 2019 08:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPLdIqL2i4Obno9/Gq/R9ruK4Ivp4CyJ0SzimPdgX3pl1N/PN8HN7vBaRonLRGUiDxyWkwmHWtARCKyRXEnUO9IQaNteqrVLav0lR32As47jN1qbWhJixWI/DNAu/B9VGmz2Zx+ArAqFr5XpnGyRSABkrWVqkRfXm7FIJ2zpUTQiGZdDV3SonE1dhqGNDsacVhvQ+tMXlSeqickz8yMYNemadVJz6ipL2MT2CufkPMm1EVf+6mGdOyeB6B0NjaULGOPdLBQnfvimYsNtHLFQZbv1oKQrswo4ZvOFy8xLVJsC76NcabdY3DZ7eMr5biqX8e8RnG6PpxQdrRhxauiy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/KRyp26hAp5KBM+H0hXLK88dP++vAEExmA9URMWPnc=;
 b=KQ9qSGAVeee5N84gvKXxZZTvNxTu+Uc/iy3yjIPMr8qYf5s8EXgT9HB24y00AFJ72APoXTqlT5t3wwpX0TyTuvMkwz7llkP+ewiqKV01ZrOnqppRv83ePiqIusIHYw5+YWf5pLVQVOFzdxbPQeZdBRPiejiiz7EsRKTACdSVPA+BjOU56HYxFKYmOvT72DAuvu971EQxqzRiiKiWmfSvWjIu10Ipx+ZKyQvpt1PoJOeak5j2siL8ukhsPAPlxkfLckYcY07gHkR/CfNJLyBbgnM/qjKWPww3TDevWo8x95JHPxKOPOwlnYKvAl0IFrg/SH+mrZ4YHuvkHSTvg9QFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/KRyp26hAp5KBM+H0hXLK88dP++vAEExmA9URMWPnc=;
 b=R61999iOve7beSkKJgqa/X8z7VQn9mKA3PsUDW/iTSGuS51f4DvohC/mbLgUmNk9/HEaFmm58ThjqekE3VbwxggrRhFK/1o6pw8iq2wAgyMLTSGvxqNJx2WYWt6PJjqeR5UQkb71ye0tEtkC72YycLx8l1Q7ZC6C9KcOZsipQ9o=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3567.namprd11.prod.outlook.com (20.178.251.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 15:53:37 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:53:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] mtd: spi-nor: Use nor->params
Thread-Topic: [PATCH 2/5] mtd: spi-nor: Use nor->params
Thread-Index: AQHVWcrtbtxtMtrsS0Obi5u9y2hX/A==
Date: Fri, 23 Aug 2019 15:53:37 +0000
Message-ID: <20190823155325.13459-3-tudor.ambarus@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190823155325.13459-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2332093c-f85d-4f12-8329-08d727e20fad
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3567; 
x-ms-traffictypediagnostic: MN2PR11MB3567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB356786BDA096F2CAB1FDBC08F0A40@MN2PR11MB3567.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(1076003)(102836004)(5660300002)(2616005)(476003)(71190400001)(71200400001)(6486002)(66066001)(256004)(386003)(486006)(53936002)(6436002)(446003)(2501003)(11346002)(36756003)(6506007)(76176011)(8936002)(86362001)(6116002)(4326008)(3846002)(2201001)(6512007)(66946007)(26005)(186003)(25786009)(52116002)(99286004)(305945005)(81156014)(81166006)(7736002)(14454004)(66446008)(66476007)(316002)(107886003)(110136005)(2906002)(50226002)(8676002)(478600001)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3567;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G3J3ZmEQQovplt1dv9hD6bfz3h+pXnzEF5Y5SQuY1xen1oll5Oes1ghCUcmhn8elWTZOhZjwjgsDv6AaZo5+DvMlJa7vxrQJ2Gn2IvE5qp2WIFeVifCWNe7D9mvKkGVnU2ux2OBjcotIEcG3JK3xtTXi2W6HA/Qf0meCi0xB25og5Nl4+xM0RdSm8YmELLdGXKKwEeQ+scT2O5zzLnt5111Cicspp7o6Vgi5QsqsOx5FnsV333dH1Q190oiDIoQSv0mS4ftdOORKUejCUv4nzfXBeXJ4euC7D2xiPo2FLXQucEnV6e1htprUbKR/TAgtGtBZeIRvb8xvhcT6Fx+IIo5im5NctDJEmdXi/ivhOCuc1ZixNvey9yuPcLZbpNfhhy6Fr2Syp3fl4/D+GIFYKASF2iguF9+Jiag6flHhW78=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332093c-f85d-4f12-8329-08d727e20fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:53:37.7814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLzAz4cCHQJZQ8iQaPtaipXHHF7QrhFkwCXJnVk1cbQi4tGdzmxvAsqmeWflXtyyRyDjPd9eehsoYxRVMiHI2STnckKCfNoi7CWffzwvvxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_085340_025811_4C6B012D 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The Flash parameters and settings are now stored in 'struct spi_nor'.
Use this instead of the stack allocated params.

Few functions stop passing pointer to params, as they can get it from
'struct spi_nor'. spi_nor_parse_sfdp() and children will keep passing
pointer to params because of the roll-back mechanism: in case the
parsing of SFDP fails, the legacy flash parameter and settings will be
restored.

Zeroizing params is no longer needed because all SPI NOR users kzalloc
'struct spi_nor'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 46 ++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d35dc6a97521..e9b9cd70a999 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2974,16 +2974,13 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
  * spi_nor_spimem_adjust_hwcaps - Find optimal Read/Write protocol
  *                                based on SPI controller capabilities
  * @nor:        pointer to a 'struct spi_nor'
- * @params:     pointer to the 'struct spi_nor_flash_parameter'
- *              representing SPI NOR flash capabilities
  * @hwcaps:     pointer to resulting capabilities after adjusting
  *              according to controller and flash's capability
  */
 static void
-spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor,
-			     const struct spi_nor_flash_parameter *params,
-			     u32 *hwcaps)
+spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 {
+	struct spi_nor_flash_parameter *params =  &nor->params;
 	unsigned int cap;
 
 	/* DTR modes are not supported yet, mask them all. */
@@ -4129,16 +4126,13 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
-static int spi_nor_init_params(struct spi_nor *nor,
-			       struct spi_nor_flash_parameter *params)
+static int spi_nor_init_params(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = &nor->params;
 	struct spi_nor_erase_map *map = &nor->erase_map;
 	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
 
-	/* Set legacy flash parameters as default. */
-	memset(params, 0, sizeof(*params));
-
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
@@ -4255,7 +4249,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 }
 
 static int spi_nor_select_read(struct spi_nor *nor,
-			       const struct spi_nor_flash_parameter *params,
 			       u32 shared_hwcaps)
 {
 	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
@@ -4268,7 +4261,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 	if (cmd < 0)
 		return -EINVAL;
 
-	read = &params->reads[cmd];
+	read = &nor->params.reads[cmd];
 	nor->read_opcode = read->opcode;
 	nor->read_proto = read->proto;
 
@@ -4287,7 +4280,6 @@ static int spi_nor_select_read(struct spi_nor *nor,
 }
 
 static int spi_nor_select_pp(struct spi_nor *nor,
-			     const struct spi_nor_flash_parameter *params,
 			     u32 shared_hwcaps)
 {
 	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
@@ -4300,7 +4292,7 @@ static int spi_nor_select_pp(struct spi_nor *nor,
 	if (cmd < 0)
 		return -EINVAL;
 
-	pp = &params->page_programs[cmd];
+	pp = &nor->params.page_programs[cmd];
 	nor->program_opcode = pp->opcode;
 	nor->write_proto = pp->proto;
 	return 0;
@@ -4407,9 +4399,9 @@ static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
 }
 
 static int spi_nor_setup(struct spi_nor *nor,
-			 const struct spi_nor_flash_parameter *params,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
+	struct spi_nor_flash_parameter *params = &nor->params;
 	u32 ignored_mask, shared_mask;
 	bool enable_quad_io;
 	int err;
@@ -4426,7 +4418,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 		 * need to discard some of them based on what the SPI
 		 * controller actually supports (using spi_mem_supports_op()).
 		 */
-		spi_nor_spimem_adjust_hwcaps(nor, params, &shared_mask);
+		spi_nor_spimem_adjust_hwcaps(nor, &shared_mask);
 	} else {
 		/*
 		 * SPI n-n-n protocols are not supported when the SPI
@@ -4442,7 +4434,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 	}
 
 	/* Select the (Fast) Read command. */
-	err = spi_nor_select_read(nor, params, shared_mask);
+	err = spi_nor_select_read(nor, shared_mask);
 	if (err) {
 		dev_err(nor->dev,
 			"can't select read settings supported by both the SPI controller and memory.\n");
@@ -4450,7 +4442,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 	}
 
 	/* Select the Page Program command. */
-	err = spi_nor_select_pp(nor, params, shared_mask);
+	err = spi_nor_select_pp(nor, shared_mask);
 	if (err) {
 		dev_err(nor->dev,
 			"can't select write settings supported by both the SPI controller and memory.\n");
@@ -4553,11 +4545,11 @@ static const struct flash_info *spi_nor_match_id(const char *name)
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
-	struct spi_nor_flash_parameter params;
 	const struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
 	struct device_node *np = spi_nor_get_flash_node(nor);
+	struct spi_nor_flash_parameter *params = &nor->params;
 	int ret;
 	int i;
 
@@ -4639,7 +4631,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->clear_sr_bp = spi_nor_clear_sr_bp;
 
 	/* Parse the Serial Flash Discoverable Parameters table. */
-	ret = spi_nor_init_params(nor, &params);
+	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
@@ -4649,7 +4641,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = 1;
 	mtd->flags = MTD_CAP_NORFLASH;
-	mtd->size = params.size;
+	mtd->size = params->size;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
@@ -4688,18 +4680,18 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
-	nor->page_size = params.page_size;
+	nor->page_size = params->page_size;
 	mtd->writebufsize = nor->page_size;
 
 	if (np) {
 		/* If we were instantiated by DT, use it */
 		if (of_property_read_bool(np, "m25p,fast-read"))
-			params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+			params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
 		else
-			params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
 	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
-		params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
 	}
 
 	if (of_property_read_bool(np, "broken-flash-reset"))
@@ -4707,7 +4699,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	/* Some devices cannot do fast-read, no matter what DT tells us */
 	if (info->flags & SPI_NOR_NO_FR)
-		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
 
 	/*
 	 * Configure the SPI memory:
@@ -4716,7 +4708,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - set the SPI protocols for register and memory accesses.
 	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
 	 */
-	ret = spi_nor_setup(nor, &params, hwcaps);
+	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
 		return ret;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
