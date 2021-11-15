Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1713C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 04:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E816322C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 04:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51E816322C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j78gzj76rK9wJXElrUyo1Qhbpo8tb7nroOmc1FKMOME=; b=0XyTCzuHaX5G1Y
	3fjFQYvdzox73bE9mmf3UnNhB6WcH4Xqp905FrgLa66MAeNlDz96om6InF/Nnn78qFdrFbhy2WOT3
	v6oGxHWeECoOCUwiqv0rBGoqkgN656e7MsAocZ8hG+hgJ4odom1UITuzhCznoyIbksHEKJ7WKV4WC
	NKLUHj56BLS9YpMefE9gPovmg6d22TEoqRgendlnm1OwlO0whs2UDLasDbGryuR5WrqC1m/CF291T
	NplV7f6QwtHLCQNArf9JNrhw73y1VUG/d9wnODd4sF2hvnxIAsAaMvpuAoSNCa7Ksk0Arx8Y67Zly
	uWY7a/19yuRErGn9Lvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmU1m-00EOfL-8w; Mon, 15 Nov 2021 04:55:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmU1i-00EOe1-Ob; Mon, 15 Nov 2021 04:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636952131; x=1668488131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5Dy4W6XleYAnz819UMxMsUlYWcVO4OHIJmo8vDzUabc=;
 b=Zq+VeIAL6n6I5VoWbZuBrcHbYbv4c0dMXO5daIOaKA/0Nu+Y8TvvbFsH
 pucvwB4sQ7ZFYOud5myGh4dNESJOvKvz17wtI9zNwso4IPajC8HL2MiOt
 b8U/6CqmhIhKn4aRUlpLFBG9pwlC8mLxTbJLAIFj5ZzLWJIIEhY/TBjtZ
 1xn2xCIcPfU2Sc26F8IiuejaIIurqj7nVrRavZAKE9n6VWIEflma+vTnc
 cTGhRHWpagEW/ae98BbchCrEjcledLApvKYFRIDBTVf9tl0JhyvDGXlka
 V5SI6ZHyYwtb9RcpfWgatVSm2MGJmGfUIERTud8J6QwgAJAa0f2EhpO8I w==;
IronPort-SDR: ANRG5SkGCYfmAfp0pv+PchEl8dT/fhNKkES32H0QoYN5pNKNRuarhz3NvJca4BOgpA4yBLFxbh
 uL9SAVjz3Z37cWz2tdQDGmTmgxxy2gqZFr7IFhYMv65OdJy0+0HE7ftf5tDKtJPKlWS4InnalL
 4MDI5iwEIKsvo4Qm4uhQQ67qDPWiPME05NeAkdJIIymq+8SsEQKuwr0sSpnw5ORocWbjMIs9l3
 BuMDj+1zM5kra2G/airv8/ZDrLmRL64QF6YdRC3FCqQE1xXa1wh5WJIVKi9ro2z3MdTah6MYYV
 /NCWOpBFIs541RkTpobMno+k
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="143318469"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Nov 2021 21:55:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 14 Nov 2021 21:55:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Sun, 14 Nov 2021 21:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgtVcFG4Nakgv8dWLCwkvdnbMyXBgZFg+Tiz/I3+IwazLhdNqwldZrEzvQ+gH0Mes+KwBFFtnPL9kWXMCN3njvQ6cLrmKruFt6o7Wmv4qw8YAQ0hmd6+sRTPCYXfk/z611AIKW+n9HDYfJQQT+y+rKglAxRFkLzKquVBmLg9p05pAroWEauXQRDcMgHaVMCl9vmVfL3hvzRsRWyLABqd2jPAOQAclCucs9D0oMl1SKeccev3shnGZ92JzLEPu1boEldjZIVW07RCvEX4kJxFDEQb/lVEY7f+n3PlJXq+yCvk60Enh6R0IL2pEEMZZgFtuX/6uDirmUnM8/MQNyyBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dy4W6XleYAnz819UMxMsUlYWcVO4OHIJmo8vDzUabc=;
 b=FKOyuSNrdZ3rxjpZ8gonYh1fwg+Ig0I2sa0xQIgHN3/NPXXZU8T2FFqe870Q5YTUGSWQwmeLxFiCuTjIDhFquVW/u+sg4g5+Ay3vylJ3MjU3F4G/EFFULGQtnlf2AY2gAIr3EDPGTXzKmg4WjaN60UrDMo/3dkO+mxfcvu3fZNN5Q3OuXn0/3nMPFse0yh8+ivHhOq/peZzJEoIkYzwbeyO1Vw5OTlG20U60O8FKRUgdMezSmph/dIQrLapuLpzHXXNmCs0rOOWotA5CPvsdk9DHGDV9q5YlRJ3wG49/WQpN+UGsBmJDSmAuNLrPNRGpB8okl9sBkPWU33+RNMUKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dy4W6XleYAnz819UMxMsUlYWcVO4OHIJmo8vDzUabc=;
 b=vkya6C24h5HEagxfNmCbPDg1IXPn7+VR5Zvb7EVra6TAU7zEqkcRCN4FgxfQAUGqC//hnZn/6ojs6YeJ6L8DRvtVigWVc1/FKqNNsYXGpEAc+gxgHZ7EgS7hObqUuVE1aefXGDCEkiHnNAdjl/Cc3pz7bJ85y7cAnIl8vcYoH/w=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3389.namprd11.prod.outlook.com (2603:10b6:805:c8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 04:55:19 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 04:55:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 14/25] mtd: spi-nor: Introduce flash_info flags masks
Thread-Topic: [PATCH v3 14/25] mtd: spi-nor: Introduce flash_info flags masks
Thread-Index: AQHX2dz8Jdi8zGBkEkKIqvIN6jgzEg==
Date: Mon, 15 Nov 2021 04:55:19 +0000
Message-ID: <c933d7c3-1a31-88df-7da6-53173965ddd3@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-15-tudor.ambarus@microchip.com>
 <3ededb98250e7e3a50a7c18d43efd5bd@walle.cc>
In-Reply-To: <3ededb98250e7e3a50a7c18d43efd5bd@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f32910d0-4101-4a2c-31c1-08d9a7f41f96
x-ms-traffictypediagnostic: SN6PR11MB3389:
x-microsoft-antispam-prvs: <SN6PR11MB3389FE50CE7FCDFF0A7B35CBF0989@SN6PR11MB3389.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1mSk2icRXs2peLG6qv/NW13rNdqlJuqfI7y6/YzflocK0OKPpghenNYmPmH8GPvAIK+pOZZI8egpP9O7gc+O0lxymCgbg3ZUwycOaTwuh9b9wGEgFRN7L85gYbkTDNgcNXA6l0e6gL1psobfNG9rWtfqRdsKFtV/Bv8mc7ZG0ppMAq175dc+ic/qEewjIKpZdt/1UflHRjvB78UA27sWqmHuvJ9DQiuEv8rNlZctLPwGbIf40bRhwiqw4YtC/ODpJeUlDExzTNX4qrkxwyCJoZpciX+Tk8oe4dTT28n1OOhTycq1xCL6AqvWw2UrGdFJZdk+DYoJ8MtYHZufjNWF3VBYeYQ/6Ap//jKyu6CgnRXPA9dBE6gtmSBI7FPOH8+af5PCQHQ8prhN4rTdkRvT+rtOKrcR/tz+bMQp6aKP5yg8x94YA4AG47FfL6578Q8kgy+lofxQna+tETPceFe9OaRVGUEJDg/KuPltgUMCkClr+0K6M7HckJNMfzD3yBBFafMk2eorbG7JivfFlmWjKQryjkhV6/QlsPFKoJFqSBopi98tgd4zsY/VqRIWEwV92QU9pmvNyZ8s71H2F89x4beXkINdSC4p1d1Ie6N/0yLNlmQ4SAbYDuTL4YQWdV56shHUM+M2Bq8IJ+1AP9gXZc1DF/TGcnYcLVLAt9ATk7FOe17ZqONh7HvQzNoZBey3AXPVm59L4sDrciBIb6DRX3r7so3LApTjYfr02UwoiwORvep60k/0M+KiOp0IZiGGemYAKmYZgfTC2iIprzhXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(31696002)(66946007)(38070700005)(76116006)(6506007)(31686004)(4001150100001)(508600001)(6512007)(2906002)(53546011)(6916009)(38100700002)(316002)(36756003)(64756008)(66446008)(6486002)(66556008)(186003)(122000001)(2616005)(4326008)(66476007)(5660300002)(71200400001)(8936002)(7416002)(54906003)(26005)(8676002)(86362001)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzZmbS9hTUNTT0xsU3IwWnQyZk1mWG1kaDJ5NzRNbVNKNUdlbXRhR3kwTm9o?=
 =?utf-8?B?ZjhEcmNXZ1BTeTh1RDJJTWFuaUI3b2g0dnY5S2F2NVdzV1BhN2lYbmhCSHJn?=
 =?utf-8?B?SXVXVjNzOUJtREdZVTJlU1Bmb0IxWm5seHp6aW5pczI1UFJzdmhsVnRqOXlt?=
 =?utf-8?B?dml5QVlzTXJORVAxRWZvSmJZTDdyMGhJNmdNYXBMUzFqZngwcXpnU2YzMHBi?=
 =?utf-8?B?NzVoOGV1NVI1NkdUMEF0dG9kNXMxU3dMZ0VpS1ludzJ0YW1YNE02N05oOWJi?=
 =?utf-8?B?K1llWlZtRG8xTEdQTFdubXVBeUR1ZURDcW0vQ3FmdS84VFhUS09kZkk3RG1W?=
 =?utf-8?B?YWprbW04cGVtaTJUZ0JpelZLbktRNlNOcWR1UE81ellJREJ0d202V1liTWNG?=
 =?utf-8?B?N3RhTVE0a3YvN0U0OWNjSzZIWkp3ak92ekx3dEV0R0RqR3I4djlidG9naXJR?=
 =?utf-8?B?Q0VuM0tCSlE4WUNyaGV4U0hFcmVLUEwvMUkxaWtESE95bE15Y3N2aU9oNzZ2?=
 =?utf-8?B?NnErVmpjemZkVWFidzZ1UG9lSEJWUUt2LzViL3NsUTRkUno1Um9ja2JiM0pM?=
 =?utf-8?B?YjhOaFZrcTBvRXA0SmFJYTBaTEF4ODFtbTJlYWxaYXE5VXUwR3crTE5LSjJQ?=
 =?utf-8?B?VWpsWjJWdklDbktEZjh4WXNJOEEwdHhiT2lvUlJDalRWdHdkMXI4aURGYWJ4?=
 =?utf-8?B?Y1gxZy9OSTgvMGdNbzNQb2h3T2xPR1ZXQ2NKQnNMQTVpVGs5cC9CcWJ5RGZp?=
 =?utf-8?B?RVh0ZittdDBuYUtaeitEeldPSS9nVmx0eW81eWxoQm9Ud04xMTFvcEFnaTNm?=
 =?utf-8?B?N05Qem1OM0p4cE1zYlBUSEZwckhwTlZsZjdKZWdzTnI1cERsdENCVklmZEQv?=
 =?utf-8?B?dnhjdUdNWnRVdTgxRE9sVlZQRjdMMEd3ZEJybnFQajBnWS82dVdPdFhTb2JG?=
 =?utf-8?B?cDQrQmlQbk8wM0djNjlxTUNnbUdYSTBSTkJpSkcyNkNTQ1I3c1plaGthTE1D?=
 =?utf-8?B?TVlYRG9Qb0s0cElrMDNSbFI5bXEzL2FEWVorZmhDV29TMU5HTEFvTE9nQWxy?=
 =?utf-8?B?N3pjcjFrY1E1WG4wUmFOZzc5b3E1WGMxT2ExQVNDZkFibHB0MFdHelArM0x2?=
 =?utf-8?B?dTZuTlcwS0IwS1pnK1ZCVDJQTE11SHMyVDlsVXplbDdVRGFCeDdoRW9ObjE3?=
 =?utf-8?B?TE5TYUUvOVJjQnVBSWg5TEpHN1RXZ0VjTnFLZGd6R0RwWjZmemFPMWd1Vnlx?=
 =?utf-8?B?cUEwRTYzV09kTFp4UmFRQjlJQi9ob0ZLN2kzMU5ZWjJYanFHanBXTXNCY0F0?=
 =?utf-8?B?dHZkd3MwQVhmVHFTVWFQM1M0L3ZvTlkyVTA0TmJqK2NJaXJMak05Sk4xU0NZ?=
 =?utf-8?B?T1ZsY1JDdEU4ZXJ2a0pwREdJaEs0QXcxb01iQkFVTDF4U1pXc3JicHdwTlh6?=
 =?utf-8?B?MDAzM0dTZklDZXVyWngvZDNkVUh2bEhpN1E0dGtiVS9BcGFYaDNnNDZEeS9m?=
 =?utf-8?B?ZG9WTWRvcVBDS1QrQjU1UFZRaXhjNnY1blphUytheGQ0dDlacjlRR2FpeUlt?=
 =?utf-8?B?TkY4b3VsOUF1Yzg0bk5RZDg2ampvTWNzWS84MzZJRy9MS29VMklpbjVZWU85?=
 =?utf-8?B?WWpyNkhLYk96S3VJV0F3S0lvWTU0dUdRU0pIaXFiR0pHam5ja3lveUVFRTht?=
 =?utf-8?B?OUdVUkxTcGxzWWpsVkU4V2NrbjMveEF5WUVhY1AyY0hDYmkveTZLajRDVkp4?=
 =?utf-8?B?WEQ3b3dOZU8xaVlXVExBclNMcDh3M3VQSHc0eGNGbjVUV1F1UDJUeUNVYi9Q?=
 =?utf-8?B?VU1yNGxpM3NmS2xGbXZYRDVmWlZLTDR3Rk80bkhKS1F5b0VzbU9vSE03R3ZN?=
 =?utf-8?B?d096UWt0THdrZ2NIK0hkN1NNQnRKZ1ZJb0V2VWxNakZaSFNPTW1ydmFqSXNj?=
 =?utf-8?B?d1RTdC9iMi8rTmNpYWlQbzBScFl6VXdBYUJXQ0dKbEIrRUtPTEd2Qms3SHdZ?=
 =?utf-8?B?LzBTaWRNN0pQQkM0VUN4RDdBOGRnSy9zNWxTVTNWYWI5MzM2Y2FKRmlSWUtX?=
 =?utf-8?B?VFJ6VitGdVdtemlBYTN5S3QvNmowdUIwMUpPekd3SlBPaGFNN25mRmh4QW05?=
 =?utf-8?B?cjVwZFViUEtVTmN4UHNSbVR2dDM1N0k3aFEyaDRRN3hOQ1ZWQTd2eHExa2Fj?=
 =?utf-8?B?U2R3L1V2b241eC80dXkzdTdaMHgrcmRMUXM1VzNST1MwL3dxVVFGZnRJbjFs?=
 =?utf-8?B?aEpPemR3akdEV3NCcFN2WkQ1RWd3PT0=?=
Content-ID: <E0986A93A8D3D54C8226A954CDAD6816@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32910d0-4101-4a2c-31c1-08d9a7f41f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 04:55:19.2107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1c/YsQpm07oPqtCLLetdunx6zYCQ8pAZW+OR3h0vmHVscw73NFEYVzajcUk22nWikSSCFsj9SjbbGW+qzAb8ZOvtL9Za2nwGOG/uLvYjqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_205530_915158_AA51071D 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMTIvMjEgMTE6NTAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gMjAyMS0xMC0yOSAxOToyNiwgc2Nocmll
YiBUdWRvciBBbWJhcnVzOg0KPj4gQ2xhcmlmeSBmb3Igd2hhdCB0aGUgZmxhc2hfaW5mbyBmbGFn
cyBhcmUgdXNlZCBmb3IuIFNwbGl0IHRoZW0gaW4NCj4+IHRocmVlIGNhdGVnb3JpZXM6DQo+PiAx
LyBOT05fU0ZEUF9GTEFHUzogZmxhZ3MgdGhhdCBpbmRpY2F0ZSBzdXBwb3J0IHRoYXQgaXMgbm90
IGRlZmluZWQNCj4+IMKgwqAgYnkgdGhlIEpFU0QyMTYgc3RhbmRhcmQgaW4gaXRzIFNGRFAgdGFi
bGVzLg0KPj4gMi8gU0ZEUF9GTEFHUzogZmxhZ3MgdGhhdCBpbmRpY2F0ZSBzdXBwb3J0IHRoYXQg
Y2FuIGJlIGRpc2NvdmVyZWQNCj4+IMKgwqAgdmlhIFNGRFAuIFRoZXNlIGZsYWdzIGFyZSB1c2Vk
IHdoZW4gdGhlIGZsYXNoIGRvZXMgbm90IGRlZmluZSB0aGUNCj4+IMKgwqAgU0ZEUCB0YWJsZXMu
IFVzZWQgdG9nZXRoZXIgd2l0aCBTUElfTk9SX1NLSVBfU0ZEUCBmbGFnLg0KPj4gMy8gRklYVVBf
RkxBR1M6IGZsYWdzIHRoYXQgaW5kaWNhdGUgc3VwcG9ydCB0aGF0IGNhbiBiZSBkaXNjb3ZlcmVk
DQo+PiDCoMKgIHZpYSBTRkRQIGlkZWFsbHksIGJ1dCBjYW4gbm90IGJlIGRpc2NvdmVyZWQgZm9y
IHRoaXMgcGFydGljdWxhcg0KPj4gZmxhc2gNCj4+IMKgwqAgYmVjYXVzZSB0aGUgU0ZEUCB0YWJs
ZSB0aGF0IGluZGljYXRlcyB0aGlzIHN1cHBvcnQgaXMgbm90IGRlZmluZWQgYnkNCj4+IMKgwqAg
dGhlIGZsYXNoLiBJbiBjYXNlIHRoZSB0YWJsZSBmb3IgdGhpcyBzdXBwb3J0IGlzIGRlZmluZWQg
YnV0IGhhcw0KPj4gd3JvbmcNCj4+IMKgwqAgdmFsdWVzLCBvbmUgc2hvdWxkIGluc3RlYWQgdXNl
IGEgcG9zdF9zZmRwKCkgaG9vayB0byBzZXQgdGhlIFNOT1JfRg0KPj4gwqDCoCBlcXVpdmFsZW50
IGZsYWcuDQo+Pg0KPj4gTWFudWZhY3R1cmVyIHNwZWNpZmljIGZsYWdzIGxpa2UgVVNFX0NMU1Is
IFVTRV9GU1IsIFNQSV9OT1JfWFNSX1JEWSwNCj4+IHdpbGwgYmUgcmVtb3ZlZCBpbiBhIGZ1dHVy
ZSBzZXJpZXMuDQo+IA0KPiBXaGlsZSBpIGxpa2UgdGhlIHBhcnRpdGlvbmluZyBvZiB0aGUgZmxh
Z3MsIEkgZG9uJ3QgcmVhbGx5IGxpa2UNCj4gdGhhdCBtYXNrcyBldGMuIFdoeSBkb24ndCB5b3Ug
anVzdCB1c2UgZGlmZmVyZW50IG1lbWJlcnMsIGxpa2UNCj4gbm9uX3NmZHBfZmxhZ3Mgc2ZkcF9m
bGFncyBhbmQgZml4dXBfZmxhZ3M/DQoNCmJlY2F1c2Ugb2YgbWVtb3J5IGNvbmNlcm5zLiBCdXQg
SSB0aGluayBJIGNhbiBzdWJzdGl0dXRlIHRoZSB1MzIgZmxhZ3MNCndpdGggdTE2IGFuZCB1OCBl
cXVpdmFsZW50cywgc28gd2lsbCBlbmQgd2l0aCB0aGUgc2FtZSBtZW1vcnkgZm9vdHByaW50Lg0K
V2lsbCBpbXBsZW1lbnQgdGhpcywgdGhhbmtzLg0KDQp0YQ0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
