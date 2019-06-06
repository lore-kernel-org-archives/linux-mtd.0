Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A134C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 22:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D075E206BB
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 22:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVZqcNSl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UOfEk2a/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D075E206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKovTdMAX8RvsnxT0biJOutx0MWksKnxvz2CVHKovcQ=; b=MVZqcNSlBAlKFD
	c5tRDMu2CBZSxIP2QAbOVL5AA8uJo1JfzbsvSG9gxUjei05zY9Qon0jgI9EUFApbN5rUDVfFMtJtj
	70ru8Yo7Mb52HHY/hXFm2n5z5w5QoCcAzj79S1+hLrIhVUV0ZiDHqGYjzPk3p0aSd2pa5m5//y6pY
	a9ScROabxzUTx6icf8cr4p8bz0nMqAjW1iBcvS5TcnQ9Bdh6CtJF7XJmwXg7LuSrBSofdjvtR/tcJ
	06ZmHAOwoYpyRFUcynx9eyKa8KUxVjO6DI0h0LnYyVLVgNFMnBa1fBE20ZmHcMcP7kZpkwRjLEv5k
	Hg0Bo4VpXWPQNJnK3Tmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hZ0xM-0003Nz-4Z; Thu, 06 Jun 2019 22:34:00 +0000
Received: from mail-eopbgr20081.outbound.protection.outlook.com ([40.107.2.81]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hZ0x0-0003Mt-RW
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 22:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5ghpEB51pcsHDyuCVH3nzaGcKb+YTllL1QjNBnVDVQ=;
 b=UOfEk2a/T4tZs3/FWdApBmSlIVimK8QCEVKq5moDXsHygT8pNfcv01QfkYRref6o6HsUguuA4NcF+J1S8U3EW0RS/OT2ekZNGJtom+pQljbxeeXaOze84rbYjQ4xlWLiTYGJZv0d34qC6pT9m/oBsa6wusgqdeCYI7j0qd/HUns=
Received: from AM0PR04MB4961.eurprd04.prod.outlook.com (20.176.215.222) by
 AM0PR04MB4147.eurprd04.prod.outlook.com (52.134.125.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 22:33:29 +0000
Received: from AM0PR04MB4961.eurprd04.prod.outlook.com
 ([fe80::e046:3c99:88be:90a1]) by AM0PR04MB4961.eurprd04.prod.outlook.com
 ([fe80::e046:3c99:88be:90a1%3]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 22:33:29 +0000
From: Han Xu <han.xu@nxp.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: RE: [EXT] Re: [PATCH] mtd: spi-nor: Add prep/unprep for spi_nor_resume
Thread-Topic: [EXT] Re: [PATCH] mtd: spi-nor: Add prep/unprep for
 spi_nor_resume
Thread-Index: AQHU+uHfbtBiSaKzx0CN/OQDDONR1qaOYFKAgAEUgBA=
Date: Thu, 6 Jun 2019 22:33:29 +0000
Message-ID: <AM0PR04MB4961A2E7620DF5BD346C94D097170@AM0PR04MB4961.eurprd04.prod.outlook.com>
References: <20190424210818.25205-1-han.xu@nxp.com>
 <ae82d8ea-dd85-0bc3-ff2d-0ba57f635030@microchip.com>
In-Reply-To: <ae82d8ea-dd85-0bc3-ff2d-0ba57f635030@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=han.xu@nxp.com; 
x-originating-ip: [70.112.23.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e34549a-a82b-4d7c-73ec-08d6eaceff9b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4147; 
x-ms-traffictypediagnostic: AM0PR04MB4147:
x-microsoft-antispam-prvs: <AM0PR04MB414736BC36F094656F937F3497170@AM0PR04MB4147.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(366004)(13464003)(189003)(199004)(3846002)(7416002)(8936002)(6116002)(81166006)(81156014)(8676002)(9686003)(256004)(66946007)(55016002)(305945005)(74316002)(7736002)(14444005)(6506007)(73956011)(76116006)(5660300002)(76176011)(7696005)(99286004)(53546011)(66556008)(66476007)(64756008)(66446008)(102836004)(186003)(2501003)(26005)(52536014)(54906003)(44832011)(33656002)(11346002)(446003)(316002)(476003)(486006)(2906002)(478600001)(14454004)(86362001)(6436002)(2201001)(71190400001)(71200400001)(66066001)(68736007)(229853002)(53936002)(25786009)(4326008)(110136005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4147;
 H:AM0PR04MB4961.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FvXYM2CjLLgb99bmsMvplCzcJIggPMDMhTai+7kCuvf7NjORFMECtevfqXQ3Mb9l/RfGySA2d8AgqzkFcLJFochrWYpSi8tl2ZFsKBqll9aw8PNuAdesCj8r7hebvLNjpfsq/phk8JI2W4FX40SAuCFl9DNR7GoCqu5P5LhNX5EfR1yGqptMGFBtXkw2PZYDgQjeePbeOzAMZ70Y4s6xHm4Fcg3zgoI9hUULjh2j+1fHhUvoTZF5+Dsg1UiHSiQ4Je8hxvcU7m/dt8h+iIv5jO26mFtAEfk8AF6TOgtodhdC1fETWIIi6mALJYb2dYajyPdYAhGsM+ttbJNt4jv7YIaTKT8XBnSEH801ArIJhZmA4en6L6kBfsHQzhK+hhvoyAkMPgw1ZK8KHjxMv7x0I5WpjIhJ4cReaWYOpbdC9IE=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e34549a-a82b-4d7c-73ec-08d6eaceff9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 22:33:29.0824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: han.xu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_153339_011937_9E659F9C 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: Thursday, June 6, 2019 12:46 AM
> To: Han Xu <han.xu@nxp.com>; cyrille.pitchen@wedev4u.fr;
> marek.vasut@gmail.com
> Cc: boris.brezillon@free-electrons.com; f.fainelli@gmail.com;
> kdasu.kdev@gmail.com; richard@nod.at; linux-kernel@vger.kernel.org;
> linux-mtd@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>;
> computersforpeace@gmail.com
> Subject: [EXT] Re: [PATCH] mtd: spi-nor: Add prep/unprep for
> spi_nor_resume
> 
> Caution: EXT Email
> 
> Hi, Han,
> 
> On 04/25/2019 12:08 AM, Han Xu wrote:
> > External E-Mail
> >
> >
> > In the new implemented spi_nor_resume function, the spi_nor_init()
> > should be braced by prep/unprep functions._
> >
> 
> Would you please explain why this is needed? Have you tried a
> suspend/resume cycle while a write was in progress and it failed?

Same as all other functions that hooked up with mtd ops, such as
_read/_write/_lock/_unlock, the _resume function also need to call the
lower level controller's prep/unprep functions to properly handle runtime
pm and mutex.

I didn't try suspend/resume during writing, but found accessing registers
without enabling clock when system resumed.

> 
> Thanks,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
