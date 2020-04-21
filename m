Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFCFC54FC9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9978E20CC7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZtCNukKW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JG1MZyZA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ae71Rh3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9978E20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/zStyvltTbq3cFtgmOawaZOQAzzLy72p+H9aUeHEes=; b=ZtCNukKWmwx5Iv
	lLTpVBP/v2STuWnBqHjfaRnk1kkeLmMBqXd2oFY9rqK8sI/MkvqEVl1RJB+T1JnWROMUg8siGQjhI
	zZCBpXFfcp+/OPyrcAEM6QuRgiwGQQwDBpVzBvrC8S57oRFLqmtwsgLyQvp6JuZL70SKT3tHeZgI2
	U2Y1kp37SvD6FJnH1YjylHMe5RfefocMbpa3O9NnicoDIzxnrmXelEMWvWN1sRf63lOgX52eRbl/b
	KyHtJluh82oEI4Xixf1yepJOdhAAYeNSLWWrlSH2NYl2fn7AuGhKAIAOovmyGu6k4vRDV3N4sQWlc
	OL94BLnFb3np8lmoDrrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQmRh-0005WQ-4A; Tue, 21 Apr 2020 06:31:49 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmRc-0005Px-P1
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587450705; x=1618986705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NnA9UrWrgvg27y1qmFfUO5OqNO7hy1EoBygonTnAcjY=;
 b=JG1MZyZAzRi0gyDjtbOf0RlrV6RgdKrAru8ZzaKml5Lgwe6ooA0DGBGI
 5GeyBUlJhYRI8tNMYCChNZDLPRbkzagdAAanpwE3n0LKo0o3/OlH4pXH8
 h5dsW7z5uy4WHqSDlFyLYOqgciGcHtO7BJ+3zrKjh3YFGAbMuX8udVvVS
 1TQnkGHGSwmzNuL8u8lWVDg5/1v1WiCmrWRYIYcQ5EkM4mdAguTYSNp8y
 viJVBaHDk4slpg75DYev7cK5on5U2JhyAKZjFH8NjWYkdLP7MPQAUx6uZ
 DmsiRUeOhYZpqvMaZDoG8oRPaiesB3kbdRXrdMImmsQTjyqHX919NJiT0 Q==;
IronPort-SDR: dGPhLOC5hP6bhItnRnYPlN6CqkdO7uwRFJNG31GxuviUBeQ846Oh5XOhVSTYQT1vIpBb0TD5au
 xbA1YcItkx6jFmRA0bCWpfrvnO1jdufmkAYYzyy1fN6lip2WXpQQI0p9fsdbvYKZNBHvZrV/4V
 TeFNXtjC+Vlk4txWrJ3sgDkRudOIaQqKhZf+7FVJFRIofCxenExf5eedM7v+7w/Pmwwu3OMCDs
 gCG36B4y+Rb0HLOxBnV81xritslVTLQFT4ENZ7S+nH/vNEix71ITNJdgrJzLNg9yfK3Ma89pYr
 8K4=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; d="scan'208";a="70984276"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 23:31:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 23:31:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 23:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkQEourdMyUyTXUTFUtcukhz4dZfZdCwb2cMTIK4qy6aoXMmB+USQDgw1QZe32usXYyHrCuVFEla9be6H8X15Ye19LCBjpLHdkKiiIyuCUs6eM/hzc5tNOwsGCQXFWXeeEnHPtOvaJqpXurDm5W5RlmrVlFuB5DHO9NDueDwOyfQP3GqKf9vLZanr1/ArF/mmIq1+FYs1mWCqsT4BOYI2KZ19zLo4BstmGbJBDabCt9uiPI1XmeDREq5bLY+ytI82XhhGmrFGeP7+ljlpvoaGqy4b9YIu8uEfgZpl0XpfqUNxatwMorc2gEmqutJqDw7NiXkDZjGw8mzkrfs8ZmLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLDgNGbSd2W/ZD1B2uy884YSH9XEHdv68v7Q2HB7nOY=;
 b=ko4QDD3RnlKuSEffIce+1ZBbGj6mjd/tu5gJ/tC3LCIP+QZYcu+BDoQNamBue69ia+DyjiOm90rHPyEDN4MkaKFmeFALSkW/8LO0+Ct+lakWRC9EixcasqgpreoH2apUr06FVO5p1UDYdFg/9FI+AuRSllWrkyrQXYV38Azebpa0AkMmPL3gjhDTpeHMxofLUj+wqfn5uEu9HZZzYeq3z3o0aQzAi2Gp3oF9rG83782SkhCIz6hgNGdC19ljraQDM2g8+UXD5dRs1OzsDJJR+ATz3XV0ydid288LrU1VYtA6x6IXv5jtkQNWuK3KQWSmhk63NMEyjpxN29SdCVicFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLDgNGbSd2W/ZD1B2uy884YSH9XEHdv68v7Q2HB7nOY=;
 b=Ae71Rh3FVJ+vBAvHh0lxUBrsX69OJ3+erK4WuF5LNszoArO0QDyBWxSnivKhTN/kalFkufNt/jwu+Cw15Iad6C8zau+q1yTTIphu2EBOC6VupqZ8S+OwhwuAnT+jWcBk4R2HKDGIRhEJlCbL+bBZZtUeYHWBdoMh0gjGcR0EToI=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4481.namprd11.prod.outlook.com (2603:10b6:a03:1bf::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 06:31:32 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 06:31:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] mtd: spi-nor: Fix description of the sr_ready() return
 value
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Fix description of the sr_ready()
 return value
Thread-Index: AQHWF6Z/3awBVO2QcE269Zh7urPljA==
Date: Tue, 21 Apr 2020 06:31:32 +0000
Message-ID: <20200421063129.244466-2-tudor.ambarus@microchip.com>
References: <20200421063129.244466-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200421063129.244466-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dea55f95-e7b7-43ed-3c2a-08d7e5bda207
x-ms-traffictypediagnostic: BY5PR11MB4481:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB448183E21CB80D29BA839639F0D50@BY5PR11MB4481.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(366004)(6486002)(66946007)(64756008)(66446008)(71200400001)(66476007)(91956017)(76116006)(66556008)(186003)(86362001)(8936002)(2906002)(6506007)(36756003)(26005)(81156014)(478600001)(8676002)(1076003)(4326008)(6512007)(54906003)(2616005)(5660300002)(110136005)(107886003)(316002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ws4OhnAST8SrJmK99QqilsQAPiCAkKdTAmEnUe3sIWEwxmh0C1QbWJYAebbIshOPc2SSwTPMZ+IOFZkigxv7FjCSijL0Vf2rjKxyfi26q28bgOyA+O5O+muh7PiU4F4O7W2AdTKHP2XFMs6FmeWWnquTi0kVJbA7E1Kz+boo6BFhYuRIUoTr6L8s0KXyt6LatVclcDjeL9wiCjOKxgEUlydak8nIk2HMLXm9vdoeJGrucbb1rhgkEXKAcEuJB10IOf/K9BqTtcL1Viws6H96RCj1rWP737LjO+Ohn9z0ocJgxyF9d09xPTlOYvK0oEciMDtfKXIhFn/ThZqG7dl4E07iGJ9/4bBmrMdM+rAt00gfNVCcoNUn2WzJnIlTW6Y7L/6OIsF98/p/2kzV1l7+uLWblhBWQbYxbO7zstL2xfQadMzb2RfUBxhfUt+FnQJA
x-ms-exchange-antispam-messagedata: oWe8dsXKpXxZauD7SJqCa8y0U/0Mi4Gc2Xg5xSulHfge4LMK/XYIE5BGYJzPXX0NACdrkjwKiyVZT1WOEdmu7ol+KEe0tXYZ7tpvN2c6K2W6Xzw5nn48PqJlGWmDwr50UrK9bB+vT26fJWE+W57Syw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dea55f95-e7b7-43ed-3c2a-08d7e5bda207
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 06:31:32.3818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VmFE0HSWGWFoGDsQ7eedmwImT+46NyRFo/dDkzAo8X096Iqy/6t1LalURo+qENnzJ+T1xwsbBrFaA6vi4H/HOjuaoQ2xs5/nNffSXlVxB38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_233145_308049_9E306BC5 
X-CRM114-Status: UNSURE (   9.72  )
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

The functions return 1 if ready, 0 if not ready, -errno on errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9dcc53bda8b0..9611553e829f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -499,7 +499,7 @@ int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
  * the flash is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_xsr_ready(struct spi_nor *nor)
 {
@@ -542,7 +542,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  * for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
@@ -606,7 +606,7 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
  * ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
- * Return: 0 on success, -errno otherwise.
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
@@ -647,7 +647,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
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
