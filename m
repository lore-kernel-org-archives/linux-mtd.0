Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756B6C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tELYK4lij48DIRHuGTyJQ3CczjO71T6peyYxby3+sRo=; b=qE9mCaa+PrwOxS
	dO/y0YaEPaM2T8Mh3IDTOXEi2Jr/OMLPHfYaXTLorNXIEfp+5AQUh5sazqvAjZ8NKUVVWUYMvZZr+
	tYt5RbGCd8w9JeQAlB/KRUoWaJzvCUifCXBpGAoC84ja3hzPAnH9WUmBO3gcjn3GCzsp/kJ+Dewnu
	zCn2+4SgnCYxfAahFNGm0KsLjHKfUCZcecrhlCa9R3zWANQwsXXMRQb9/rL9AWdwyeTZXyr+WEe2S
	EeWTWs4jG/8zRUjFhpnNMDxvKyVtBRRGcuSywr5bdsj9AMKBuBRa2ngR+GI9O8iKTUdQl8nZwDG1r
	Qj46hUs0Pol+XTAFtvEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofxHD-00CcJT-6V; Wed, 05 Oct 2022 05:49:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofxHA-00CcId-4a
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 05:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664948940; x=1696484940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0+AXWJO+VI6ZKP3pkBTckFt3P+jYUsNXIvMj2g4Pgc8=;
  b=Badf5/val1enZryHDajtufaWUi9qBX1Wrzx9x4iis4C1qv387cjr2NQ0
   sMU3k1U9DaL3VkuymSk9x/lxg10uu6zDdY24tDWFQHf5DAD9o7aQ/YM99
   CQkZfZwSTYc6hjw4qXyXbRuUsJmR68/Zg54ID+Ot+YxpBsvVWy1w6PTFn
   tuSCi0e6XBQCm+b53LaoHJ8HTm+jEzv8C0bj39MvV5b/OQY4jL6Fb1P+0
   FXRJx3eZOJHiHKXa8rQUvCd1CJ2O+lStSFwhbmg2cZYOEBad6OwHRQD4L
   D0mXO6ktt1AMhMPQV70ffUKFqzNoo2UxNlFHBbBZsCAvjNaYJq4bW7qfy
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="193863403"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 22:48:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 22:48:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 4 Oct 2022 22:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmtGt5qUMvKwv7YayAGqXZ/YwUC2wc7PmjZeHPOzJpr1IoTgGgnKMYSs+Z9aK3z4Abn5fj+U3CwvyBirREIlVkpPAtAlmjC7q8sClQuZroAsXfhTQsYgcvwqCsfjNBTUVeIr4Fwh/++TDefXDOrsVEMG4DFJicp3ExPDlUVK/apJ1lybjV/wvEMedTjbp9hub0Oxn/kds7q1kASkHG2BiVl/tfMeJ5As1fMNuUnSq7S4Rs9RU8DeHHU76Z0WuWCGOucm9bhUiCy3Z2GdnNREHATDxZ4reLJ6VYyEQzWqvW76GSe9NGk2dhiHDEA5QVjsiAQenq0MpFu0TQ1a1WtynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+AXWJO+VI6ZKP3pkBTckFt3P+jYUsNXIvMj2g4Pgc8=;
 b=l3VCXfqB2QK5qhJk56GLcF91yMU2ioiNeavIPUrL/bdNaZkktyurgkFKPh+PJxtudUJpS/PKjkpBReoxszUnTFBNnWjpISqrNA8X6MT8I8+ASYQWHjBPTlJfERT13XUqcCsgcI1Eko0BTGYsTxPYAoniagEn/MudrYeqUoZz+XmgNFeWnlWUazoFgEGqCyonlT5qFaQW56uQKDs8xt8+QwCWb+Ev8FZcS9GCj4MvqrG36V6X9ErlUhuiDUU+co7T+U6XexpmZ1K5sM9rmvxtT9miVTzB+ZbrBxTz44+D/+7RexSjM+cfO8ha42AODVcmQFNeuzqFpTn4Xf0NAIZT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+AXWJO+VI6ZKP3pkBTckFt3P+jYUsNXIvMj2g4Pgc8=;
 b=Pdlu8XQAhhT+nyEHJvWyQY/b8EFgxJyDddhZ5vOidDgB+8o+7hrJw7AkE/yyrOsDknesOFPF6Cf5bc5erT76FUZ6DB9jBZOO/KDgf1AN40qgoDWMYALzyKW7p7wrbVMEvO8qN4FoSAlxeSU2XIF6MizYxvZ/46TaL8W0v08WfFQ=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CO6PR11MB5572.namprd11.prod.outlook.com (2603:10b6:303:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Wed, 5 Oct
 2022 05:48:46 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::94df:cb94:4d1:3490]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::94df:cb94:4d1:3490%5]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 05:48:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sai.krishna.potthuri@amd.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Topic: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Index: AQHY1wyOMVqeK6UYGEuIaAC9FCmatg==
Date: Wed, 5 Oct 2022 05:48:45 +0000
Message-ID: <53b7f736-1f5f-7b89-671b-536bb4e02d77@microchip.com>
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
 <20220908064428.2962-3-sai.krishna.potthuri@amd.com>
 <7777b2fc-8c22-22dd-1ffd-dfe8a21ea0d4@microchip.com>
 <BY5PR12MB4258E91B51E4F7836828744EDB5B9@BY5PR12MB4258.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4258E91B51E4F7836828744EDB5B9@BY5PR12MB4258.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|CO6PR11MB5572:EE_
x-ms-office365-filtering-correlation-id: 23658fa3-77dd-4912-6355-08daa69544a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu6J3JNoY31B71nKpvYzsV95CKCjjhmI1GSe0JfcZYavKWeErg0ctZecCyHvHzZBApGQuel+Dcb88KNu1w0PoJzEk5P+7WpTX/GeTsMwOF1iMG5NgZkMPv7bQSyIdJze1GdJP2mvfwH3YSJB/qiFtqtkY4UgwRUQ5J8a0eQF5e7DvcMVX5KovzEvv+oYMk7eRfArCv1bxJGrJEsT+gY7KtQ5x1eQV/6fOEiqu9DUxYYNiXwoBZ0ijBxkt9Ck8Aga+2KJlo54LIcuajG522ceLKZqXSvU6TiezKQkY4VtiokMrr3f1C+JDK6I23F/Laf/5Vv0trptCoNTB3vT3WQGJLARkYuCd8dhjkSyGb/yUHXklwbM8ExDWmlagRKcKw1BzQ0uTVv1qjoH2jAGxW/NtAQm9b6Xvn5XQ8za9vEiWi5OK4K49MNCWpwj0riDr1SIbUrZch9ehHI7ENd8JhqH25ddo3b1YncWwZfT8RzIpSQDOYNKALbuS9uiOnIa/Uvq9zOBPtJT0xKov3QaDNashpDn7C5nMdCSY7H+GYWkfq9mjTJZQepPyW8ZkJEQQrqmXWAP/nYArJd7BbEp2zyPPMJqCn1XZWhcgCjLuXKa6o1WE0KqX46yo6eMsWZjPkvcxo1enVcR4axM0mo4zIoydN7xP59QpzXUYuFlTk0ro/bpt/ADRqCUGS7W6qBqziqlJZj1rPaF+3/ZoZ2FZbQowm5djvB9+lM2eUW2XO2EV/ifMSSTOvnMAXvxclwwhg4ndO7KNSgDJevuLZE9NGU8Xja3ZckEFf7J7m2SmGFl78dsXzSsI1SXQfvOgLjofcLgGmPrh5/yAhUfkLPau83l6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(66446008)(76116006)(8676002)(66476007)(4326008)(66946007)(66556008)(64756008)(26005)(53546011)(6512007)(6506007)(54906003)(110136005)(2616005)(186003)(8936002)(38070700005)(36756003)(316002)(91956017)(2906002)(5660300002)(122000001)(38100700002)(41300700001)(31696002)(83380400001)(86362001)(7416002)(71200400001)(6486002)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3lpZkJ5ZnBwczgrZkxrb0NBQllyQVFqaVh6NnBMdWlXUXNPR1dDVmI4WFFy?=
 =?utf-8?B?SzlmRGZCQmZRMTZXMzhXeDVORlpRMHNERVkxSCtIU2N6M01EVkpRNk81YjVw?=
 =?utf-8?B?VlFYVjhnSmlFVExhYkN5bXVxaVV3VXV3M25LY3IrRTcxa2lIQzR2NFVFazdG?=
 =?utf-8?B?c0hLRHU5QXloa2RZTWt3MmI5cWdMYzRMVExFdTBWWnZqbitycTJhbkhOak16?=
 =?utf-8?B?ZFpTYXovbDNJTktlanN5ZWhjUks5a3RsbW5ZVDZhQVF6S2J4OWxIc2RkUDNh?=
 =?utf-8?B?ODh1WFNLQ0dtQ3pIZ0dESzg0dkVVSUNyTlo1NkVPUGJkN3ZseDVNeU4vcDVO?=
 =?utf-8?B?WnVQVFdudzRzZXlPeHdOVTRUSWVDbkw5c0dXTjZNVW45TjNKWkJ6RTlZSTJ3?=
 =?utf-8?B?L0NrUE1jRnhqNll5bjNVeEtwWGlFeVMzMXZxMHVqbEdnaVp1OWZnL1lEQ3dZ?=
 =?utf-8?B?SW16eFAzeWdBanVNYjQ5cjk1bndVZU5LTU1ERHlDTEw0a3FNYUtuU2xHcSt0?=
 =?utf-8?B?WmpMTTZLY08yZW1YVmxyK1hHRVJUVFRETC9XNW43MkRaQ3NqSlBYc1pSUW1E?=
 =?utf-8?B?ZFRpNVZNeFlHeTVXYmI5aEhpdlpZbENpaEpUcEpiNUdKTFF5OWRKTUhhSXVG?=
 =?utf-8?B?a3Nkb200ZmtRaEh5NGlUd2ZHcnRvMHVVczJnaEJEa3c0NDhXcFY3aGwrTGc4?=
 =?utf-8?B?bEZRTVh1WnNkUW9CNWdtUzMwaHRxampRLzJWcWFKNjBJUkhJdlFNZlRjNjZ0?=
 =?utf-8?B?amxhNnlRK0w5b3hTRkhZY29YcEpuRmhsOFh3SnpwSU5ER2R2L21Ub3VHbXgv?=
 =?utf-8?B?TnhmUHRVWmwrdjBlR0YxTDlMQUUwZFM0UGNIdHVyOVJYUnNyNEFrK1A1UDFT?=
 =?utf-8?B?b3BoTGlxQzdKU3dTZzNEZlNjUzJydEpKc0YxNTQ3R050bElJRW0yQjM2cFd4?=
 =?utf-8?B?eCtCeUxUZ0h1ZVFZRXFzcVFnUTJYa3RPWUwrdjBCZWRmQWtxVDVPcGlGQVBm?=
 =?utf-8?B?enJUQmJhU1lIaVQ0dEw5MWp1aVRKMGFweXQyb1YyRzB3RzF4ZEtIN0hSVDNR?=
 =?utf-8?B?dmJkck9QRzNDWGtNaEUwa3dsL0cxRlVqdlF3SVpUWEljRDhEZWIwaVJTdnhW?=
 =?utf-8?B?SEUrOVNLcGs0dmtHcXQxamhsbmtYTzVYRTJXVzlJSG1DOUxaM2JoNUFUUGhW?=
 =?utf-8?B?OFBzdUEyZzU2SXVSdDZSNjFPeGsxSjBZUnRlSGM4UEpoYSsya1N1UmRFQk9U?=
 =?utf-8?B?TWsyTWlQaFNFNExUTW9NSmJnZkFZMkVhOHJRdW0rTEQ3N0Q4eGViS25TTzM5?=
 =?utf-8?B?cHZsRjAreG1ud3RZRUluZS9GUzdhTkk0czZoaDcxbERtVWVCSTh6Zm9sTTE5?=
 =?utf-8?B?eXlSZSsvMmVTVmJHWitZS0RwV1Z6SExBb0g1M21YQTl1TUVZQUZUalhTMWRB?=
 =?utf-8?B?MFhXclpLWnZnY0ZxMU9DcHVrMXZnR3AzL0pSbzd5bVNFM3ArUU5WN1lqYlk1?=
 =?utf-8?B?ditOSC9GTHRMT1hGdGtLY2FCVENJYmtqODM3MjVGekgwQmlpYm9nSDFUbGtG?=
 =?utf-8?B?OTl4anU1eWZaa0JHNnNKK3BqWXNidVYvd3ZMMGFBbXlhVlpZQ3JRWlhva3ZE?=
 =?utf-8?B?ZG9aYUpGUVFvWWJmVC83WnBlcGVjSFozdTkreHk5bENnanlZOFZHL3MzamZs?=
 =?utf-8?B?M1ltWnNxbU5JTWJoS0V1bFBKblJxVkhQWlpEUEtBNGRZNkQ3anlVRWJzV1I1?=
 =?utf-8?B?aWM2TkZSenRZVWZCKytZMVZtYXhXM1Q3VEJhWUJsdDgzUlh5ZXRtamVPOWt2?=
 =?utf-8?B?MEV5NVdaUFp4OFVBQXlkTlFJODVDN3pQTUpyUHRGYjNaSzJzL3o4MGJmNncz?=
 =?utf-8?B?SkpGMFYyUWZBQTJMV2hhL0hJbGw2elVmcTdHZU1VNUxRL3dBSEJwWVA3TnFH?=
 =?utf-8?B?Wi9iVTlUZlF2MitjRWNQL0hUc0l6bGM4Qm4zVC9UUmhOa2QwMU1pZjgwZ3Iy?=
 =?utf-8?B?Z0tBZEFMZHRYNjgvKzJ5YU9BR1oycFA0K1p3dnlXWTZVUjBPdzBmbTQvY3E0?=
 =?utf-8?B?ekVMbTFOanl4ZTVDc0taNGlURnRJZUxETXl4djhCM2pyVTY2SHhNNi9LRER2?=
 =?utf-8?B?QXc4Mk1kZUVnc0pZM3AxQVhtSDBLN1pQMERPZXBDSjZNN1J3NWZVTXFiOVhN?=
 =?utf-8?B?WEE9PQ==?=
Content-ID: <CFF374F7452D3847B2875CC2F7CE4D63@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23658fa3-77dd-4912-6355-08daa69544a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 05:48:45.7864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXykggYYUGmBqgRvNz5ZX7DpNaU9Rm84SBWWJP5TVpVEcegVs19NihnI40LtALYwGVihCbLiYkmisQoph0wG3JsjAcB3+mMMT8I/2d8sZx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_224900_213040_52831905 
X-CRM114-Status: GOOD (  20.72  )
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

On 10/3/22 13:06, Potthuri, Sai Krishna wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor Ambarus,
> 
>> -----Original Message-----
>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>> Sent: Monday, October 3, 2022 3:13 PM
>> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>;
>> pratyush@kernel.org; michael@walle.cc; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org
>> Cc: devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
>> kernel@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
>> <git@amd.com>
>> Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
>>
>> On 9/8/22 09:44, Sai Krishna Potthuri wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Add support for spi-nor flash reset via GPIO controller by reading the
>>> reset-gpio property. If there is a valid GPIO specifier then reset
>>> will be performed by asserting and deasserting the GPIO using gpiod
>>> APIs otherwise it will not perform any operation.
>>>
>>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>>> Reviewed-by: Michael Walle <michael@walle.cc>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index f2c64006f8d7..a78ab9bae2be 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2933,6 +2933,27 @@ static void spi_nor_set_mtd_info(struct spi_nor
>> *nor)
>>>         mtd->_put_device = spi_nor_put_device;  }
>>>
>>> +static int spi_nor_hw_reset(struct spi_nor *nor) {
>>> +       struct gpio_desc *reset;
>>> +
>>> +       reset = devm_gpiod_get_optional(nor->dev, "reset",
>> GPIOD_OUT_LOW);
>>> +       if (IS_ERR_OR_NULL(reset))
>>> +               return PTR_ERR_OR_ZERO(reset);
>>> +
>>> +       /*
>>> +        * Experimental delay values by looking at different flash device
>>> +        * vendors datasheets.
>>> +        */
>>> +       usleep_range(1, 5);
>>> +       gpiod_set_value_cansleep(reset, 1);
>>> +       usleep_range(100, 150);
>>> +       gpiod_set_value_cansleep(reset, 0);
>>> +       usleep_range(1000, 1200);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>                  const struct spi_nor_hwcaps *hwcaps)  { @@ -2965,6
>>> +2986,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>         if (!nor->bouncebuf)
>>>                 return -ENOMEM;
>>>
>>> +       ret = spi_nor_hw_reset(nor);
>>
>> Should we condition the calling of this method by the absence of the
>> "broken-flash-reset"
>> dt prop?
> This is the suggestion from Michael on top of my initial series for which
> i also agreed to have this call unconditionally. If device tree is having this
> reset property then we can do the reset in any case.
> 

Okay.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
