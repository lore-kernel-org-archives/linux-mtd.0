Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488A2C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 06:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19006206BF
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 06:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbNZIYOG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="T88t6yx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19006206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYHC102adBzww5xTS/Y0v6nalWxEJ8iuCZos/nSVnvs=; b=CbNZIYOGvhSj9S
	R1OKrFKA8qXTZf1lrF407yK+LSdJU6F+7c8upKcz885Z+kiSEwpp2JtLHxlQ3Z/DcyftwXXRbOSCi
	riZofwsMBYwp8N+mE6H0492CGD9iZi8CO4yXHYvZokARtJs/mOdMBI5TNPRlXQ/ujj8/UX6kG0XPw
	W4m03Zx43uRmZHOlOUV8q9/2j6oKbaymKJ+TCpHVNX5yQ5ScheTvw3l+pJ1cKaPeOrc+XRK4+cyb2
	mIhDMo0A251mPzbjKK4zTT2siUwagddzryHsRSR9xVUlnUKXOSJMLEJ6+NllewZVlPq0lL4j/xqm0
	2/eLKAUoVsJSH5FuAjtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2VRQ-0004Ns-U9; Tue, 27 Aug 2019 06:58:56 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2VRM-0004Mn-8o
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 06:58:56 +0000
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
IronPort-SDR: vvsBUIFEpd9r2mX+5PYlc1AG8jhlTonYyNElAbtQLeh2OQSpxNAOf5Bc/q/6PLFrMtEqEla8BW
 wyIvPFRVU+BjUkyFHiQRgMNBM9YAadE62zEA1nd7AjUu5WvZNxGB+C+Aq4Cy28bi59y8FeQF7e
 XIGmlYTo5Qm+f3IEGYzhV2Zx7/Gw7F+FUWla0Gnibx5AWJERZXfAG4E2XZ/q6Bd9EqUzcoOgho
 JOVo0m1X23mHlEtAdW/N1OaRhlDHsOr1+OMe+Kz9JOsqsvbLz5/z97B/NIN3daV+OYIc5W2G7T
 dgA=
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="43805319"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 23:58:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 23:58:46 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 26 Aug 2019 23:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCoi4VrPz5Fhdu4inAGrwDNUsTIcVwb9o0SxlRDP13kZkFy/7Oh8lmKMBQLuk24n+v3L/szEBuTpmM1BTyvA2yLGh4YF4BnFkNl5rR9+pYX+1QhPTffQm8CPPyOL4qGYGTDqmgxVi6qV5XOcJRrPtGCNlsJ2JfuTvpfg3rmCOsZFRctqwu1IgH9CCCjM5uQf88wFnMWlTnVWgngfTA5e+FPGikW8JIc7EXbzJ6oAxkJeN+IOtVSEsGOXbXT5Lr17RLSrkDEFdXCTloBoPtgYnHiiVa2ZEzULaXNLwHFZ3cjf72anRTp9wMItjgs5T4BQnESGDj6ekb7C8JqNjbw2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3LGTxdLo1zFWew2hKIsB+4G/SiJQEmmfNsGn6m7Dfc=;
 b=jvcOqH9Zhqc/lCEHwmGndjVOSW7wVfZrBPeGcE38SQMdYLHkoZmKoaWhUr5j52m+ewgEb4BwZXM3yeWbNGUbz/sqHjgcmZ0RtOtjEXRaO+CYbyCeDhfczL2CEySLDDznAgvNG9IjFShXOi3vpJDk0/funENHqvC4RPI4gVCZhpyFTxFD6r4LMsulQyFRlb9oJaoJNCV8taP4qWfgv8DfTV7uwiNKeAXXWhOwMt3OwJbfIQFgqvHIICkXcmGO85QM+9Z5QQofO76QkL1tWywOIKfRHZ7NGOm8AYNjzmxof/RlxGUoogjRSzN/8XLZF5sWQk9BcugZEx58rbJQ3cQyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3LGTxdLo1zFWew2hKIsB+4G/SiJQEmmfNsGn6m7Dfc=;
 b=T88t6yx3T6nVivdya9lrzQnuJpVlO7vMpNFAy+1hjmbYY4BzcgYT+LeU+k0ErpvSz87SzdeMtMcr4WDHM/ntvjTX5zDWF+eOquFY+5W4SW9yZ2jmAiU/AGmEnp/8qnd7CR9y+nZ4MC/cKWJ0OGDANxtlGi+x0OHcE0BISzXRJaM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4269.namprd11.prod.outlook.com (52.135.38.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 06:58:44 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 06:58:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 10/20] mtd: spi-nor: Rework the SPI NOR
 lock/unlock logic
Thread-Topic: [RESEND PATCH v3 10/20] mtd: spi-nor: Rework the SPI NOR
 lock/unlock logic
Thread-Index: AQHVXAcFrCpvcaMjzkSkkB6kiMDMIqcOi3kAgAAGJQA=
Date: Tue, 27 Aug 2019 06:58:43 +0000
Message-ID: <1238fc0d-eb7b-c8d3-3bb8-2562913ed0fd@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-11-tudor.ambarus@microchip.com>
 <52884b82-23fe-86d9-06b2-0dd1d3e57f70@ti.com>
In-Reply-To: <52884b82-23fe-86d9-06b2-0dd1d3e57f70@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0150.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88234aa4-2bec-459f-e3de-08d72abbffec
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4269; 
x-ms-traffictypediagnostic: MN2PR11MB4269:
x-microsoft-antispam-prvs: <MN2PR11MB42694D18D8DA07D647EF2BF3F0A00@MN2PR11MB4269.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(8936002)(66066001)(186003)(305945005)(102836004)(110136005)(26005)(99286004)(7736002)(36756003)(52116002)(2616005)(81166006)(229853002)(386003)(3846002)(53546011)(8676002)(2501003)(256004)(81156014)(486006)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(6436002)(6246003)(6116002)(76176011)(476003)(2906002)(71190400001)(14444005)(11346002)(86362001)(4326008)(31696002)(31686004)(25786009)(478600001)(6486002)(2201001)(6512007)(14454004)(71200400001)(6506007)(446003)(316002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4269;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sbo5JvQMKsuCkrYj/OtPjye4OvGWhQ3CfeDv8prx7HPz1h0GVPQe1pa51eY/XIFuqTNwUAU7cL7lX1FF9DzwdxmQ3F2LpMSQSJ3FyLc9ZkRmwyPhVO1RpUE3IE5oHxzEAdz4klqiKdPrUEyJqKLICm2n8hb+byVlfNK7poM912ardQbXk5+GUSnQqnqslhzJ+HY7A4X1gjFrKigEeUlHXn4PBpkh1kFgIHkmU3jhGUqnonnk1/CHRZM+X/GEIuxPB6L0hKkH7z5seY9uF/pxWXkaeQIfHFkGGIcLjjGs6wTs2yzP1R0FzqwEfZfhdJbS4Q6zcolV7TXjYl+bj3P5yStfFEfbdDvNILwxS/Q6xGAJvreb3/ZfxQE4GETQYtzPpAwp4e+KAEOIUN1cTrqD0tWx+EfSDZRQMc19EeJ/KJg=
x-ms-exchange-transport-forked: True
Content-ID: <3F420E01D8D4E647A7E4ADEFCAACE473@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 88234aa4-2bec-459f-e3de-08d72abbffec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 06:58:44.0028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7/syxNZhfUtPskpxY84uhMC3lA4s4T0f+MezTQfR4coapvnB26lXFzr9QJNugnLDdtDQSDf7sKt1FwOhn6JKq0yy8srZN47LxGsvy3zat0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_235852_367533_118438C6 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: boris.brezillon@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/27/2019 09:36 AM, Vignesh Raghavendra wrote:
>> +	nor->flags = SNOR_F_HAS_LOCK;
> This is okay for now. But Perhaps its safer to do:
> 
> 	nor->flags |= SNOR_F_HAS_LOCK;
> 
> so that we don't override flags if set earlier than
> spi_nor_manufacturer_init_params(). I see that patch 20/20 does indeed
> present one such case wrt atmel/Xilinix flashes IIUC

yep, you're right, I'll update as you suggested.

Thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
