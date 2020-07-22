Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2F4C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:07:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8DBD20709
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1RkBjV1i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="B9sEkTIu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Vhccjgxc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8DBD20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=1RkBjV1iGRw9ZyUSx6iotPF7V
	orJMXEOhzL37HUEPic3A4eS01FVTLOnOIYQkgCE1uSRqrvbRBiQKWKHGs5W9MWiXOQAOXmtTRISvD
	vUWdeEt6dOB9ZtYj98HsE2OjFFMN6hDap2H5DQYCXBxbDoPaDRA1A54epohpnHdlHCV0TOxQfegcN
	4xeqTVZgBAVpT0mqRjudnRYMNG5blKz7VJCSC+LHYA7mcs2nSQNuSfzD9aGgK5I4XsmSVThyCJSlv
	8rxLzFC86VNkzILWEK4sXtZBZE/kcTiCZ+UcC3CVwTSoLb55JFiQFlZSMAYv8tVdv8p6OepgisVR5
	/Dy9Co37g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8q3-00027K-2d; Wed, 22 Jul 2020 07:06:51 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8px-00024w-BC
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 07:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595401605; x=1626937605;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=B9sEkTIuNnVJShr3rteDDaedacjEsCVFBTIoYcRQzbimr2604hkuNDcK
 JLqmQ69hrspqtGJxYY2/3vA2hg7nWyRRTbRf5k6AgVhISa582iK7C7xbv
 3ZXt8yWB8H4NbqUCsZa/CGE+9f3IXnkI1/OCy7evht4+FFcDPqfUjMmdP
 bxE/teXvIqGed+Qu69/RtDm/Nhngu/afX5Hd87VPggCf9ZMZPHIQH+h8l
 4AbBBVvurxIr27xEwYJt6CM4RHgLM3KQjm+3AgCoPVtpMGsHUBxhoy8Bn
 OPLUR/8nBJfbqcz+sdNgeIsEbTVSGaxQogg9u8SbHyppFovtaFpfOufID g==;
IronPort-SDR: 1cC/ZmCXw2L7KZN7j+3FnZb6iD/zGOdmDPw2wC+8afPlAXyrtfLqQ0IHxiR6NTt3NyAY2OcsYh
 CE9ypca0AV3xIyIR0/BhLD3mCOK0eEJO0/nOcDXTrSOIDcyRbaMgUNWQAnBitZO841K6T1vHmU
 +/GmrA8sZCEMCGZJd3fdri1/Ko5X1D0WtFD4LOZLyBj0YGT+0Hr7yDdv+b9iuS4SiHyZU21jP5
 XOygclq9wl1W+l3z5n5DatFGrUzpkbKrKWRQJ4HXUTaEamXSwfzd7KuO4kD3NSlz1vAz7CLb5F
 Oug=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="252374963"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:06:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6sb+2WL8QHWnTUYL2ym8sVhds+28a4IzNJCV1ZVBsuAAVyRvct2eWrgyMWsvMIolp47PUVyPWU/2BGQoj34mY9++hO7EcKvB485ko0RrFUg0ulkfmkL7z6XDmmWPHPrcqoGzAjM3lus07EQrz5VeKg/OClQQIJtCsm0cpaQu4WLBmscODUuWpmtrnG+O/IwIXOBePhNSZO2hp69IZNkh8JadVNcmeXMJ4UHMDIfdcKtwVrjXhsWib0rBILQgPulgD3MbPFvIUC94ioiowwrr0/ffFHOfNABByFlQfxfJuyBYhMlCaXtbAnqzNVrbkSAMtM+EyNrRuKNFl5rzIHFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=U66On1cmLp6jxJ+efAXN7XXMbx1V81dXwgfnitcx+a2JucSWEjwLPmXPrnoLpH/CcpcwDnEQY/id/2dTP2eOvyqRsLeDiou8hVBMd9os31XjHTZg5VMc0EwHYY+xrnY2W29JMkHjHMGtEURdv1OnKpmSW45CvcyPj47QeuAX853nKufyvAHovONf6tWRsiOY8SdgHge1vYvHJwPjMBaF8/iHS3/de289FD+HGOoYmYx4gNJDZaTJMUd4P9865xceiwTdBiOn6ShdScD7jQXaYLvDykJ9KphQA14jykqVN8oDrpzxairfCeNm6dHMY9I+68UN+pA4vBI+XwuH8QLa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=VhccjgxcMqxTYFrTPoOjhbaOQpxVFAq+3p5QqnNYWWJ+eMMAjzOg2m1lGB0S9AHARlQyQLvO6/dfREW8V9YhgXHwvogx7EqjutHZucjVzCtOY3Dxtsd1wFgcDErv3G+i0WVgwkFueqfIVljSiFFOOow0I6bhnzfRngeaOsNGZ+g=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN2PR04MB2239.namprd04.prod.outlook.com
 (2603:10b6:804:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 07:06:41 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 07:06:40 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Thread-Topic: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Thread-Index: AQHWX/EU/Gp+h3cxdEuFDKhh6e2P/A==
Date: Wed, 22 Jul 2020 07:06:40 +0000
Message-ID: <SN4PR0401MB359858B7C65ADC19A58680B89B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
x-ms-traffictypediagnostic: SN2PR04MB2239:
x-microsoft-antispam-prvs: <SN2PR04MB22399BE18885C4555C49EF769B790@SN2PR04MB2239.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZ2WBoKTjUiCRczBINJPXt8slJKCWaB7VG2GIiU/jcWAzvPUpQHTcqy72iURil34lyAyUTsk7iDbehuJYJWDmFoOxwxnoKpMhoL2FFiy+o15O8Fn/xzk+W0qDZfZq9rqy6Ku8CNhZMo2YhhqDHMWhQRFhPf0otxV5YIJ7SwOqcrzvf6wA1TJxVpK3uDp68xMKG2A5lfT9IgHGmx8r0tcsqbVepSMNX7wkNAC1VRjxP5YCrteQ1NJvasmnqz9bqBg9fLQlMAl4tIX6wztxcBtC52S8ey9WOwdVwSCwTjDGkZvIJX9uLcEhLWk4P94LReVU6hUp2F8/uPmtIzAPAaIZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(52536014)(4326008)(478600001)(9686003)(7416002)(55016002)(5660300002)(33656002)(558084003)(8676002)(8936002)(76116006)(66476007)(64756008)(4270600006)(66446008)(66556008)(66946007)(26005)(54906003)(86362001)(6506007)(316002)(2906002)(71200400001)(110136005)(91956017)(7696005)(19618925003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lF+WLkAW1iTv8GTT+lrWQKEw/9YFv0A2vLwi8HFMpNw2MSBWI+PnWVEZGtIeJd9hKwwQRy/HZHxu2Bfn7Sn4KsOEpudZ0WQH7wQzHmuOuPzxYIyPfNp8GlKnGk1MpDHa1qNRt42kk/Uo/RBv704eC2E2jZiY2o+bOVn8Sh9l/domlQ9896gTFJVBjan3vlqHgAYA/i6t9FIxB02qKwq2akOmkLrjsC+VwS0VIFtR59y/iUfEYYYUQjwencUfqY//y/UYcONBlWatvTTFF/OsIWCoUnulDa/oTPPdvotwB1ryB4XisFUZ2pBdUPDjG0wU7jTWywaaboZTDf9dOR1qc0/zg4jP5DRIgDN9OKil/jzIps4OsPRGaH9vjS9wwCelgBbkIR8V9Va8En/ZFPMVPcxEsw1TXOtTU3yzmcNti2d2s2vZ9qr+CZgfssA4frMB3uTF+B0CmIMZI/avQ8Vua+Cwp2suY9K0pbvHuugm122kMzlJ4n/ZzhXKyZSPGLwN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:06:40.9030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69clVlzfq5RK22/6bqsJwMAzhrFxun4DqnADjbPPMnMgSFFvB/DDmpxjSlrTkxFvCJ8XY7liRo80WXv/vIV97xHvradsQ9JdYVBFdz5AZWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_030645_711431_CFAAE051 
X-CRM114-Status: UNSURE (   9.10  )
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
