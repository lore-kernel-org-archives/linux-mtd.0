Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D147CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnnxLQDCo3EtDL7GZ/COTPw1kq9rrHK2iPjSDieT2Ps=; b=efXDuZg3gwvxRr
	ai8i2fJlhNHy74P8fexjnEoX3q6El3yxlJ/0X9ivzBSWxzngYjKzKa+tiictqOHN/kE2iw/jTLE3F
	1/0vvLVVFyNF5qV3IGKhbiZ8dHX1ul8tzZ5JrPKOKMgtjs0XEpVirTw3VVOxwHDpDU5uXYsKjyaVG
	zUjRs0RxTZ4rZUv1m3CwJJEPgoojBlo3CPhLsh0cCy0rpG+Ttqt3SqAe4mjjWqd0XtRMuxVxLA8fb
	rXJkqkcfyR3ZDcRvExSxMertMQ71mzhR/7ErZB9vGlDs6+XTUP3u9awh8WVYXRQa2pN5wxIYEjr+x
	nKo+g8dG5EbbDqpNmVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUJz-00D4bN-9W; Thu, 21 Apr 2022 10:45:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUJw-00D4aN-BM
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650537956; x=1682073956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E6p0jwEWGo6GAOr5v9n/Tzf550J4BeusNL9WjYe9Emg=;
 b=fR6jKGZpDFZBWWcO7ELh0ssJYhheZxEy8jGg4M2SEwUogOr7nsQAH35M
 4hZJl7OWlRcwaAc9dfAqKasPO39N9rBtjUF+q6VjOWP1A6hVty3r5UjDB
 CYhh1Y9fT+ZkhLgHjh/MwImP5Zfrgtia9V2nFT76dWIqVHPSxzaZNeCVp
 VCELmnV1LF7mZtzeHu7vDEZnKIpbP6hZ/8H1l0L4zFhtOs+ENF6WlrE8K
 33LL7twrGIZE83dWFGdmQBVbge3+Xkc6egF2W3AYXWRBDxRuu1YD6y1EY
 RFb21tzWa92E5ctaAWfP2b+2e2eaZ/h7CDbdOu5lLS4RJF3LgICrDhcLA g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="153350470"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 03:45:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 03:45:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 03:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhlBr6eCTP4SfEj7ka9prmAaaaNmTmNa+cWWC9moYaoBUjsII6I8Ys1l2xseybq9D9Mv/3oJrmbOoRCvClD/Glq7VKKIsOYNn9v33G7Ak/gspOSr4VUhbkYqUT+uFvBft0TvlfGU0C+ec3uGfwT+u4IBuKlmoK1pdzOYHWRtfijXXrd0NPsafAnL3TbnVOzRrjMo/kZWeWpi2u9E89m/XxLr+b5ZnjGsQb8QfRA1v5iT0IDnzJN4j2nflArid8jYyrb3YGOa9LgFp9sOKkncRWqoQFMwQJlcZSvY8zzlpoHjySkxFEpK6yupIZmzfMGZJrWT++OWbr3FKT/x/g+k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6p0jwEWGo6GAOr5v9n/Tzf550J4BeusNL9WjYe9Emg=;
 b=Wu+ErPo0UY7rThDCLsXRgSp+ivDIbfw2EkQ7uSXrYvDowd9GDvvXTpHdcPby+Y2K+nXr+Bh5nUaT/jaF/dLN+w338RqIqcaYCBdF47lO7K7xc9OUSIfFps8GyUf/RztdBiG7HAccZwAMoYAROl4vql7uIuN8HVjIanragMXziOK+uYBSk2z1Q93huyM82k7WUFyyHXmrabsp0skCOPA0rXVMB71QYqRaxMZEFgjuWZ8OXb9/15XdjLnnquKilKh8XUVkpB8TwQrwHt2PjJCxyhf3jjUcxvnPWNFbCgv+eBE83ST078yNc1Hig9+sDiY/mAJZ8ckcRfo3udxuWFKc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6p0jwEWGo6GAOr5v9n/Tzf550J4BeusNL9WjYe9Emg=;
 b=SmF4/2qzkSUpNNC63iZxMtXd022KAxx71R9AXnFPNi3dgYbXtq0It0j4LZ4tkz4002s0W+cG0KujW5jR6H4atL8O/ZAKNX97tK5JF6lvojV0podaBg5t90lSAlGcMQV3K22Z4PPqboxlGcUqvJpPt286jHB+i2r8C535uiYoF9o=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 10:45:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 10:45:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 4/4] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v13 4/4] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYVWz411TPTtgGa0ixOnjBxBZK0w==
Date: Thu, 21 Apr 2022 10:45:52 +0000
Message-ID: <a039deda-89f6-288e-071e-f557aaa0bd1a@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <5ecc521018a8fe89c5554c7d69a0a9a36eb16737.1650532121.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <5ecc521018a8fe89c5554c7d69a0a9a36eb16737.1650532121.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 214879de-3c72-435b-b9f6-08da23841b02
x-ms-traffictypediagnostic: SA0PR11MB4592:EE_
x-microsoft-antispam-prvs: <SA0PR11MB4592C1FD85B3AC7A9D30AF1AF0F49@SA0PR11MB4592.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g7pty5tObta1wQp6y7KHJR+7HuehsRigYCgEPiLMVTkift1jOLOZalI52NonwHqVhsMPbjbWoMw59OxXZdHoB8EQxSC3etykckQbsxJ/KEO2LyGpz27PlQexCrQEXC7a94Ujw+O74LNwxXCBNcepOxOeCZ50gTdweiF2x1HBt8sSUQ5KPYru+TPqL2ewtWVb3a/w8b0uBiHiRoBGa50C3foKhnuKU+swfts0YZhl0SFmgobhz0YZnkihtSgnb1lYULy1AfGCsY3gBi95PoNJM2N3FXOYEzkYVAlYjXf569uhxqMGXHfhuBBF1nNrlDbVLHLw5frMYwIcQbu+CQHFa79qyFAKeQg4OFUPRoT2mSg12jmsx02qGrAsTAJEWI94FNmAVOiDtaujwOH2fWv4qe43wofMZbj7zvM8CExcrwAkHWTNiXFhhiMVhEwSJ0x3WEC4x8goJOWeXMH1Z7ssRoCmXeLl16UCgNFf2lyCuEdQPS+3vzT9U2uPNXo+f/rcaHjsSZ5o2nMeVJi1QDRFomHwDhOF8ObrrqUqXzqj8sO9DybS9ovR6wwk3qIHVQGaN+qKM0rq23K2xM+yTuyxrkHY0Wk8liWxbol1k/H1820HzC/6ubLnDeWLlisW3qHpsfA8aYpvag7UDQPnEEBetg0kGxGYOvD26IGpp1bqENBHspqkdWzTrVNeinvWqJvojZr/Ce9q1i7bcJ+A5AzSMCZ8HT+SVAoJVv/SL/c4vLeK9QvnOtsXMKneUwNbDRs2tS42mZ/i/xUIuDAt6HrzxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(91956017)(31686004)(31696002)(316002)(26005)(186003)(5660300002)(83380400001)(2616005)(122000001)(2906002)(8676002)(64756008)(66446008)(6486002)(86362001)(76116006)(8936002)(508600001)(6506007)(71200400001)(6512007)(66946007)(54906003)(110136005)(36756003)(38100700002)(38070700005)(66556008)(66476007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzFIdzZCWWd0L3BsTEw2Z21LM1lNWkl1MGUzS08rS05BWk5wSG1OSHQrVWtV?=
 =?utf-8?B?dEV1OXBJVm5Fam1LNitPTjllK0xtUFR6RjJMTGRyNDVsT2Q0bG16SGR4TS90?=
 =?utf-8?B?MHZZanpZbCs1N0RYVUp0WVFvZlVQRVZKYWxNYzU2NkJsT3c0Vyt6QWx0R3E1?=
 =?utf-8?B?SVZXV0hvS1RlT3MvRTVqR0lIRGVNTmtIcCs4RDh6dHNpMHR5SXZxQi82cmMy?=
 =?utf-8?B?TjY5WnNUVWN1SEpZQmo5UGRubU9LdnhEaUJhblFJVHNUSGRaZzliMU9EQkds?=
 =?utf-8?B?ZUN2RmZiRVI4VzhyNXRTdms3dElXYmwzN0RaQkc4VUhZbVppSG5MQXZDZnlQ?=
 =?utf-8?B?eDdhM2pMRW9MU3F4MG1tT2hWYXBLVjJwN2diQ1hEbnQvQ3pSY3B6R2NFeFZk?=
 =?utf-8?B?MFFDeXhLYWdUNmNJSFJZR3U4dERsc3hjV2hLRlhaVU1qaGJ4aWlJRVhuaGYz?=
 =?utf-8?B?bjh2ZC9memRmRGZlclRtM0M0bE1NRFRhQkk4SmIwdkVPMTBtWTlhcTRSZko5?=
 =?utf-8?B?eFpsb2dFa1hNS2NldGliOE9ETnd3K0NoMUFaL3FuUjYzYmF2UTlLbUlqN1RX?=
 =?utf-8?B?Yk55OWthS20wVnJqWmZZNk83aW1YSnhYLy9mV2IyV293dnZiRDE3NzFWcm1G?=
 =?utf-8?B?V2Z0MEs1YUpFWXd5LytreDVTdE5jR1JhWUxYcndEdVFGMDFLZjdIZFhsZ08x?=
 =?utf-8?B?SnhqMjYrWmVhblR6aWZQUzg0V1JuK3JsWW1tR3B1SVpqZjVaTmR4bDA3TGpM?=
 =?utf-8?B?ZHBkMGR3dG1WdUhneWdiOEtHOUczZUZBalpTTi83YWE3dHpxNkJzQTBrQmgr?=
 =?utf-8?B?bjVjUFNyOUhVVHZvc0hlNHA1UTJMMFlaVjFCeGhXQTZqUXFrMTUxeG1TQ1B1?=
 =?utf-8?B?bkY5NVNWYUQyUGt1NUJQSFNIWEdXakZSSnFsWmtITVhlb1B3NktGekw4S3h1?=
 =?utf-8?B?NVRNQUpEZmRodVBpWDhQbkNPTHRpRHdzTVFBdUFzOGFhL1UyUnl5bWwwbDIx?=
 =?utf-8?B?TGhLTUpaZS81MDVCRDMzR0NnSmhaalhFeDhQTTZZeFNVSGlnYi96b1BMYlpW?=
 =?utf-8?B?WTE5emRvRWNzZEFmaFI0MW8zMlFMajUxU1RIenJZY0d6bGF2eTFab1RXRUlx?=
 =?utf-8?B?dnlBUUxlUDhvRGlJT2RlMGdyRzMrRzRVQnNOcHRaalBGQUZocEpLOXFOWERx?=
 =?utf-8?B?T2RrNmVvVHVIYzNhWlRRRTF2T2hSSHhKWEp0WjF4bXlhcXR3QW85QUdjRjVS?=
 =?utf-8?B?MHlRUnN0bjlqdEgzTnZZU0k1aW1kR1ZaU2FZZHZqR2gxa0huQzRTMzlQK0cx?=
 =?utf-8?B?OVQvckxHNzdGM21JRUcwQnZUc3VrTEI0TXV6RVVjeU10RUdvWE9mWTQ2VFNm?=
 =?utf-8?B?Zml2eFBsbDBaeHVBS1ovcTRpcGRFZ0kyNWRxTXJ0LzRoK3RlSUNPbGxWbVdm?=
 =?utf-8?B?N1ROTmV1eTdBUjdpZUdzMm1FWUVXUENvdUp2WUtUNEhaNzdnYnQ2WGFlbDd1?=
 =?utf-8?B?b21LeDRuM3JoQmo1cmp5WkdsVnZvUnFQNFNkVXhFRjhWc2J5cmlyWVJQREkv?=
 =?utf-8?B?L0NybStvUXp6cnFQd1ErRkZleEFlVFJDYmFhdi9DdGJNRk12ZnVhci9EQVRH?=
 =?utf-8?B?UEF6dnlNUFB1Uk43aFIvWDhGWWF4QlI5M0hFekU0b3lwNE9iYm5OQUFLWWNa?=
 =?utf-8?B?ck1Sb042aUpIaEVIN3JQZ3psbENnS1Vrb2N1OEtyblE4bWFOZDlBR0RzcXhB?=
 =?utf-8?B?STEybVU0NUgyK0Q4Y2NJSkNrMnEwU1BEbklPVXVTNEtzeEJkSUdpbWNGOG9Z?=
 =?utf-8?B?NnhTaWVDVHVLZFJsRFl4R2hIVFlZbEVVS1dJQmswMjh4Zm4vcnVxUXBXcGRZ?=
 =?utf-8?B?a0tLVm5FQWtlZWtNdVlhcExjaGZLSnJZQ2xqaVY5Q1NpRUJNODd2OG9NeFdn?=
 =?utf-8?B?eDZJRm03UzF2bjFHdWc3SUhON2NRVkZRUi9aci82SFo3Q2Fpci9YQWhvZlFj?=
 =?utf-8?B?RFJrVlNMSXFuY3FYL0pKUExDZWt3Sk5oUyt3eVU2cXFWTXlJWVVQcTR5QXhK?=
 =?utf-8?B?STMzY1VsTFIrVTFnZ0RnL0ZGZC94eU90T013ZXd6cFhBWU1xSVR2eGhTS1Uv?=
 =?utf-8?B?NktHbFB4Q0I1YitrQ2hNNXZsZ2U1a1BmUGhJQ2FkRC9RY1VNV1lqMGFEUExX?=
 =?utf-8?B?RFpHSVd5czBIVHcvZGU5ekVNaVR3ZDhJNXdsY0Y0YWROZ1czUnFPdUdESjF4?=
 =?utf-8?B?RStoSUl2NFZtOHRTeHA5R3ZFM0pMdnMxU2RhbmFnWmdsMW16RjBTSHA2U2ZM?=
 =?utf-8?B?YmZFRmt3UWtYL1krVHg3UVpzMDZzZm5aTDN5SjhPZUVhVUYwbytLU1FKQlBx?=
 =?utf-8?Q?QwGVv9CrZt1bXMMI=3D?=
Content-ID: <5C7026F40B6F4246A001415EFF1FE2A0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214879de-3c72-435b-b9f6-08da23841b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:45:52.2009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqyI+5T85TZ1boNNXSvBYYoT+HJqz/FBtJCvD3SyWDvd57cYqzS+v4gxNKbb3YvU6DogNNWSCdlgBj6Voi54sVml9gXog7P7uwqQWEQjqOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034556_524410_C7862719 
X-CRM114-Status: GOOD (  30.58  )
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

On 4/21/22 12:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v13:
>   - Remove part specific set_4byte_addr_mode()
>   - Revert SNOR_F_4B_OPCODES
>   - Add post_sfdp to fix 3 byte erase opcode in 4BAIT
> 
> Changes in v12:
>   - Cleanup fixups based on other patches in this series
>   - Add part specific set_4byte_addr_mode()
>   - Unset SNOR_F_4B_OPCODES flag to let core to call set_4byte_addr_mode
> 
> Changes in v11:
>   - Cleanup fixups based on other patches in this series
> 
> Changes in v10:
>   - Cleanup fixups and ID table based on other patches in this series
> 
> Changes in v9:
>   - Use late_init() hook to fix mode clocks and writesize
>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>   - Use MFR_FLAGS for USE_CLSR
>   - Add comment block to explain about addr mode in post_bfpt_fixups()
> 
> Changes in v8:
>   - Call write_disable in error case only
>   - Use spi_nor_read_reg() helper
>   - Use nor->bouncebuf instead of variable on stack
>   - Update ID table to use FLAGS macro
> 
> Changes in v7:
>   - Add missing device info table in v6
> 
> Changes in v6:
>   - Remove 2Gb multi die pacakge support
> 
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
>  drivers/mtd/spi-nor/spansion.c | 66 ++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 952d4383f9da..e56c48c3280b 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -203,6 +203,56 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>         return 0;
>  }
> 
> +static int
> +s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
> +                       const struct sfdp_parameter_header *bfpt_header,
> +                       const struct sfdp_bfpt *bfpt)
> +{
> +       /* Replace Quad Enable with volatile version */
> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
> +
> +       return cypress_nor_set_page_size(nor);
> +}
> +
> +static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +       struct spi_nor_erase_type *erase_type =
> +                                       nor->params->erase_map.erase_type;
> +       int i;
> +
> +       /*
> +        * In some parts, 3byte erase opcodes are advertised by 4BAIT.
> +        * Convert them to 4byte erase opcodes.

this is a fix, those opcodes don't work with 4 byte addresses, right?
Looks good!
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +        */
> +       for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
> +               switch (erase_type[i].opcode) {
> +               case SPINOR_OP_SE:
> +                       erase_type[i].opcode = SPINOR_OP_SE_4B;
> +                       break;
> +               case SPINOR_OP_BE_4K:
> +                       erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +}
> +
> +static void s25hx_t_late_init(struct spi_nor *nor)
> +{
> +       /* Fast Read 4B requires mode cycles */
> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +
> +       /* The writesize should be ECC data unit size */
> +       nor->params->writesize = 16;
> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +       .post_bfpt = s25hx_t_post_bfpt_fixup,
> +       .post_sfdp = s25hx_t_post_sfdp_fixup,
> +       .late_init = s25hx_t_late_init,
> +};
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -379,6 +429,22 @@ static const struct flash_info spansion_nor_parts[] = {
>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>                 FLAGS(SPI_NOR_NO_ERASE) },
>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
