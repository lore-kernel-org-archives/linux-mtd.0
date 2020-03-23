Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95A3C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2782072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNaSPkpl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="bT8ybywz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C2782072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAjdTX+eEEtXBdCVElNPbW16YYoValGuJB+vzF6FhCk=; b=DNaSPkplDK0lAu
	gCaafxpFiYNMau/PHvAdoSOUcjlNAO0gz+RQM4UvubTBJDOqK5RcJ38CvyNV0M0a+LDReZD2qMY89
	kK56IChugvUHJYWMd23HzQYhJe8Q0Hh1D1RU/40/qDhmAVIE8M6/O+iIvwFDS3TiuGMfHWTvhwWHn
	JOKOn9D3NCQIVRGSIMjhAd6N3NtdMhBh9hMB4xtXCyyvDOHfGk0465U+lriYtUB93KLyP8nPtsTqM
	VMD+UFWQpbTjU2qlqGZzzA+QPwmw4HFS0WXtw9A6xfOnxZDSXYv46cb3hh4ecgfJEgY05R9ulQPlq
	tftoRWZhvblzP6NM8xbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJLm-00064o-2c; Mon, 23 Mar 2020 09:26:26 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKD-0004TA-4G
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:50 +0000
IronPort-SDR: 5ZEsfy0NjJMgFkz90VG4CKqMmBLXKBvq6tcKtZSqyjY2QoARWO4Hhh/4LYboBxb9tePvR3pPk/
 kYDn2iAXOVnGVAOaaFGm3sVWZDjpvboy3JwXOO1j2uhz4ZAyDL6blDNRtfzm0CHaenc07RInjr
 OG7WwMLSO7hWM11D3oWBLhOQHnhF4dxhhg12K5AyRX5GQwfRq6qDvjqAhhk+CatAVnCCF3jCGe
 k70nxnFD6D09G+Aja4DlIgp/QAYLeeGGuUh37Oi2nWHk5PNEmiUW9J4cBcZdMw4OsFJIW+g7Mn
 nlI=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; d="scan'208";a="73067117"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:35 -0700
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
 b=RtVtTmiuurVylvVLH/bdtdHFb3awj51l42aUPYVZ3E5CiiLab4PbQ0y8fW1mxlvczlEMFUxnYPemACKbKeuXy3Bohfe0zY1SqDI03jpOvs3ApzviEHII4VGdJUJap7WTT3tYLzCYtySJQaM3iSM9zleTpmMV3sREHIrmVMopq0yrLyiWnYBy9IhFPUb+yj4XtM1yvj62DCx05fjpr7vAByEEgk+vDq0c/er4+Wx8YMJHih0/lFfl2ZNm7B7ghF/kMnL2hbdjYLss5wKl98Su99drAlJaTsafx6e5ZYoLlC5NquUgz7Xr42Dzm5ZVigtIVxqzic0ML1b0bctdETmGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BYWyPsMigYkanm89bFCDHQvWShYHHN74j1hHqwTQWo=;
 b=CVEUgTc+VacyCsYumwyctgB6mj5tHzbU+2tSnbW0jrqqZQ4HarFNzC8pyGCAaA9wzVjLiN2ddXcloH0PIlvBbnJCr1eJCkc6rTRKQjFUizxhXOgFq+jjmp0+inshDKx3PDVtF6CIC+DXclKkBjsSCEBuRHVo3QLaBN+diLA2BiXo6tfjZX/yLQ73Rrru5Jhgs/PVSvoZiIeQ1DSn0rToC8AUGMLSnWPkgCY470MQ/xMMMtiMlNQjCXXCEv/fCiZHYEeAM61k50Gx/vhyK6GF7ObB8BkL1lIr3UiXnFQ2crKu5UpGLbDxBBPfHTC8Kwi7tXSUNMX+3o8sLAZv+7xksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BYWyPsMigYkanm89bFCDHQvWShYHHN74j1hHqwTQWo=;
 b=bT8ybywzZK5Hukwy37PibxPPfjN//4IkQjDQIC8rfOs3ujIvcIKX/rMcF4ZBqP5zMivLeXM1tPvHQVsjXRIFkVr+Khs586bah7+wjyQky7jOjBxZGJ9zM1Dqqld53dxu+FlekanM6bRzztti84zgFtJ2N+FuJ0BbIZg2BoyJKHk=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:33 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVPw==
Date: Mon, 23 Mar 2020 09:24:33 +0000
Message-ID: <20200323092430.1466234-2-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 4d9a011c-120d-4b6e-aff4-08d7cf0bffd6
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB44496C53BA5EA7F5EF97DB6DF0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
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
x-microsoft-antispam-message-info: HbF57OJSi7KVxaweqs8aI6SJta3UCWOirGF/J3E0jCq/mEXbJdlgXz2B8Z/QjDxSssTU19OtAdH1gzMxBQvm98hFtl8gzROV4bfQeL4Q5FFUUCdASVGpBXHmOp4/0+Sj39XVP8mO2PlIIeRi4u8zB2KeYh8EhxKUE6DnFDvmdc24fyK4D/v1uEjmsqFGmkMKXt0aiKS3GUOU+j9W6Ib3lV42MoGeJLs1e4cBsup8i5PTnb8T/rKtnNgy7dWwL+Znibp6GYbzej1FxXJtgIjT2fn5JDIBLE4EAvfvXX6d25fx+vNYYijzKGKukvMktLng1UYFhoOeNj6ykFapEgI5qZ2wzOR6MRS44IQI0X4apiUn587VdRzhG9JjVLfnFvBbDLOwif08fZ4XtWZna05X9TezZ3UKDXlOMr1409BblHY+1xTBdh/e+QgKVy0+GkPC
x-ms-exchange-antispam-messagedata: MPIjsJpNhF1ZSVpLvv2dwAHao6woRLFjTgiksO60U7eUNkA0QwiHNLszHxU0zIFgfqJlW7ZKRStE0vFoqn+A1t4ZFKM/CPzzE07C1I592cf0sy/u7F5SGhwFU4VAXBzW2M7rPXSJV/tPDF1ZBSnPdQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9a011c-120d-4b6e-aff4-08d7cf0bffd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:33.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aTclvUJTE6vhhOUeo6SsCS+hsLlHCrQMiJm2u00elGVfkJAPPwY37pmK6Jrh5hnTS/1+5iUTTAPk/r3wd7BtoufNu5c2b91t+RrZJesKgrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022449_193449_1C382849 
X-CRM114-Status: GOOD (  11.44  )
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

Fix the gap for the SR block protection, the BP bits were set with
a +1 value than actually needed. This patch does not change the
behavior of the locking operations, just fixes the protected areas.

On a 16Mbit flash with 64KByte erase sector, the following changed
for the lock operation:

Number of blocks | BP2:0 before | BP2:0 now |
               1 | 010b         | 001b      |
               2 | 110b         | 010b      |
               3 | 110b         | 010b      |
               4 | 100b         | 011b      |
               5 | 100b         | 011b      |
               6 | 100b         | 011b      |
               7 | 100b         | 011b      |
               8 | 101b         | 100b      |
               9 | 101b         | 100b      |
             ... | ...          | ...       |

For the lock operation, if one requests to lock an area that is not
matching the upper boundary of a BP protected area, we round down
the total length and lock less than the user requested, in order to
not lock more than the user actually requested.

For the unlock operation, read the number of blocks column as
"locked all but number of blocks value". On a 16Mbit flash with
64KByte erase sector, the following changed for the lock operation:

Number of blocks | BP2:0 before | BP2:0 now |
               1 | 111b         | 101b      |
             ... | ...          | ...       |
              15 | 111b         | 101b      |
              16 | 110b         | 101b      |
              17 | 110b         | 100b      |
             ... | ...          | ...       |
              24 | 101b         | 100b      |
              25 | 101b         | 011b      |
              26 | 101b         | 011b      |
              27 | 101b         | 011b      |
              28 | 100b         | 011b      |
              29 | 100b         | 010b      |
              30 | 011b         | 010b      |
              31 | 010b         | 001b      |
              32 | 000b         | 000b      |

For the unlock operation, if one requests to unlock an area that is
not matching the upper boundary of a BP protected area, we round up
the total length and unlock more than the user actually requested.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 877557dbda7f..36660068bc04 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1654,13 +1654,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	/*
 	 * Need smallest pow such that:
 	 *
-	 *   1 / (2^pow) <= (len / size)
+	 *   1 / ((2^pow) - 1) <= (len / size)
 	 *
 	 * so (assuming power-of-2 size) we do:
 	 *
-	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
+	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len)) + 1
 	 */
-	pow = ilog2(mtd->size) - ilog2(lock_len);
+	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
 	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
@@ -1739,13 +1739,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	/*
 	 * Need largest pow such that:
 	 *
-	 *   1 / (2^pow) >= (len / size)
+	 *   1 / ((2^pow) - 1) >= (len / size)
 	 *
 	 * so (assuming power-of-2 size) we do:
 	 *
-	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
+	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len)) + 1
 	 */
-	pow = ilog2(mtd->size) - order_base_2(lock_len);
+	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1;
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
