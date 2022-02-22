Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2078C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQ6jmD09C6E3BWMgr+RcWkTCIh58jMcxsOODNBo8HMQ=; b=XdqwoazbSUoAIQ
	uFC3q/rZOhKEV9I2UV7udjKTp4X7eIgngYT5reW46HuyFPsBfHTuCE64nrkV0a9kn1C4qDjBtgVta
	wPaljC3InXsnYM/FHU5IVNdjUU9WObxSUmvO+eFMWF3KiDSw9Pa7Nnesy8sYi7hWOutU7K4wm3GLe
	5075pHBUgGhRJ/BykiTGN+c1yyUSf9BpG60YAGLGX71fPfgGAf5DQ4bEiM5gv1P5RdDL0RH0LCfAF
	HNv5z4VHKfP844ntt9TuGU6P5xVW2q6rhrRHU1pVrrBFz6wsLb5q8+FfPUles4lwG5DS6LORT+vQg
	Ghtho7gED6uZsHpmjsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMW4W-009s9d-Pz; Tue, 22 Feb 2022 14:23:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMW4U-009s8o-H4
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 14:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645539799; x=1677075799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8DgsEypY4F7A8ia7iKs0bf2DKqMfRqUihvlcV/Xv9V4=;
 b=rlUYNFky9eHCBjCCvew8XlEWtcN6ZxqO8PvNTYWiHdQP9yVnYHKe3ayh
 qiGEGgk2V47k5/z8yO4KPioRPXc7GsZrb5VXiXDdkrPv9/5beTULy1ure
 YXAoK8beZHaYO/MrZnOY05Q6iy6HkHycDm7tKmZ668xMChj5Z9eMOGOc4
 y/Z7av8jR2rXnBa1GFoMDH0EgclaNExd87FBtO8ufMZoSKEzMGSpmuEoe
 UZ/9CsVMPa+AGYdf3lm7CXWs4LtQkaDRQjohW4eqwlJGdmw32GcSjLVxT
 cMsk+m8tx44IvlScS4R2hFuAmFP1/Fvc/wq2wIL8fWKLS4dpb1+1XWhZD w==;
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="153937069"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Feb 2022 07:23:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 22 Feb 2022 07:23:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 22 Feb 2022 07:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmMlfdKTVJ+ph+qX5DMKuIFPpR3aLr0XccWITDUiwn72stF0WOEEqG6NBly0UtXoVYkETJo1z3fhpCqq4XdCN7So0+vpQy54oZZJBGPfex6Ky3xAAYaMJS/igFe2oY/0acYNtkOphQKTswsDTLGThvJJVWYy6BTA3Q3Ip4Mu8uxjrgW2XpSTf5lREAloExIU38pofnHKWbr/9pjMyYnAnWtyk0bQIdUUA4LbsmjKjXNPM5izoEd8dG9FX+g1q2/t53fHgjrt5W6PKcGRtI1D15udkXXh7FWBhyc3Y6PaQsnSY3vLBDmdrkZIi75nmW2OfRAIisBh8dUtWstDAJNslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DgsEypY4F7A8ia7iKs0bf2DKqMfRqUihvlcV/Xv9V4=;
 b=EmQRAXZar8A5b+23AkQ17mfPViod1hdJK8OJtX6zR+8k0kgbCkBEjJpf+eyiieRGUGQ0HgEnO0Fod1CrIre4dWEZLWmEJjL2mZnoA+IwpGCXHMuJK4ybAcpRmo+tpXcm4vBHbPZnTLaFfpmQS5rEIsUKiV/UgV9op/70uO3cJwRdfNccEW1cbekrk/QnAx0UhMpuby5o/vmneHE8E4umrRt7Z7+RYeVG1h6e8zaRxFmMvwA6hNLWgGuziE8OQe3B4WYQ6LH5x0hnn4WJr+GVROZBllBVLz+ryffYYQHae5wHAf1AHv3uuWfgzWBFwEmQ+v43qAz6Jewx8y0qkd8Lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DgsEypY4F7A8ia7iKs0bf2DKqMfRqUihvlcV/Xv9V4=;
 b=vKlzb103uJq1d3+4mLvW67JilrbdltQhicBGlPEJjV2zWP3S9W5H1WYC2fqrg/fEkRDrDrcEeHmfW12e/yEuGisYGZFhm0dFYjWh9wGEnQAwNoqUuNzcN47ktclTgdr7DvE2zB0Aq6tOS8nGSDezC65F5lbT2I/dk0c07Ma3Zi8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN7PR11MB2802.namprd11.prod.outlook.com (2603:10b6:406:b7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 14:23:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:23:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/Dw==
Date: Tue, 22 Feb 2022 14:23:04 +0000
Message-ID: <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
In-Reply-To: <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06c0fc44-76a1-4589-e781-08d9f60ed70c
x-ms-traffictypediagnostic: BN7PR11MB2802:EE_
x-microsoft-antispam-prvs: <BN7PR11MB2802A51C358DF208428F9AAAF03B9@BN7PR11MB2802.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JfCyYTwlYwqyeJ1DhMS6l/BksGqbdK9hbjGjNcCqCZxEVorlS2Xk/KOPsB9OSI4pl+s0iGIKbIIlpll4optpR/iO5WM1pHXTLOsI8G4u9BJkZZ82RwfPJ9/qq/LhmP34fJZIH/JokFNDuO8nvoubOM8K82OdW014Sc0/8Vp3Ju2JWLEEpobY+ArBOD1c49Vvnxu7UWoWq48jgZg4K94Uu4+NgrlhUYGbx2G6901REZbFy90UU8itZVXfn8TAXkIQVdiyo7z1q9a+5MjjXx28EJabcwoP7V20JUKpe9CK4RHC6+aMsyawnndabwjKHq/UAd3LcdKr6c68jfvzya9qTC9mXs+ia9yeHCJ2X4s/EOxeYMKTA+4nlL+2hv208mc/roJXTONy0A7cCAgvvLHKqHJXc1LUXTy4cyojeVUpeN9c/x9LF2hHLyGZpJGZh+kEwXVmMWWcV3FO6CF0VSnnuepEfd4+CCvP7VPuJYYIZl62/SHf5mGHQqJg4L3dA8KQygc9TQ8gUxBcDqZBGkNJ0RF0joU1wbMgpHF9JBLbgZPRwwamqu9EFEo15D3Ei60eZG5DbkoO4SXa0HJsOZ2DOOjdV/ZX8OYm4m09uBUoCa2XT05/rlhpajyKGwHyp7CCcfwx8nay8dBsFMB0dFOTTa4iBxTD1lhSkca3e9pQZnIyq2Kx6FwNoxb+iZU7jskKbr/UB0Qzyd2w/HE6JUid+/C+704pt/Kszbp7pwWpt8LU8lHojf5qaesORyw9SeKTar2vhnc6eXoVUUuaa6afxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(4326008)(83380400001)(66946007)(64756008)(76116006)(6486002)(91956017)(66476007)(8676002)(66556008)(6916009)(54906003)(508600001)(316002)(7416002)(6512007)(8936002)(31696002)(5660300002)(2616005)(36756003)(2906002)(38100700002)(38070700005)(122000001)(71200400001)(86362001)(6506007)(186003)(26005)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhPeEpYVWFaNDFsUVNSQlFnMWdtR3NiTmVIK1BnaHJNMEkzMm9PUnRLSkt5?=
 =?utf-8?B?djRNWXRjYmlSclA4ajJsZGhkeE0yd3VZU2JCZ09PRGNhK0N0Ty9aMFJXSlNr?=
 =?utf-8?B?V01vMUVVSmlwVGZNbmFBOWtBYkNNL3Y1anMvUkNXdjY1NDBVTXV6UG5ka2dx?=
 =?utf-8?B?dWVqR011Q2x3L3Z5RDZqTXkzU1JIMVVWU01oVStNc0tqK0hOM2lReU1TL2Ey?=
 =?utf-8?B?MjJmNkN0Mm5UZTdsc3NUamljLys0cmY0QzdCb2ZOUDkrMEhZS005dGNXcHl3?=
 =?utf-8?B?dlBkN295ZURUdjhXOW1iWHVWK1pGVUZQTk55ZWpYWlNpSTYxYXVhRWgyZlZZ?=
 =?utf-8?B?UnBlSUNDaVBwd083RHdSaXBaclFNcU9OWnlIM05Ea3B3ZnBtWHFoMDN6SVU4?=
 =?utf-8?B?NVZVZzJqNnRYeXF1azRUckJhcW5pTWRiQWtXWmh4UURoQTNmQ3UwZFc3V0NR?=
 =?utf-8?B?eTRnQW5GeWNNSGVvbVdHeWRybFI5cmFsVzVaYmF4NllZeThpclpqdW1OOGJl?=
 =?utf-8?B?WHE1UTBSSWZDSEtaWElXbWhab01JWUIzN1dlTkcyZS9DbXBuR0o3T0psVDFo?=
 =?utf-8?B?SUZFcitKcXV5S1FlM0hMbCtzMEJJNlc4QXhKdmhJY1dkci9tRW1nc1JMVzZZ?=
 =?utf-8?B?T29BMjRkTnpIdjVnWFd0SlRERTNOWXczRUlxVUtVaWN5RktCRmJvdmZJS1Rr?=
 =?utf-8?B?QkNma2laMy9hV2lwK2VoQTFYaFpqdFdzWTArZlJwd0FJTzJpWWVJY2U5Ymwr?=
 =?utf-8?B?R0ZCV0QvRmYzeWtLMUZJL2t5UUlXUVozTUVsTy83UVBXTENxekN5VDJlZzVy?=
 =?utf-8?B?dWhnN2VYanVjWDJwTk83OG1tYVlHd3AzZDZmanZ4dnpST2xyZks5Q1YxWDVU?=
 =?utf-8?B?S3hVOEF1a0NvYkJ2a0NZekdKbUFRSWY4NnRpcEhzOGdRaytleGk2S2Z2NWFZ?=
 =?utf-8?B?WDlKZDV4TkNIc05aQStTVXBVU3FlZXppcElEdnV0Y1ZaZFl2NG0vRUE0QkY5?=
 =?utf-8?B?OE1RdjlJcFI5WWx5L3o2WitqSkRJaDlNYkRpbjJibW9VVzN6NXJMcTBmaXBW?=
 =?utf-8?B?Vk9qOGwrcVJiTEF0TitKQVYwc0xsOE1VVE4xTldNTElnVUkydHRhRjg2ZEJj?=
 =?utf-8?B?a3M5dEp2MHFwSFFXenlUQUdCY2NLUy9LeDJWQkdNRWhsWUdHSlkvTjBjdFdD?=
 =?utf-8?B?bDQxOURoMU43TWRXMW5LM2RIZld1ZHplYkZIelVQTC9RdW9idWVwUWZYTWgz?=
 =?utf-8?B?MUN0dFNrSCtjRjY5eSsyaVd3bCswTnR0TWw3ZmszdTd2bldKcGRvVDg1OC9x?=
 =?utf-8?B?ZXFrMUdKbm1KYzhvQnJkNm5XMVpDVVlXOE1qclR6YUN6cCtaSVIvalZGaXA1?=
 =?utf-8?B?Y0hJbUkxalNtRmp4RWVUaHNQcXNNcDZJUnhlbmpqaUhkZGlCR3NIdWs4RTU5?=
 =?utf-8?B?Mkt2eFk3SEw4a0pwOFhiaVpBVHp0OFJlVWZBaXh4MlpFa0J2K0M0NFZaQ0pD?=
 =?utf-8?B?anVwVW1RQm9UUk5RMnJXSnI2MnFZQzRyWURITmZrWVdPa0YzSFVWcHg5RjRh?=
 =?utf-8?B?Zkc2Z2FZMlN2QjdVS1grZTk1MUpYM2xzTlFVQ2hYKytTSXpRVVM1ZU02S1pk?=
 =?utf-8?B?Yk1PdS9vN3gwcFNCVFJnUnAxQk5ETHlhUXN1ZTNvL1JvYVBiM0loeFZLckV4?=
 =?utf-8?B?VEJSM3JnRXhEd284dUE3YXJIK3F6a2xoRVM4b0VOdmREZk9vUDgyUkZuL0Er?=
 =?utf-8?B?c0ZkN3JlVkh1R0c5bjh5RzBGaHhOMWpseHlBWlU5TnAwaCsxREFOQWZGazVC?=
 =?utf-8?B?UU9QZG9xdlRkSmI1eUNRUExaTHB1bkpPbmFFWE5BWGp2aW9Gc1VmOGg0TFd1?=
 =?utf-8?B?S1VqbXN3MlNBUDF1QStySU1iRVozY1FOOXc4R2hjbjhITzJpYzI2ZnRnNHZn?=
 =?utf-8?B?eWNtVVNWOStHNlhxVWEySFFab3grcWpiaTZVUmZNV0xuU2ZaQjlHcVZGU2d2?=
 =?utf-8?B?Qzdrcnh2ZDF6bUIydDBNZUE4UjFPS1ViZlZDSWQyVUgyNmwxNk1zejl4TGJK?=
 =?utf-8?B?VEw1OFIvTUZrV2ZXdEJNRzZoeENXM08vZUM2QzlydlNJQ0YrM21MMk5NUHUx?=
 =?utf-8?B?NUVRYkF5ZmZGY0VkaG53a1U0U0NSUVU2R0YwY1dRYzFFejg4NzdmbWwvZDUz?=
 =?utf-8?B?S2tCamhUSFBOZ3ZlL2k2Q2dzc2p3YnV6VTAvOVNpQUVkRENvSFg1clVnbXFj?=
 =?utf-8?B?U3dJajByb2d5VTkreERSNnk4cCt3PT0=?=
Content-ID: <3613EEE22A27A442B0867EF676AD649F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c0fc44-76a1-4589-e781-08d9f60ed70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 14:23:04.6620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UIwGQ9w6PXvv8w42h9sxNA97seIExNwNS7kuLoJnsQ5OE7R8ndqs/1PO91nvB/cVWSx5Rjp20vpiI2WWY2G+qwdAjPT73uazZgYfzt2eAQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_062318_601341_B6E4DBD6 
X-CRM114-Status: GOOD (  16.55  )
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

On 2/22/22 16:13, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>> On 2/21/22 09:44, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>> Fortunately there are controllers
>>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>>> Provide
>>>> a way for the upper layers to specify the byte order in DTR mode.
>>>
>>> Are there any patches for the atmel-quadspi yet? What happens if
>>
>> not public, but will publish them these days.
>>
>>> the controller doesn't support it? Will there be a software fallback?
>>
>> no need for a fallback, the controller can ignore op->data.dtr_bswap16
>> if
>> it can't swap bytes.
> 
> I don't understand. If the controller doesn't swap the 16bit values,
> you will read the wrong content, no?
> 

In linux no, because macronix swaps bytes on a 2 byte boundary both on
reads and on page program. The problem is when you mix 8D-8D-8D mode and
1-1-1 mode along the boot stages. Let's assume you write all boot binaries
in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when u-boot
will try to get the kernel it will fail, as the flash swaps the bytes compared
to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1 mode and
when reaching u-boot you will read D1 D0 D3 D2 and it will mess the kernel image.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
