Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8B6C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 17:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B082086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 17:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UT6toj44";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="R4BmQ0IS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B082086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSSeegljarV/fJmdG9jUPc7x5OF/tW0hYkGU5OukN7s=; b=UT6toj44qXGLVf
	Iy+Uwne51SGzzXj92fktu0zx2syHLZE1WAS4S8HsE7QtggytZvkn+3emZMnlptjgGQYajZ0QPtq3u
	+slXDRoXweV/FSnj2oA56p0v4E0wJB+kPahuLU+lZRWFCV1zEIMz36JJBJE0FdjaiMwgfgxQUuEw1
	vohycuxxpZGPyeEq4QsTsrtV9v/JpPFJZzNZTjkRfms1r5eq1/oQ7A/4Rc+2ecmZYHN0IEZwMA3B7
	Rqc8qdh39qd9Q1ME9Y2Oqu+NseXs5D5q+zHqgfL9w4U3V/ZbA+yKrcu0lRvmIufny3SLb+M9fja5C
	sTgvAJfKjtGkVAmfejIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huh3g-0006xB-Mt; Mon, 05 Aug 2019 17:46:08 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huh3Y-0006p3-Vw
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 17:46:03 +0000
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
IronPort-SDR: pxXpMitIqQvyZRCSqKXNJbLbyDsrDI1rPnGeb0+mXNT+b0KepVncMDfsIsFpQ27hr2yu92/CON
 DDUuV6h4Ce+TU1xyihlGRNhAfIKjV4v33jelMB+rvo4hxPBlkM3iXVAZHA3hhFI6uki1itSHfF
 oySjhZBqv6WZTDgXfY3V4c2njelzP/lWMJq6Yi1cQ/s8xKejlehu0UGpPk9c6O9CzdituwF9gM
 N8ri4M0c2HCRPDsjRo6zBAU73Du+NFXkHDuS+Ywgmg5UPZ2XKLPf5XdZ4rQe6RuMmyvq5qg24n
 +Ec=
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="41049603"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 10:45:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 10:45:55 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 5 Aug 2019 10:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ynayqu6pdcbNVzlAx0NSnNzRh4Fh3THn+vH9fzpLli3kJNnrxX7OhhrUL0Ee1sCZQ3HZmgbOJeRyitpDnq0KQo3+DnYM8rxFR7GiV9zdQqHfxErXICOaUVezB1zo5lDEkikUM2GKrnQVrTbxbyX9kzGhwd++OZqk8Tjj6hGRLKCFi3A2JnfGU/GK600Vvl4WiPMxMeo+EMacdqa2qVV50bUXJS0dAbQHmLx47/89jIP9WaghyHPVkUGwlfI1kgGFHpf40wbnoIQr/rClwPdk1iFHijmyDNbg0f9khKnvujpOBV5fd3/6s1aTuz170Jn7RQaqHdmLcKyAw8aJJuafYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tSn9ArI6Oj9LWP0VR4kuqpS8nsN/9ABFgShx4107Pc=;
 b=bQFgNxsv7VDu+cUE038Ob5tFgxzZBkLs14M0JNapI40YU4119KQd9onAqw6/0/HN0G2SvUzvr/4qmM7Mz5LiTEpAoVUDtGufiBb1OeUvc4Kqm7XAmmDvM2rkOLh6Oh386lPsm86uYVr/QVDM2hUK2UviPHydH9v3jqP3YbQE30e32Q+/CqdOADJaMPJN/QigcFviv9n4/2/aUo8KGQMhr0SugbX+lRwl1XWok2Zmf54EZ6SVQr+B68+gkqKacLJkF5Nb/8OdZKMn638RfwGVsEoGsLRCSsBXju0seEFA/uSVjq2jfXejmQ1BCO7h3QOUjewxTICjGSBiris4mwW5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tSn9ArI6Oj9LWP0VR4kuqpS8nsN/9ABFgShx4107Pc=;
 b=R4BmQ0ISIj1jQWO6Bs4O6YI7n340cY2Yj5+zfPOGEcExMXOppWuWnKcGX2BImsnyDFKyqCGxDEAVtRb5uzZxFABPOrHO09aCrxtJTn6FzJmz+qr9mNJYZx7zmJsBS35nyqnHPa50KfsPzJatnsOIUoGpHdniivocQI+EW+PfvEw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4287.namprd11.prod.outlook.com (52.135.37.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 17:45:53 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 17:45:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Rework hwcaps selection for the
 spi-mem case
Thread-Topic: [PATCH v4 3/3] mtd: spi-nor: Rework hwcaps selection for the
 spi-mem case
Thread-Index: AQHVSIVT0p7xGp6VbkaLHo0K31VAGqbs2i0A
Date: Mon, 5 Aug 2019 17:45:53 +0000
Message-ID: <ca327faa-d716-9ef3-f368-e496a40c6e2e@microchip.com>
References: <20190801162229.28897-1-vigneshr@ti.com>
 <20190801162229.28897-4-vigneshr@ti.com>
In-Reply-To: <20190801162229.28897-4-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:802:16::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f81827d-e20d-472c-cf9a-08d719ccc2c1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4287; 
x-ms-traffictypediagnostic: MN2PR11MB4287:
x-microsoft-antispam-prvs: <MN2PR11MB4287802585D28472057477D4F0DA0@MN2PR11MB4287.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(366004)(39860400002)(199004)(189003)(25786009)(5660300002)(446003)(66476007)(186003)(76176011)(53546011)(6506007)(386003)(102836004)(256004)(66066001)(52116002)(81156014)(81166006)(7736002)(64756008)(66446008)(305945005)(26005)(4744005)(11346002)(6246003)(476003)(14454004)(8936002)(99286004)(4326008)(68736007)(53936002)(486006)(8676002)(478600001)(3846002)(6512007)(2906002)(316002)(110136005)(229853002)(31696002)(6486002)(66556008)(6116002)(54906003)(6436002)(86362001)(71190400001)(71200400001)(36756003)(2616005)(31686004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4287;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uEBNluvNSbJTsv+ZeK4ciKY+7ZrhgEvJ+4Qs37FtlNBu6OSA+8h/h5U48Qx4RjIfhOGYmlhnCopNivIdaOp/HeOPzaL22W9vkTmW6CppCm8MhZj8kx4iS5RsHFp/0wxm6k/JO03UDmtFww6hKjTzTT9QPmvf6cHzThobV78FKixhwipfvlsSGl9avF0PCr3y7NeR5BTtHmzDZqq6smW4eHHDbgDCLG8wp2mTv/WPIY9xAntMbCXU+Z3CyJra9so94ujp/2Ot0kArmegQ5eAngWNoAaNQxm0x/FH/c41jZbRtqeVsBprwpQEH7WMoLGGli8Rv5c+xfyYjb27DYX5Pp3DWYkWVxYDm+epGzG161U3gPsSJfGFVZbB+sfyf3+dvABga4V1c0evPw5RqF5Cwcc232ghUNj61VKOCckD/G+E=
Content-ID: <7F416EB51D6EB14591E18B60F949FBE2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f81827d-e20d-472c-cf9a-08d719ccc2c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 17:45:53.0796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_104601_131686_10812BFB 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 07:22 PM, Vignesh Raghavendra wrote:
> +static int spi_nor_spimem_check_op(struct spi_nor *nor,
> +				   struct spi_mem_op *op)
> +{
> +	/*
> +	 * First test with 4 address bytes. The opcode itself might
> +	 * be a 3B addressing opcode but we don't care, because
> +	 * SPI controller implementation should not check the opcode,
> +	 * but just the sequence.
> +	 */
> +	op->addr.nbytes = 4;
> +	if (!spi_mem_supports_op(nor->spimem, op)) {
> +		/* If flash size <16MB, 3 address bytes are sufficient */
> +		if (nor->mtd.size <= SZ_16M) {
> +			op->addr.nbytes = 3;
> +			if (!spi_mem_supports_op(nor->spimem, op))
> +				return -ENOTSUPP;
> +		}

this returns success when:
	op->addr.nbytes == 4 && !spi_mem_supports_op(nor->spimem, op) &&
	!(nor->mtd.size <= SZ_16M))

which is wrong.

The patch looks good otherwise!

> +	}
> +
> +	return 0;
> +}
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
