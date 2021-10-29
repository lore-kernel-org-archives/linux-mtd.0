Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA38C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB2D60F0F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AB2D60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYZtmObaTBCtkxqEn5YsVHF+7NRLsZ7x4QPSwVSEWSs=; b=WodpsLiZ4KygJ6
	401cnFKdXOzfMQL7qKGJkRTtLtpVzfsyjTC5gySJJ93OVNBiHLYGJEZ2dfK8WNBDIvOO1zdhVE3Gf
	dpysPaeInB6CBRW/6t6edlMN74ku7jT/Pak5VCgSUlTqE6bqMsgd5Ss4tTKw5CLhGqHJJL4FmIgUU
	yCsduTeZbyn5YbCllY7eb+VkISjZWLnBTEWQYX77nxLsY703Mg9rI7DmiFpOsQg263DwBB7kNYvfw
	ep0mPl2YNlqNJsY24BwlUl0AoSEK+JLFSX6ZsBD2XJ79EFr5ZHq4QWLLbPGcIjJBp3Mb2kybVbtY1
	c1xujv+mBGkl4cN/FoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgX1w-00Bsa0-GM; Fri, 29 Oct 2021 18:55:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVjR-00Bad3-Ch; Fri, 29 Oct 2021 17:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528718; x=1667064718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S0GjJEd5uIQxxBSIcjXxqaKs4is1IJ8Epp36ySRrAeg=;
 b=HDPDdXOtmYsv0C2D3gTsueoqC7S3akAlxSoXBGoB4sAKBe0Yb5FLDj+Y
 kWvTYscxBAAwszoTBJNCuxGQQhvxZ25c7e57RqTUeDEstDE+/zP7xhAY1
 oGps/EAS5JLE3Z8D2gvwqc3gxw7zPA6yUePV3O3Y3UowuOqk4SYIFFkPd
 0yWLwzh8eBZodDVoHIfrw6uc3uLkqdJWK7jL4vdWgL3pRKFeqpUTYs55v
 +MW6qQn3eG8uAwpqVGbFwuos6mg5tRD76uFx6HwRC336rQCmmZMCk6E/I
 ZJgrDdjthLhbxqh4dLvExHMNLeuCscZD9+Q2q6PaNZk85854ciyb0BgWs w==;
IronPort-SDR: W3lnrExyvmnyrib+v7pwv6USoy6PD8lGfQKFYy3cTgkXQsCnkCN/8eYMkwJUVZIxXZ41j2vM+m
 xYP7/soicOP/Vplg5RZQ5P94yNGAP1kQyBVf/EtUp3ZFzeCVOfgLGlrfD/JsfmeHYpgAN3zCCv
 1wjm0g9b8E/Ecf63J024yI5McD7/FHsCXIdegOXRvlMi5KFhmm2dkY+ZLK4VqpvrOqShyGGBRg
 Q8pb54nHdYNT5S32q6wL5Qq1AASRZyxC3Oa2rPZxgYfEAqPVnBvaj1ykXQ/5R3r4ze8Kpuornn
 MHbDkFSfKwrM8/8Pp3nE1hmp
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141587345"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:31:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:31:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 29 Oct 2021 10:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiO1tWRxkTwhOQaJ2ThQRIipgqW4pSRRbIcWyOJqp395OtvrEDgpwnIWl+lY/CQMojUAO8DvqRE2k26i/QLCqZ0GR9PKNYgTZErLgTTSdIKAi38URIYc4jXgf08tN0byiGleF4TgBWKbIw148O5zTEKPqw9H4/sT258sxoySllK7OSsVq7PkNpvYw+z9xp0zN9YbviyjRUKlVpOsFVamBDEDov0uYYy7noQBVDv+evGTqJusLNCzF2speKDvv0ghu73mRHUCz2s53PE4n66MWFtpYdigBJx1NeYMIsJ1K/qW9+4iF+FTZs1PAqu6DbVTb2mlMfFlKpAL2zF+//j00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0GjJEd5uIQxxBSIcjXxqaKs4is1IJ8Epp36ySRrAeg=;
 b=QdrGC61LmMgW3G5VqZE0m+fAKgiTZSW+tiQEQnuMNi9siV5iiLoQ9f/FbNT2N9FmKycEBb5jjEirnlCH3enqjbHAsIUqHBMDVYa8d1f9BIz1Nof1VamUnIVgvQLJzKmPOfprnzJJ7inoKB9k36ETGiNdcbkinMjnCmFgOj1mjEN9Jhdvp8Q7nFVOpm7ciB9hDSAMvGAxyq6YN1nG3TsSaZfg0FXBMEQd3cguemRPgoT0t00oKiMTA/2UudEJYgu+DRbDLwrHV1o+azIKo9BXVKix7lIoAeKhX9RysM7T0o89PSYedor1rMQIMxcLSLttxkzIeiBqYMCHIUgKZoU4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0GjJEd5uIQxxBSIcjXxqaKs4is1IJ8Epp36ySRrAeg=;
 b=nVpj8gElMQChOOAzPMoIDQANVddPn/t4hvmdqs+cYMF/SMEl/ip54TjsB0a5CeORdOisgg4m7ppRE9v+O39lwEiSYbxa78xjPctDzh70rWi2IkgerYKR/88gDHUZ3j8xxXOA64SA/dGmrMZTzZDvqnQXJYDygfSxrXZHwEQJQ4c=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:31:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 17:31:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 21/25] mtd: spi-nor: winbond: w25q256jvm: Init flash
 based on SFDP
Thread-Topic: [PATCH v3 21/25] mtd: spi-nor: winbond: w25q256jvm: Init flash
 based on SFDP
Thread-Index: AQHXzOrWRt/TiwPVTUqupooTzx2mqA==
Date: Fri, 29 Oct 2021 17:31:42 +0000
Message-ID: <0ea225ae-18ca-7cb8-1a15-7c70acb4d531@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-22-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-22-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad80a6fe-340c-4e30-b66b-08d99b01f8d9
x-ms-traffictypediagnostic: SA0PR11MB4607:
x-microsoft-antispam-prvs: <SA0PR11MB460745739B2886B30AC8B632F0879@SA0PR11MB4607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWPd0GE3Y+peNXiiIzg+TrgPW9QY6VQbPLI2K1lingjC5w6Lbxxu5997h3zwsJSwcePHLqs1LLVdpTPq+GlvBRml9ZJmnoLudr4D9+1O/LK7GwMcTshBaJ8H5s9H66e+Sg1Xi3Bgpmnj4W6yt98XVR+mDl3+08tq5tgDoFLLf+4uH3PigM53tt6iRy7LN3rtm9wJEsLWoiVexSm/93hvVwe5aH1q0jh4p+5WiAdKk+68kyXh8d9JwNefOGhlO4XnCZ067ggQyxTEg/avGBOwfu30S1O+/xt2gmyTrwkrL1y9YkjiM/m14JoLQZHNXY19KFeN1Z70Dir1MZdK0FAfIlIB7pAeAb3jfHwnMhm1KvCYi7yweWZp+BsTPwGgmfmyUGPY7QgGKCcUG6mk19jp7SsnLreWf5UXOHHkxMHw29P6qxzLygJGV+OJZZxHAOdNk6I4MUjKDXy4N+xgpUMbDEWfvTryUEkT0LSuskdwnjV6Ihat6sAfLAJtdRyiTZJ3bErlBsYaR2FEoxhLN6xZzolTDVTVE3sc/4sZto6x9YjzZp7pscxNR1rsovCR4nwl7Yv1InHLTKhB/ZEBhkO1pNU6Kugnx7wqspCGcczFAsx5iZnhl7f1/H92bAVAcSGEL350HJIPFl5geW2uxpKK4yZ6YaADW8pgpqddViOgphovdcfoHsjaoLUtgun+T2FWEPCynFUGe/mo5GPfUiJagRPrwbwOV1nX1zucAyEDhfHmi/ew4Uv5XI9lcVbEhfwMsCd2GQYt+7TRpJP34CQNpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(2616005)(6506007)(122000001)(107886003)(91956017)(66556008)(66476007)(2906002)(31696002)(86362001)(31686004)(7416002)(71200400001)(8676002)(316002)(5660300002)(38100700002)(8936002)(508600001)(53546011)(26005)(54906003)(36756003)(4326008)(76116006)(66946007)(6512007)(83380400001)(66446008)(64756008)(38070700005)(186003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c09VN2JIMi9oTjBCTUthdm9GTEZTSW5jcFNnNnJyeWhwbHJleHF2TnhMNDQr?=
 =?utf-8?B?MWlFZFRyb2dkUnBwd08xMjlvNGEvb0RlUUt0WTAxQTNwTkkwOStTTHJFZWtx?=
 =?utf-8?B?UXV5Q2JnbFBYeEpJVE1aUnlPZ0FxbWgxV3psVkNsbEsvQWhWL1lFcnk4T1VK?=
 =?utf-8?B?NHExbTZTaXJSMjJmR2lPSm1kZ1JHQkY3WVk0MVZ2cTVoV0NuZ3hhYXdmaGlS?=
 =?utf-8?B?VDQ1SVZQMTk1cVFVUjRCeFJqSG4zREZqVjA5QU1YOTc4QlNCMHk1Wm5lQkZF?=
 =?utf-8?B?VFFEWEM4cVhubnMzN2Q5MTdJQVM2TVFjZzBvRHlra0dRNUt0UUVoWm0xbUVL?=
 =?utf-8?B?WG0zR1hBRjBzNURvVENjVjBLQ0wvTWU4NSttNVZMUW1LNTd6OEtXaTVYNm84?=
 =?utf-8?B?alZmc1BxZy92aG9JZkdhTzVtcHVSYmhWQkoyMXhicWVSdlVhbk5QRkN3NS85?=
 =?utf-8?B?T3ZDZDJ0MXhuRmNBaWpEWFZzemNuV2U4em1NT1RkUHV5a1loU3M3L3lLZmN1?=
 =?utf-8?B?N2JCV1FRWFZ6VWtvSVBUL1B4K1JrcGhjZUZjdGJsQWxaRFZPQW9ZTnNpY0tv?=
 =?utf-8?B?VTR4SzFFMzJyeFlVNWhWQk8zdmFMeTUrVGk1WnRUR3Z2ZlFqN3QvY3FVQjNY?=
 =?utf-8?B?OUk5UUt0eHdEYjFNa0ZPdjFTL2p6NUdESC94ZGU2eHJKRjRjaGxyRmd5SkNx?=
 =?utf-8?B?U0hSYnZkM09pcDNIODJXQlpKK01yR2xYQkdCcmF1SWdMVVBvZFR5UE0wRnRt?=
 =?utf-8?B?SUpwT3N5cjFXVVo4SGZrUytpQ3RyekJpRS9SNXNMVmFqSm0yY2hPRFdSNmlT?=
 =?utf-8?B?bjZraTFNU2laVmNueFV5Q1NOalZQdGpqL3hrRzNxMTFvUWZXd1V0SzJTeXVk?=
 =?utf-8?B?RlJYakV2UFpkQjFLcmR6eHZnbG1DeGN1dDZ5ckhGQTlKM1l0NFdqdVFRQmFm?=
 =?utf-8?B?YzJ3dS9hVGFaemd3enovOERXWDkvd25ScEdvSHA1U2lqN24rUGZ2eHFQREVq?=
 =?utf-8?B?NUs0SHlXV29zQ1piWUtIdXFhWk90cy8vZkZvdkZDU2gzcDBjc1ZmK3ZydjVZ?=
 =?utf-8?B?Y296Mi82MEV2S1FkS2JQZHIwbkxlL1VIeDJpREU3SW9YUFVLY2tYOXM3R1o2?=
 =?utf-8?B?N2JRVDJ4eldncjhQdEJ6eG1wZDdCdkkwQzVPWEVteEdraXpmSWdCTVgrTlQ5?=
 =?utf-8?B?MVFzQ1EwVmIzVzl2Y1A0aVhEYU5uTmN2MGFDV016UHh0MlpkZXZ2QWd6UXhu?=
 =?utf-8?B?NFYzMnRiOFM5QVo5RCtvc1pYSEdJV05GTVpyVkh5ZGR3b2JYSUtZbmZBMFdG?=
 =?utf-8?B?SVMrNlJINWJmcEN1bGFaUkVKalNTU0trdUs2dUNGQnJtV0NKVHk3SHdqRjBt?=
 =?utf-8?B?NEhjeWo2aUhsd2tGWXQzQ1I0dFdwZmxMbVY0a0hqNlF5TmM3NU5BelNST3pB?=
 =?utf-8?B?THorTy9nakppYWVmVEtmWkN4V1grWDdMUkFBVXlaSUZPSzRCT1JhSE1PNVRL?=
 =?utf-8?B?emRnKzJ5NzNWSjlIays4czNkRzRoRGhNMmNOeTZZRGk0VkNxMWpNSFBQU3l5?=
 =?utf-8?B?OWE3WVlrbUhFS2ZpcVp2M2dSTG5HS2lwMlRqQmZDVW1PZTZHS2dVWW1icnl5?=
 =?utf-8?B?SU41bFJGSy9kbEl1RmNEV3UwajB5S2huK0p3SWtRbUN6eXFoWDVZejB2aEoz?=
 =?utf-8?B?ZmpJbEpTcEJQN0tPei9nZm1wNmo3TXhzbjB0TjVFUlBSK1VQQmM2YkJKc0hs?=
 =?utf-8?B?RFUrU0RhTGVocTcxL1VtbmJJMFNmUmw3UjFkVE5YdkpqVUhrOWRwSUdWVkV0?=
 =?utf-8?B?VnRuMmp6UDgya1pJZFpYVVBKMCtCT1JaL1BpUlcvRTBmZWR1bXZmc1FmemhX?=
 =?utf-8?B?MDFCNW1rR09mV0JwQXJScS8xK09hbmllZkk4NTVZV0tWQzRCQWkwVGNjKzFv?=
 =?utf-8?B?aUkzQ01JQ3pLUDB5QXdhWTExOUxuanVFYkZTS3czbDdrQ051QWRBWUxmOGNx?=
 =?utf-8?B?QWlkTjZTZUhXV3N6cHBiSm05R3BjTUpkQVRZc1dkRE1vdXVsczlmbGF5VnJN?=
 =?utf-8?B?WjNjT3oxcFZ5c0psMW9uc285Y0pKKzU0UFRnS25vUmNtOGpjcDUrWkdtSm9k?=
 =?utf-8?B?RkNLRTRwd0czTFgwT0J4WGpXUjZobzRTYUVrRFQ5ZmcvRUVCU2xqbmFnQ2l4?=
 =?utf-8?B?SjlqMTRzbXpXc1J5RlpQQ1daUEpRTm9PMXd2RnpYcDJ4aFB0R0NpUkwySUJx?=
 =?utf-8?B?ZWI3ZlI0QzFrME1kZ3VJSCtkN0FRPT0=?=
Content-ID: <D9E10226DAEC1048A92D87A4DCB118F8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad80a6fe-340c-4e30-b66b-08d99b01f8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:31:42.0701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kl2/+t4UFQxR0aRUYejgjyIX8gRyP6vQN/E3e5EZgCBdxLSPqyPPiVZvCYGixlObJBtglKJtuPfrqpOCFcci7H1j2e26T4XcssD2ib23keU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103157_526145_2876E80A 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Get rid of the static initialization of the flash parameters and
> init them when parsing SFDP.
> Generated a 256 Kbyte random data and did an erase, write, read back
> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
> for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
ef7019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
winbond
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
w25q256jvm
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-w25q256jvm
root@sama5d2-xplained:~# hexdump sfdp-w25q256jvm
0000000 4653 5044 0105 ff00 0500 1001 0080 ff00
0000010 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000080 20e5 fffb ffff 0fff eb44 6b08 3b08 bb42
0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
00000a0 d810 0000 0236 00a6 ea82 d314 63e9 3376
00000b0 757a 757a a2f7 5cd5 f719 ff4d 70e9 a5f9
00000c0

>  drivers/mtd/spi-nor/winbond.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
