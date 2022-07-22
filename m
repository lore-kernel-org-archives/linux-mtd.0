Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E3FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ1U7+INfKPW1FS2WHvgyB0z8T8xPke2ymg90gRY7gk=; b=sJ8KsHkGO23uCK
	WYlTMHKJLWcIshJuVTMwHeSc5TkqM00jiBjjwzgSR+SaymxOBJBHu00W5LR3eqD1dRvLbCy4CFBzY
	11rAlmHvAMVPG5T2zsLgGqo5MadW0Cv/G9L2pnnXHFjQqudG7+wnnXdppgI3B1t4UmhefwE5ZV6hT
	PrwSJdmnSvkBSuZ+34kUJZGwTp80/sIgXv+0y7CBMPfvHSsc+L5Emavacwkf0Z8TVnfc9oOfafWpR
	BHHRx753qwTpsXm7oL3IfuJh2AHr/ny0cBryE/FegQaRLNYQY2McHFwCo/gSP3MHH2dYUB4T6qCex
	Rwf+eQ0RH/Fn/lFw9IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnFV-000hKS-AC; Fri, 22 Jul 2022 07:39:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnFR-000hHk-VJ
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 07:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658475537; x=1690011537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RamDaolRxijM6fXuPhcEk9qk9U9VMARrLl/wT/gTFAQ=;
  b=iS3NHrFoD6kdUmAb1lAHF9yoNGd6BCkL7VUjjKBI6O9EFoh9j9znP2cc
   emVQkUTxRn1nj8ufAR5auSYVxOUlVPbEHqGSpJWGwOti6CVAISdYnV1dd
   jxyqTXJwGpbO3MU/OUhtc0xkvLZwEG3oWE0VRflmPf2QFuGfJEKF+3eV1
   PmnH7/W+PRh1a4ZAG4uKIur5HoV8ROrBuJF8rFswMtT76KnlRETJAudHC
   7IFH7yWwXTSxOjb6bUuKLkaOTryGVmLQx9OeKysIEmgGRaLxWNc3je5ZR
   DUwrfRR9uEMP6r2OwqL2Wy3zCcdjNmZrgFzLirPLS6kpHoxEPJI7zhsO2
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="105662714"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 00:38:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 00:38:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 22 Jul 2022 00:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y506YSC3eDmnJ1KD/povOr3zl9afMsG4GL6fPBFSZD0aIz3mirRW5a5dqWoHUgm4Y30YBPXWuFcWy3n7rWy2B/39i96h3HO5qdZLHVs7kebdSG2uYXAM2Rxaaps7vOzsXwhK/G99wP/+sz+IxHtA/cB3b3SyvPgvzsfXYrkxJKIyAgWUhZ8rOPM/5MqHrp+/Cs7jEN0EvK6Xkvvdc2zPcnrv+Y0cRqOP0qtrF1yIEET0uY2kK6uEaEeA2DTdUrvBfvpBaD0Li4BekuRobAOzvNbjV1jkdTXWqPoYrcqQtqEFjCkWBSkkzWGbFVodPdBJvaBSQrTfYByj4f8+hpok3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RamDaolRxijM6fXuPhcEk9qk9U9VMARrLl/wT/gTFAQ=;
 b=Nf4KWKDBD1CrUdlXPgmOX2QSfywQe2Jtix1gyh/jXwBGHs2JZXC0pI/4dt4Y0BNVHgISc0O8Whiv6+5NKICw2qKeG1tejM7/rmzm1fRgwU55NHElEOPlg7W3Wo6lVrn1FPSMyC0AfWsoIt4LGBX77WgjkvyHE8H9GNma9ONeMGq35X35y+IhkG2BoyihDX83kxiF+C0OImZWaEeZHXWBf42rpL/88UFYfoNJrIsGqedjKB0+l2Zg3ve+zAhgKZmxaRP0X2mWs4xJW37t+QfEgeQAy7CFFY3hKFW0De3bqQGaEcs29nN27h8qcvTuzVn8pk9/YumuHxZe09laWrSqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RamDaolRxijM6fXuPhcEk9qk9U9VMARrLl/wT/gTFAQ=;
 b=V0lxHXpNdlnLxbF5NcHBs1nZ9Z1dzG7eYAHShohXeM6l+yOUO84WVXWlSILXr0iNlWjLZ1yfQf56oV2xWAlulR5Em+Sc5UxkwNAAk0gEVaGHF+9WkJW5VLLqe2u0jTkeO9lJlSdKTHGDFjM3dfecE4F65BFUfaoVNt6SD/pTzfY=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Fri, 22 Jul 2022 07:38:47 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 07:38:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaP62KAe4A
Date: Fri, 22 Jul 2022 07:38:47 +0000
Message-ID: <070bfe6a-00e8-1c59-c9db-52d249dfbcfe@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
 <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
 <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
 <36924e69-318a-8955-bbc8-86356c53bc42@gmail.com>
 <7a9a6f4d-37f2-68b4-2770-bff0c09de742@microchip.com>
In-Reply-To: <7a9a6f4d-37f2-68b4-2770-bff0c09de742@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe980103-7b21-4300-74cc-08da6bb5365d
x-ms-traffictypediagnostic: CH0PR11MB5219:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eRxGf9gUmLvvxg32a+inXZ2WuLR11ESbLNZ5rJo+DcjYdkP87bFVXKw5GdlRs9QLmWwxqurEWtE9UpzJOKwbw0hFdN0FMaywyNwvvKit89cPS2br1p8K2zqHxs5fkURJiCLQACcGpEeb2FXiVlPuJ9mgeOs1mFrcoRzJ6DfBL/kWCXXtEYXLtxcWD/W4cMQBjVeMbMUEt7xu5p4cSQq+Zmx9o0U94+2jDi16M1wG17gwJiN3KLjIDx9+Tb6JdKgGTzqlUHxUGKTOloHl6poKdaQ7vmAG5PvXmZs1Orl0jmB45/A3C4o8DUvJCFLzQIWBeANmXN1FLuperqyEwf4rgH792e4aCNVzqdVMd9hf8RDHoe1I7eXY3HgVRI4lNJztUu/WvaMhAhM3TcvCEWOF9regJAwrc5p6xqiDdbHtj/daHV18inieionN+dGTGDGToOsupSq3+67pxPC2z3HIOt/NA/BPkDIdUHZWxpMF/sCFrbXMPflRzQLYI5Vzqq7iuc9w/Bbm3erErnjynE6yGjI9EiWfqNIRuYMeDqN+O3RR3wV1XQ0Mx/LAXq0JO+l7tZ/9uDPR4Ypcpen8zpnnRkFbd801ntN98cYUJxC9GCmWx6Air3OIgFq80wgMYApDp5s3gHfRQF0rZMukOOf+vzZVxMS8G6H8DX43E72hxgSS1QQtBVJg3UL0GysirVMHLLMXUxMlWrgSfbhKVDHJJNQ0f2PYk6zuiBKiPUJRyE1CZ/tFiHYDK7tIAG+5aj9H+aaK4unB0ivEPMlb40qj0GLkcsqUSFrkU2/DWtUZ6oEOiJ1b0aUkhK7KNz743kJno/lCHS2Jqh+YMR1+xZDZdKjAEWY1UB4Xp80v7PbKJG9+aqZv47DlzXToD/d8ucm6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(76116006)(38070700005)(41300700001)(31696002)(2906002)(8676002)(36756003)(86362001)(71200400001)(8936002)(6486002)(38100700002)(478600001)(31686004)(91956017)(316002)(2616005)(110136005)(186003)(122000001)(26005)(4326008)(5660300002)(66476007)(6512007)(6506007)(66946007)(54906003)(66556008)(64756008)(83380400001)(53546011)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHhiQXZpOS8xTTJuUkZRM1hJc3IzTlBXa2FwVTZZWFErVlZjYVA4emduazJV?=
 =?utf-8?B?N2pxNjRsU0xxbDRNM0dUUk0zdmhxUnJhWUJIbUZiWXVwTlFJUmprWjFqdDhM?=
 =?utf-8?B?MzBtOFBGWXk1Ylkyam5abXJ6a0dIcWlDd01kanl0a2F5Yys0RVVjWWFKTWwz?=
 =?utf-8?B?bVZVTnFtSDRJdVNBSTZ5QTN3a2R1SXZ1SVkwYWkyRHdYckV4WkJYYU9SZUI4?=
 =?utf-8?B?VXhlL0NNbmJHTlFwQzQzS1dnSHhxUTEyUGYzV01VVEkzdHU0QVkvMGVFTU9a?=
 =?utf-8?B?L3B6WFYvK2swT2xxS2JlZmNvUk44L2ZhMy9zbUk0QmVNd1Y0MHhDZngxK1VZ?=
 =?utf-8?B?dlF4clMxelBnV0V5dlp1YjAybWhUUC9FUHNtdlBjRXBWQTA5UkxOZnE5MEgr?=
 =?utf-8?B?MGJoSEd2YWY5bWlyWXByUXkzV2xaU1Y0YzhVOGNJeU9iRlYrclJSamZBVjF4?=
 =?utf-8?B?YndTRE9YY0pZRW9KaXZxN2NSdzZHVWloYjRWQytCSWpMUFBwTjF6UmFkdGx5?=
 =?utf-8?B?N2JxZ0prbW56cndZNStKeWpOeDBvQ2EyUjQyMUFMTFh4NFpkV1d6V24rMm93?=
 =?utf-8?B?WmdvRmw5MXBTSHM3NlhIVVNNWkVmK0w5YmROaHRERHJWRXdvSXd6TWxneFR5?=
 =?utf-8?B?L3RCSkh4Nko0Qi9GbmZSakR0a2pEUmw1eVdTMmNYQnlnNFZTdzZSNlJBYkxL?=
 =?utf-8?B?WVgyTUNYVExtVk5sakRSMytNRWtobzRGRXcySU1mci84eUtldlc0VzhRc2hn?=
 =?utf-8?B?aDQ4eWZheXRWSWhOV2lQcHVIcURrZkhBeFpBaWhsZHFvNzBuR0MwRGwwQjlD?=
 =?utf-8?B?VTRHeFI4ZCtzelNnOGI5b2hNbGxIRmV5aTVkaHpyaXdFRGs3YlJjcWk5YnJx?=
 =?utf-8?B?NVNSOGhpUlF5LzRHTVNoMzl2QlFQZzhteERTTllSK2pYaDBiV21uOWlQQlV5?=
 =?utf-8?B?MUxFckxHMUZ2SlEvc2s5QjUxQWp2N3czNlpJcEdyS3ZkcCsyaEI4azkya1BH?=
 =?utf-8?B?M3hjbTZtMTBZYzV1ei9EenRHczhDSS9WajdPa0NWNEpyTEZuQnFKenpBam10?=
 =?utf-8?B?Z3dRQzh2NEdsdUt6dG9vREZhQXpxYUNRT0xiVWFJNHdBMGo1Y1JWeHg4MjVk?=
 =?utf-8?B?NVZ2Y3hWTWZzVXdvZTJMVit4V3NrSW40aXZhdm16dVFMRzR2TzdXbWdGSGN3?=
 =?utf-8?B?MlFBOEU3cVQ1SFRrMmRFVHMzV0dMdG5zY1pFSU1jTUFORG50VFgwTjQrelZa?=
 =?utf-8?B?TlA4ZWRJUEF2blIwRkVGRUt6NjNreE5McTgrV1c4NDZJKzBtVzBGOWtHdExi?=
 =?utf-8?B?MUtHWktJNUtNS0RlaGtqMTAzcmJlWTFTcFRMemFUWDlQREpEZUFodWkvbFZH?=
 =?utf-8?B?d0I1Zys3WnNxV214WjlUMmhOSHM5TUVMR290dks2WExCOGppMXhIMUdNRzNQ?=
 =?utf-8?B?ODRicUpsc1VNeXJ1OC8wWnp2bmQxZDdnbkhyNHlkYXY4RDZkMFVSa0dCRG5E?=
 =?utf-8?B?b01BOUxVaUJOdDZ2d2E4azJBYm1adktEODVqL2s5Q0ozZ1RiUkVCNWdtR3dV?=
 =?utf-8?B?UWFydytjS09sVmV6OGwwN3k2bFh3UlEzeUJQYTl2eWp2Q0pFek9SM0R3Z0dY?=
 =?utf-8?B?bzhTbmlsRGx5TCtOeklpNzB2Rk1sR3pvSHBWdHhUcUVzT3Q2VFdCUDVxckpI?=
 =?utf-8?B?VGxDK1p5QlZUZGlkNjErZlB4RlFYU2g2SHVqbVpXMXJGWHRhZjB0c003a0pL?=
 =?utf-8?B?THFyRXlpNU5oVWxZNkUvZGdCN2RCSFliV1hOWGFkdnVWby9reExoT3dPWk9o?=
 =?utf-8?B?c2llTXhGaEZ0WHUwcCt1Slh0cW1lWGlLcVpNYk81NjdkekVObU5IWm1aZHQx?=
 =?utf-8?B?N2ZrZWtxdVJFdjdadVQwQVVPcndld2V2cXZiTWNhWFMxSHllL0Z3ZTNYbEQv?=
 =?utf-8?B?RlBmSldXNDVoU2hNbW1lVm56RmJmclh0Ri9QdDc1ZDZUWmVwRDVjVVNQY3c1?=
 =?utf-8?B?Njh2ZWQwWFpMeVA4clVpd0VHeC93TWQ3NnVCYlV5bWFXM056UVhNeHAxNDlF?=
 =?utf-8?B?TlluUGJTL3I4WGo2RkJqMlowa2pnN0lyNy8vNTB5ekovNTNYWWZUdkFVb3M5?=
 =?utf-8?B?bU8wU3pBRXdvWjRBdjRJVVRKMjJlVmRVa084ZkJJR2dHNDdKbk0yNERCakZo?=
 =?utf-8?B?MVE9PQ==?=
Content-ID: <15F9D8867A2C9C4D95244AE789650A58@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe980103-7b21-4300-74cc-08da6bb5365d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 07:38:47.1224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o82ACOMemGAWQarYKoyP66G0aCmonhMnj834NdN2ZTyuORE1FTSItXnKUPYeQbcq9aPIBd2geA6j+wwUcNEdr2Xtc0NL8JwxZY0sS9rHn6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_003858_471293_047A8135 
X-CRM114-Status: GOOD (  17.43  )
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

On 7/22/22 09:08, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/22/22 08:11, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 7/22/2022 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 7/22/22 07:46, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 7/22/22 07:00, Takahiro Kuwano wrote:
>>>>>
>>>>> Good morning, Takahiro!
>>>>>
>>>> Good morning, Tudor!
>>>>
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>>>>>> On 5/23/22 10:49, Michael Walle wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>
>>>>>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>>>>>
>>>>>>>>> Yes, it must be fixed in next rev.
>>>>>>>>>
>>>>>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>>>>>> as
>>>>>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>>>>>
>>>>>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>>>>>
>>>>>>>>>>>> SFDP spec says
>>>>>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>>>>>   length mode defines the address length)
>>>>>>>>>>>>
>>>>>>>>>>>> and
>>>>>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>>>>>
>>>>>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>>>>>
>>>>>>>>>>> Actually there are some devices that have variable address length but
>>>>>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>>>>>> series
>>>>>>>>>>> is settled). To support such case, I prefer to use
>>>>>>>>>>> params->addr_nbytes
>>>>>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>>>>>> hook.
>>>>>>>>>>
>>>>>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>>>>>> I will send datasheets to you in another email. At this point, only
>>>>>>>>> summary datasheet is available in website.
>>>>>>>>>
>>>>>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>>>>>> Yes.
>>>>>>>>>
>>>>>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>>>>>> mode" handling is correct.
>>>>>>>>>>
>>>>>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>>>>>> check
>>>>>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>>>>>
>>>>>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>>>>>
>>>>>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>>>>>> (spansion) specific hooks.
>>>>>>>>>
>>>>>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>>>>>> 4 byte address mode for read/program/erase.
>>>>>>>>
>>>>>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>>>>>> then you don't provide stateless opcodes for the read any register
>>>>>>>> op :/
>>>>>>>>
>>>>>>>>> So, I think we need to differentiate between address length for
>>>>>>>>> read/program/erase and flash's default address mode.
>>>>>>>>
>>>>>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>>>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>>>>>
>>>>>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>>>>>> program/erase and should keep this usage.
>>>>>>>>
>>>>>>>> Yes, I wasn't aware that we actually two different runtime
>>>>>>>> parameters:
>>>>>>>>  - the read/program/erase address width, also used with the
>>>>>>>>    4b opcodes
>>>>>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>>>>>    because either the mode was switched or the 4b opcodes
>>>>>>>>    were used. So this was mutually exclusive. Now we have
>>>>>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>>>>>    of the internal mode.
>>>>>>>>
>>>>>>>> I can't think of a good solution for now. Need to think
>>>>>>>> more about this, but I'm pretty busy at the moment.
>>>>>>>> What I think is clear is that we need two different modes
>>>>>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>>>>>> read/program/erase opcodes and nor->address_mode or similar
>>>>>>>> which tracks the SPI flash's internal address mode.
>>>>>>>
>>>>>>> Hi, Takahiro,
>>>>>>>
>>>>>>> Can we determine the flash's internal address mode by querying
>>>>>>> the flash at run-time? Is this possible on Semper flashes?
>>>>>>>
>>>>>> CFR2V[7] has current address mode, but to read that, we need to
>>>>>> issue Read Any Register which address length relies on current
>>>>>> address mode. Chicken-and-egg...
>>>>>>
>>>>>
>>>>> I see. What happens if we issue the Read Any Register command with
>>>>> the wrong address internal mode? Will I read just 0xff?
>>>>> For example try reading CFR2V[7] using addr_nbytes of value 3, and
>>>>> if it fails, to read it again but this time using addr_nbytes of
>>>>> value 4.
>>>>>
>>>> It's undetermined. In case we issue Read Any Register with 3B address,
>>>> the host controller outputs 4 bytes (opcode + address) then inputs
>>>> 1 byte. If the device is in 4B address mode at this time, the host
>>>> controller inputs the 1 byte while device is still waits for LSB of
>>>> address so IO is not driven by device.
>>>>
>>>
>>> So if the IO lines are floating, we'll "read" whatever is indicated
>>> by the IOs at that specific moment of time, right?
>>>
>> Yes, right.
>>
>>> If so, we're forced to statically specify the default internal address
>>> mode.
>>>
>> Yes.
> OK, let me scratch something.
> 

Would you please send me the datasheet for Semper flashes?
I noticed that the addr mode is controlled via a volatile conf register
in your case, but there are flashes like w25q256jv that control the
addr mode via a non-volatile register, so only a default value will
not empower flashes with NV register conf to actually toggle that bit.
We may introduce a dt prop for the NV case when needed, the disadvantage
being that the generic jedec,spi-nor will not be so generic, as it will
have a fixed default NV addr mode specified in dt.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
