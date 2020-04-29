Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD45EC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EEC6206D6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATuKyeBz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xCw12g2t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PEDcmB0g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EEC6206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JyXFmfsW7DBJxEzmtuQqBMOSaHbE91LyGGVRwueFO8=; b=ATuKyeBz3CVvrj
	7L0TtAtRleB2MF0rN3p0f1zztkObIe9JWqkKOqWU6LYk9yRuh5NWPb4m4jRDBBt6SPtbvCuUjP6lx
	r/JUwH4/d0+VuNwKzkJNeEGrj/jv0uQuRkZa+jmo5x2fkmFS3usS4/8mi73T9ign7m8GvY8kcvNCI
	UVaZ2Y7A8WX8nLp+ebDfLr9AI5Q1jiQXLAEptAkQS/Bn+xYRROdIAcJNz+QIkpuu1L6IRGH7b2FcC
	1doVC4hzp0y2O80Y3WN2VwtRCDNbbLMGzqa4UTjX4RdXbgd4lrytHxNvdn+aU/yjrISbCOadvYIIj
	6iEF2MuR+8ZJaK+rBfyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgVR-000704-D5; Wed, 29 Apr 2020 06:47:41 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgVO-0006yd-4g
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588142858; x=1619678858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=toHCsO1T84U0Zw+/UhVqKrqLEHSsc2r8lnrcwrhu7hs=;
 b=xCw12g2t+E+MHQSUTGvch1FyApCVbJ6ioH+EETUC74Yfyrt7wD/CmN66
 LLdw/0F9bhR4sB5f4tio6xzGw56EGb2WtI3fkzEwFjjIOP5E9EUUqYdXf
 Thkq66EEMybdtqKdq+WyvfFtVT3w2pp0bp8teUVP76jBajoTFexPY5Xfr
 Ba3VNapGz/etHcoPTGltjKxCXEAt3/mlMkLTIsw5IVlhIXCle/rh6sBJR
 fcL1HS9J21o4AiC99N91NzE3CPNfrYf2sPTRjnzI1K4FWIwX5qp6aX+FE
 l+56bQ3nrPn71sUns1HtK7NVmcywyOg2DOe8fYiELpS9Lddl0A5+lSF5V Q==;
IronPort-SDR: G/jTRARKc/mezVb/J1aJ5E3Ex9btsQ59x4HorEfpNb9TR5jLTnjrrBZt8MzURqxcCBoqS2YhYM
 o6Tbi7I82oG0EJ8vrHmoR3TkoTMioAV5Ccxa3lZ6kZtbC1kLUKwlH3r+kj/PCy0aHiPp3L3+Nh
 4Wv1wnRD0nWoHWH7DrPeeZNuAQReASN6HgSzYTog5Q9cfb1+CXiw1uSAcUl3EcuaEYNQjk41J8
 VLMwrKmAi8r6KHeHrVAzd/lw4ZNXnHGzmHgmlvOJr9XHuGq8bpN9AYudv9lrcDhQQZqHgkz/+y
 Rz8=
X-IronPort-AV: E=Sophos;i="5.73,330,1583218800"; d="scan'208";a="71863694"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 23:47:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 23:47:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 23:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrQ7HW6hQUqc15XAr/Kns/VoyamZDGb4heNaIQfMqvd//OE8UbbW2jj6bgdO316RfgAFEgTCq0wCQe87R+IP8Lq6eS/TH9I0ROEwA5uSaYq616z62ZuSAN2/8ZrD2XtrBsyxK5CcW+pTzst09APfUR+TYIoevHyWL6WcSDFtNX6Chqrad3N0qgaNHLfsP6HPg4+0jM8MQ0UYu4Wf+a/wM7peLRIVzqYYYGhvBy9KVQ3Fc8zAqEUWr63BFjbJhzY12KdMvzTZIDHkQ6L6Gnk/z+g46jOrOrhlmFY14Q7lNhnQXj9iBbedPMA7aRw0fI1jzR0LTTNyOm4zeni9BFHX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toHCsO1T84U0Zw+/UhVqKrqLEHSsc2r8lnrcwrhu7hs=;
 b=NFVo/TBg7sgFtdlFJzMf5BiaFODhp5pnXn1mn448fOU5RE7nEVZAnwY7IFn9vX3HGGL/I06YtLpkK2XF+RWmXHHiyG6GZx/lq4wvXa+P8XgexmhbcTeDxYfLqrWsfihLlVYu1HMrb0gGxLnyNlKFOnZcCatl6vgSx9YvV1ib7YwM44Rt0lHlMVs1D+ANycWcX4mFdCCBiEvxLagCKqT3jj28+xoCBp/4veNayn+xFbgwQSZA8tFM6++jWAmqEIr0eQInNR1lZve3EZx+vd+MBNrsZ7rvVaDrJ0YyHUDWLeyHw/MSu1dtsJGujyrSY1XP05b1a4UdZK13rm5V6/XTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toHCsO1T84U0Zw+/UhVqKrqLEHSsc2r8lnrcwrhu7hs=;
 b=PEDcmB0g2Ddo8z1eiM5ULEh9dj/bkbDf0O37M2Npuq+uD61kvqXhNkoHEJUv1wxa8KIo9afJAy5QOj+MtRI75RIXMwlmKE0Dhps9P7OXfo69bRJU3MaDyZOIRKLl/AVvlj5+M1aBeeATdGu8iKahDUjO/a4scjxjeX+aiu85C/o=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4289.namprd11.prod.outlook.com (2603:10b6:a03:1ce::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 06:47:29 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 06:47:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00/n25q00a
Thread-Topic: [PATCH] mtd: spi-nor: Enable locking for n25q00/n25q00a
Thread-Index: AQHWHS92PmKHUd9KLEOhDzr8cmoAZA==
Date: Wed, 29 Apr 2020 06:47:29 +0000
Message-ID: <35295915.GGfv1WvpPC@192.168.0.120>
References: <CGME20200421063317epcas1p388256ada10113b38b92dca757cd11e41@epcas1p3.samsung.com>
 <8977895.SZaA0p1QKD@192.168.0.120>
 <dd59f801a3eb175afba5c28fb628bdf1be38df2e.camel@samsung.com>
In-Reply-To: <dd59f801a3eb175afba5c28fb628bdf1be38df2e.camel@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ecad06f-1765-42fc-61bc-08d7ec092fd1
x-ms-traffictypediagnostic: BY5PR11MB4289:
x-microsoft-antispam-prvs: <BY5PR11MB428927B658D2D699FD681A2CF0AD0@BY5PR11MB4289.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(6486002)(5660300002)(6506007)(53546011)(8676002)(8936002)(4326008)(66476007)(316002)(66446008)(54906003)(478600001)(66946007)(14286002)(64756008)(26005)(186003)(2906002)(66556008)(6512007)(91956017)(76116006)(9686003)(6916009)(86362001)(71200400001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLvLKEgn0gluYPyxDE6L10A9mx1bDg77DxsWIm1mKtloSSKNI7Uticya6CTmT+WH8W/LZnd27Ml7RoS7ZW+h42RcmzmT94VW/ijvQcKGK7fXFPIQBc9EvW7UJwWman/cDX9hOgVojppHra8MhMrNLQaR6v1EoS2WxZLqwgWs/SfMTtvHQqXhYnYiALufSCejE+ZEhtAN5oS5qVVKYsPI8myDjNN2BEiG4gnPCQy/Q8X/DhHZOlEdlbY7ki5I7LeLJyB8M0vHbEbfm4xFa1Y6bXeLR1S2jqc5xsgQm+Nx3ws65yUdy+wVdmP3JgGKtCzgrTc6U4X441vO3I4qQTSBH8w8kKSuDyIpgljQuW8SMsfqhtmXQDzEbL5tGAEkWgec4H+ajyMsGE9+N2SJa+2JZJl70leE0M4WhPlb2qeBI5iuxJyJgPz9NfxTYbWXVEEM7Tq0N2QRBQfUGKTJ1n2GH/zCumiJpSYeb5t9TWD9+4dA7L6TgyEd1rbGFezXOc2H
x-ms-exchange-antispam-messagedata: yfxEe8/uYJ5a9DSaRpfR1lRHyQk3fWWmYLiJfOfBNW3IVS1Maqj5HJBH+ThKDh2CGZBQ7yLUDVh+ywFkLRGEvDuH5lkzW2WvYw0IaJVAsQRhw7geroAh6aKNjnDDZj8xgp1psXYW3q2KbMoCkU4NAZ+KJYIL/HY9RqXdMfzoYH1jFFxMi1Xfvozcc3HCBdj8b0kWARjXfK9YM4eBKiShi7XhSkOcu+PmyRFL2rEUxP3Dxe8gDDLvN8Q7vZ7qSx9hrMBPesMH3RX5gtw7xPtqA6M+UFUEHkedn9m13tJ7Q8AFa2I+XPuV3hsJSkPRR/PbCMWtDZCpp7Dsw5L+0iFJup5+GyHnzX8b8cbN4lxs+T5V01MTZDUSpFX++wAFvU5srNlYSzEUOoVRn3aNN45OZnQGm5zTbCLlpcv3pOpatzcHI1Szd9w8Qn9AkV2jOrWaupZIGbgPA0O4jwhyN6s4emj6nWnvMeQchAtAftj0zTP2TGXk9YOKVSkKLnnY/b+VoplWEsC9FPPocGF64Fk2QK/NiH/NQWDf/ppA5tyUWl/uPE6+PV1N87xJtTJDM3yK5n6aR2WT7WbSfvJf/8BfUmQ1Awy7FBk8HMH9rAkMG5bTwxKuqnIOfqdJMHIpuktxrH3SYAC4z+Xi9hPnwjQL7Ebq/HpK/TJBlXKHBobLISj5Q9r998jFQHgAh+TIfhdheAlLeZkMj8pD94ueK4DDuDkakBqrgOlJd8tLClirvHyy9qbQMRS6vdkBbwWvWmoUhjws5fPeDPD4tq8oxYpPKRTsxCEGKxMq9AMr89EErWU=
x-ms-exchange-transport-forked: True
Content-ID: <271AF4947D72C742838F110FA324F0B3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecad06f-1765-42fc-61bc-08d7ec092fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 06:47:29.4957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZM9d+5EMVIax/OT9C04qdKG3egbpqLA8yzF2FDDy6t4NwJYEYScKMpSStC5eQjUJ9TnvwhQM5P4CM3U0RxbQ3PCVk9c7ICKaqNorSxPyVYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_234738_270552_885A3328 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 28, 2020 11:35:13 AM EEST Jungseung Lee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi, Tudor,
> 
> On Tue, 2020-04-28 at 07:34 +0000, Tudor.Ambarus@microchip.com wrote:
> > Hi, Jungseung,
> > 
> > On Tuesday, April 21, 2020 9:33:13 AM EEST Jungseung Lee wrote:
> > > Tested on n25q00 with cirrus controller. The other is modified
> > > according to the datasheet.
> > 
> > What is the difference between n25q00 and n25q00a? I'm reluctant to
> > add flags
> > to flashes solely by datasheet info, without testing. I saw too many
> > faults in
> > the past.
> 
> The device ID of n25q00 is 0x20ba21, and the the device ID of n25q00a
> is 0x20bb21. BAh = 3V, BBh = 1.8V.
> 
> The Vcc they are using is differ. That's only one I could find in their
> datasheet and they are also sharing their datasheet.
> 
> > Let me know if you're ok with applying just the changes for n25q00,
> > they look
> > fine.
> 
> I understand. It's also good for me.
> 

I updated the patch to enable locking just for n25q00. Applied to spi-nor/
next.

Cheers,
ta




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
