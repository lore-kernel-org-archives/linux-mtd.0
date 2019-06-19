Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAB5C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 17:26:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B569D206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 17:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUb90voM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CEUm/U0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B569D206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKksrxlb5tqnu485Owmk0OtdjCsFu3g5ufFKWrG81Hg=; b=UUb90voM3N5ac6
	1fleVerweRd2fBM3oauXRIhs3RJFScrAWs41hMz3weqhMpc6/xwjQQl9NTs+w4Ih7e2RRn2CKOLb7
	Okef7L5W1lVpGJkZs3gEaUwvRU8WCDZukz4z1DGgiZN3IGYR+yt8/cAxEmhLxNLjjMl1iswQsb7MG
	/+eLvQ2JL5xjrRUkLRvPXRxF2D/vHtvtgWRB7RpbXS/SO7iJhD0ZII9TFTGFrBEKeSlz8v4hlhz1C
	4d6yRWJivVQKl1vyHpknuK9KCHlzb6i8cxRuCwLE4jZiJRsETpN+T+MnrAt2mqfeUKT6D7pHRsbOa
	WCYK6qni/ZtwQNoh8sog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdeLb-0006KD-Gf; Wed, 19 Jun 2019 17:26:11 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdeLX-0006JJ-J7
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 17:26:10 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,393,1557212400"; d="scan'208";a="38069922"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jun 2019 10:26:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 10:26:05 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Jun 2019 10:26:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQYIJolw/Eb7yXG9KVlLziOZ/pU21HoMUS5SXf36krs=;
 b=CEUm/U0ED2sKHg1EURjPabTD9QtcAuVsoQNpSZ1PM4NbJZQX0Jiw1hl9wCdWnne+e1ZJ+jOJ+b897sA/TqRjbiIcT9D8+yeAPkvGjSh6M0nyziK0eZJwObRifwY+m8bGaFZMmyIKC4iJ6Wh1uYuDaW9LdVwt37iUSESmYpzqVV0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2049.namprd11.prod.outlook.com (10.173.31.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 17:26:03 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 17:26:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <marek.vasut+renesas@gmail.com>,
 <marek.vasut@gmail.com>, <vigneshr@ti.com>, <jonas@norrbonn.se>,
 <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Index: AQHVJsQS9DgOntkRFki3IzozNsJqYw==
Date: Wed, 19 Jun 2019 17:26:03 +0000
Message-ID: <20190619172530.27159-2-tudor.ambarus@microchip.com>
References: <02babf5a-2a50-848c-27d9-9f810078cbcf@microchip.com>
 <20190619172530.27159-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190619172530.27159-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::38) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856c398f-0a66-450b-9159-08d6f4db345c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB2049; 
x-ms-traffictypediagnostic: BN6PR11MB2049:
x-microsoft-antispam-prvs: <BN6PR11MB2049A4C30C5ECDD76142BBA3F0E50@BN6PR11MB2049.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(72206003)(71190400001)(66066001)(76176011)(486006)(6512007)(66556008)(66476007)(66946007)(36756003)(5660300002)(64756008)(99286004)(446003)(26005)(73956011)(386003)(2616005)(476003)(11346002)(6506007)(102836004)(71200400001)(66446008)(50226002)(81166006)(6116002)(25786009)(7416002)(54906003)(478600001)(305945005)(1076003)(4744005)(52116002)(14454004)(8676002)(7736002)(4326008)(107886003)(256004)(2906002)(81156014)(8936002)(14444005)(53936002)(68736007)(86362001)(6486002)(2201001)(2501003)(316002)(6436002)(186003)(110136005)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2049;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8+R+mgW46Xs0FxkPZmei1QJ1Cz8ZmNGm75P4g84uMboEftqjJb91bPHnN36Z84VbkM3AsRU+ujydVlDt4t/2hXcPJVxThfkIxFoBjImDqnpEo5QYxwKM0lFZdbPIEI19CI5E3zMW/yK1nrspV1WxNIwP5KyexUwXrJn3QHIa2o1+n7wz+ICtTOXgwOyJAxLB+IXyshnRvlE8s41J64n/iQHO1KOPVZYIfzJJb+I/flVwPW87P38bjUZL0ueqNFo9Efqxkl9TNJbTyyjPymiW+esDolwL/usbJiNzZ9Vu+2o+elS9WIgcfaxs3ZPDnyJH8NrkCTq7UcTOMUwbtPyl4cLOA2nARnd/iHnKW53lPHbly5KKSJ1tNVj8TV3ZhdzX6omSwlglODT63+0xuSWZgGMOlfZhoWV//6bvoa9todk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 856c398f-0a66-450b-9159-08d6f4db345c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:26:03.9226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_102607_662260_957BB25B 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The description was interleaved.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: new patch

 include/linux/mtd/spi-nor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9f57cdfcc93d..c4c2c5971284 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -372,10 +372,10 @@ struct flash_info;
  * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
+ *			completely locked
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
  *			the SPI NOR Status Register.
- *			completely locked
  * @priv:		the private data
  */
 struct spi_nor {
-- 
2.9.5

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
