Return-Path: <SRS0=lNmR=2O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A45C2D0D0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:03:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEAD920706
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwl20M0Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Qm8JRvho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEAD920706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nlx/QR4ui3ZvBQaKUJrpHFQT/Go7qhaxkn3L8zuU+M=; b=kwl20M0Ykch7Ji
	LcbvSLTshB4etOGTqRs734sf5i12rshGxPZUmmEhbFMjBa5FoxHpqwtWrwdh9Rfwz2MHV8o53TxHz
	LQwJOjdxmmUtUDt2wsEQsEXiMK4vReosii2I7FVg+4yOgcOvlrsagpfzn5qOZXV4+VIylvx845BEw
	oKulyo2z36aQDqHk/HgfbhkQQq2KV3NaYIMMyV2MBwtG/f+hUq1yR7PvzcQOPt5QdNSQHhrKqglYk
	bzWjgmtafFDvd1IG7C3n34yvPssoSRVBtMLWcXUNzz5E8/+Kn4YfK/95fBdyEF4xvhihnZSaub5Xs
	LHcxghpKJTUrTkecQo2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijg6S-0001Ee-Rh; Tue, 24 Dec 2019 09:03:44 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijg6O-0001E2-Qf
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2019 09:03:42 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: vmgGGbjA/2VQnWyDYASgptGGPqn62dkHbQ9WTC3DtISUFDKF3xPsHPt7oEmPApTwquPNbth421
 hc7GrkY2r6gWrkGzwOnFg7Fb2YTpkpSrsThCy2OWuU94SFSILw5G9dAauwXreu5TSw40gO6G1i
 ZlLqIJZILgpGNafB8wsGFzw6QkbXPFo8CpZLj3FZ1AHBmlmU9QsOJ6JxFb6Q4h+8pmEJCmlYnZ
 +Vosw7o2PlCdvF42vOcWgjA0YmLc5jW2TcBjpcK9sFvHauBXo9OxbackHo571eYRg4wrtJu+mw
 Xh0=
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="59467397"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Dec 2019 02:03:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Dec 2019 02:03:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Dec 2019 02:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+Y29vPTVErR5/9WPe5x5wduxKYFqqcNY5mqcwurTzOun3SG90hFuwizNvIFkwcJpesA/t0m7NAQwzU3kEuKnNPQZgZSuKjQxWYoEMxzmMmWDI88rZbmKgeYSqgA4UkR7q2HUj9aEYQJSCUWYxnhdAgd6iNKEtqEagc66O1TfjMKKxxwjBoYe6cHw8VCZxtQ54Ifqv+D7mm6UM8z1wJXXQEhbmoFksQJIWgErt2iIrksV9W3Cx+qLUYccrb5I16UiD1Vv1g72A+cKRjdLXwqcaCZZJHKkMYI4aWvycX1ISZxoQMPGxaGZ9hDWEt9mIZBONQSUlTsHhTBK+0ZiToxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKNIYQrg5z2B2zhCFSHE2HQ1m1uqIDqJl6t3OV5WdyE=;
 b=KodEoxaD7558H1h5EHvmSojBsR8JvVao3teqloR5zKuXaaF8MgJP0GENt4H1QvIL4M6M08H/6FXgD0GpwTMd4cQvitUSeE1n2N/+1yTElJF1SzJq0Wqaqg+i4KwWCRLRJ3e+gWUk68MByHke4eetEuboqColV4zlO0U3JaslBHoYeuA8vmGDgUu/jjP4eyESlVvM8VCmAmuKjEs/cecS/DvAqBmoVuTyhe8c3oWLFBvUlWQaeEcJAeRrqlzQWfYpv7IgAOAtDdUCLyvM9gS2/EkxiK65w8dXsBuY6xIQZgYVYwMYl777qp9iV4QtnmqFidshThbQvSId6FB88mpzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKNIYQrg5z2B2zhCFSHE2HQ1m1uqIDqJl6t3OV5WdyE=;
 b=Qm8JRvhoXwi68CzZeqhpXIlTsbWxMp0jdgHFMKKvWO/QlrQ3ITnH22nHrT6ckcrCG8ognuFk3FlMSPIw2cKoZVmVpQ5rkLBapKqgj1NQswo3MVoaEEX4PZAWeDHQK3+tyYlLy01cp2fagEf+x2M+H+2tjTJBKh3xBTidFt/Kxfk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4141.namprd11.prod.outlook.com (20.179.151.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 09:03:38 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:03:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <js07.lee@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Rename SR_TB to indicate the bit used
Thread-Topic: [PATCH 1/3] mtd: spi-nor: Rename SR_TB to indicate the bit used
Thread-Index: AQHVqNq9Kv5DT8VgEEiaY6d62avQAKfJIFiA
Date: Tue, 24 Dec 2019 09:03:37 +0000
Message-ID: <332e88bd-23a2-dddf-9d4e-acec89860728@microchip.com>
References: <CGME20191202063518epcas1p2ef94da5925a0381da565bb5c66610415@epcas1p2.samsung.com>
 <20191202063507.21311-1-js07.lee@samsung.com>
In-Reply-To: <20191202063507.21311-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d7f99d4-b329-4b40-21fd-08d788502a32
x-ms-traffictypediagnostic: MN2PR11MB4141:
x-microsoft-antispam-prvs: <MN2PR11MB41414EBEFAC783540ED40203F0290@MN2PR11MB4141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(316002)(81166006)(81156014)(110136005)(31686004)(8676002)(186003)(2616005)(6506007)(6486002)(26005)(53546011)(66556008)(64756008)(66446008)(66476007)(86362001)(76116006)(91956017)(6512007)(66946007)(36756003)(71200400001)(2906002)(4744005)(31696002)(478600001)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4141;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XOv9pAK9ytM6Hqg197kqUkp1ax5P/SWfY3Mi2rusI822PWIgCCuGfQZHyXV9Q33bqdchHspJBysS6mOqHRptLGyl5Z2CdslK681Ujp1npUMihoFLR1dHQoV1sDXFNy/0RU6kJTXYZZR415bZKKk1Gr/KZ6UObE4YvSsltznflUwB78kFgOU6TP5nVWhEcufM6kX9bPCuKwx9I8o418knZmpKG8WpDzW+ehtWfgZIUx5ZaQyC1yoU33wl928w4DnA/76DCQYy3eBC3mvXGPdNJ2A+lXzQyqWiLh620pHddbqjRvobmCdHIrIXppuY2SDSQWkPpCVN2ht7M2MSiZVEQuhnTC4TDqWWNZEVWk4K0AKfzRSBZu3gSKPhbUmhN9tAOXWrdobLRiN+F7iuOACLvFzp6sacq5g43C/Fb8cCZ4qKGo9mMVsvIU0RYgxg2i7l
x-ms-exchange-transport-forked: True
Content-ID: <867C241DDBC735418FB11DFD532EC824@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7f99d4-b329-4b40-21fd-08d788502a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:03:38.0915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KiBiMYRlaHanH7Xuu513orwdVerGClt6j0tfsbX05TcYAFDcBzHvD3y9/SilI+yeLUWNUfCUp3jI1z8duZwWrfVwpKxO2EdDj7O+U3ypnV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_010341_574323_B016247E 
X-CRM114-Status: UNSURE (   8.12  )
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



On 12/2/19 8:35 AM, Jungseung Lee wrote:
> Each vendor uses different bits for SR_TB of flash.
> To avoid ambiguity, rename SR_TB to indicate the bit used.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 10 +++++-----
>  include/linux/mtd/spi-nor.h   |  3 ++-
>  2 files changed, 7 insertions(+), 6 deletions(-)

All applied, thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
