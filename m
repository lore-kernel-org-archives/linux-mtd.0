Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52CBC49ED6
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:48:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A145C2082C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hy9Z5XRK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Po37SQsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A145C2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+HZSlJv2j5BpTNYOfF/sKPkwdLzrojoFMpeQrE9QTE=; b=hy9Z5XRK7H+X6K
	fzlp9E//kKnzyPm3dTkwbXPFXHnJ5Q+rPu1TXWmt6oCvHnumMkNOoGPThmH1YlyZeaR1WArQbQ9bV
	hNh4saRFDOg04VwQn4m+MCs7jbLABpn4Hg4dvjLVOgO8qZ71Jh5szEryfbCDSZoU04Ta40E/0rJGd
	FY3vcqESp/OlJqDqA/HK+pVazQDLGiEj0B07BoUqX1bkBH1GHJPOA1VbJpIo0mKvN1gYTIaEQKwAc
	vM9CkCuJQhMNvWCjrw6OUbgZ57ajL7Igt6O7Gv9244u1x93/3EDlq7CCpaKqYXN/ryZ+hTkvFLIjb
	jMHLW2UxsWL+07w4WanA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7zFB-00016S-Nq; Wed, 11 Sep 2019 09:48:57 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7z82-0001uV-Do; Wed, 11 Sep 2019 09:41:36 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: lWUW6SqYSsMGdSj9w7+ppjLeZ9rfsGb5hDb5by5Fm9OCtJpabRVjOZ3HZyeiG1zHowaNZ3UfeO
 eKCHLOAq8OFrqKbPnVRXU+8xSanW7vG0gnQaOerAI7wsSmgr/I/L/lTsC4chNXG2Mgi97S+ZDF
 cOckSaEbW15nkGiMtfWXlKOhEbTmxEiJscPDrRt4c52Hc38+7hSUHA3HPfamkCoJBgUhsSCPxq
 kN/6bueadcH9gSTndrF//2XTDcKGA2oyA5b+TTKYApJ4DdIt2ZB2UJnx9Yq9xUkZO8sj5aC+Y6
 QnY=
X-IronPort-AV: E=Sophos;i="5.64,493,1559545200"; d="scan'208";a="50037869"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Sep 2019 02:41:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 02:41:29 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 02:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njHngHMJQ/t9dKQjdKPNt8EWiyJyf9f/BVET2I/n6lkcz6SUPqZHGLelNwMWV7YPbz/10ioeMqRgMESSVa16Z2ZPBcpCFUQ/9pB9HhvbQ0zc9YZxaUaJJZt8fXqj0N381Fh2AxiQ/optiaeDKa9e+0zPiDuWOYZ4GdGIrROWYrh8jgM0wJ3OT8trvygt6lavaUJxFf7d8BfiI/A4lh/lcB+Z9e54gZ1if2kturzVxRnMO36J/n+r98jBt6CqKMtoIp8dVy2e7E7N6ctvNmTDH+GfdULdmn90/Y30YxX7L//mNvX/koKbc9x7osNon1DPz8PhNOXBZn4W6d+4YkNdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRSfxqPUl9f2TqJlqS8dOA13WsDD16Mpx86SvZXOI34=;
 b=CuYVXZrTked1oLVDBitzKFAJxs5/xAPG0NPHQoxr9BS7SkEvh49m95IouRmnidgfzJLIfKbCWljqY/THjipa9ZYPZbpc2vHHuE9smX8WzxDjwZECwYYdhOw3oOBnvR0Jh6cUnUhqvrbQ9cWZAH8WeleodZpHmwIvmmo7a1Q3KJeIHZ7Ie3cJyIlIWBc8UkPNHyds8gJSxumEYdzhIUnEturHO8aZUhuoCURfNejh39UPmso06wR1giVSNiUtr2MmgIYwRts+ot5jg3J0KLEqI3YbeE+DuZEZ6QVdqPPz9ODIcsCcRb+76EOKb5GamOaCMYeA48tytsuBeZ9y9kvykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRSfxqPUl9f2TqJlqS8dOA13WsDD16Mpx86SvZXOI34=;
 b=Po37SQsq6DCDZ5NxF1QYa4c+MPrDatyoT3mHTGfmzuSrGWfkfz5Wngc54MNJHwPqCfszuKn5mnnIROAvgbf+GPCYUterNkPklj3xnE/knVuXTjSDZVAPzXLd5uzVnWF6L59jwFmWmMbiNolJJwuEoNws1BDAMRHfIurCSeof7DY=
Received: from BY5PR11MB4435.namprd11.prod.outlook.com (10.255.89.94) by
 BY5PR11MB4401.namprd11.prod.outlook.com (52.132.253.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 09:41:28 +0000
Received: from BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b]) by BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b%3]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 09:41:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <matthias.bgg@gmail.com>, <vz@mleia.com>, <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 13/13] mtd: spi-nor: Drop duplicated new line
Thread-Topic: [PATCH 13/13] mtd: spi-nor: Drop duplicated new line
Thread-Index: AQHVaIUVj7IA2JKehU248W1K/WG8aw==
Date: Wed, 11 Sep 2019 09:41:28 +0000
Message-ID: <20190911094031.17615-14-tudor.ambarus@microchip.com>
References: <20190911094031.17615-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190911094031.17615-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To BY5PR11MB4435.namprd11.prod.outlook.com
 (2603:10b6:a03:1ce::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4360f77-23e4-4403-f2e7-08d7369c37ea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4401; 
x-ms-traffictypediagnostic: BY5PR11MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB44019C2D12BDC398F607C60DF0B10@BY5PR11MB4401.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(1076003)(53936002)(6512007)(102836004)(478600001)(14444005)(256004)(36756003)(26005)(25786009)(4326008)(4744005)(5660300002)(186003)(2616005)(476003)(11346002)(446003)(486006)(107886003)(2201001)(305945005)(3846002)(66066001)(71190400001)(14454004)(50226002)(76176011)(110136005)(66946007)(71200400001)(7736002)(66446008)(64756008)(316002)(66556008)(66476007)(99286004)(8676002)(52116002)(8936002)(6116002)(81166006)(7416002)(2501003)(6436002)(386003)(81156014)(6486002)(6506007)(2906002)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4401;
 H:BY5PR11MB4435.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1v+/jEkhzKgqyrD3MLHoWOec3zOoWmVLCxmhA2SDNikAMgHGKQFobC4vl9VLsgLjTbXPURWSd4z1gIQBXQeNA8G6La0XqTRWLhRmxD58vKraGR+U7NrcEqehMbvaHJa+eoH9fMCD8jv7ogjgHbsiBExs/LjCwIToS/dCQwDg6v7A3QrQ9b0YpmYDh4/secdV6BupCWsQdyz2vAXAAHPrHg/84KH6P8uwg8X5+2azcyqUfFo6yLOHf6KMdtBkQ5CVRo+Mz7r0f6XZVWw5JMJuxTv+p6tlzJ+w/hbB6AXstFC85fuHJf+XRinNpuiifA4A5KxdzC1Cif7F80VXGcnQKEKTwcmQiIbj1+pAPIF3C99YjIsF+xn0hfR2T9pGYE8VfFER7/k0BbltbpEmlQ82/tVBNzd2nvQ1HGpXi1E7CkQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4360f77-23e4-4403-f2e7-08d7369c37ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 09:41:28.2054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtyoB6s4S0a+YEHjVjmFCqRA4di6rEGAD2x9BSFtDqV7WEeQzb8oI++qlSDxkcw8/DR/GurA4bZsWk6zJW5Q3OgbapbDfP+/3lCNtb9ST08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_024134_641897_C68B3658 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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

Two new lines, remove one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e0fbf9c00d24..22d0775cf2ba 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -841,7 +841,6 @@ static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
-
 static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
 {
 	size_t i;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
