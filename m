Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE8CC433E3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B562206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pm8+uEkj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aQbNSBHY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="QxItiRav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B562206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=Pm8+uEkjipLvbPBECzNx2mkrw
	OfNMQPO7zV+nTgvmAoxyXQuyCL/T2u2/1DWwjWlUXq4lQtwlIuXK+0ir+V4aNxzq9uTSUh8tbJeP5
	r7OueFVUQ3+j9jSGJ+DsaksnsPRAb99kFpGZdffJaFiQ7omyDTiw1mp9aFi8PW0rLHlDIIlwpKJQ5
	e8ZLfAWf8BjnKsEOJnrYcgDDipNDzllaMHMO9S1tGlJVFIdm/f99XTllWJnu6vUwJXOLlbxVPSJ9B
	vmVOLA5C58/56JCLVMYt0Wn9nXZzHbmz3HyzBJv6FsyO/F9ET/2uMVxf1SPdRIDiIPTsor5lWdEEe
	+GKJ61SMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Odi-0007uZ-1Z; Tue, 28 Jul 2020 12:23:26 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Ode-0007sx-Q7
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 12:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595939003; x=1627475003;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=aQbNSBHY2vGcYXFjEb39FJgxJz7u2n1CJNmsJZaRRo0sDsQCtNLH+CNQ
 ih844IB8/JO4XWVhIFO8RJIyZwUCSc4S3v0IClPxBzCAvCy5XtqXYPST1
 Tiok/njPL/jGH0Na12SwfzcU3o7owl1M6KJrK7BQJEuWJ9QTd0YFnC3HX
 lBl8huLQO14J8KJ88lZQxzU8LIIZdzbYDOLAsSv4g9rZmkOaanqW5HSbL
 K5NlWsoSJwKMmC3jPvE5pUGzGVyPcdETiuXw2hPxg5z9q47IwhtDNwTu6
 I2DysuJiuGNSuufPf/D45DwiJFyHkAZCDXPUCLdf4gTWE63Ztyij6wJkf w==;
IronPort-SDR: nHwbTT2+vn9pF4EhYRMEHd7dKsa9G1qeLWUPXheti+Pz3Zc6oYAIeAym0RRYqLmfr3T7gCN13G
 hGUz1YRjBCThLrtiqVTJa8cS1sQp4CPgdkA9in8VzEE5kTj2vnkwgaK64Iii88kcCzIgmi6wen
 AUEmIBeY8P41CBdaTiqKM/XwD5j3Fpul8EVgqwwd7Es16E9eGa2oOEVE1xqXnBJ/5VcRhq1v5+
 5E8EKshIWQwQZ0tKScwy/wyU9aex3Q0n5Z6OBelkg73aa73WV6Apm74oXSQgjsQi4xYXvn3a1B
 VXY=
X-IronPort-AV: E=Sophos;i="5.75,406,1589212800"; d="scan'208";a="147859977"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 20:23:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS58XHLfiOtAEZJ+0Nn9Kp1Y+ynt023kt+dNFh1PIXxff/XCNva3qhpj660DpW8+OZryh/j5l2/uaShUIP4YoKZH9Ns9F1XwjO6V+cdtF3pVVCEJxwsHdip/+NIAT2sQHpibPzk4X007cIlY7FdM1lTxIImQ9m3A9ZGjkbGsFzmCBzGcBx8MTKAO/uKwt43ikXDTK6MaRAytzvOreBMqAaOE9OeePpYy1qhtstjx4Q8a0xRGS0syWeFWXhlGPvwFuksyurODsDk73eaWMUjNsovF0kDrQ82DTL8MhfUVcsBdEEMF/H5KHgTOOMWNB++eBdLx2PK+O/kN944MEOvKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=UUrVjbjEDAVWVmx7RzmSwpZrceWs22zKEfHHwqQIBJUh0n9k7hN8FGmQxMRTt6qmuCu4MnZfBP709cFx7zZ4NExyZQkfA8iamW2zux1d6678qGdsTJYToE9MRHXHlem+qQrvAVPA7FptHR0F1NPqWCOq4qJ/o3DOWOYtb8qLqbFU5VJsFwV3KHi3j1GpFNbTd0laipFgYCEmzh4nJj9wV0FIpr7AbHMyAoqXZEOGVf3vRmtgralmh92iVQF5jAlxkKFzZMASK4cc6DCSWw5eKBwNb7U5e+2DhaPZb6XDUq0x+T2kXWDnNbsKCzjO71Tv1hOQSBXXee85Qqke8FW8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=QxItiRavHzYveDOEBW0UFViPWLwou38pbhYILYA52HxEGG6xoH1TcyNk5d4ns+x4D29on9arDMVefwoulp+6ZW4Xz21E5Y0RbdPrrH+Z9xiDAw3FbBAgR2Oo+pHcMCf1U3yTO1onnBdWoZmPCw0D8As+T1yeKLZXQiVl3fqsoUM=
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com (2603:10b6:4:7e::15)
 by DM6PR04MB6042.namprd04.prod.outlook.com (2603:10b6:5:128::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 12:23:18 +0000
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573]) by DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:23:18 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Thread-Topic: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Thread-Index: AQHWYYzl+a7Eqk4s2ka3fXGEsbV2jg==
Date: Tue, 28 Jul 2020 12:23:18 +0000
Message-ID: <DM5PR0401MB359169BADDBE6B9F611B9BF19B730@DM5PR0401MB3591.namprd04.prod.outlook.com>
References: <20200724073313.138789-1-hch@lst.de>
 <20200724073313.138789-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41c6ceb7-578c-4100-8b52-08d832f102a7
x-ms-traffictypediagnostic: DM6PR04MB6042:
x-microsoft-antispam-prvs: <DM6PR04MB6042DE20A315424F8D2533529B730@DM6PR04MB6042.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZdHaPqnktjMFEGBYJsxb6FTC8d0ugTzRNcXhnKqt0egUiYzymkMqsNmW+Sz+Zf41My3LEET5GE2/h6rewehBYCLLmhpPoo95Jknf2TLBh2ODw5HyNAVk811121hHOZaQKEhJ8PaWKQ0WIn+2hlH4+DiVdTWbCHeLI3cHqi7uDqxu2Ge9rav/L2d3nEceqktRk9ElOjv7nz/t+9qpwh4PnvZWbaytY1p/n+KxPI+g+IOo3NHQxqw2ky/VaNZ6lv4gFc2o+RBLt8SFnutCas2YVU9Ap4wrWe3FuH9TMibD597SVAKof4PlE8G8nYCwICGH9AN87jzKgfEkXpDUNA7Xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR0401MB3591.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(54906003)(7696005)(110136005)(19618925003)(558084003)(64756008)(66446008)(66946007)(6506007)(66556008)(66476007)(71200400001)(186003)(76116006)(26005)(91956017)(52536014)(478600001)(4270600006)(5660300002)(33656002)(86362001)(8936002)(55016002)(9686003)(4326008)(7416002)(316002)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: whG+n3jqlXJuOd6kui3pyChonTerxMiCSOqI7YGRrP+w2/lRGm2YL+RH+sZDESLaYiv+hXSVyC+hCanAINAYHE3T0cIiuj7qMZyyVBMaSRh74e/m6YCVa1XRy+rIzSUrGV3Veif+hGffucuTeI5wfVIGfDGpkdjEwCrjfY1qMWUuIcWi4rFl5NZjezh6zdAiR4swYp/L0bWIRaeDmQCWR3DiHT4tYWidkpdCFupctf6ZVCbcp4J5w1FPd3rezNFP8RdDSrQNtKXvs5AWWDOltg2cTlcCRgJV6xZcDn6mkMBPEodOUhcWCzHAZfSVkKTBEPthT/VmbhGxAe/gGXOU8PV+YNRoXlozvPTtHS8781xPEAoDyhl6uvsegR9WK4jZ6a5IpllTfEeZ/5vo1mIlSyca0+Z8kXeiRYCFQg3cX2GstzQQ13tQjfCYKMeKVI3Q5dxbr67m8RD87SwzKzc3JXcRSLx0XyGkKxOX5aWrA9zqA3oCRgcYu/PP+wDuBt/6
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3591.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c6ceb7-578c-4100-8b52-08d832f102a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 12:23:18.5057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9oxUAcaQH+FRTbrT5RxUaoJfIoRjFxeQz8cgTzgE7hbb+uOz8DI/06Y5E+Q81ZT8diU2rriYFvNdP2IraoC0vrCA3qPZPm+bSa7MmJ1F+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_082323_136956_551FBE0C 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
