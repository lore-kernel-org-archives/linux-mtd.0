Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B061C10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D85A2072A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HyBWBztt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nhtu4Sru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D85A2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch3balW3A1oXZR1Wn7371FRH1tIoMXR23jsgtVfNGtg=; b=HyBWBzttCcbgcc
	H0WW00IixtoYPaSHcL6rQiQDGyNHIy30ewrUyTDThtmuYPTbGJy83bYNwhpSxXkSQrxIja3eItrnj
	Tdpt0yBjFzlbkAvhupph0U6vp5VFxn1Ci3L9L2ior54Rz4lWkSvJxXUb6Ds5WeprCFY6trfq/xO+f
	tgHx0l3nY6xoiIKf65Zswfsd6OSi98O3JGqc5Uig2PFTH7K1yE8g1IrWq5njp8JjPuBTDPnf6CkWc
	rHC1Mpgk+FF10KbPWZ4pQpuVBXWoNpmIb1FgU7dYGVQCDdXTxTMlUyeYxGpB3lQNnW35GRrnhOcDg
	BdTmNlHvoGFy91BMjdhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFRP-0000sX-7x; Mon, 09 Mar 2020 10:15:19 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFRL-0000rl-TA
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 10:15:17 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 7N325HKPtsniCRikU2ggXBOsrXQ+n7h8klfUxz+sf7vE9+rEDfmLOFmA+8tlU4RYFbyShBn7qq
 LwPQLPmFiLSHsuwII2L1bBKUXU58PInyPEM1aPqr6ERmyxheARnJDQp8QRDaeyH4spgHes+d0c
 pcJdQQDP7MoYoN5zZS8pqVM4PSNmV4VdbetS8asiW9bdBia1+ZyWgCjaYqUke+S/OtcnRWy/lr
 n+PU3Lyzq9pILf2avxVxs9tZAukqaydagj3koALx81+uOIZhl+fonfqK4LnTqCTfYHC+Twt2od
 VyY=
X-IronPort-AV: E=Sophos;i="5.70,532,1574146800"; 
   d="scan'208";a="4963230"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2020 03:15:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Mar 2020 03:15:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 9 Mar 2020 03:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+5yUXpEtWoNmaw3pqDx8z0aL1wu78njKXPENwFh2yzJije5WKBZOsB6M5mw/3fpc68GGejr29nrYFPy/QPcPzpyGUFHUm68CSzMVtu8VWIYuAhhJzpWQxhsggI1uKlUHcgTJJvGkc5TZJS3Snsn4cE5pq8azGYngxAqTzGPVtcfRqVOmttYPdl+6QfyV1RmufaL9JkYqirqn87aQVbN+HhWmFTH/CQgkFyjLDB9i/NEyH6uGUcEUh0B26kOvyqPZc23YZap/COyiPNeOMZcT62j+BXZwPeubXYe32KAs72Lqn+fqAcJumIE4KWTbsVzqp0MBKggheMqFYOuIGOV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmmdfxobYwbgB+t3M9/gY1o1cGs/eNhoIhVjFZ1AZbk=;
 b=O5AL5egBV4NHcIAwkswTJ/auZVT/+1DAjsT7piwC+gqmqsUtXtPjikZgb1hUaocTiecR7Crb9nSeMNZzQJAqZApTKvTLeU3NEtkCjokcwPlNd+i6wygldcjIWPXPeyvl41nX9etxvo/KiWCagK0QtNue2A2vDMghm4BnGmIPqQAcgT1oWFxsxKFm9MgN/TC4yJfxUcPjUsT+CmhymKFYouTU/aLP3Sl7UF+NwFHjEj9znnKHDpK30pdDCpDXwK9vVK/t7t40j7Wj2xdu78Msb7oB0A0lRnlgnn+noK2dIBMSlGZbOJ7qn0CjChpYdOI/bKTp0oMa0Vz8csMm/xgPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmmdfxobYwbgB+t3M9/gY1o1cGs/eNhoIhVjFZ1AZbk=;
 b=nhtu4SruPtRwbQa5wAdoLUCqwivFYnrzo+JgxDkcOICCFLvxzBjpc0229sTRCF1i6Q9c3vAPsQmr2+Vw8N36U35GrgkSOfYJL9GDvgzZOEpb5uJb5tK+GOhTeGkh+aA3VXhgu7XZ1rwq3zcL0cj81YZI6EWnIvCzEOkpFQNWFmo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Mon, 9 Mar
 2020 10:15:04 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 10:15:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <vigneshr@ti.com>, <chenxiang66@hisilicon.com>
Subject: [RESEND PATCH 2/2] mtd: spi-nor: Fix description of the sr_ready()
 return value
Thread-Topic: [RESEND PATCH 2/2] mtd: spi-nor: Fix description of the
 sr_ready() return value
Thread-Index: AQHV9fuZBFIxy0R7KUalsX6CWwEH6g==
Date: Mon, 9 Mar 2020 10:15:04 +0000
Message-ID: <20200309101501.191530-2-tudor.ambarus@microchip.com>
References: <3245882.KdgdznRmvK@localhost.localdomain>
 <20200309101501.191530-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200309101501.191530-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb6f8be1-7cbc-42a5-3534-08d7c412bc84
x-ms-traffictypediagnostic: MN2PR11MB4664:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB46647730F885C5E6C828A97CF0FE0@MN2PR11MB4664.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0337AFFE9A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(396003)(39860400002)(346002)(199004)(189003)(186003)(107886003)(81166006)(54906003)(81156014)(110136005)(8936002)(2906002)(36756003)(8676002)(4326008)(71200400001)(2616005)(26005)(6506007)(1076003)(86362001)(316002)(66556008)(66446008)(66476007)(64756008)(76116006)(478600001)(6512007)(5660300002)(6486002)(66946007)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4664;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3z2z8UDZaokxPqj/vm7blWo7CcaVlgp8AzY0vL3CPjfAEGJbF3wSGCxAj4gUNUxmo8qSBzZ0YZJqFa2BbjWDqFYb04IYAUutKoN03xYklAOxZfO5sPX969AKEQcYA/sToNLWphohhqGaGFnR/8Zd0W+2dY8IHlzgJpX+zU69XhLqS9W2K+/auatltNO330TBADC4wBblKqTNHhuR4ad2QDNo421mOVsGdF0LOHSzMRxtTVsIA2sVso0cNzuirHPZIKNo3/oscgcxXUWdq7pKwQcISmmI7GHw1VVJww5EikPvfcpdcHlIGEQ+xHm0NrmNaxr6wWB1qEqgwvMbixeI5hhstPX16fwlUwomrSwT6wNRx8KBKjvqGQKFaBCmL3UKS0Ue7Km7pZ9WYzA+mehSXF4z4ZDVniR9e71FUk61uUFIlc4XfrNJ4/3VK6XSBA1s
x-ms-exchange-antispam-messagedata: R321pwe2H26PC2wCHDYRwnxtUC55a7rhoQ2pv285ZrmsxJl3cJeNZbumhjsz5RARxxjo0OVaKB2nNkbE6gpBQfxCjJIw/EXu/SrAHR2w4xL5Yj3S9+Bk0ucPlSQblFCEZY9LiLmXsfqR8PVXMf/Jqw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6f8be1-7cbc-42a5-3534-08d7c412bc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2020 10:15:04.6011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPoZNWg6MHEyQLya0KOwhcR3zlC6c28jH7EExIflTtg+LF3Zo030Bj4tH9vg+lRIeQ9k6x/Lh4QJfpi+QRX1NwZENqB4ysdXq4d88OxVVAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_031515_972267_0BA85515 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The functions return 1 if ready, 0 if not ready, -errno on errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4376d8ad5834..604043ec95cc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -759,7 +759,7 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
  * flash is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int s3an_sr_ready(struct spi_nor *nor)
 {
@@ -802,7 +802,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  * for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
@@ -866,7 +866,7 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
  * ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
@@ -907,7 +907,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
  * spi_nor_ready() - Query the flash to see if it is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_ready(struct spi_nor *nor)
 {
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
