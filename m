Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03FFCA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 14:29:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D4B21D71
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 14:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TUv0eoBv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="aJ0qiDHR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D4B21D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3Pjjxi9hPjKVI4mrePGVzG7WuATUdzKr+dcPPYdF3M=; b=TUv0eoBvMhIEJ1
	gUknKnzqCoDi8thbElIISrvrIzcoi58jmnZJYn2sYgWQjQS5XZZEtlr6NkGDXkkMLaUXRk9Hzt+lw
	xYQ3zFNZb7DOHZCAgiAues0CGtg8RRgMJz0aiHJW1jvGdfdTZEkVN0rI+yoybnuDalfBA66W2EZuT
	U/HFYHl1bQhwUyTHi36/7sZELOR7444WgaBRMBlDADKjyBmwb5dqN6/0JjXA6nnbk46a2IcB7MQ+q
	Q/aj06UzagGVssevTyhDrAKZHjFEoC3qh8sk/5micgVmTfhGQMtdA4wIjxIT83JhjjI0Ucz9+9Q8B
	rlCYjxmRKoovH7R5faWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO0a4-0000JB-L4; Fri, 25 Oct 2019 14:28:44 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO0a2-0000IS-6D
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 14:28:43 +0000
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
IronPort-SDR: xWs2Rzv+m2C6VrzqfkAY7Ni9OQ+8P6yU6W4gNBxhZYNiLlfOVoE9N+x08u+rBnmozDGHsHcJpb
 xUShwbDe0fPgynrZ6h5RLyE42LCm6J+LB+PY9OIkMvVBUkgiU4MfwmwBGNLZ1ucyc9WbqmpHal
 9iHVFvohmDPUiqZp5s8fwgmz53Nooxdc8K9zMh7baJ5gr5cTZpQcraJ3iVmVGMgUl3G0B1Py3y
 ziWpVJdxyKIzatefp9W1z94ZRrWgvAoLSfuFNlbqvZj7gxphthkIpB6LMy5q5qWp0oQ3usZ7ad
 ZAY=
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="51567010"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2019 07:28:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 25 Oct 2019 07:28:39 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 25 Oct 2019 07:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X65MBtLodSCRQP5HPTAKyvLboPOwOo6qguOOjE+C2kGB0mtB05RpqyS9D//AEo9J14c2q4Dy9nfuVT1vLheUbnYDa6GG3NMFnLvmo4WqzqOEHGIOqlcWJXfO7FpjU1kFuydAQ6YYpeLu6jbdRz9LgqBLM/FI4kJGBMrpqdX8zQ5WR3mAKfTWJ/p5Rx+hLE0pAjMDAnkkwUW2XH216mNT/BSK24GSvUEomyT4ejvfeQVIUwd+R293ZdbPkPp+049FqH9c0LvXz+474YF8im+A0BZGgh2jVqzWH+1njEftcjW9FBaDUu0B9ZtKufuK+dxTYZjk2vdqj19yuNwI6O7oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5/Z0RKSdopEx3jHTn6uWIJOYSGa+5rgkw8LIRkqpj0=;
 b=HW2ao9EZoYCKIAbM+lLcOv+f1I1i7iH1VoKT0m6NFpNh771zEDSgZo7tHCf6SnO1ahO1VxxgViX0YzbPA17tSUUMnGM8nCJUrc1C5c8U0Fe244rQv2W+VD+dL1dSMW7WIK+f++qyxwAiIMuuBOCpKqHiNccTtzXJCPGH/2XhLq2zOiQjYteQldCMK3BkGy6ej4CvfxEvKRlfYZYjifnQRIlW8lsMiDC33/o449dFLJvoAomwwhxV5k8WxPtS+D9UGFQ/Pphk4SL17ZQRrQuTLND/akMzkNozaZpAR5GE8LJ+wMtnIkimeOLV2FMSaidvfp0z1/+eMb2mIft+DBxcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5/Z0RKSdopEx3jHTn6uWIJOYSGa+5rgkw8LIRkqpj0=;
 b=aJ0qiDHRHPZF1E4EsI5gKuU1xsK1YF2rhQBVGjqOyrDFrlvAZJjyMt9IRd5B68W67v18lGRjrz4K56Y3zl5ro9IWrGbySo593Omqd9F3+vRy0J/ad4RcudbUjLy4KUElSLiWs2J7Fh2/MoxMzBQXBrWW66GQ+AUim5sMAljPz8E=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3741.namprd11.prod.outlook.com (20.178.254.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 14:28:34 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.030; Fri, 25 Oct 2019
 14:28:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/2] mtd: spi-nor: Make sure nor->spimem and
 nor->controller_ops are mutual exclusive
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Make sure nor->spimem and
 nor->controller_ops are mutual exclusive
Thread-Index: AQHVi0B7yT0wDOD2KUuqxWx725p6Kg==
Date: Fri, 25 Oct 2019 14:28:34 +0000
Message-ID: <20191025142811.541-1-tudor.ambarus@microchip.com>
References: <20191025123217.12790-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191025123217.12790-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c9305d5-7d64-4558-1e65-08d759579df3
x-ms-traffictypediagnostic: MN2PR11MB3741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3741562B04385E8C2114B031F0650@MN2PR11MB3741.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(376002)(346002)(199004)(189003)(4326008)(107886003)(256004)(2501003)(14454004)(186003)(110136005)(316002)(14444005)(5660300002)(36756003)(26005)(305945005)(2906002)(71190400001)(66066001)(71200400001)(7736002)(446003)(6116002)(2616005)(3846002)(486006)(478600001)(76176011)(11346002)(4744005)(1076003)(66556008)(66476007)(99286004)(8936002)(66446008)(64756008)(66946007)(50226002)(86362001)(8676002)(52116002)(81166006)(6512007)(25786009)(81156014)(6436002)(386003)(6506007)(102836004)(6486002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3741;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qrJF0xCac6J5mbSwsYnwcXXsieZjh5knX9e3mZal6jJpDXesNzO4pvAZMucpDGQLLE1l35Yfuwwtu7L7Sn7D78KCKDHxegPxojSDQd7m61Ux6W6x3XqpbsvWEAiJXbqwWDRSScI+JVNfIcLKZmstTPZPa8/C7XOQE7XdPB2kUvuCN1HaLVF7O+om+bFFuaB5B0Lm5pIs1mLdm7X/p8QwQdrOfYYTq87nlL9TTsaycGP56EzikbfQCa2EkBo/HM+p03OfFfjKCBTFHoH07Co/PQQZ0w1EwVMkkf6lGFYzfrq41ociGIp9fz0RFxFoksH9mcTJvGuQzLfcs7lPqew6oZCEW4auX0CGHm+k6XstCkMilrbNNCp/SgBWwrTE1wDEm3j+LwrWs6ApMPWjZwQyZ3fiDZldPblZ6n2tRki8usyjQoY1i6wipgMqJKSmUgzy
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9305d5-7d64-4558-1e65-08d759579df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 14:28:34.7914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5IMTpexytYRRsY/0PjEHy9Cpxo/3sjsFFtNv/ZYJUKHV6bc3oywyWC0NN99VdphvdcNGBM2H0W2HUlneawi46i3pNRK+R/rRQ8CO37Awks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_072842_321224_95DDC0B8 
X-CRM114-Status: UNSURE (   7.49  )
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

Expand the spi_nor_check() to make sure that nor->spimem and
nor->controller_ops are mutual exclusive.

Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: new patch

 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a6f9f833c862..b452d3d0de28 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2741,6 +2741,12 @@ static int spi_nor_check(struct spi_nor *nor)
 		return -EINVAL;
 	}
 
+	if ((nor->spimem && nor->controller_ops) ||
+	    (!nor->spimem && !nor->controller_ops)) {
+		dev_err(nor->dev, "nor->spimem and nor->controller_ops are mutual exclusive\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
