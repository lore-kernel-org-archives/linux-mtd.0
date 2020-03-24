Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14D6C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5792074D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJ7brjT5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="X34WqibA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5792074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSiYajxuQ4s5BAoG4j4l2oxWU8/8zc/D6OrQlaukmLY=; b=HJ7brjT5eTrwii
	h9Tepzy9Plwjgry2jYCPBzEBFdxBK5/MZbkuO2Q6LmJgldYRuJKbaqsBtLrf0RIu9aH/DDeScHOhm
	W8zxOI/jmyS7sp3kFYM78Q0qN/de5PbQnG0dqJ13xhgetxneA1SRMznlqAIYAbuEh1lhgmEakuu4r
	hCkN0b/vRVh2rMjXCO8oBLb2CWdgJCqCZfGrOfGj+Ck9ECq8obb7/EVTYI2s3IT1v230pTNb23rcQ
	TCF42aaGhXM0p88bVhMoDe/iiXCTU0zkP8po97Ew/HataxkZSNW0pSGLkWcKCk1zvDp0MhpL2Hwqo
	TJi1gy6TdexMs+wZ30uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGcdk-00060l-G2; Tue, 24 Mar 2020 06:02:16 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcd9-0005NL-1k
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 06:01:40 +0000
IronPort-SDR: yZ6LaXNf4X79hA1hMV4XBbPvc+14t+5mT4608kclWCGVXVnbzo2oOlcweZgDlxKSmyHvfUmJ6T
 4Ag8JruobH/9CCNAkXmOqBcyogRIc3oW2NrYUuV8CWUetdNAqAH8xXa0zvlHQ8h2UmpnadEPoK
 sZPL0WoQIEyGzTvO1Dn7V8m1zKNKU24MYUbswqMi8c+RPV77DGjwkRKd7NjRjJPsNw+YO89cfq
 odBrYBE99qbRCjevA0MmCY3DWsaUvQdD46nz4aSS5lSbswO7ZExjIiXveBHvGQ/etfboeJisdE
 pco=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; d="scan'208";a="73217567"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 23:01:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:01:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 23:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd/SpycsoJK5vRdAwgCNk9ix0l309Ghypz9zzvY9AL7EUN80dx5/DYuzDyi4Y5A7VYAKEFYneesOViVCoIZkt0Iw+QjwNs6aLfRFmQ7eoC8vI9T9rFrC7/4TxzIPu/Bc10//rNH0j+9B0o9WZO2whzmiClg6HdeIK/scT0ZvsGY0DcUXFKtrJUUjytfEgvsnJvSDmPMqWlgA4deRyap7ZzjAWoKK4Xj3ta9PqUr2IzAz5CF1GVXGQQTwZjLdNDx8uW2GGkJxxXwCmH/ztWIXN+hJvRI8LCYJsp7JWox4LImeOaYSGXRTaBiG0pgzFGgzNPHn6MizNew0oBR9UsQeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtaKnlZXTyuxPnpVfGGq/Y7nBjrso+ogCxGDfT3nFKA=;
 b=LuoQd1/AJ6JAKq3FOxc5FHhYcN32i3C8VD2j1AHbz9yocdTjxE80vcdXd+Pr4dqmLO/hO0WN1EDVDZ8qeVDMWc18yIGXD542Q5fz+FqXZu0gvjTlLmpvjLYZBNAGFB8Dg/1Lbk7Vb2sOlSilSdeZpXIkR2KYOejarWb/klasetlU3iw4PBcDcKhKYBRCTjHO43stpQd6mjze1xHtKbodXAzzYn2E6fyZvsLP/dDB/wEzv3L7Zl8rr4aA2gmgXPf9O6h6HafbflmnYQzebf0eeXL65nQOA3I/LGGTHhIOdt8GGloXtWLPkevd1mIfyDjkb+p/tI7DUmNGuP62qU0wzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtaKnlZXTyuxPnpVfGGq/Y7nBjrso+ogCxGDfT3nFKA=;
 b=X34WqibAD0owvpbpcGlxkXte1N2Sj0mN7+uKvbcwpCwYdQ+MyvPmgigGEzd0qG0s/3oixK3HmJAxTdkNvypCtquHijS6TgiZvtOvGGpq148fZs7YnDp9+ZAbHo3XC5Us41ZcMfhsQF+7QLQIrw7XSPqvPrdrThpflzykfO7QvlM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 06:01:28 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 06:01:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v4 0/4] Add SR 4bit block protection support
Thread-Topic: [PATCH v4 0/4] Add SR 4bit block protection support
Thread-Index: AQHWAaGoEQ+/CjYqWU25daOPN99hfw==
Date: Tue, 24 Mar 2020 06:01:27 +0000
Message-ID: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a83973f7-d9c1-46e5-7f2b-08d7cfb8cacf
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41848985D4294706D2867115F0F10@BY5PR11MB4184.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(136003)(346002)(366004)(396003)(6512007)(8936002)(86362001)(2906002)(71200400001)(316002)(478600001)(54906003)(110136005)(81166006)(186003)(26005)(2616005)(76116006)(91956017)(6506007)(66476007)(64756008)(66446008)(66556008)(36756003)(6486002)(5660300002)(1076003)(8676002)(81156014)(4326008)(107886003)(66946007)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4184;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FuorQud49nR3aDr2O27usQItRYcbwHmiBUhNws1+Lv4PnNK161EoDtKl2wYw/AVtPqasepeZxHFgmflVNtcuVyAf/mLWEkq/oKB6BGZOgbwDAqmj53hlNjx73lHwBJCA3UdvGOlN5C24Ei5ibxqI32QVACF1kSBaafrwFeq66pZ6vYubiHAxC4GexJHzwA+UO6IRhRfVVm3rujfUKumZ6RleeFvkhsJzsACcmEKlJHqKL+b9alUV3xj+/HJZltXoh0lam47bL8H0xkjtUW5b53+BkGqmrs6mTPRo+himGzpU7X9E5EtV8KTu2WjqbAjcNsE4ABH5qUTFOCi/ZBfn1FPZmSCMvETcG65WaUpYgyLl1xFTjaaIpaN7j3h4XcoqwnEzMOcfmJIDSxpE3Aoywt+jRd+kHDfpwPUDx7Gjfwbs/3XCAGH+U28NoMUpjnqx
x-ms-exchange-antispam-messagedata: tdeBTvWqKVfWBWBuqrRWwo4BokoY3Wh9bnq8HNj6/KuhpfcAxVTUZHuaBjmwPCLoFYeahoJ7WbU9K7zbTQi1bDdE2D6oWvvkW9dp3AABe9qKwfHnn155gXRUWlNYd04WLwrpJtoRzr6+FZTncyWpfg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a83973f7-d9c1-46e5-7f2b-08d7cfb8cacf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 06:01:27.8923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNAPN8u17+Axi6TfZxhjyOzz4P4n7FW7OURLAQPu42Xfnl/Y5OY5GHBXjxwQJKUOCGQqcHZxXJb7TW2PCMmEKxdDJJU4LpJdHzogi/hYvHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_230139_116969_7CBB1B2C 
X-CRM114-Status: UNSURE (   4.79  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Hi,

In v4, I dropped patch 1/5 and stripped the changelog that I had
above my S-o-b tag in each patch.

Jungseung Lee (3):
  mtd: spi-nor: Add new formula for SR block protection handling
  mtd: spi-nor: Add SR 4bit block protection support
  mtd: spi-nor: Enable locking for n25q512ax3/n25q512a

Tudor Ambarus (1):
  mtd: spi-nor: Set all BP bits to one when lock_len == mtd->size

 drivers/mtd/spi-nor/core.c      | 144 +++++++++++++++++++++-----------
 drivers/mtd/spi-nor/core.h      |  10 +++
 drivers/mtd/spi-nor/micron-st.c |   8 +-
 include/linux/mtd/spi-nor.h     |   2 +
 4 files changed, 113 insertions(+), 51 deletions(-)

-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
