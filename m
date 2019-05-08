Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D53EC04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 10:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BEC20656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 10:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quH9xgay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DJ322HsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0BEC20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNJHH0u8m6mFWKj80dvUC3MfPpHaiv/BFzEJdTUPUG8=; b=quH9xgayVktVt3
	SqiWoAlPQ2C4lzbWmdpANRQ1tYmTSxbPpFyENplwg3PDpugSktOfFtqs7up47RLpudEdnrNveecs5
	gX2qBXVpRsnNQkIFSp+1+VoQ34PBSbsIzRqf2SMj/J31kev2lgvuIXBFLBgjw99BlmD9XSkbJK8ga
	o/nCYe3notGAJnqei/fDa/A+QsAsXhm61WBHooPiugntLQimWqJIZr9CUTqOH/m0XBM/BrowigzNW
	t13/xxCWogNL7mAc/xy2fGOcZnYzcPrzZVmUfFbbWi6rAvDaatG6Dpg7ldjQCKgSVE+zl6rxdcuwT
	qDyoYyXp/75Y7ep71j0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOK3e-00048x-8J; Wed, 08 May 2019 10:44:18 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOK3a-00048I-NB
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 10:44:16 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,445,1549954800"; d="scan'208";a="32090823"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 May 2019 03:44:11 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 8 May 2019 03:44:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfOb26TbhgGql5FsXaaPTc49yJP9Jx+iv88sMFkkUi8=;
 b=DJ322HsSEhrn7C/udTfWTNNeKjKEYumptHi83MbmRNbqDPWOwMryDbi69pWRfFJRpmkMSijvhg7OCBchJk9yOKcGuwylTijD4OujLMPGorp+o+J/B8L5ryklt8wsSD8ZK1w5UmDJU07YIi4t4lGS3Y6668VD3dGlNtPGRdB3z3Q=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3858.namprd11.prod.outlook.com (10.255.130.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 10:44:06 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:44:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gA==
Date: Wed, 8 May 2019 10:44:06 +0000
Message-ID: <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd67a406-48ee-40dc-8845-08d6d3a217b1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB3858; 
x-ms-traffictypediagnostic: BN6PR11MB3858:
x-microsoft-antispam-prvs: <BN6PR11MB3858282DEF6901B42BE5D43FF0320@BN6PR11MB3858.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(64756008)(6116002)(66946007)(66476007)(66556008)(73956011)(3846002)(305945005)(31696002)(6486002)(7736002)(86362001)(476003)(11346002)(446003)(186003)(2906002)(6506007)(5660300002)(102836004)(99286004)(68736007)(26005)(2616005)(76176011)(66446008)(31686004)(71200400001)(71190400001)(52116002)(386003)(66066001)(14444005)(256004)(81156014)(36756003)(6436002)(25786009)(8676002)(81166006)(229853002)(54906003)(6916009)(6512007)(53936002)(316002)(8936002)(486006)(72206003)(478600001)(14454004)(4326008)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3858;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3ykGE+yDkFv1TG3YryF2QLNNVva6JzW/Fz1r6INiyFulbhxCjP4Gr9cWpLJ5diVVSmYGxLV+zqNyyQVEIzwgfyVEOCFhThgY/LdETO24kW0qLZfKZ+Oll1uhy3OAT9Gks96XRG8Y7wfY886UVXh2hLuDsSLRXhDzGd+Iek8krkhYmBKCovF73heN9SX8lly0j+rytk0Dpze8XTHI49smwhaM9mGhSghJOZotGORbkTO1rcAMlh4vaWYI4gZ8/AqBMf7q/0OLiLlDcy1Dpu23J299ye3dCo96AwX5nckKz6W4ZLKwEwjIsX8lqxINRPlYHkuVq047a6uF70N6P+0AD5FA8NQrzZ6of7cYyXnG12o7zvwcwc91JpvYcMruGiGfuHJiofoMgk6gJZQ6PZRzWZsoX+e/1ZkMgcJk4WelQ4c=
Content-ID: <5065A531C2656647BDE933922641A6F2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dd67a406-48ee-40dc-8845-08d6d3a217b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:44:06.1562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3858
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_034414_898978_808BD962 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: linux-renesas-soc@vger.kernel.org, jonas@norrbonn.se,
 linux-mtd@lists.infradead.org, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Geert,

Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
and after the operations in cause.

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..20d0fdb1dc92 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -22,6 +22,8 @@
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>

+#define DEBUG
+
 /* Define max times to check status register before we give up. */

 /*
@@ -200,7 +202,7 @@ struct sfdp_header {
  *         register does not modify status register 2.
  * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
  *         Read Status instruction 05h. Status register2 is read using
- *         instruction 35h. QE is set via Writ Status instruction 01h with
+ *         instruction 35h. QE is set via Write Status instruction 01h with
  *         two data bytes where bit 1 of the second byte is one.
  *         [...]
  */
@@ -2795,8 +2797,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return err;

 	/* Fix endianness of the BFPT DWORDs. */
-	for (i = 0; i < BFPT_DWORD_MAX; i++)
+	for (i = 0; i < BFPT_DWORD_MAX; i++) {
 		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);
+		dev_dbg(nor->dev, "bfpt.dwords[%d] = %08x\n", i + 1,
+			bfpt.dwords[i]);
+	}

 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
@@ -3532,8 +3537,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	}

 	err = spi_nor_parse_bfpt(nor, bfpt_header, params);
-	if (err)
+	if (err) {
+		dev_dbg(dev, "failed to parse BFPT: err = %d\n", err);
 		goto exit;
+	}

 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -3576,6 +3583,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	struct spi_nor_erase_map *map = &nor->erase_map;
 	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
+	int ret;

 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
@@ -3681,12 +3689,15 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		memcpy(&sfdp_params, params, sizeof(sfdp_params));
 		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));

-		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
+		ret = spi_nor_parse_sfdp(nor, &sfdp_params);
+		if (ret) {
 			nor->addr_width = 0;
 			nor->flags &= ~SNOR_F_4B_OPCODES;
 			/* restore previous erase map */
 			memcpy(&nor->erase_map, &prev_map,
 			       sizeof(nor->erase_map));
+			dev_dbg(nor->dev, "%s sfdp parse failed, ret =%d\n",
+				__FUNCTION__, ret);
 		} else {
 			memcpy(params, &sfdp_params, sizeof(*params));
 		}
@@ -3908,9 +3919,67 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return 0;
 }

+static int spi_nor_dump_sr_cr(struct spi_nor *nor)
+{
+	int ret = read_sr(nor);
+
+	dev_dbg(nor->dev, "SR = %08x\n", ret);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading status register\n");
+                return ret;
+        }
+
+	ret = read_cr(nor);
+	dev_dbg(nor->dev, "CR = %08x\n", ret);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading configuration register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int spi_nor_clear_block_protection(struct spi_nor *nor)
+{
+	int ret;
+	u8 val, mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	ret = spi_nor_dump_sr_cr(nor);
+	if (ret)
+		return ret;
+
+	/* clear just the BP bits */
+	ret = read_sr(nor);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading status register\n");
+                return ret;
+        }
+	val = ret;
+
+	ret = write_enable(nor);
+        if (ret < 0) {
+                dev_err(nor->dev, "error on write enable, err = %d\n", ret);
+                return ret;
+	}
+
+	ret = write_sr(nor, val & ~mask);
+        if (ret < 0) {
+                dev_err(nor->dev, "error on write_sr, err = %d\n", ret);
+                return ret;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+        if (ret) {
+                dev_err(nor->dev, "timeout while writing SR, ret = %d\n", ret);
+		return spi_nor_dump_sr_cr(nor);
+        }
+
+	return 0;
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
-	int err;
+	int err = 0, quad_err;

 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
@@ -3919,18 +3988,38 @@ static int spi_nor_init(struct spi_nor *nor)
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
 	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
-	    nor->info->flags & SPI_NOR_HAS_LOCK) {
-		write_enable(nor);
-		write_sr(nor, 0);
-		spi_nor_wait_till_ready(nor);
+	    nor->info->flags & SPI_NOR_HAS_LOCK)
+		/*
+		 * this should be done only on demand, not for every flash that
+		 * has SPI_NOR_HAS_LOCK set
+		 */
+		err = spi_nor_clear_block_protection(nor);
+	if (err) {
+		dev_err(nor->dev, "clearing BP bits failed, err = %d\n", err);
+		return err;
 	}

 	if (nor->quad_enable) {
-		err = nor->quad_enable(nor);
+		dev_dbg(nor->dev, "SR and CR before quad_enable:\n");
+
+		err = spi_nor_dump_sr_cr(nor);
 		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
+			dev_err(nor->dev, "dump_sr_cr before quad enable fail, err = %d\n", err);
 			return err;
 		}
+
+		quad_err = nor->quad_enable(nor);
+		dev_dbg(nor->dev, "SR and CR after quad_enable:\n");
+		err = spi_nor_dump_sr_cr(nor);
+		if (err) {
+			dev_err(nor->dev, "dump_sr_cr after quad enable fail, err = %d\n", err);
+			return err;
+		}
+
+		if (quad_err) {
+			dev_err(nor->dev, "quad mode not supported, err = %d\n", quad_err);
+			return quad_err;
+		}
 	}

 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
