Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEBBC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B4E2088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onOwPiDe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LdvX1Kl2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="HqJ6Pw5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B4E2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR8n95OHt9ocB39zo28uf2FGmjSM9j4DA/dgtOSA6MQ=; b=onOwPiDebNL1Uj
	nb4Zi6YOc99nTUL+IniOtqIx1dwlKGh5+jzgAN3i3OOEaJByjBuLHexkandruR8cC8hgIX865ZM3I
	T8S0ZSvJIYsF8beNbgQvwrXefYU4NvHMp0GBIfj/szt0DNmX1vXXXsiV5fpacwA4bgQrVu7BOeEmg
	ZFIaVND0JVztd3U0be0VwO5G9bdzue59Cf53+b9joDuyxCSMIAa733TyM83N8XIkRy6azqh4jXAPA
	VFRiNq2Hn2lQA9ZW71hgJgO2Nw8RC1N9K8TiMu4wPUbiL+qUOroNbyx/B0OLtN+lfyOJg+yTCNGhL
	fEmJkVvju3So55wAbl/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDbN-0001Ak-6g; Thu, 28 May 2020 08:09:21 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDbJ-00019g-KS
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590653357; x=1622189357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wGEBuebCPd1gw8tclbdFKvdlZm27Tj22BgRcU6PnVpc=;
 b=LdvX1Kl29tGHtP0EKoWIn1T/gunJUAC5c5mPNgFYcYRiT1qTFn42lFxr
 mPTJa0ErXWjuOKvFtP1lOmqXnPDYVTEXyu1VxhhrcpdjQ7xG2wRskMTjH
 GkuGBvnrRHdhpGtWW54BJwXPmdDyMTukrhUDiHFWeQvaaFBEH75VcFvix
 WZ2hGe1wnrR3cOnF/4yOIl9KvbQwXOuP+vLdHz28K0QRjF6sI6UCYnaBN
 mivcRTjlIw1O5FStekL5v28TN0BHmAUIrLapDMCfDo0cEXAhXlBUCKDCS
 BLH35bSRSquySmvSATrEplCp3KYXjgHu2BuBjtxjqv2XOzzPwfMNjOCxZ A==;
IronPort-SDR: ITTRJftvuF5V3R5qu16ORWMPiRJEesZWYtG5DY2NKY36v48BX325BO0EyTJPEewMPelmiL988D
 CTCpPNoJ7EXDXew8UYMe3hNXTk/MDwthiiAvwvG6eYx22mgTXjZG3JjLBc9RmBUafEwRdRp2Zm
 voTjUcgy1nyeAhcqefJeJJ0oYNd5FiBy0Mc0pfM44WlgqKgsWvOp46tr4z+OV/buOcd8xraXOZ
 tVKrlvYMpffCfJrU1byf/gp/AbnLk8bSfT7qhbomacJtLmWHrBUScLYLKVYACbNGCaH+F3WLq7
 sig=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="13767334"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 01:09:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:09:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 28 May 2020 01:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arRbVXIs9Hrs6147RZUqobXLOtScxFUiKu8/DZ81brQzbJar2w7bbUdp/tHyLjqxQ62W0J4ULkDpgXjb89tr58PWt6SO/IXWGPz6Iqyqtc6slLSFZSKnK74qrcsWvH/FIFT7bBoBLAtpNWnhX56ECclzegKC+bIcwH/nJ9r3OlSr4FhDNsJw/wpIhPQ9iEAED8fTqbZoYpXsY/xTRsaRx82IKPw5X2FpaxB07XMh8j8Kf+uppMHUa8yrTrOvFBHRpwyZbhziGdY12qf03Vw+vzmRUMLN3VIidkRZS/t6O+Uo2lLGPlZDX0Uyx446oMAgaD0GfdHcI2zi14mv4a9UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmSuwrJaI/ylCnbhn9G8R200cn0D1KuodcpbaddhvWs=;
 b=SNmLM5TgTYGDVlwXWZ7cnCDuTsKcrtHiQKQoWoAWhV5pWYf5NHOW5M5BM0cZhMZ9NDimJiyOIKklpB4hTVHV3De8vdDI2eqR7drMCar5s1xErdNDf/BdKdqb9osSaunBuBLMSPeKz9PdrIN743BJYuNdIIkE0DBhBXbnyZySjqzYSBg2GzT0mpEIbjTcB1IJyFwdT6G5ov5+aQ1JO2jjfa+MFZ1gl9LWhzKt7siAq/32b8Lx77xLPLzjE5H1tR6Sdiet/Ep6hG3S+7ZJiL1rdv2jZDayRr6gpbtlzVsx+JMjT6trbUxXNhvtK3lAwJlDcvF4iGVZAVaI7KKAfP5Jjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmSuwrJaI/ylCnbhn9G8R200cn0D1KuodcpbaddhvWs=;
 b=HqJ6Pw5iGOBToAy4s9s6c4JLKhQCXqptEwlOTUkgPOZQgw/O17B2iWZsD28URrNjIKq6nuJVJ3Oz+ijFD8WksUTRHW9rzTSH6IGsVDh4FX7N7r/SWZZAHd7QOHLIGNJzyawhBwvTrWIuD7TZS4B4Voml9ZaS93EBqCQaTCDmfsg=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 08:09:06 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 08:09:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
Thread-Topic: [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
Thread-Index: AQHWNMdBaU1fqK0AZUqGhi83p1xaew==
Date: Thu, 28 May 2020 08:09:06 +0000
Message-ID: <3448072.FLBLMjMirz@192.168.0.120>
References: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
In-Reply-To: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28516c1e-a798-4dfa-42a6-08d802de649d
x-ms-traffictypediagnostic: BY5PR11MB4134:
x-microsoft-antispam-prvs: <BY5PR11MB41349F4D1AA63FDF34FE894EF08E0@BY5PR11MB4134.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9gLP0fdFtBQy7HHPZqiLg4CEz73jGEA4ObQG1FxWKAam7wjm/QTZXWuxiqQTSu2DjvHuCKkxKl3wRdYWu5adZY8TLYPIzhPzQCwchxNV4ze7hjno6lXGji2a9W/5s8AxmgTXsnlB+bObIX3tfNecglND7fwORxwhluxljvzAFuIuOw5HWAyQxlzHpMSMIGjNRw7Vd7KsXi2Ul1dBtrEinG+ZhBa6uZvvoGTtCTMwmpUrtagN1blfLulLct6VxzZgR9qe0/oeIt9BsCDMwcgD8ecQj2TCgOPy4dKjwsh94rgeemppTz7zL5oqb5Rq262r42R5J+jd0ryT3h1b/3y80m0H3l1nGRvrxKRrXvm2B5ScGCEIZcVSQssBc1GFxQ7AyBEPpHX3ww2T6XRF1I1SeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(136003)(346002)(39860400002)(396003)(186003)(91956017)(76116006)(8676002)(6512007)(9686003)(66476007)(66556008)(64756008)(66446008)(14286002)(66946007)(478600001)(4326008)(83380400001)(6486002)(8936002)(54906003)(316002)(53546011)(6506007)(26005)(6916009)(966005)(86362001)(2906002)(71200400001)(4744005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: kBcSd98FBv7+7B1oXNkaIAoXh0r81pieH5jiy7I2LAD9AnR0RoEzQur8LZNaWwO1YMYENTMpbnEs4zRZt2kcfIaCSPJZCmVGov1a0ZsfPbSgjNuwo/F6DPcW8KnRfRoDTfFIcqHZqY9CtdnRNqhHrWYbvmEEenPHGr/evNmnt2luGdzG7CV4dCqvcSE7UeHMZVEVmC7lWh8+UJ92uwSRnjGjV3RmNSjKDSxAda/EbfWqEpdZ8y7rygVIbrNPKfcZm8BGSSjUGgQFhwGiUlxoj4p5zAixDoioU3edrPxdmFnZTwNE2qcHCQyQakydRWF2GeCcja5H0I8f61rsFVODSHFEgpkbWzOcDYFMEAyEaK5X5SLLUdLw4ZMEICKizLbYn9wEUhOB826jTsRbn7zoyV/I7nZCUoUj1vMU6IdW7s/RtHmCR5cTmpynZfjRLsPl2wpLtc8KyXhAsqAtO5JPmygTRXL/r+bBBg+Iy4yuGn4=
x-ms-exchange-transport-forked: True
Content-ID: <90FCAB599F13144088A994BA79720A12@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28516c1e-a798-4dfa-42a6-08d802de649d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:09:06.4099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UvINYCaoPN9CODnUfB36wNg91NPnU+5cwCfBKF4EzONj3aHqmur1cCgEBM64UOzCtUMtbLFpUFFBXO9pDfVP3Gmg2IbUlW/oyO1jpoMsxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_010917_809904_8F554B32 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 yangyicong@hisilicon.com, alexander.sverdlin@nokia.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, April 20, 2020 10:13:58 PM EEST Sergei Shtylyov wrote:
> Spansion S25FS-S family has an issue in the Basic Flash Parameter Table
> (BFPT): Dword-11 bits 7:4 specify a page size of 512 bytes.  Actually
> this is configurable in the vendor unique register (CR3V) and even the
> factory default setting is to "wrap at 256 bytes", so blindly relying
> on BFPT breaks the page writes on these chips. Add the post-BFPT fixup
> which restores the default page size of 256 bytes -- to properly read
> CR3V this early is quite intrusive and should better be done as a new
> feature; Alexander Sverdlin had the patch doing that:
> 
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20200227123657.26030-1-> alexander.sverdlin@nokia.com/
> 
> Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

Applied, thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
