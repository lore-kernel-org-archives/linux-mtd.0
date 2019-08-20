Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4E5C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 14:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD76922CF7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 14:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="umEKkUPu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RO6ov3l4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD76922CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VZSxJYwvBUXwrn7xBUx/DLIWMhbbWiNU7BWtPATcBc=; b=umEKkUPu85LSGE
	V1chNluR7Kt/Lmw9xkpfAjePP1cP3+0LNpIEr5uHylSxpp5OsSK6XbAVdBeoIOtLzVqbs5r8uOSAI
	GEsFO2kEHOyqdVVQqu4FYXF8OrPPcMyb6i0s5Fl2EarcCYGgla6xFUD/DR5sJ7Zbsq552k8urTPIh
	03b+IyNNrmBeTL0ymIAjvMDigZMFAxLVjCAz3Qcf/u3gAlcHmaOckDCl3JYwJyn//wZ3kBWQRodRg
	ygfXPnNjKEUu5EQVZvdzqPrPvD17EtnKkJQBimkc32HQ7SrpiAdR1F+pkL0RV2Z1lq4u+7Ep/A4fs
	Vrps4Iu9CjbNLUpWorqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05M1-0005kz-KO; Tue, 20 Aug 2019 14:43:21 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05Jo-0003WT-1a; Tue, 20 Aug 2019 14:41:09 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: RtYos3C75pSxHZT67ddJMU4Xv4szRPm/d00nSVnnTacz+dhngJXBV0t2brAGmfqfBe4fGFJ0LR
 XwqDpGLXD7AYDV+Mb9pVErr6n7EQfFQXt4Qpv605xJZMn0u/NkkMM5nJzkClVAz63x4RUKS9Uf
 LEPsY+kR31soBN1xnDcmepNAC6EXiYulMwLr7sbHGYr+/4jQSCQ2z+8010oiLRBPtHQP7lsgV8
 6K4lzWT11TlagyzRVum3XzRrvBKdJqghz6yT8XcRhmpQwmm4RuANCanPE0+gTqfBxGpNIxWoAd
 yQE=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="45834398"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 07:41:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 07:41:00 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 20 Aug 2019 07:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7qb3sDwyQguufns1GATKJSHxyc6OJ1TilR/tvgiezWomr1j66IKiT3CC5s/jUkW3s2T4BPz263QKJKuylqbc1dokAcuGrFstTXqul9wx/h0aWpUeGvEILXBK7XWTnPLHPBLFdRU6uJ0DYYyu0Wykx/a1NPfZuKM4Figexw4rmLSQj3t0BmNv8ddUZB6h3R/U8R+b117P7oPWSESICFMFV8+tGnSe3I1A9LUMVaVQEaamv9fjmqGkt4U9jnW1vQ4qZfEQa/hHGDWNyYZjtFVZwijyLFHYMGIZAoBo0QVYOjWT6D3OKAqzwyqbVrywq4ASJ4UMtoYKm8oUr3uDuBfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa9S5oSVpPzA2zxWma7Y61tNhlRGPEZDvdqYxj8kqpM=;
 b=bWe1xg7GX1qV7S050tdCfytaF/Rq/sUz6l7EAzEG5/BhTfQ8/3DY4P1FTUO4cNsC9SNAs/x78tvV7g4IcYspziCcFIyNhiU24fQcHp1vFoEs4jfDcDYib0fQPEyU3l3PlgqSQ2t8SegLU5BNs+Kari9Xaf7ZHlMMy7T/I0/8ogha5XZjA3JFP+xytFGAzRcFiXFOsOCijjFG/OCDXRZ2YPmoLEW1mwrf0LHS9jZRcv7OHfn7lJEm9tKZXXvj8sSqIriga1E2tstywbXtcELdeJ9LENURghr/E2cgo9Acb9rHNmNV0aNXQN25P/Zw9WxLcgab06DmAWm1tBX4KMN0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa9S5oSVpPzA2zxWma7Y61tNhlRGPEZDvdqYxj8kqpM=;
 b=RO6ov3l4BWdzp2cWA2Um5DOQBwapWoI1SfF4iZWxAj74Th8ItcrNM7dVsvnlj0u36bpKh4u93+g7YeDBC8nA5oBVYl/58pSyLy5hIOhpgURydV6FW7o1QKR6yeUkQUAXvzZPG79UEz3AyQbvq1IK3gJyrgKLxNzXWVd7x9kPkds=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3903.namprd11.prod.outlook.com (10.255.180.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 14:40:50 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 14:40:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Eugeniy.Paltsev@synopsys.com>, <linux-mtd@lists.infradead.org>,
 <marex@denx.de>
Subject: Re: [PATCH v2] mtd: spi-nor: add support for sst26wf016b memory IC
Thread-Topic: [PATCH v2] mtd: spi-nor: add support for sst26wf016b memory IC
Thread-Index: AQHVPXIRduqv2sbp0EmPJyLdHxvKlqcET5cA
Date: Tue, 20 Aug 2019 14:40:50 +0000
Message-ID: <c7d2b65a-b821-7a42-ba79-e8d0a80ce970@microchip.com>
References: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0006.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::16) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82eb20cd-3458-44a5-d9df-08d7257c6515
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3903; 
x-ms-traffictypediagnostic: MN2PR11MB3903:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB390322697D9D9F7CAC8EEF9EF0AB0@MN2PR11MB3903.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(53936002)(71200400001)(71190400001)(25786009)(31696002)(110136005)(6436002)(31686004)(6246003)(102836004)(6306002)(4326008)(7736002)(66066001)(6486002)(81156014)(81166006)(386003)(6506007)(86362001)(66946007)(8936002)(305945005)(229853002)(2906002)(54906003)(64756008)(66556008)(66476007)(4744005)(66446008)(6512007)(36756003)(478600001)(7416002)(486006)(186003)(966005)(53546011)(14444005)(26005)(256004)(14454004)(8676002)(5660300002)(76176011)(2501003)(11346002)(99286004)(476003)(2616005)(446003)(52116002)(316002)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3903;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CDK2zgrFixGSmH48rCvZKxoGC3lgYSXS0Spc5G639Uu7izWQmvmSSHokULUQwFJVx0cffAKeeSa7T23EMog2LK4qgI3eSESuo4Woiz5pGgcPv86aU84TJUFd8VM/WAJ0iKA4S5ml4+9wXPuSKtHygGJfax9EQXQ6T37cVWADCtNsf4OCwyb6nBT+gQJV+Wq0ezWhU/3ZOsCeoNQneHbrS3gd/BEzHyFjbe/mYiF7OdU0EC3nykIKRSthlqtEAq9asIOKrVG6y+6oG5jiwN8SafnxEKpSJnASbjxi6Piqp/qVNo4SRcK/L+WGdcRLp3ZGvbv/kB+uTbpRKqYOJddwjFVZKuvYIaT1qmqiYjYfV/4Tjst1bDKam/wQpHHeOcHqZcuZ+uJbZ4toAwnbK8DOXFEIwc/J0UPYaBNg6QDW/CU=
x-ms-exchange-transport-forked: True
Content-ID: <A03EDBD83440904795BF673225C76F11@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82eb20cd-3458-44a5-d9df-08d7257c6515
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 14:40:50.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8R+fJA4Pkyi5WM7BmCktDQakF+nevRTNi7mWZ419bsywflBQ1FLQSp4aDt6DGwlANt1AlulkQ8JZx3B/VJwCsXBW6izm/uUEqAAJqPULZn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_074104_118317_CE66A917 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: linux-snps-arc@lists.infradead.org, richard@nod.at,
 Alexey.Brodkin@synopsys.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/18/2019 05:06 PM, Eugeniy Paltsev wrote:
> External E-Mail
> 
> 
> This commit adds support for the SST sst26wf016b flash memory IC.
> This IC was tested with  "snps,dw-apb-ssi" SPI controller.
> We don't test dual/quad reads however sst26wf016b flash's datasheet
> advertises both dual and quad reads (and support of corresponding
> commands)
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v1->v2:
>  * drop sst26wf032 support as untested
>  * add note about SPI controller used and dual/quad reads to commit
>    message.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Wrapped to 80 chars limit and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
