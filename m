Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D0EC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 127D82072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C157C9Zo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="vtyCKqfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 127D82072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3ZtH9mcGVgVmNhjyKB7BwKveiw2gLumXcmbXpWN/zI=; b=C157C9Zoyq15aD
	bb9mj9SYZ74IgutkWjG42KQq52zB5xSU0tWKbi8Mcw9D1CRSrhrPLuDQu4JJPYEa03hWEIyY9piK8
	ZTz+EWJMuBjOhWU/Ddgx1xRAUpbkEOUzXL+xBWAzI9sIOCTJA/eEyUVZWW73oaKsjfC7glsXV2mkJ
	YtBMMXtcEW31qiWlBQnleu0cAavaO60Z/MJbSAcDgDB2qBuX5EATpSpQJx4IKy/BhdMfVrtOVw3Md
	bIopH2nnnRqnhnLMY06yYMTBOVbXc0CGqKm04WIFEO9GIR6+pRniM80Fz5/k5uepQMaUgyD9VJP5q
	ceOUjFXX3KkYbGJ+WOKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJLb-0005t3-Nw; Mon, 23 Mar 2020 09:26:15 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKD-0004XT-Hr
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:51 +0000
IronPort-SDR: 1+Mx+advun5H0wa9A6DGDwzSg0QNwIBfMrYoVALfy4LhZwQ3jFZmeJS+6twlgODwXKonaj3osN
 k7EIiHyGSe0n9nEVVJfwSXbVaNE2R9F/3OnZAgsf0H5yvuI3k2UO5QRMwd+0ap84Q+dW0XMsgn
 cySMpmM76YmSrQSG927KCGN2pOwlPk2ip9SCM86T8RXcsgYrv1So5C+qrvy2tUx6hs9Ox55fVa
 sfOSzRNMxVX7Jz/V0aO1wkcRw/Q59ojR55AjOh0DbmXPvJNZ98Gsd0LukGEIEJb6kRbcCJyugf
 TXI=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; d="scan'208";a="73067122"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:24:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBpP3puFRCW7DeFctyGtrP463pURt5xKnhFnUlrW2ROl4BB8BaMGu+lCLrwsDhgmWdG37J9dcpDRAnqpOJIbp/TWlbWD39sq+phizFERznTgeFd3fjb7vufMWmfHlTEeuMYHatNbDTTorzTKEnM+5JOdeXrqegPjlcxEazPGrPgAChBMckUVYSO+5MAPw5sWvt5vjMRQYgXGj2S02uz+zKvAmSMadigR/qCt3SF8ljSLqCSiPAe/tlo93L1WSiV7g3zGyzU7frsGl/FOEwkDshTxZ3LyRD2Q7ej7tdTSsDTiAkhu8XcxUb7FkJaTZWyEgw4WEtfsfWZwAkABoDbpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYOtsLW1TTTrqEG+yLkbKtVRSeYzpP3wpKcznETOzj8=;
 b=BkJBgEDqM7yywd1JUxJ/N+rCDPqvxfnmp37FMufLGdR24NR1rwwZ5+qVnPmpQ7JSyILPHXgEUectT2PTIJ9wVEH+owEPpSMr606zVnQQ+psaOs8XrAnq2r+MojvVKFzxCku6WEzhg2ZJiklajZHjHBcwgXz0zsJrDhOeRllkZ3lAUs5/gKmLjigSbhXeDJ0U8rjFsWC3e1Hr2kfiLJHX3IhKnXM01TRdYw0Jqpr/rJj1/tLmp/MuYjAE7Vgn8FnDtKp7yABy6uDHJqOJnbyT2Sb9xmqEs6a5IkNVbsn9hLNpO0puJ2P4IBcpia4TxCC8KL0LxWS9s4eokUrKEoj9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYOtsLW1TTTrqEG+yLkbKtVRSeYzpP3wpKcznETOzj8=;
 b=vtyCKqfMvKTTWytCsniN5QMyrYBne9hfRX2PL6Js2CVIoSZ7AmR/k9n65WzIso/wGXJim1Ie0A83wAohPXEbuBEFcZ5m3BLOzxC43k1EWgmGg2OkgRUg4qg9XrTsZW5nlIaPSg3x5DLFDsyK4YP16W8YpefPOvJaHkr2sceYcF4=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:34 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 2/5] mtd: spi-nor: Set all BP bits to one when lock_len ==
 mtd->size
Thread-Topic: [PATCH v3 2/5] mtd: spi-nor: Set all BP bits to one when
 lock_len == mtd->size
Thread-Index: AQHWAPTdUj44Rr13ZU6ROxvLZFEJaQ==
Date: Mon, 23 Mar 2020 09:24:33 +0000
Message-ID: <20200323092430.1466234-3-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 804298f8-96e9-4281-3b78-08d7cf0c000a
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB444967FF77E6F8074899721BF0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(8936002)(8676002)(81156014)(81166006)(36756003)(76116006)(91956017)(66946007)(54906003)(110136005)(316002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(2616005)(107886003)(186003)(71200400001)(1076003)(86362001)(26005)(6512007)(6486002)(4326008)(6506007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4449;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5QIvAAYDtlfE5Evek/2HMdb+8PFDuE+HFoGrLI1dQBNrnqDo5xtKWO0bjZPE9PIa9tLrKy1axIcFxz8nocLaGdX9jEQW/txqQ8m1D67Ph5HIXH/z3N1of9tsvRwiC5pcYKNWS0L1yFWH8xhfY4vbuSWKKnQ6aWQloW3zZ2Hu1sjdwyseNkGehpVEvxC7Jo9uU1QsdVSsowTSvruE0jRqRLR87VScRM5C5xlnhRWGn1H5M13UFMhyZbJ594Q/F36e5qySdXI/CMWruveoT6A3TlfIoXj+oaW8+RZ5NnZH0MrBhsfY8WCwhpdPab6NziA8+Mr+L0DG9fbQ1gANdNtAj/mUV9LYdtsrZK50ja2zOb3a9K4C+vVKyoKx7iLNduXVAD1xofcqm71pDOkWOU3v5ttlY0GAdMTLubCrBHAgoYob5K/t+1RdBeyoxIj6/pOS
x-ms-exchange-antispam-messagedata: +xZRGbLHptNN6tPM3FXL0dPcGWzSotdBzXyfDeBT/WzA3b2+KZ2TmJqNzTbLPmsWk84z9JEOY6LY8BPTXcrelU2u8kDCpKZUrL7sGYqq8+sPbo2Qk6j2APoIrwEf9p1ylwvOyZXsQurubWMz08x9qg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 804298f8-96e9-4281-3b78-08d7cf0c000a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:34.0124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Hb/ZbTaPwa0UPQPMPgmSBwX/J8vRO6qL5eANEMDhfgdbqW9GmqT6T8JxlXfu9Hur6p5I9dpHygjhHV5xMZf65R7lNlgpZuVZfUCLpP6f4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022449_680235_3A795BFA 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

When there are more BP settings than needed for defining the protected
areas of the flash memory, most flashes will define the remaining
settings as "protect all", i.e. the equivalent of having all the BP bits
set to one. But there are flashes where the in-between BP values
are undefined (not mentioned), and only the "all bits set" is protecting
the entire memory. One such example is w25q80, where BP[2:0]=0b101 and
0b110 are not defined.

Set all the BP bits to one when lock_len == mtd->size, to treat this
special case.

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 36660068bc04..3788a95c0a47 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1660,13 +1660,19 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len)) + 1
 	 */
-	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
-	val = mask - (pow << SR_BP_SHIFT);
-	if (val & ~mask)
-		return -EINVAL;
-	/* Don't "lock" with no region! */
-	if (!(val & mask))
-		return -EINVAL;
+	if (lock_len == mtd->size) {
+		val = mask;
+	} else {
+		pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
+		val = mask - (pow << SR_BP_SHIFT);
+
+		if (val & ~mask)
+			return -EINVAL;
+
+		/* Don't "lock" with no region! */
+		if (!(val & mask))
+			return -EINVAL;
+	}
 
 	status_new = (status_old & ~mask & ~tb_mask) | val;
 
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
