Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72CBC3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F812173E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFmgXaw4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jJfmDZB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F812173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1MEEnN8sKN1d9MIe0g4EoHormzSusTGKkVKUo3yPrs=; b=ZFmgXaw4ryqzV+
	0l7GpAvEir75Vto0aS8HHGh/sAG4e/f8QFPPPtUKuavz388pZdcI5iwqyZ+0hQt5ASCoj8XJwf3eJ
	jBnAcXDj38J8GyyHG9LtckiXzGi/E2URhSLWoVwZZyQc9dbQiz3WBCnvpNrpLzDEwJAJDXarR1X2Q
	z1s/h0g4CPyyQoOtVetOuwqod0yVPDHyAIDs1FiDlfYH5EoRMvOYaxb2KoUQySx9FOM2AYInBbBFU
	4raH62dGoC7lVFmfd6ptnnMrHmtjOqKPjqB6uNWopK9p6eJp6sPe1UeI4G3ZSqMwWMiYJg4ORIl/9
	hEO8kR07exIVa+1mPtGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1UpO-0004VR-0C; Sat, 24 Aug 2019 12:07:30 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1UpE-0004Hh-AY
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:07:21 +0000
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
IronPort-SDR: q1LiVxg7BDiI/5OGe4oIp8UOmJsGIjV4mV4nXfzGsksH4x+X69N2mKoex8yJksv0pfdNnA+jaw
 sGovYJXXt9RLEDtvblyvgTkPcHd/51ORyIOUpLlxrbB2HX7kCyhL6/9JRRiJQAfEdu8mRwtyAi
 F03JPBGk/VSxwcmBah0CSzwemWvl5XBdNhazLalzfVAx/VjKGmwlalSBb68IvqB9ixsGz1NCBB
 TJtjC4TIP7HQ9ybcF0shtZ0E0+eqM01OpiL3P1IAxJ6Mp8UHnXJv/kEzlpS8J/aOofNtsbR5Bt
 cVc=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="43548187"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:07:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:07:12 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 24 Aug 2019 05:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3Tzig+erwlBKk80cIAWA5MfOrEf8JWGMTcpvvKhXHRPdVzZ8iOzh49hHBfIc7xnmjsYV90A5LWJGA+iY6ECU2Xys/oe7EK96iRfgTVbs09p+wxDGuJC4jX6tDdV6VLl5T2rkBglX7eFPs01B2aiGy4eDYcZUXPNr9nBVvbQbeeAjtgaOMqcWvnWw2gHTWJBOW7juPneUHsYfsW3BCMjydTTr1tr2luEAvMRBL+jxf2SvwYPUuvJiJDhz444ifkCtzqB2YhpolG+V96bTsLEtWnI6CAO9Wtutv9rIfEX1LoGhHhVD39Xj4JkRO56Vh3zkIdmJanXX2qPNlVK/8Vadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dhnbq7dnyLdr+YcjxZnVn8vZDKg4b8qvmuhYqmkQro=;
 b=FnT+ytuc1JmenXhLLPoQbh41PeimMqw3/5BmNF+8wt8EJsVvIKa6nnK6bnbWSxHcGI5UL2nLgHneM80EgGPbY3rWaep6GL6kNazGR3N4nvbMMekfqTLweVaWq/agv5Zk6e+don4dvKti9W8d5bUfbFSLwnPGAI/R6e7lh/UPhpMSXRZtAg5SlZ1bAIou700TVg+QHWYDjbmMt+XHATzN2V4qT7+EB8MxSI6xQWaVaz8SmDrIoPPhHKv6gnixrdIgaeXv24d0/d4Sckbe1ruP1/Oa99B8EAG5MoFUdHzKbGyTJ6pUQxfxCb45N7vNchdoHFf27DheVCz8jUEAti6vRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dhnbq7dnyLdr+YcjxZnVn8vZDKg4b8qvmuhYqmkQro=;
 b=jJfmDZB8GUVIH3e9e+Hl1R/M6mFh45oEMcgMSXNy0v8qrowkBDL1tbRvg7fDdZpLcsr5PYoW78SVHl/OIEG0de15aBlYhFZ7iq77L9jUpQR6/5C/E8J4DKT2FYaTuSdtT2tYIs4dQD2WNfulHLsZzOwmfpO75kZaYli5hMA5atA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4301.namprd11.prod.outlook.com (52.135.36.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 12:07:09 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:07:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] mtd: spi-nor: Add post_sfdp() hook to tweak flash
 config
Thread-Topic: [PATCH v2 1/6] mtd: spi-nor: Add post_sfdp() hook to tweak flash
 config
Thread-Index: AQHVWnR0EeQXW24OJECAkHHh4CF/sw==
Date: Sat, 24 Aug 2019 12:07:09 +0000
Message-ID: <20190824120650.14752-2-tudor.ambarus@microchip.com>
References: <20190824120650.14752-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120650.14752-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::37) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 411634af-7ddd-4a1a-2cad-08d7288b96f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4301; 
x-ms-traffictypediagnostic: MN2PR11MB4301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB430142364BFEC1FB24D52BDEF0A70@MN2PR11MB4301.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(305945005)(99286004)(71190400001)(1076003)(71200400001)(7736002)(3846002)(6116002)(2501003)(52116002)(76176011)(4326008)(478600001)(2906002)(316002)(14454004)(53936002)(25786009)(110136005)(54906003)(107886003)(5660300002)(386003)(102836004)(6506007)(6436002)(8676002)(186003)(66946007)(26005)(50226002)(6486002)(36756003)(8936002)(66556008)(64756008)(66446008)(66476007)(486006)(476003)(2616005)(6512007)(446003)(81166006)(81156014)(11346002)(2201001)(86362001)(14444005)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4301;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CsUqMYSiyzQKI7az60XVYuCXXQHFkVwrIqiingNUPFIbGXZJhD3tBJVNPyPwUVwkFJCvi4UK7I9xvmy6RGCGLESPzBoxnnnF6q97CsYjnypfXXbBJNZC81wVtVxJKc7C+ZGAQLINakkPyg4bGSJotbWDY6FtQowc2S5CVTu2Tqn3DNki+0qjzUR+BrHdx34F3H4cILQ87l75+/euuM8plAmiuywV9EIRYWEuEHKjKpBos152KSwtZTsCXj0HLG1jh868skBvN7j1Z1AgolnO7NaIdXitbVfDMBrkSEjYgjfXkKYhnxF35bh860Vj4v6c9sL1a9IQ5r47GU226SO9GMuONxjCDIhnrdhD2tuGgru2yMrVM01ig92yVY/1cFOGp2t2Hhz9aRYitee6OBSLk2GWBlBcp6KBpYXdDMWRa0I=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 411634af-7ddd-4a1a-2cad-08d7288b96f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:07:09.5851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Meock808vsGXPyFRtOEHsOknFYa6WxecwNM1X6Vbtdzg4WmUEcYL/JeIQB6fK+96uyh262IqBqXnBApxu325fMCh9HX9Bl8tHA0JT9PsUIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050720_408272_4A3111CE 
X-CRM114-Status: GOOD (  13.24  )
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

SFDP tables are sometimes wrong and we need a way to override the
config chosen by the SFDP parsing logic without discarding all of it.

Add a new hook called after the SFDP parsing has taken place to deal
with such problems.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f4e9fcca619f..41dc95415260 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -158,6 +158,11 @@ struct sfdp_bfpt {
  *                flash parameters when information provided by the flash_info
  *                table is incomplete or wrong.
  * @post_bfpt: called after the BFPT table has been parsed
+ * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
+ *             that do not support RDSFDP). Typically used to tweak various
+ *             parameters that could not be extracted by other means (i.e.
+ *             when information provided by the SFDP/flash_info tables are
+ *             incomplete or wrong).
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -168,6 +173,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt,
 			 struct spi_nor_flash_parameter *params);
+	void (*post_sfdp)(struct spi_nor *nor);
 };
 
 struct flash_info {
@@ -4317,6 +4323,22 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
 }
 
 /**
+ * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
+ * after SFDP has been parsed (is also called for SPI NORs that do not
+ * support RDSFDP).
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Typically used to tweak various parameters that could not be extracted by
+ * other means (i.e. when information provided by the SFDP/flash_info tables
+ * are incomplete or wrong).
+ */
+static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+{
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		nor->info->fixups->post_sfdp(nor);
+}
+
+/**
  * spi_nor_late_init_params() - Late initialization of legacy flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
  *
@@ -4359,7 +4381,14 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    flash parameters and settings imediately after parsing the Basic Flash
  *    Parameter Table.
  *
- * 4/ Late legacy flash parameters initialization, used when the
+ * which can be overwritten by:
+ * 4/ Post SFDP flash parameters initialization. Used to tweak various
+ *    parameters that could not be extracted by other means (i.e. when
+ *    information provided by the SFDP/flash_info tables are incomplete or
+ *    wrong).
+ *		spi_nor_post_sfdp_fixups()
+ *
+ * 5/ Late legacy flash parameters initialization, used when the
  * ->default_init() hook or the SFDP parser do not set specific params.
  *		spi_nor_late_init_params()
  */
@@ -4373,6 +4402,8 @@ static void spi_nor_init_params(struct spi_nor *nor)
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
 
+	spi_nor_post_sfdp_fixups(nor);
+
 	spi_nor_late_init_params(nor);
 }
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
