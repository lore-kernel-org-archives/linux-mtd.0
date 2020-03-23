Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D303C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662DC2072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUbfYqim";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pnAAmSyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662DC2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7k56YSszkj7rnWhllSODIwz6W9Iz71pxCQ0Y2CLIVFs=; b=VUbfYqimjs8UJJ
	xzNS2UnPTmSvMaTbhe/S1mHy7jJaN3wbVxk4zR5CHYGg42uXtVjM1JAHmWecw1G56W2jtzbjL94uF
	WkYMz1Mzj6SxaHChZ2pHslOWq6y34WsDxF5KP0ZoD/IJgxa0+eHYdDEEOAul8IzwXHgd9vhOchn8N
	CkardgT9mCRV7btQdGHTk6FXf1Q8dP3rh01vSUa/Q8AgFNO5WA7TrYqLVM0Exjj8FexiKF+pMCETr
	6V7/Z9M6iYIpDLcYi2e37ct3hDjqPIOfvbd0baY7jhRvDvZK3dICBM6/ljXqhSyGuBthbdIDlEs9H
	yqs6hAM3NN6bE0v+YKmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJL5-0005P4-U7; Mon, 23 Mar 2020 09:25:43 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKA-0004TA-W5
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:49 +0000
IronPort-SDR: 1fLgfsEx84RWk/dtYA/P9Hsr2qbMWIZL5bui2N7P1fd5ffYKL+b1fYWzPiSQ9A5gWosGHu6hvZ
 kItkdokY8MVurAtzcVOn7Sx/GGJyYHCIBaNYGHtzX9nG5ffirvQbcxUjn0NYUrmne5rv12VxDA
 RbdxxgNZAQHdbrN1r6iAWupXKXHhHCBJATgyDtSpgIIk0AzElRrCo1LTGw0ND+grtRbCxbgNnh
 b4IlayeoWZvROcP9gH7RGm5QJZnNdMJPzjA6Z8g14H2Wjc/WL+IsYKUqnaWY0VffAtHoPkcM1b
 XLs=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; d="scan'208";a="73067116"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:24:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyJSHmjSL/Nb00/SzQyeF5Dz58cKF8ZIttNxbfNa/RtU3Q8HAjnZRBG2oPBmUmpBEg9vAf2+qX5QH4tEiM/dXujPQk7YuYwabF5ohb3jk36oKxZMsd+dxQ5xl7tXYuLZyMMGDatkN6ZFKgx5vLSm6KC30nU4vFckpTTFA0XKsc+8VKwtBM0jSRQjSZu7Wl+6b2c1HNr4saDXWkAznMP3+rwfP2S0AhkeZ/c5ngvkZ8TjmbOX10S+XEW70d1NYzxdwJ/CtO1ObpX/x01t6i83Br5wGPxoykJjIpebENRQG7iO7IJzudTpe4STpGJLKN0RZoahW2UZFvaqdYFOXtVKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r97/2suzNcoS2b5SpM8nZ1pq3kU5VUEiCu/DNPMWnLQ=;
 b=g0uxZCxYbF9h/lAu2f85bDhdllL1ETopHK0M1zYGAhkNWkoGpAQHr2ym0DHpsGBqOCMZaYj9MlTB8rtmoqHrDQ+fg6KB4VKAiiLnLIl3TGnhQvYg2/RZ/9kLTNOsXKrNOiEVQcXGz3afiuMrO090FaSdI8F74u4UbNf0SzvZsApD3StBtjfBbytsjDSZJ4CTTExV1V7oLRiIs2prXQlNOuGDqKVKh8ZVQnXN7n57tHlDkwlokeU7WWPTYTiJzwosyuk+qZcA5SBUBZy9vPhS0v12yvJooQhXG4KlciDh1xuQHRn/kKN27l/p7FxtEmtmZfcdkUWKi5zmhy8SSmIE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r97/2suzNcoS2b5SpM8nZ1pq3kU5VUEiCu/DNPMWnLQ=;
 b=pnAAmSyYvp9ht+VqwZ91ZRW1W4treMdSv0bPLt3qqJWO1GuzDU9b772i9IpHgcWeXVrrCuiN3DT9UCTYEXyU+Zt6M9cCtv35Iopivst3Ke2AFai0ydHUplUaVy84NHPXA/FCTgngvj1MDky5GchXS7gZVGDr6mDYqfQIM/We9Ss=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:33 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 0/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Topic: [PATCH v3 0/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Index: AQHWAPTc4qvJEoy/pkuKBEyfTyO2iQ==
Date: Mon, 23 Mar 2020 09:24:32 +0000
Message-ID: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38ee28b9-50ab-47c1-8275-08d7cf0bff3c
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB44499036BA6D5399FA7187BBF0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
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
x-microsoft-antispam-message-info: 1NnmMN6IzdiUTbcFCMrOD3P6gwXzvholmG8UsIWOfnVb27kqj7d6yMb1ycHqRzbr8Clhk0QrtJg9xBrYPMfQzXDFy0UVZS8pDNGjviGDkHDDLSfZdBKJnPgHRCjlBwULUdA6hnldP4g6i6UyWwWmx9MOTUvMkbQX59NAjKpiYpytIFU27/LaddI2AY1D8Zoesl6gR0w6NqnOkDNk4rpOc8wM3z7QrAFWMxYsCERX/7yFra0QBpzNIa7RkIdmLIgI0eciLxwtV7cYodZw1DnobTH0lIVrAk5U5j3R1XKcn+SXLfeHmJmFLmM2LaT9bmSAMyTo/yNmZSJQrIl3h5vGczKqH97+kPSlj7s/YM1Oep3+bpe7SM8KOg1tJi3PatpWgFXWAgBkFXlvKPXXS/n1JoH6iCxNsym1Bsw9E0Su6+7ko7hj9gZYbNpE2NlZTbzx
x-ms-exchange-antispam-messagedata: cI4gmrqrx2ZDbTTNQnRkY4Fw8zIblOUdilQF/sCNQS5D34FQUMJpaujF8GxS1oUJkimHJo2zoY58tYdA1KarlJNPAAJ5pdPxD4KjSKQYPK/31I2dY6ddQAFfZTvheInLpaHZJt2cOwtfSvGiUr1Zfw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ee28b9-50ab-47c1-8275-08d7cf0bff3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:32.8510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMkOvy+IAQ1k0IzYyR29AmA78C5TAtTrFdxfwBwB2ea2XDjHCu5IljyTXlifvShYtXiMHqDoN3zy4av44o4inkGDuuC/h6KWjWdo8QFW2kU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022447_034615_952F5729 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi, Jungseung, Michael, Vignesh,

I took Jungseung's v2 and amend it here and there, the description
of the changes are in each patch. You'll notice that there are 2 new
small patches, the first one is needed so that we start the BP3 support
from something that works. The new formula should not change what was
before, and silently fix a bug, so the first patch is to address this.
The second patch is Michael's suggestion split from Jungseung's patch,
for a clearer separation of the fixes.

This was just compiled, not (yet) tested on a flash, I'll test it later
today. So I need you guys to double check the changes, do some testing,
and if all good, let me know.

Jungseung Lee (3):
  mtd: spi-nor: Add new formula for SR block protection handling
  mtd: spi-nor: Add SR 4bit block protection support
  mtd: spi-nor: Enable locking for n25q512ax3/n25q512a

Tudor Ambarus (2):
  mtd: spi-nor: Fix gap in SR block protection locking
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
