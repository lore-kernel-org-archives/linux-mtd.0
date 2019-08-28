Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB37C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0155E208CB
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuw7yq8s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mu61SjZS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0155E208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crGfw7tw86jRQc7H4LFEyWR6eIwNTZsq6u13lAXbF3k=; b=cuw7yq8sXlJuJb
	vgVr+jbW035XCUS1/Fg3Wa1+FHmAj5Y9VyzEb1GuotS41WUkE1Jp/qeJTy9EfPSbxrPJb7Hw6Oa25
	BGspSQp+aDhGWq46fxSuthfgb1LNouu8FnEdJu6+rfoOEVcxl53LS7gawaBjg77799KKHs9EKSDov
	eNarH9SW2xqgpXvtbNRzfF6IMsMhn4zhkYJOgUz6UyXaQKCjojY8FMclKyQov4FvuvbdSXLwaLkdj
	iJaxTnqfCWs9pbm0xwOS8DZMRKC2+bl8CnBINGuko5gMTZM5BZi4IJzRwOzCy+6hbrKDmBw9AQVzh
	0D2BrgOb7pxkqsU3COuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2v4m-0001a0-Jq; Wed, 28 Aug 2019 10:21:16 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2v4j-0001Zf-Th
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 10:21:15 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 3C1mYxsOGbTbus/WcnqwaZobFQa9nVQH+HxJn3/by4ntturdvcOFXjHlfawkQaGBSy/V+XVPa1
 w/Vv0qVTlN8WDQrDynUvh5HhhXI5mgjIqx3CMUVWoABhHP7TlFcN86P4FS507JdWIyUQbew8jz
 FyfDl6TyRlWxOOrNoqHYVBrXYBl2QMcQlUaRXIB+Zq5AzpW5aj1y9IUOybouS2TXKqzmrIX6CU
 BCgYwneoTq3WA4qx2uU+9il9VphB3Gpu/wpLDGEgBtT7djB5Z+11uqQczCor39KAtxlp3z2cEd
 Ggc=
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="45898451"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Aug 2019 03:21:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 03:21:07 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Aug 2019 03:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3shl3D1LeP3HTwNVoSHpt4cG9p9pJn9rzp7eyxtK9mTn2Kx1lhrXppEvXnbi8z63VwIH1W7dTFT6fNLU7WWMo5pGGXxObZtIIQvxh12D+dh8IP3eT0rccetwJg8tmfitzDgtcSHOyEg9eQu71L2ooKTMyB7IZ0CsfQY6BnygsENbS6UWmQM6OTlxrmQivaQx14HGJ1IRnzdZrD5kLAZJNpT5XVDVFKO3TGS85tn+ezT0HU5Icwpucd2lfsuLTi7yke23dQOw83G9tEP94c8QFkfqqnN3DPOrRbp9i4+tiwdXsHE50nA0Dvgai8s6wf+L3l9/E682XPKHQ2hgtupWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnECFp24bpIodyW36dP2dpsHNW/ecRN72T+kYuglTb4=;
 b=ofxiT6xo9p3B4ip17lzl/n7BMP05wRrh3DQxyzn4IbTrpjGNkGEkNxQof1vUvM2jqiUoYGspjpA0qqkQpVi+meAK5COY4/v49lBEGg+V2FnvQH5Q1Q0tgjfkg4qXFO3KzwhoLxSn6c1U3lsgPedAG549M4GDpuhQzKaxijMc4vF9j0kPTDhSM/1k0XHiz8LPjl+acB0ss88qcoLNTtZLdSsDY8iuqV2mDeW9MbOneSfFXkovBOAcp7gnZBQ9iPvFZLjaUAczHZtQOlR9ciCr4jx90E5AXYtQ0gJnrJGnM5FJGRvvX+6A35IDvRsHKmXSZBuYZ/tXdO7Nr1XTNuWhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnECFp24bpIodyW36dP2dpsHNW/ecRN72T+kYuglTb4=;
 b=mu61SjZS2TE+xcLb9JzuSWyHQtjvVY1Yjh/gFTZ6W8VF+hz2FTGPMnfHe2ip+X4MbyLRcqP+62R7hV9ze+E+ZLlJWPhcMxq0LdtYqRV9+WZNtTTehkgIXzEATAhURNEStmwtjS8x9QpfJHPSqz3zuuCILgMQ8p/cLGLhl4Fea9M=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3982.namprd11.prod.outlook.com (10.255.181.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:21:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:21:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <nishkadg.linux@gmail.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: hisi-sfc: Add of_node_put() before break
Thread-Topic: [PATCH] mtd: spi-nor: hisi-sfc: Add of_node_put() before break
Thread-Index: AQHVUy9IDz0ZQu4BAEWuGBMOA6SdhacQbjOA
Date: Wed, 28 Aug 2019 10:21:05 +0000
Message-ID: <925b636d-1a81-1651-4e19-3fe2fedd356f@microchip.com>
References: <20190815060334.2632-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060334.2632-1-nishkadg.linux@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:803:104::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a9d697c-b044-48a8-ef28-08d72ba16f57
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3982; 
x-ms-traffictypediagnostic: MN2PR11MB3982:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB39827098CF7FF0E7A3C820BFF0A30@MN2PR11MB3982.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(6486002)(14454004)(6512007)(6436002)(446003)(2501003)(6306002)(486006)(2616005)(2201001)(31696002)(86362001)(26005)(476003)(11346002)(3846002)(31686004)(316002)(53936002)(6246003)(81156014)(8676002)(102836004)(229853002)(76176011)(6116002)(8936002)(25786009)(52116002)(99286004)(186003)(53546011)(386003)(6506007)(110136005)(81166006)(305945005)(71200400001)(5660300002)(256004)(14444005)(66476007)(66446008)(66556008)(64756008)(66946007)(71190400001)(4744005)(7736002)(966005)(478600001)(2906002)(66066001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3982;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zX7jII7oRT5ywFz32ZI+8wp/954RTTQOiQPQFFhnMchr5Uv5uqfJfTbudkeOlLjqN2TN8BAZnIAxanyTcYKZSg3Qij/KyTXhHTQe2Jna9puI+wL2ad/0rdoKMLQ7IkYa1PicRT/fK74zJ9yNeSnO/F5ntFjDO7b40Q9+/StIaSITSmAJs6SjINoJX/y9gRn923WOWTEFm+Ll8KOaV1rObTuBfcqCtesz6Wfl3eEgMs4OcIvadXuCBdPqN7ji6jZ1lEDWu4x85xUEZ1Bo+RKIFAaafI+aw9PqTMswdiVW97fURX8E9hXjoWJMr8RISNhjX8wd4kWNVHVxjB7akP18H8cKqhCdolI03uFiBlWiWsoHuzTUe4d02XmaC0TtcKjuN2vK2NZAUZXIAynbiveAXDt1I0BN2tV7lVbTxn5xJLo=
x-ms-exchange-transport-forked: True
Content-ID: <CC8009B61538D842AEE3AF29D0FA4A72@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9d697c-b044-48a8-ef28-08d72ba16f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:21:05.8144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaRRPop3J127PSEULGpUDna6FQDEISOngjaEEt6PYUV4DwnVUS29+/xYFUZCgEL//IqTV5vn9/YFosQYx3oEOu570vpvSmYRk4twBxrUk+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_032113_988126_DE01ADE8 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/15/2019 09:03 AM, Nishka Dasgupta wrote:
> External E-Mail
> 
> 
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a break from the middle of the loop, there
> is no put, thus causing a memory leak. Hence add an of_node_put before
> the break.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
