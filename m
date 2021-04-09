Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5A6C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:23:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE57960FEE
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE57960FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ud5OdcQY+3agwkc3+2hd+5hEBST/utttJHPcWT6T9sE=; b=AXnDzgwMWowYOA7fTkzNyxBQD
	+xMF0xyddBhVnpFG5aS8ktRRYX3m/0KZP28UeDreG7C/d+Kb9toiAQbuKO09nW2qxvau2tNhCygxt
	raXoQzvV+ReRBlaNH9JUFToSHiGCIOmNM6k+jC85IfbcuZrFPNoJHWyHctca74ymIbvITgsU53hFb
	mVJeXcT+aIA5y0ToCZjvf8RBXVbEoNPVI2YMN37JW/t8V5HzLkC1bsD8Gx7zCRhtdvCXNSBwllz+Y
	2Ac2o3VYrxRayZEo7ZlETqSjsttpZ+FhQma+a1KLJng0BsMa/g3ZxhQ+8wK5NMFwsP7DkKxoOSaEM
	jz8jvlLFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhiS-009ppL-Pm; Fri, 09 Apr 2021 03:21:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhiH-009pnD-Vy
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 03:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617938501; x=1649474501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pZuGYAM/UwJbP0GoHu+wJQt2rfCAyTOHR7LaPVYEztI=;
 b=sUt+uDzDuZ1ouRcK1h+8+j9Yq8sMH2TcGys3NnHCTDTMEQE3oQIQMxMX
 INVMdDez5NgWiFj53J02F6rQNpIOeZu0YpdkxOPvL3Jq1Pst1G1rHkOTK
 6fe/J4nXqIPXdRnbVdOu6JTDYkmeCkYkU5cCgYSyxkuHNLqBfawfj8ZLi
 KXLWYUQXQ2uIuweYPhCAPlbu1S1UhUmN11c2YHagtsGtVb1qjW46L+F0i
 panklaOHZTP1Aev1QDLgMyb8MjPMy3EeeyHn8HIV4q0+JiNclXTWxMiwK
 BHSOxagAzeSNsmlk3zCMa+rJTR/04GyNuJ6eRk0ImNOUimxst0VtxCFD3 w==;
IronPort-SDR: V40F4XZaqD8eRR8fwXDkhWMNO0siFUitavIPqozf7k+6jvPwaY8MB7tC6BACSZGInmbm+KjgkW
 S4yh4lZ74HwnSxlqOXZ6ptmKXZAeviz0FP2BxLsVUvvu+GoxMVFqBwdZv989CqHlGThem4LkIW
 D3jDXo+Xyc9GMsad/jFOeavCKjoDQulGRR4qOjSCgQZpcjR5wDijyhMsMyD9eH55YQ2W0RJ2Uv
 sfskWQqXgKU3g02zgwbO3DWbD5e0V+LRA31EfVANAK4EqkX4G/jvPmLlCxkYW4Dk/2pZ7feAIs
 s6g=
X-IronPort-AV: E=Sophos;i="5.82,208,1613458800"; d="scan'208";a="50533264"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2021 20:21:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Apr 2021 20:21:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 8 Apr 2021 20:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzRcyZtlqxJLqxhCScQHW/jmcqeqIdFYTW/ofhbGBCWGn5BPR4rOJMCE5DX+MZC1HGURAFzfA5+BOMVqrVSSrucymoxqJ9OOaMcdbA54WGpYObCz2K9tE45UzrrP4TOaGkgNrwjXe9xpDJ0YutRYd+9lkr1Iu+yzB+qETJ28EKofualpyk3piKiFNrLvikkkC2oJPXyy+VQ3bIC51PZ/1s6r7VRO8fiAylFZhCqqMA0emp64fvZbLtQGO+3y9AlECvJDQJy06TDZ4Vbb5t1MAppjuW7sNmq/H6OrsjIYAp97rzvCJn3x+BFgNeNEE7SnNkJ1bS4TQ++iedGl7fP3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZuGYAM/UwJbP0GoHu+wJQt2rfCAyTOHR7LaPVYEztI=;
 b=MV+RbkrVQP1e+hywzf/E0//BYNwZNyVXOaSVldFnJWEXoPlsbcbOSUFFIF6UO96A/NE701cAvH2NaN4m9f6zITk4a+yAN6bFqV3ZMf+LFBvkHOkd5+HSeePgk5MwlcBUh/ivGH8iDBZ/y/adx8m/wWBZ82EQQJRBFXYdct4b0zqXmArS2hCgYnEabMnLLwA0Cc+MHVHF1v5lCfunAMin0OOEBtAiD0V2vxHotGAs1lLWWhKDw3kS2L6aM0Ott0K0CE/p22QuQxTl2uOzP4oI1s3or2qoFMfBbZ6ef1ApPF6uHWmeREn4v1QI24+SawkIpjbX1gQPCnDszO+MrK+8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZuGYAM/UwJbP0GoHu+wJQt2rfCAyTOHR7LaPVYEztI=;
 b=E55SU/1xBESLAcuwT0RPUp/zYaP1e76v7kq6/vHVcblH7e/ccFWkRXjBLQJuiZ89oXtCm6S74T3E1KlHgNP/beRj8Vkc0nVDKv/dwdmdpLQEgqIffRH9uDOwSHJjrA9LlGYtghYlyDNBajhYkuuk01FYB3g/mHW7DGTiR8muMys=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2735.namprd11.prod.outlook.com (2603:10b6:805:60::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 03:21:38 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4020.020; Fri, 9 Apr 2021
 03:21:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>, <p.yadav@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Thread-Topic: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Thread-Index: AQHXLO9zrsin2tR3IES2teSB3cSkLw==
Date: Fri, 9 Apr 2021 03:21:37 +0000
Message-ID: <a77d9b48-e7c4-044f-3c14-25bcc817b43f@microchip.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfd63d68-6ddd-4b77-c3de-08d8fb069613
x-ms-traffictypediagnostic: SN6PR11MB2735:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2735B16D4BA11D8855689F6DF0739@SN6PR11MB2735.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0sWUg97Yw6gA6bKYzYDVkar3Cdza0xoe9hjcHXuZVV7VpdodfnxUWHjxgnYin5qgO+nE9w03pAwQ/JgaWWqRnbP3RtvHusYUh9Rc2nHCrqoOxEySjZA6DjB8uXRg91+k0DdhUmOwG9ObvAdJQXPSVc4nSWZhsO5XatbbqlSCIdab73l0dp8GeMOruDyWfPDRzlP8pvMe3OVBJ2KZ/9HtNFucuAbXFv1NuSeEC12JG8QH8W0qe7cp0eHUwCnQdtCjtYfTpuW590DqXPF6RrwMOmbpOkxmMVlP0im+QJCehR1/GkvHEwMtSKVOnwYZPAtP2L1XyxrJcyEpJpLhfsOVqi4RBlpVP/wZ/SPN7WcnfVFrEfjcfya0kTcXWovNxg6PynUOArLNkTMK34AabR0oia3akLj2Zb1pW+9up06ndlujGxxhBeUD5ZTPqg9l1ZVS65Kbi40a1EUiH7T2fgbUq09SJDVHG8kt5+/nLB/Gv+GBJJOGItQ0vXbEqlRFt1bgHcLnvWiAKkizscIlxjEUYrzU1a1v9jkUNJHKYQK0Oj+K2D/WwMveoWWrqEsSajR2SXWHv6oEe4MuKHDEMVMp+XGjdmHW5tJwohPU1Lado0yKqtt5BAy7Tf2W2FgH98o5l4Lv1631Uf3ILb0xsjo/zb9H/a00/8kAl4+Ieyq+1phN+84YlZC5Se93Yqz4UERLuJQMUBzJVZ5zF4do8ArPlKeKv4xOuvbQ2yW+JisLIF0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(39860400002)(136003)(346002)(66946007)(66476007)(478600001)(66556008)(66446008)(6506007)(4326008)(31686004)(53546011)(54906003)(5660300002)(64756008)(76116006)(26005)(110136005)(91956017)(8676002)(86362001)(8936002)(2906002)(6486002)(38100700001)(316002)(31696002)(186003)(71200400001)(6512007)(83380400001)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RWY2czJ1dFBLK240R3ZoNjNxaUVzd1dxSGZQWE5TRERMdkR3K0NtdW0xc25K?=
 =?utf-8?B?QVE3dW5TSHJvaXlmKzdMQTRNYWduSnhQTmYybnRNRTdTR2hEa2FXQmZQckxp?=
 =?utf-8?B?Z3VBT0dBblg4QjBOUXhObGRJQjYzYVo5ZGlHd3RMMXFIUTIwM052MDZ4MTdC?=
 =?utf-8?B?cHZxcXYyVkp0US9waVVZSlgwclI5YnNiNEl1emZzYXJRNjBlMjJieVZENUJW?=
 =?utf-8?B?R1RTOFBtZlhFNXpVTkNRazRNclBhMWd1V3g0TEsxVlZsNFl2cXJGRnAyYWNa?=
 =?utf-8?B?UE1qSnhOR2ZvT2I4SDVZcUJtVW9wVEVOSmZFWk1sQTZSYVI3VlQyTUI5NTN0?=
 =?utf-8?B?dnZrc21qMUxURHR6OGIxbUhYN0Y4NHBZUkxWbnE0eWVZcHdrbUgrK0NSSnlH?=
 =?utf-8?B?c3diTGVLeGtCb0hXT1dyMVY3MUxEbWViMGVyRmh1WXJOMXNjemhrc3hqRGJO?=
 =?utf-8?B?NWxhZTdIUVcvWGhlbU1VMXdQYklxNTllK01yTTRZYm5QZXJmQlByUG5YSjBF?=
 =?utf-8?B?VVZnNzZDOGJSZUlHNzRwRmtOMm9qUUJzUnU4NXhyamI1WDBZYXRyOGphcWF4?=
 =?utf-8?B?RldCVVNFMytMNlVDRVZiMFh2NzNiaWtnMGg5MXVBbm5yYkJEb1ZwSVYvdSs0?=
 =?utf-8?B?bmVjVzFXMUsyaHN2ZDRyUHliWlZ1OUhZZDFiWGJzNFl3N1Z4OUJVSFE4b2d1?=
 =?utf-8?B?aDBSclJ0dTVuelkzZXZnN0k5dW4zZ3hVQjd3YWY2bXVYTEIzOEFmSHp1UnRS?=
 =?utf-8?B?aFZ0UzZYT245blVDdDYxbjdlUlN2RlA5UWZSckJLS2x0NlRETkhHY2lqT1R3?=
 =?utf-8?B?WlUvdDRIeURuSmhSWnQweUppRHFmN0p1blZmdmtjVGFpRUsrZS9rU0pLU0p2?=
 =?utf-8?B?cHcyVmFqd0lsRmZ4eEpYemJsUnhVWG1QN0RycGU3UFlUODFrd1IxTkFYTXNr?=
 =?utf-8?B?QzRsbmxlMXVqRmJacnhGWVNqSm9yOEI4OGJhVXdjRmwzRlEzOGpUTlVvU1Jo?=
 =?utf-8?B?QnFUMTdRVGVtSXBpb1NiUHIvbEIzN0ZNakNXVUI4akEyWnQ5cHZ4N1RlWTZE?=
 =?utf-8?B?aHJnUzJmVHhSOU9Pd1pEb0FyckNBQ0pzd1RNeVhjY3NPUVBVWDRxeUpxK3ZS?=
 =?utf-8?B?L1o0OXI4VjRSNU9ZejZiQWtDekF2TFNxb3pFalllUjdVWGVLK1diMGd2TUpH?=
 =?utf-8?B?c1FvaVR6VDhLVHh6MytqR2pETWt4NmZJWTZwRGhQMnhudkdGWjBOT3lGL2tZ?=
 =?utf-8?B?b2p6b05xSjFzbWlNZHhMazFSWGtOQVV4ZHZWbDMvTzY0MHZ1SjUrNnVmOEd6?=
 =?utf-8?B?WVlqQTYvbHVMd29qbUtwYkYxaWszSEVYRkQrZmtWcElOQ1F0cDNHSG1RcFJW?=
 =?utf-8?B?OWtVdEM2dkc3Lzg1bUdseGhGZlBUK3hlUmgxVUxEZjVLemxSUEtRTDR5WFNJ?=
 =?utf-8?B?bjFweVlQRnBsS1JkeTh3a0dzdHVWSDVmck9mY2FCNDJ3am9lTjRraVFRMG5z?=
 =?utf-8?B?aWNnZ05FcVp4V2xtcUFYVWNpbTVWWVBaWnU5QXhZS3VtVjVmZ2Zqd3BQNTFP?=
 =?utf-8?B?TjhUenpFSE5vTHZWVGJtcFp3NGw2NmdMWllwcjBmT1EvUXQ5TDhxdGFmTDZp?=
 =?utf-8?B?b2J5RVFWVG8rYkRDNm5kNW1mUit3L3pkSFlmcnBHb1A4S0Y4TzFhQ3MvbXIw?=
 =?utf-8?B?QS9HNnYxUXJLM3VrLzA2MzVEejlFTktvUTBQSUZUTXVZeVQ1bWdKTWVWMk9R?=
 =?utf-8?Q?HNX1O1Tnwa5o6bMffE=3D?=
Content-ID: <D5215CA37BFEE64AB848B3076D2E7891@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd63d68-6ddd-4b77-c3de-08d8fb069613
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 03:21:37.8172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DIyT4NInUN2++vFk3jToe7lmmuaeqyTOUghGYHCKtv+FBqHghyNttJIeGpi1TU7PnXVHwYAxXQxSJpVk+YOXYa3C8/3hU60tQpUPZjLvUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_042144_461666_AE846E0A 
X-CRM114-Status: GOOD (  26.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/1/21 10:34 AM, Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> If rmmod the driver during read or write, the driver will release the
> resources which are used during read or write, so it is possible to
> refer to NULL pointer.
> 
> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
> hisi_sfc_v3xx driver.
> 
> To avoid the issue, fill the interface _get_device and _put_device of
> mtd_info to grab the reference to the spi controller driver module, so
> the request of rmmod the driver is rejected before read/write is finished.
> 

Do we care for a Fixes tag and a Cc to stable? I guess this bug is present
since the introduction of the driver.

> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Will fix the subject of the commit when applying.

Thanks,
ta
> ---
>  drivers/mtd/spi-nor/core.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304..72bc134 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3301,6 +3301,37 @@ static void spi_nor_resume(struct mtd_info *mtd)
>                 dev_err(dev, "resume() failed\n");
>  }
> 
> +static int spi_nor_get_device(struct mtd_info *mtd)
> +{
> +       struct mtd_info *master = mtd_get_master(mtd);
> +       struct spi_nor *nor = mtd_to_spi_nor(master);
> +       struct device *dev;
> +
> +       if (nor->spimem)
> +               dev = nor->spimem->spi->controller->dev.parent;
> +       else
> +               dev = nor->dev;
> +
> +       if (!try_module_get(dev->driver->owner))
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static void spi_nor_put_device(struct mtd_info *mtd)
> +{
> +       struct mtd_info *master = mtd_get_master(mtd);
> +       struct spi_nor *nor = mtd_to_spi_nor(master);
> +       struct device *dev;
> +
> +       if (nor->spimem)
> +               dev = nor->spimem->spi->controller->dev.parent;
> +       else
> +               dev = nor->dev;
> +
> +       module_put(dev->driver->owner);
> +}
> +
>  void spi_nor_restore(struct spi_nor *nor)
>  {
>         /* restore the addressing mode */
> @@ -3495,6 +3526,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         mtd->_read = spi_nor_read;
>         mtd->_suspend = spi_nor_suspend;
>         mtd->_resume = spi_nor_resume;
> +       mtd->_get_device = spi_nor_get_device;
> +       mtd->_put_device = spi_nor_put_device;
> 
>         if (nor->params->locking_ops) {
>                 mtd->_lock = spi_nor_lock;
> --
> 2.8.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
