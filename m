Return-Path: <SRS0=W5Gy=YQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31703CA9EB9
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 21:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021FA2084C
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 21:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dW9LTvce";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gaSsMf/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021FA2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKrevMFx4Psuuj6HtqBy3hp7H53/5P2OWginEWoeSVY=; b=dW9LTvce458kso
	Pwa2yfh0X2LSpcAYTFZKFAsh4UjJZinLzWvDCd43a9RU/hOTQODlq2evKwcHAP544aUYfRvuyQfkv
	x45lNH+sZOkb+q+sr2D8Y6BlX4mqSuEZ7q39MmRH2qW7TqQoemWj5Bn0D2r4892fccmy0C28Cm/GK
	1z7IQkbxBMBCabCB94kW9EVbnCtlXunw7wrhExQZCbhIreYIoXqO4TwCsntnFpOVkblJF0VOolGsE
	260PYEiLDcgE10RShoMUFKefmr6WcdCxhczd6lasfFCPjSMfRjU0qwhRBivo6eXpd684g92w9pPPj
	xEq+TuELYmfrPAW0reKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNO5z-00008B-8y; Wed, 23 Oct 2019 21:23:07 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNO5w-00007n-Ke
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2019 21:23:05 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: xDq7WLXnAaf5/Cs4kzATyHh1zFqKIA+Z1Nu3WBD1OZ6eIeY8JyCTu22NvtsRfnI10jGIO6OUAS
 XFkSWSXm0Bwjc0MVZd4L5Zp1yPnVDIVf/lKz3N0Xr4Q1RofetHTmf+507zD7zYWDr65gdixRxI
 gp5ds/AfDgY4PM2px9lqo3xB1lhDYC/ff22KdU4GY6ODuhc36SWgITpgoJP9kEAzgsltzXhUit
 W29BQt3iYyhS+7jYWKGaOeDVZOoUnL6oCuj35UjItVeedl4unqWiJSTYNC4WHLqkM/N4sRNSo1
 S6E=
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="52671870"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Oct 2019 14:23:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Oct 2019 14:22:59 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 23 Oct 2019 14:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaFdiDQbi88vQBx9xtQiqsp6zSLi/PhIriUVQ20DPl1/cwJ5DIuSWxbi3dpMn+IruRYvLgNNv9emQTVZt2IPvNHzDyYbB1DtL+XEnb5OQ3B/StouUaqcDoqgDovYf6PGVbxo+ewQR+EZy2LLsbCZrX5I6fLDGR7ApInzIAKbwoNMQOOfweeoG2xjr+hiXmrp0UsFN/YIGzXQ2qpdPD9QOu7Xjep6T1a5rWNmkozYls1lHcGUPxe6WXxMzFq5+qGQmFS+Zxuu6WoVr4on0H8BXPu41QFCiHNRrmY36oZj1qpO4mIleQ7Ic2O4u5r0MnxY7HplGuOZnF1HNbgzbMvcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0qo8/rYpZQFWDTODdNkd09Uy262GTdC1bKxt2b6cfU=;
 b=FFPUdnIcg2+KzTAlrayo0vZa72UhkQHLzklO91VvUNgK7EwJTvaI85cS3teR6KROcHSg5kCbeE9Gt+YKK3lNrtD6EKVt7pPYkc77jPoAj3H7kAMGI8BNyZ7+ZgApEM6/ADXtQWCCqhxy4MnCLtM8o0qnqOuG7evJ1qTErcM+1slt0vAXgpubiy8fzBpUXQSsQa56Cig828TSz1qZiObovcOsTAsSNzyY02WPeoNOWpFbgq9HBdGEpKioxPkZnWLynqNMaopQKPwh5+TQPCvL3FtmYYUZ7oaidwu4XtKjIf0amawbpsgbdOVDURbi1ZIau3N2U4buNMjwo99uF71JIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0qo8/rYpZQFWDTODdNkd09Uy262GTdC1bKxt2b6cfU=;
 b=gaSsMf/jN3GiJM5Vgbv44SZLTBEz46DDown3LhwQr6STuX48fWj2gMxivRgYOm7Q5gvmBNmtF3Rh9zvulJq6zT7IWTVhc44or68EE3nba7fAkuGvYZ2D6/0nAxZXrSRyJ7mmS4TjnfpikpFzYEqydRE3JjKYVpYI0tHroUteN2s=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3549.namprd11.prod.outlook.com (20.178.250.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 23 Oct 2019 21:22:57 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.029; Wed, 23 Oct 2019
 21:22:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dqfext@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add support for en25qh16
Thread-Topic: [PATCH v2] mtd: spi-nor: add support for en25qh16
Thread-Index: AQHViPopl1gTpLS2h02L7SyifdU1ZadovhaA
Date: Wed, 23 Oct 2019 21:22:57 +0000
Message-ID: <30e9ebcc-a815-3572-75be-945140714988@microchip.com>
References: <20191022165939.9116-1-dqfext@gmail.com>
In-Reply-To: <20191022165939.9116-1-dqfext@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::19) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07555cc7-53dd-440b-e3f2-08d757ff2cdb
x-ms-traffictypediagnostic: MN2PR11MB3549:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB35492D7CEF3237DD12097BD9F06B0@MN2PR11MB3549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(99286004)(316002)(76176011)(6486002)(52116002)(71190400001)(71200400001)(66066001)(110136005)(305945005)(476003)(7736002)(2616005)(486006)(4744005)(478600001)(6512007)(6306002)(31686004)(186003)(6246003)(66446008)(11346002)(14454004)(64756008)(26005)(102836004)(86362001)(8936002)(66556008)(446003)(2906002)(25786009)(6436002)(5660300002)(81156014)(6116002)(36756003)(31696002)(81166006)(2501003)(8676002)(3846002)(966005)(14444005)(256004)(53546011)(6506007)(386003)(66946007)(229853002)(66476007)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3549;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ocySR85SMqQFntNxD6aewFe6QnTpH3ovbfrqea6OcKnk0aZIYgZg36z9C1bb6zVomDGQ4TrqOuE5I1Kuh/bBQ+PeLYkww9I1H0/DP7slHmFEnL1MXPGxzNP+rxrY63syY6Z2iBAgQTQ318gOAX7aVTrUYBHO3jIifrqPAp3bgycN9E+6aQM+JC62uk8W+Mca8Wnp//yukBXTcuy3RweVvGDjS9ppp0vw2mwCXYJhElVN6agARp2e7XFtPwHwueEbCOrIQ4VW8Z1maGAyEuUGXC/VMCre1iOmSrsuVY/448X0JB/11WB5bcfAftdrR8jb4TLTwWR4zHy851nGQczTpt/zyvvKUyLl7I+Hjxh6VXJg50Ze4ZH/9JhwlMcH0fkKGWt5vmqczQnWKEQ2pKtq2n+jzKfA7KIuxsBFKozULgvCpU7yMI18ehQqN85UaZAF6uM1lEYRYihmEWGMJ9o82uVMpvlaGdFK0QJVUyGivY=
x-ms-exchange-transport-forked: True
Content-ID: <CF8A68EADA150E4FB9CE8B85BBDB3F5B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 07555cc7-53dd-440b-e3f2-08d757ff2cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 21:22:57.8648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mEiq8KCxyzbc6z+YTSQm8MyeHWpsbY2J6F9wRgdnP88+uYEqiNHJPE17ppGeiOJi4AUPg2e5jF+3S8hfsHZPi/pq6SDjYYZ5ISMFF2I2Upg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_142304_681253_442DD9AE 
X-CRM114-Status: UNSURE (   8.29  )
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



On 10/22/2019 07:59 PM, DENG Qingfang wrote:
> External E-Mail
> 
> 
> Tested on HiWiFi C526A
> 
> Datasheet is available at:
> http://www.xinyahong.com/upLoad/product/month_1411/201411201256018276.pdf
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
