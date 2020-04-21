Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D723C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCFD20CC7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irn1eO5j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nrSfDj5j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="D4N3N1ba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCFD20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tOIdxMIOiYvrC31PUoqeUqGataRDn8QkDZ6/24FxXG8=; b=irn1eO5jtHYe72
	HBatYItUhZp6XcwCb0eNehktERfKXIKJj0+v/FvmPSYy2KtUTmwmBIsucUN3fWD6dPteYkQln2nbm
	2wbpjF/0ioBubfp1IT8xxJ/wDhWlGdMRR92A203GIMSkrIQuO80zsuD61y6txZq/8l9tbQO84hdGI
	/QkeJW9wRgxTuZrpSSM1MHkmUgdXMYKoVBwCgWDsO6DToCB/mlKz+gTtsDySyaToL/owy2d9AjEOb
	65a7iTnpnTS8U0FidYVcAXfa/jveUli045ZgZ8SS+RnWaHzh8NlVbafNsboeHdTzTzKpZZIN8RPs2
	/lOzFj35iBi8HYf+hwPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQmRX-0005KD-Oe; Tue, 21 Apr 2020 06:31:39 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmRV-0005Ii-0O
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587450697; x=1618986697;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gbn3vNaU0CT/TNmq4Pfvp1Ko9VVaUL72Xx5kzilSZsc=;
 b=nrSfDj5jDNyo+24ObC/AiI4MJiJaqzpyylEdH9UYJbhhdBKlqIZdy/IY
 +3FocZqnBt2ee031yUg4k7JxrRVvFSEJFDmpynx4wix+53zfcFV6kea35
 qPpeGqJzXDZhi6d864LRMq58OuK2eZF7IM+eSU9GvjQClLC8mHxm9MRdH
 iVt+m3zj0sprrlPj7kdeLIJEJoMEOH1p4LXoDkC2X1xfTbjeHM0vXUamf
 Ptibntrdywd1EWwuO5B+YkGYDTltbs/ucoYCa9m2KYRQ6AL3ApTMNpeat
 8HcNfiHj4l64HgPDQsQo8nIvcm2sw54lTSNrH9Nax18mx3Xpn0qtA6xUk Q==;
IronPort-SDR: gMJpGDjs8q20xdmZD7qOA0VgT0b7XOd/RufQwJKR9O4kO0cthOMOhT3byh//vpK4xEnhfUrk1a
 CLu85ZGEN5RhC7TlpZ3F7pv0iF8wzW7+GqDc7cXMksqkXNDApLgdwhRSiHrGPGhQDitOgn84PT
 +VHloKNu9mie8BjHivu4t/IiXZBjtNQhjHCrMaOZwdc/kk6/RaG/Fn24zDegaVYtmRGkmS1GSq
 i9r7wC/d3wFh/Y/yUBUPIa7ZvtbqWzrQilDAJ120BYbsXgumfcrnPgFo/a209TM9FOECOvBKzp
 Z64=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; d="scan'208";a="73226090"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 23:31:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 23:31:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 23:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0pHkQvjxDRIbo0bOwX7mUJLH/h6sRLwtAGAEItbLKuKfr5EQtakrUxHQpsgWOGV5buhu9pd4MGHUXhIzfuqKJRA3HZuNyNHLnBmL3fd4MJoK3TE0jwpjyZFUYigZ0/UwEQpTP9IXPzHfAJRNP6UIhrw1DN0U5ZMjsB/jp5jxL2ka0fQvhUXeC1XzO7mjPrFpXakHd7tscHklHDRAuZeHiuJGfRIjcBDUdoMIY4Em2FgrUugZGHyBpmZQX2ydiMyGX7oEsp5tyuMo44qPJ7IQJx+4SWc4MIYsdLkPKBpEdLGqmf7xZRDatQYvBhlC5UYOWQMTuB7ydjAz6jp/4oEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX0MmlXrSgfcIsIImcFp/GsMvPp6YRd8ws3WTZnYuzQ=;
 b=iyjXff5owLc4JqvAWXESpy63mw8pqzvnPEpLM+FLMUJV+7RtWB22O5hjl5p5g3pnJ9ddrE9zgqa7eOHwPXVCpqQ9X9KYh9XLlHXgE2XyRRSpq9lgjmHX5CxCd3d3mxhC8lF7MMmWzbbF4BMExBb+IQB/V+NsP+tJoX724X3xZ0X08dUnMbkIf7px+odJ/e6UNoDKLdhuqBrl9oN3WxEcHRqP8hLoKTnHz/+jdHSzTgzbWPEyrAn0Ialmc+TFu9dn53OTnppFoX/ajPclKbLi8cE2f7XgL49ZpjPRw6fgH7G7utBa+9Uo4cL7fmztkF7EyBfjDy5Yqj42cAz7LrPAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX0MmlXrSgfcIsIImcFp/GsMvPp6YRd8ws3WTZnYuzQ=;
 b=D4N3N1balAha5A44b509ukZqVdCyoTbq9hSlSeGvL7/wP3OsRqmkYFNK/axpIadyJ5McgDP0vEcVFwVcjnX8P16B5JskJbHWtcWoJkYmKGk9V+ERNAUxA8wg0SEtw0PYZKGp9yJm5En33uefEgFmg1EyILerbgYyHJxopYMd8uA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4481.namprd11.prod.outlook.com (2603:10b6:a03:1bf::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 06:31:32 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 06:31:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] mtd: spi-nor: Uniformize the return value in
 spi_nor_*_ready()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Uniformize the return value in
 spi_nor_*_ready()
Thread-Index: AQHWF6Z/y2HPIm6OI06flI5wCCnJXQ==
Date: Tue, 21 Apr 2020 06:31:31 +0000
Message-ID: <20200421063129.244466-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33b150de-7577-4572-61a1-08d7e5bda1a8
x-ms-traffictypediagnostic: BY5PR11MB4481:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4481FAA038D45D92AD9CDFF1F0D50@BY5PR11MB4481.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(366004)(6486002)(66946007)(64756008)(66446008)(71200400001)(66476007)(91956017)(76116006)(66556008)(186003)(86362001)(8936002)(2906002)(6506007)(36756003)(26005)(81156014)(478600001)(8676002)(1076003)(4744005)(4326008)(6512007)(54906003)(2616005)(5660300002)(110136005)(107886003)(316002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6tD9ozfMOed/Lk+gpmWAbipuZxwRcDgEmdTNaK83+dkZoLhIWNl4m4rV/i71D9Z9mcVGlN7CN/MxVOn056LIZLahwwZ0FLuoahhuJQs/y6fLLkEbMpNgIYJZFxUp7eyyl0wxAoATA3uf5zQrq+SdaWvIcjztcveOR7npleD11XCocriW3ryrM9uigntUk/G1loOfZfFw7rWz7xpi26h4NrkLo/nbIdLADRh2jP4ASHgjmUBVR3TxG7ruZC2NoP6QmGH7hk6tOe4EOBNbuiZRKLG/m24imAJfeRb2mQmgN4PzDyVDAqy70Brh3gbvzrGlIWlYCc3m36sByfMdIFrHUltx66EdR/JPq657xTp7WlFbvdiZaKr/1RouEl1ih8wpMcQFZuXNsa+NMl/Lh/YAyiIRsvfIutQvfx+OQpuKYl+9PG+8fysKy7tAg8hc06EI
x-ms-exchange-antispam-messagedata: 0nNTMovxrCwbt/JeFuD1FNOrr/uuC8jNsdBrkWRmcMKW3GEXL5Uc2sPnfbnuhfFA+TsCRbH7WyGcXOar/VABsOcmjrYPxn68DRwXTOdpZxSW9aKanFnvUSnkBOuuN8p3JMvqf07kD+v+sAYY5My28Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b150de-7577-4572-61a1-08d7e5bda1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 06:31:31.8321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYzGMIt8mITvV+2SRxeUlWovMTCIWX3cZ2uZHCbl1eMJap+BSMrIJPSpaar5Tao2380JKxt8aVCs/kF5jeF7s+8tGVvTyxlMG7gP+0Gk50o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_233137_059371_7F14E4F2 
X-CRM114-Status: UNSURE (   9.81  )
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

spi_nor_ready() returns 1 if ready, 0 if not ready and -errono on errors.
Do the same in all the spi_nor_*_ready() children.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc68ea84318e..9dcc53bda8b0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -640,7 +640,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 		return -EIO;
 	}
 
-	return nor->bouncebuf[0] & FSR_READY;
+	return !!(nor->bouncebuf[0] & FSR_READY);
 }
 
 /**
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
