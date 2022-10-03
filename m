Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF68C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KslRV9i+LI7+vXW933gwPgMPp48xJPTvF2p99yCghOk=; b=bAGe4Ph7z6K3sX
	E6VsARg4x+f30fJexMi9LSI9R/wlxKZuEEHMWQ8SLqDDdw37Ecaf614f0i0xgU6RIhNifb+RVx+Gc
	As5LFxp4OOoSdC3d+P9sjL+ALXvGsaEAyiXdKgZgG18XgxEtxjjVPpzhbuhkS0EgTng1WjtRWrR/N
	MQ2n6KgcHqyY6kAdQRYRi7jcrp3V/iS6/bY9uaQ0DDPFj24CQxnfSgrIjEBqY8Z3J89rfJHR71k5W
	tLO/tqxllGvkZaK3uoncP/RUB6y/0/S9lUKVoOy/esgB9WRPUA0csTIWNBFWk8kagap2fRibQUBoC
	0JSzERMgmW6Zdx8hWZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHyv-0057Ha-1f; Mon, 03 Oct 2022 09:43:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHyr-0057F8-Jd
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 09:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664790201; x=1696326201;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AMEIeSX5Zzz+HAP+2N8bFrlglG6HV498fA8FVQshiSA=;
  b=RFFk7f0DmhHOx/9EeX43aEfqmrWKcLd7Z0nLZqvdO+yrc2Tinr2shDlx
   pFZYaWMB4NbgbctrPBla4ZPhOIvsSmE+fhbnA38MGhd19EoT7QYxRUIAA
   PoMOqqDAk3CM//J1decPvHkyiWf5YBx/+nA44GfQRCqdaDdSLoDXET/26
   SDzukKQXCSliKr4hexYz6j2wq8QGDx4sQN9jQe0pKCUFAGASZ4kY3+nGU
   IJEid3gyyaKw5R6TCSoQsFiOZges+VN2r6f1UXphbZIeRM+MUc5wjHjXR
   mptTe+O5cFcy2L9uEcS58CmimijXkVsceCQgqrrAppzTBvsQgRU6cXbx3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="180059410"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Oct 2022 02:43:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 3 Oct 2022 02:43:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 3 Oct 2022 02:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR7FKab+8EkaJ2QPhAJR1weayIYTE8EoEFKxYsf03ZUw8AYubeMTF1fodHYnoDZwTMBQ1DYKbg+/M7IfnYg8KHtb4bEn/mhpceYWFt1lePbZ2c8vFdeGm9KZEQoL3A/b/zrTOWpWWTfmK+i3nJUEPshOT8EsJEH+d1SzDFnVOUSMrli0LsM+eKoBgqtXKoTiRFi+Yb2CIg7lyuVhmpJzEYEW7YJpLkh04sYyb5dnCizs+EwXAxuUAFM/q8qHW8CE3JExpQC0J05r0S24rZkJ51v8vUXRtRB0NgbwVOHkrN5ZXCshFwsjUPefpbXxltl8I2kWWl7ktlWK16aH/oAzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMEIeSX5Zzz+HAP+2N8bFrlglG6HV498fA8FVQshiSA=;
 b=bMQa/0QPkrprSQdZCK0WOUeJ/2noVIi8cCkvR5BgVRj5yUv2CTMPUF5VVlDr/ZOKZwdZU/8XMj1NEOhtqvpTu4GYJO8YKgRPMhPbok4vLtc9I/vUIRJxqkvRMJpNWAmvLMGILUr1H6v+WSQuGaORdG7UI6fhU5LNdsju1jLlybszkkb7av9NewsQxXfikQXG3EwXtgJ2GY2uu9LbaDuYV6JVDO6RwZmPU1dqsFwJVh6XeuNnnkqMAj64iDbkiun0h3wm9lYq9/ANPnlKuLC0JfpNnx2cpWuwy3EPufjV7aIqvtGLAknCpz1KPC4oCJh9ifRSk9adjKGaY1XewGafmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMEIeSX5Zzz+HAP+2N8bFrlglG6HV498fA8FVQshiSA=;
 b=OOrudKfSq8eWkdpt5Inu/yPidxvLimhvaubVoEWbfWRtw/tAdaTyMjBjQvmusqoBXhynWn2cb7YUfYltpKDxTqqtZA0G3YxreggJl/anBYuk3znlDRgYkoKWi97ajW9cUUQSqfi1qi216Yumx1pqliflZiinWt8sCYD1ZdkD5Kc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BN9PR11MB5369.namprd11.prod.outlook.com (2603:10b6:408:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 09:43:14 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:43:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sai.krishna.potthuri@amd.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Topic: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Index: AQHY1wyOMVqeK6UYGEuIaAC9FCmatg==
Date: Mon, 3 Oct 2022 09:43:14 +0000
Message-ID: <7777b2fc-8c22-22dd-1ffd-dfe8a21ea0d4@microchip.com>
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
 <20220908064428.2962-3-sai.krishna.potthuri@amd.com>
In-Reply-To: <20220908064428.2962-3-sai.krishna.potthuri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|BN9PR11MB5369:EE_
x-ms-office365-filtering-correlation-id: 1ac1be8a-baa1-4ebf-3841-08daa523b121
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NzB5kq44mXaGZk87UR+MNZugOtsMXaRjPWkAbDgc7gDYBlHAD5is3cMJtuIMqn4O78QXAtcK5f8hf89lm6F1jt5kzqk/oUdDXgyhmu67y/6c2fzAB2V1o84k71Ye7QsDGYAneNZ4YHxH/zaQsxKNke53oVgJfoDWa4T6IcKqYUcCdiHdDMT3x1xspeELpyJRbMLklJq2YyxDP9zYAMnh4W42DfSK91Bz1yHp/Fmh7AETczWtqcuyx2mSVoHKHpvF34+YmZRvTu6WQh7nhhKY9sIm5wK2pgSxsmLzIJW9Fz9YH2ISDZECOm43UFkZF8hQ+dXzEtik5u0zRFJffGc+YnqKaIwDxskVV1n83UgUrzrbW69iNGLhQaCt4nlsWJlkL2ICaeZQ0BZs0WxVAVaAnwGgVudIszazPqc/IVEf5Qz0VjRiScoDpwe1+Of1v1a17q7Dd2F4JX2mapKxHRsjBt9PMlFBOPZNVp6gJZrKjaNMLdOC7mO/jaK8nFP+OCzIVXDdbFUMTG5sbkUo7MJTJpCADMzsjDVR+p979POu9YhqSvbP4Kv3ZpUtPlmsjGNWYiFvmUdGznyLePpEzor6wmMSazhqf1m3hWHc0XBuyABAckm9SrFRr6QwhpSiIIdH5TwzVWzCnr3IJlQWMAzmpDoTCodOsu71Ymlq8SCx7YEwx/YGTZVG/nwRdd1tsJX1Q/oD4E0ITRSjV/rWnCfH71zWt8Wtbvapd7rAIowbceWPYvuTAkeMGksuTW5HmoKL1HU33tCX+j1O14ZoIXXwQm1yCzCRIK4JK5hi9dRFljm0U+Uug1V+w3IP5TQ0g8cx55hKZ92EBkdjIeMTn2/f7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(6486002)(36756003)(31686004)(38100700002)(122000001)(186003)(38070700005)(31696002)(86362001)(2616005)(6512007)(26005)(53546011)(6506007)(478600001)(2906002)(7416002)(71200400001)(316002)(41300700001)(5660300002)(8936002)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(110136005)(54906003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGkzdERrVkpWTjh3ZG1aSkJYNG5BMXJrdEFjK1Izdk9PTTNxck5IL29xOFVC?=
 =?utf-8?B?VmVQM2FkVzh0cnRhalBxUkp3TFZhWXduRVREdnlHWWk0YzNPNmkydVlSdDhI?=
 =?utf-8?B?MGdjYk5pOHZJVHU5LysreXZoM213R2xQNUVqK1dZQkJGYUMvMVgwd2NuN0tT?=
 =?utf-8?B?bW5DczQ5amNzeTdJK3J4NWcxclN2SUJUeVpOaXVKY1Y1TUFtcGZCVEtiNGhU?=
 =?utf-8?B?MzZTelVKSXpWb0JUZE9sYVhEVGZDMStWQWVzWVhZSWs0UE95MndiYkNLMVJN?=
 =?utf-8?B?aEpyWWg0TVBWUUkzd0U4Z0JTMHJhdVZpVXBVK1ZKV0lHV1RGVytGV3kxRnI0?=
 =?utf-8?B?eFNXakJsN0lUYVNJVEZVaVlHNFpXQzU2Q3lRZzlWc2F1TUpIK1M3U2tySzJ4?=
 =?utf-8?B?Ulh6b3NFazNMK2MxQ1FhV3dSZ0tDODIyTlRPNTQ5eEhJV2NTL3pLb2Y4T2FL?=
 =?utf-8?B?VEI2dTlNR2dYbzd4bGNaRVJ4RWg4KzNpMlNiVkxUbWg5WWFOUlh5c3ZzU1RP?=
 =?utf-8?B?LzZqMjIraDR0WFlDMGQvRTl5UTlNcjA3c0l1TngxNlc2MU5rY2x2SEcvVXRC?=
 =?utf-8?B?MEYwWDZmcHp6RnFvNUVsMXZPUHhsMWgzM2FpTE9Jd1ZpL3RYZlBndHRpSGFM?=
 =?utf-8?B?MUxETHFRNnJ6YlJId2NZSnJSSDF5eDd0dHhLY3FpWi9vVWlyOWh4NVJETGRk?=
 =?utf-8?B?MHUzWWJrQjJERW5ZSzNDS0ZiVEk3T3UvejdwMnZtVTVPb21ObldFTk9WUEdx?=
 =?utf-8?B?NVRPNVAvemErbGdyRVVidFl3cHJ1dmNvekVuT3Z5Yk13UXRGMmFjM05kcjFr?=
 =?utf-8?B?VzBiVzR5MVpQOGhnYnQ1SDZZK1VRN3pnRUsvMDcwOU9iUStyY0g1VTZnU0F2?=
 =?utf-8?B?UnRrTDhqOVdBVHRhdUFqOUVQeld0RmFiRGdCWEVwellkK0VRd2dPYXNEM3Vs?=
 =?utf-8?B?RXFEclo3b2NoMEdhM2FpT0xDaktIMEptYURpT3RKVEoyRWgvZDdCZ2JzQytC?=
 =?utf-8?B?eklCZHhodkVscUx5Rjh2dnpwYUxvLytnTkF4Q25Ld2NGa1hGWlgzc2cxR0ZC?=
 =?utf-8?B?ZHZPMGE4SUxRK2JEbTdGaUhkTGVWUWVxSTB2SUx4a3lmTm5LVVlzNjIrSFY4?=
 =?utf-8?B?ZnBEQ056ZHJpUDNsdUhUYUVwdzBXT2xDOHZic0JlWmtFVVV4aHlnRUV5Mmdz?=
 =?utf-8?B?TTczN3o4Z1V5OFliT29tbjgyYzg4NlA2eTh1bjBDc3RLY1lqMUFvUjRVRERZ?=
 =?utf-8?B?TXliRllubk5wVE9qNlhKVVpMVkljaFA0eGFnOE9hNnY1RS9VWVRLUFV2a1hL?=
 =?utf-8?B?Y1Y2RTUyNk03K0RLSTFIaHlpcE9CUnZMM3pBS2tFM25KeVFySCtlL29ja1Na?=
 =?utf-8?B?L2pFTDI1VUhKVkxjVGJzWFpZU3VYQ1V5bFBzU2tpb1BTcitTdC9WNzN6TVRu?=
 =?utf-8?B?WEV5MThtaWlHb2YyWVRVMndvWHJmN0R3UTQ0RWxCRG1WcEEvRkJ6RDA4dEkz?=
 =?utf-8?B?cjhoOEZBNG1iMzZQOXlCRHRaOUpJNUpROUk5MW9NaFZVOHdEeDlBaTl2bU9t?=
 =?utf-8?B?d3FNS3BOZUtqMjhGY1VEc3JZSTI0VjJoMVRLbUxZZzhRUjRyWHhQdkZUR2Z1?=
 =?utf-8?B?NldNSnZqVWZHcmozcWRJMDZQc2kyQldScFVmQWkybWU0UFZOMHlVbUEvNXdz?=
 =?utf-8?B?STFpdmxoUmlQK2FKSlFUSEM1TmRySWtPZE9hKzZuTmRSWXI0SGZObnJNMjVl?=
 =?utf-8?B?MmZUam1YTi8vNlN6Qmc1VUF5OE5ma0Z1VWc5eTlnM3NPOXI3WVdCYjJJWGlV?=
 =?utf-8?B?UlNTd2Z3T1VLV2FROVRHOU1ZV29QMnVUNjdFS1Ftak5lblMwTUNiTzhCTGx0?=
 =?utf-8?B?L0lnRnptKzY3VGtFRDlqTGY0NTVCeTFNUkppTlVkTmEybzVXREFRbHkzSFNN?=
 =?utf-8?B?SjFOaTY3dlNwSURGVWNGQU1XMFJkaHVSUWg4OEg0K2toSzYxZ053ekgzS3R1?=
 =?utf-8?B?U090Q2k0dXF1dkJabGVsRjk0Ym1leElnQWlwRy9zQ1VNNkd2dXZ1OEtMT2JH?=
 =?utf-8?B?QXZpQlFkZDFwOXRFYUU3RWpROE9yNWVFM2diRW0xTjlNeHY1OXRTNUpKREZq?=
 =?utf-8?B?cllNaFVjODhTZ003eE9XUXFZN0F6dWt1dUlhaG9WTktpNXN3bG1MQVdYa2Y0?=
 =?utf-8?B?VWc9PQ==?=
Content-ID: <A0ACFD4C8336E040B9B52F387A9947E3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac1be8a-baa1-4ebf-3841-08daa523b121
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 09:43:14.0373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHU0x1GILkwYRl9ZYeUfaXxTvg6zb4Vdy6of5VMxVqk/USEMZVnvLhm3lMVe0zosxkeeo0pe/tgmDhPgHMEMD3FGm8be9IIQI5X1XIeoYIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_024321_776946_54F51556 
X-CRM114-Status: GOOD (  22.04  )
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

On 9/8/22 09:44, Sai Krishna Potthuri wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for spi-nor flash reset via GPIO controller by reading the
> reset-gpio property. If there is a valid GPIO specifier then reset will
> be performed by asserting and deasserting the GPIO using gpiod APIs
> otherwise it will not perform any operation.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..a78ab9bae2be 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2933,6 +2933,27 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
>         mtd->_put_device = spi_nor_put_device;
>  }
> 
> +static int spi_nor_hw_reset(struct spi_nor *nor)
> +{
> +       struct gpio_desc *reset;
> +
> +       reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR_OR_NULL(reset))
> +               return PTR_ERR_OR_ZERO(reset);
> +
> +       /*
> +        * Experimental delay values by looking at different flash device
> +        * vendors datasheets.
> +        */
> +       usleep_range(1, 5);
> +       gpiod_set_value_cansleep(reset, 1);
> +       usleep_range(100, 150);
> +       gpiod_set_value_cansleep(reset, 0);
> +       usleep_range(1000, 1200);
> +
> +       return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>                  const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -2965,6 +2986,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         if (!nor->bouncebuf)
>                 return -ENOMEM;
> 
> +       ret = spi_nor_hw_reset(nor);

Should we condition the calling of this method by the absence of the "broken-flash-reset"
dt prop?

> +       if (ret)
> +               return ret;
> +
>         info = spi_nor_get_flash_info(nor, name);
>         if (IS_ERR(info))
>                 return PTR_ERR(info);
> --
> 2.17.1
> 


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
