Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E193DC33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 11:51:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC272080D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 11:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HG3JXOw9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cj1Q7zLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC272080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhO9vbivLJjJPktnEDRKoq0SxfSNCTfOhISxIC9EP/g=; b=HG3JXOw93A11qv
	mPpwrvAmpvEfDgM+45dNzfTv2myOAJrgYo6aclX+msgT8rGJibHL2PuggypE3yCs0vjb1cRVzOhNh
	MWPOiD4ElhA5flBfbTrWufnCBK1wr/bnm09HSyFdaAlYbBOrF5kY+62m2pbrqCS1zTrOobZfLPbM5
	OQ7c9txDbtLAV8ZovSdXjW3L54LXvXSxTcP0tdw2zLAGNHTLM2u5SzdUuZ/NaYuwzRbPoST0Gae4a
	i2wZC1YpOz9kcVkwfYLd+ryTGK0+8oBLKWMiO4cppb772fuI5X9RAWB8cyQip9HYYHzKAKPdUkrZR
	yKiUnl5C1ehZXu+4wwMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipsox-00056o-JC; Fri, 10 Jan 2020 11:51:19 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipsos-00055g-5c
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 11:51:18 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: H91G2jZezA8PCcyfQg3raXKLTe0gBBVza5BiWwt43SyNKw7URgU9/fyDca98tucoocz6DYo15a
 4WLRd6xo5tKXKH0SPwUGLwHj/vJpxrqlihBMNRIk3ibCWGCVfFFe7sgJi0h22YgOkIYmDZsrQc
 jv+oKy60DMG4KD1ecVfR3XeoGBTAX+LBRtOLK5DHWNoChAOR6MJ9S/Lrb6wRF5bZ5VSozZ4074
 coEyV3u5db0f4Fy51KzETAjN94Ckqoel+a6PUqZVrLRJXD6LbsPzvkzsLf6lerRO0emtk8gdjG
 VO0=
X-IronPort-AV: E=Sophos;i="5.69,416,1571727600"; d="scan'208";a="64323522"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Jan 2020 04:51:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Jan 2020 04:51:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 10 Jan 2020 04:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6EUXkCb5xkVFXdKgre5R01IQw7ZUWXWNEyYsQYQqckSlC+S8zX/rSFrzHLmM7QaX8APo9qHv1e1LXdqVYjWggBE7T1eTvUjT3bOpiw/H1YMHnddfBZ7hHf0KL2TOZ9LSV+so2uuQ1pfgBLTxLupdtJX3MROc1krq6ys6j/VveKS4l0Q7wGE1luLrtHRxmfAHbObiPfZYjDRio64seei82cYQi5Ew2T+Jr8yiX/ntwyc73UsVC57SYeJQne3siAB05CEDRGR++/Bw7725C4/kVEauMZ1oO/HeKTfW/Aecaj5MCUcirXKFlqytKvqtef0AUYMSIIsOpE6MKWshREUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1tnQS+EXHeX+Y/TUIyOd+H+u5a5xFz1Iz2Oa/POe6o=;
 b=Pp/Zt2Bzh9VLn7yOXHTPmMYn4sqJBoOzjvzlU3Gk7yIYUbipY4p7oCKt8RYUX3DlvZlvvbgubLWQAAcWj9V5bFJ+6kHZma8MXz8pz0OK7j7Zdm7rqb/ug4O8+Lk7E+AHwUby7tPpFZ2lViy+rby30sxAswzAqxW2nwVr8TRbp7+608h4sXTwtTd0CVPhzjHeNJ+pXa+vnDr1/LVts556rDCPHsr1ploWwyDYSD9rjPqV5KahIXVp068sI0tS3eScmGEIlv7glYJRAZnV3n/Dkiyzpx6V8ujxiHz7m8H9k26NzpqEftNRsDZdI0q/l4/pRcEg11q8yKqa0XugXxf/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1tnQS+EXHeX+Y/TUIyOd+H+u5a5xFz1Iz2Oa/POe6o=;
 b=cj1Q7zLOuDKuUsG9Fx9h3jHenZQ2TyiczewfZEuasfSgqZ+elEwWHcbAS5PlLFS27iuvzwyVojvupwvSFkA1mcquunHnxzXpXx4L4dKOgIlKH2xP/Msukf/+kIRa1Mn4AbobqEnPprJvNAAMwulLImAVrtNnovslT85q1O78G8g=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4494.namprd11.prod.outlook.com (52.135.39.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Fri, 10 Jan 2020 11:51:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.013; Fri, 10 Jan 2020
 11:51:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuAgAAMpoCAAAo/gIAACjsAgAAFwICAAAY6AIAAAjIAgAAXB4CAAA05AIAADFwAgAFKAICAE1EegIAlOVy+gAGnKwA=
Date: Fri, 10 Jan 2020 11:51:05 +0000
Message-ID: <3245882.KdgdznRmvK@localhost.localdomain>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <6667f429-4732-d098-843a-7a030010f192@ti.com>
 <e7d782d3-2b7a-4141-e511-a238de626688@huawei.com>
In-Reply-To: <e7d782d3-2b7a-4141-e511-a238de626688@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 055b54b1-3738-45ef-ffdd-08d795c35fe8
x-ms-traffictypediagnostic: MN2PR11MB4494:
x-microsoft-antispam-prvs: <MN2PR11MB4494EFBD4712B58450ABFF54F0380@MN2PR11MB4494.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02788FF38E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(366004)(189003)(199004)(4326008)(478600001)(186003)(6506007)(81166006)(64756008)(966005)(53546011)(26005)(71200400001)(2906002)(8936002)(66946007)(8676002)(81156014)(76116006)(91956017)(6916009)(66446008)(66556008)(316002)(66476007)(86362001)(54906003)(6512007)(9686003)(6486002)(4744005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4494;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TynSgbooXQ1INPlB1cQRKvgjhlvu0Hxd+zdsQTbjXdTCBm7U6Go+3kU8pZMZOpa9y5mWQybVxASuRJvhyY3/5LN09jzre46WFdgUIFAD3QVd/bxCfOa/yaYdcoEQrg9IjrZtg1kZhqN2qLzHKmaeQR40EpuY2+knujnJhwoPyxzbRqoLs6eDmewKh4hqvCnnpNkdWLrius5VR/6amT7y+IA5yWgl5dpbIa2fyDFY4O0jwyhPuHI2b19cEBgkPmoVaEqVYR8hAtjbdl1XgAGc+llQ1Tc4TNZpCQkIY1J9j2fP/TuWRtMcorJEHnDvbAxDnpEgHyWPXPENiawTBgIEjN3ooK0mJinTpzYA5FXbDwM6UIe4ORZ3TDQQPwaeLcZaorRBtdrf7kcP5jmd4jsBO08pjs5gEnZn/fZop9wDtfkgUL7yr5djcZCnYnHZqV0/zbqvlVsv3k7psrKs4Qm5rYl15Y8V3CxrFLwLdHxRZEc=
x-ms-exchange-transport-forked: True
Content-ID: <7505A18757A5074B87942590AE25D036@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 055b54b1-3738-45ef-ffdd-08d795c35fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2020 11:51:05.5451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3YZHDUw+3TsbcrLrgJGyrsZ2hoxuLDykLylkgVeBRiXN4vLr9rIzTRR7RB0P876+9CMb7qu6QnbS175PQF+ji9JEjGndqi9s6b4dVfVNAFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_035114_369141_CD307CB6 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: js07.lee@samsung.com, broonie@kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, fengsheng5@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, January 9, 2020 12:36:11 PM EET John Garry wrote:
> Apart from this issue, on another topic, is there any special reason

Ups, I forgot about this. I had a patch for it, let me find it.

> which we don't support status register.BP3? Is it that it is not
> adjacent to BP2 in the register, so makes handling trickier?

Jungseung worked in the past for adding BP3 support. He have just sent a new 
patch set for addressing this, feedback is welcomed:
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=152401

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
