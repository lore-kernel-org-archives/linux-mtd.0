Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE64C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 09:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBDF2073D
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 09:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sPbosSNO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="iL7z1pok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBDF2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ik2XogwOZP7Tnm3XmvxUxH8xrFZ5oz4vyFKfyHN/dsk=; b=sPbosSNO3m6tMa
	Lp3psMI0mImrKxu33SczCby2afGDIF77Va/qb7YnSio3AAW3GPzRgL7fWqkEBRcoVxZUHpRZ5m23G
	dqDZFgTTOs4MQwzRzZCVv4Au9AqtOEEXAegreXyPv8IIu2VDY33+xKy4EV4ht27PMDzQ1C8X0F4+W
	RmVCCeTaQEggbul3ZtAk9SA0WjDIVvSHLD53ta++xQdcyacm6y9W9FGTXn/a5X/RyubqUOZm/2QfZ
	40+ZfyArzYFwFf3AMTygz/4Gw7fxmd6jso2kQ4mFEpYyd3bd03HeDVepag7UpzR6BA7ef8Aon2qrl
	MD1iCVqRN6Qe6TZHUJUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqxOZ-0002RV-MV; Tue, 05 Feb 2019 09:51:59 +0000
Received: from mail-pu1apc01olkn0810.outbound.protection.outlook.com
 ([2a01:111:f400:febe::810]
 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqxOO-0002Ck-Ld
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 09:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiYUTkIZGeOr4EOpbraoFy3J0mfSLjjUwyPBH4EAhJ4=;
 b=iL7z1poki5KR9frzHiMbgZgotEjlj6v3q+KM5KaRiR6IlX2icuJk2Li1MSfTyEcPu6vm/Ga+LKYCjmNxgM/xfpzfoUCBkuPFKEJtoSUImLbjc+rn3xs3jDP4E07izCj0j46zekr1+y36NHRsUsnLLEcdsFu3bvkCq6tW+L0t+7leRwqmrcjKa/1/269Bj1xHNDT5SCPqdJ5dzlqTwy8nKMBG4vTeEZE6VWHqeQad8qa1yGmrM9x+zTGpC/Kpx1v1obsHTjkBRcl8WiFv5NJiqs6PeibWalOOlSsXvNrJYt7e/4f/CLUtuSfSbu3pColZXTBptHRP2ynIDIoYREBTTA==
Received: from PU1APC01FT022.eop-APC01.prod.protection.outlook.com
 (10.152.252.58) by PU1APC01HT077.eop-APC01.prod.protection.outlook.com
 (10.152.253.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.10; Tue, 5 Feb
 2019 09:36:48 +0000
Received: from HK0PR02MB3634.apcprd02.prod.outlook.com (10.152.252.59) by
 PU1APC01FT022.mail.protection.outlook.com (10.152.253.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.10 via Frontend Transport; Tue, 5 Feb 2019 09:36:48 +0000
Received: from HK0PR02MB3634.apcprd02.prod.outlook.com
 ([fe80::d582:b3ef:f46a:4735]) by HK0PR02MB3634.apcprd02.prod.outlook.com
 ([fe80::d582:b3ef:f46a:4735%3]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 09:36:48 +0000
From: wen yang <yellowriver2010@hotmail.com>
To: "harveyhuntnexus@gmail.com" <harveyhuntnexus@gmail.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: jz4780: fix object reference leaks in
 jz4780_bch_get
Thread-Topic: [PATCH] mtd: rawnand: jz4780: fix object reference leaks in
 jz4780_bch_get
Thread-Index: AQHUvTZQ7UgW9LorXEerRnoEsI9p/w==
Date: Tue, 5 Feb 2019 09:36:48 +0000
Message-ID: <HK0PR02MB36349BDCE693F67F150B0172B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0048.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::36) To HK0PR02MB3634.apcprd02.prod.outlook.com
 (2603:1096:203:97::14)
x-incomingtopheadermarker: OriginalChecksum:7B76A0E4B0EAED3A4C520B1CBBE3FB0127B11509722135764FA3FE332F4C8A7D;
 UpperCasedChecksum:F04D32FB914A6FFD3C43C3C4BD98CF3C0FDA46EC146D07A3BECD9018A8617F04;
 SizeAsReceived:9140; Count:63
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-tmn: [XIZE/NtPJ9ZiUDfk4zE7OOcZOf5aoUvN]
x-microsoft-original-message-id: <1549359225-6656-1-git-send-email-yellowriver2010@hotmail.com>
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; PU1APC01HT077;
 6:Y9RXVZRQ9GMHy+kPAywbz8kxuljVqMIQX1w/l6FFmdbD5F/TSwR9CZoXUVBJAS3F5g12A8/r1UtQzfUUxXbYiQYpyjTgxRmmxlSamAsGWuPUYhsOv4eFzDaKsfw0XMDUy5GieHu29XOL1b3z+biKiPfdN05wOKx6kfGqo5Zh8CCo1+TVbtdprqGJwTPV69smG6LAc28ZlqppNwOzrBiL4GYo5lK5te6Y/2Okr8unf4VewUM0oVTvX/O1IkNIKUeNubLAJlUa+IEQZXJOwk+mQBr3xCTw1ShPvdvcDFYBQCaT5B7r7KcF1Xb5EefWuBS7JMRbSfhMeRN/y6vYqsxRsfpGhYgFcvgPZyo0urd2JLYHOG6gUMZb8rMmJRB3qOBSVS07veT1+KKNRqvwPRFBLLIAt8bm7ne1hbzMVD0Khh4xEKn3uZUeyKckbFGgIALJyS7KYik5ydN/XnwEAMNLxQ==;
 5:txmuvUE/nqHBOc8mgrzTXYV0lvYk+IK5vVGU885OW45S1YkS1/T4q7nr49O5T0m/OaK4gs+onb6qEoTQ7++QJfHHN5lfk1H026eICf3o2iFKIzl5PZghRpHm6eNQ5Vh+VJFw2D0Ir45C+EmNpClKmDbmsPUkesem1PRku/Jg61yrg2g2wdS4jepMtcDSFjwoEFcL9GosKh+OQxCJgwHBHg==;
 7:0y/Ptz1repMGKt2Zc6JpdEKcnT0nxNkLgcdpJn39HZqso+Y4vdLPHaZ/OQxdDf7XeaGC1iAv7IxfujQBSgO+idvjf1uBPB9+i5Kjg/XjuUBpiYJMQTcGL5XJXsc7v7Ngo1gWnoaL3VqUumEjpmt7Fw==
x-incomingheadercount: 63
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: NS9Gj58uCj2J+tAIqy0ctvOpedbU3kU8KiquIEcQsIDiBh8m+0B2QrzhL53FKjPlH9d2GkFvlIjN96QGQ9sTRZJEqai3kUfTye0NBTacJ37G46HymoXKB+IMDNguplH2EYMF1b5Uj9WItOjQ/eLYHLfkLa2vU52LEmam42th7ArsFAZeS++i3yhLQIZgI/6HdppwzCWLrHH+NcU7SpLvJG5ExQtgNbWBQHOsFO9xIpIBm/sBLXoimzyk0WphhR+Vhj0U05hhATHzXyh+cPvWLORmhDc/mtC1uRzet3jqoy2J88nH/yG+kLcoGgW8YusvtKhCkK/lUh1pfh4f3RyZB0UFGXwazQArldS0T7wL8Sp5NK2D26210Sp8O0EyT2t8j/hJNxH5wdStxTf0USzxG86gSuAEgnltdqlOEVLHXbcbRpq/zY2Qt0VcvOSAIkuLYfbXzjfZjUtvyJSoP5ZPh2a5lxewpmeE87HW4GX9HantJN9RctU3H0n3B7guMky4J5J9ii91BJqYNv8df22uwvspf5rgKJ6HBF54Xxwp2pALs9T5wBG/6UTI2CGjBZZY4ZjQCYCyfIFOtJUrCc7zg7C13QHF5APKXLWdcimH2kCi0n9uTCvUn+5AZD7YmgwyquD/YOoxYIXEZ/Mks345RpTwShF/6ksuu3uTiEp4pRK+OhJhYI/u9PLT4C63W7QZvL2hTdHmWbE0KLTGYb1uTg==
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:PU1APC01HT077; 
x-ms-traffictypediagnostic: PU1APC01HT077:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:PU1APC01HT077; BCL:0; PCL:0; RULEID:; SRVR:PU1APC01HT077; 
x-microsoft-antispam-message-info: mkWlS/HA62Ech7s4ABy1BmgTzB0MPraQf27fmJ9j8T001e12yflOEEHkaJqp+s+l
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 9a4e3081-9524-43cf-bfc3-dcaef82d5da1
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eb90f2-1e75-4c71-a1eb-08d68b4d7341
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 9a4e3081-9524-43cf-bfc3-dcaef82d5da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 09:36:47.3191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_015149_489377_27EA9D11 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 wen yang <yellowriver2010@hotmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

of_find_device_by_node() takes a reference to the struct device
when it finds a match via get_device, there is no need to call
get_device() twice.
We also should make sure to drop the reference to the device
taken by of_find_device_by_node() on driver unbind.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/raw/jz4780_bch.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
index 7201827..d0ce5de 100644
--- a/drivers/mtd/nand/raw/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/jz4780_bch.c
@@ -279,17 +279,24 @@ static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct jz4780_bch *bch;
+	int ret;
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev || !platform_get_drvdata(pdev))
+	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&pdev->dev);
+	if (!platform_get_drvdata(pdev)) {
+		ret = -EPROBE_DEFER;
+		goto err_put_device;
+	}
 
 	bch = platform_get_drvdata(pdev);
 	clk_prepare_enable(bch->clk);
 
 	return bch;
+
+err_put_device:
+	put_device(&pdev->dev);
+	return ERR_PTR(ret);
 }
 
 /**
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
