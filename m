Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562BDC00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnaI70ilTnkonYMp+L4QWlwMD/G5kc5FGUnfOmgd6sA=; b=K2TfXp5S0RIlSf
	eZ2CzyCj41ActBRy44rigfPxerN6hMmByCOJNrMe8fSkdnRGpryjC3E1OzuBRoIRlo3kn+JOgtIpd
	xaOs5lPR46kerGFkO6BRdScwjSmV1Cc3FG/sjtXK7h+ofX9vQqHt1TEXfbwRrG+91hTV5F3/dsAzx
	49ad1F1+yv3otYcbEBDP2kbnq5Bu9mpkcw7nhO+MJQA/Jiy41JrUGFkW1DiO0SzRi8HO/nOfVErA0
	QzQJpDt8I5gwkIgKYfNAUrQMF+2ixQqcoO2gvFXXOgXiHk0VgtJH4Wd829xRqSN2uSpq3dEkef+IR
	bBTd8YqSyJx22cSN9kOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKy5g-00COZf-2y; Mon, 08 Aug 2022 08:26:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKy5c-00COWx-MR
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 08:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659947180; x=1691483180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aBAidzU0FVb0WUZF82ECgyuBx3SZI4gaseq24fecd+8=;
  b=GHXFOCKgHTY7s/ZIjnV4gdWIZkq+USv3Y5NFFj+lWPTkVWAguwfVEKCk
   vUSJkpkwNQAzta61YYjTQG2uIGt7dy8hPM9itGkzLXVvJIIkET/TRttIW
   HI/kjF0Ur+ND1p+ZAYlwHjaKIRWm4P+VTHhb0XLDtNHV60buTdakfqYnx
   ArBmHbFAaxg5wX9zge+YMEMMIue5DQli8aT/CI/TPyV8Ahng9n3z8EoB1
   +ayKsuLn9Zna3VNpaNIUO9+ycxNxUo9e+k6ER0EQnqXV3veruZaWes+zA
   SH6YJ+lTMRG1WM1VWeAIeUa90wLHJeb6w6tuq3B834Pi54rGqLc/j1tOr
   A==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="175474158"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Aug 2022 01:26:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 01:26:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 8 Aug 2022 01:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6OxNvYR9WvZr5UFNVJEp9ZQzlleJ9PrY8H5LVsVlfhL/SVlJLY0YMnCdP4Sfy8bKQZtKUaLuVLFEzWAhYvR9NHNoyKmok57WggG3GbTTb9AC0CtdjRai0CCLZHzFN25Ak9pBjqoSDoPr5UxhQz7BnbIwEihMV/W0ljqJSrjnwaEW1ZmYn3+yZy/OlZNKlH64WqFxeuSqWGAISjRQYejcYyFlBWLzwmc4Ls6oa6A/8ZlvhYiPHk42YcMlWnKc3lyoXlCtAP1cZRb/5kjgFEZ3c7jWVb/5uQK7DuWCKUCV5g87UbS9L0jrC4op745QfxUHCDZ5yDGI/wuyJ0lehUpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBAidzU0FVb0WUZF82ECgyuBx3SZI4gaseq24fecd+8=;
 b=PuCA1zUaRwsSEGSuO6yijNnflknB857F/XONaPIxEOlD+V+KovdnbCnpi9YYBzcX5ylRzPOvewORvu/MUJ3ybamyw4eRtFT0cjIzw0PjzJtbfwXQgYKTkLuo300KA2zZGIcKU/YrgTYITkqHVzlJHP7g9TaW7m/vXOOU4Y2hf2EImoahH14r8AIuH2yvW1gOUKw4ztXCLRBrXyqjXow+gY3sHz3Yq8ha3n0ukwwlGR6waQkQFPoo1YlSfHL4T3juZAlfGzkpqQO5hakrA6MWblor3Mo7Di/gwsDIHxWgKexmnO19WEsc1DQA9QzJ1+Hm3usGNJFwDaBhniMl6F1uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBAidzU0FVb0WUZF82ECgyuBx3SZI4gaseq24fecd+8=;
 b=I6PwQuw97Nenbuju+zrRfkApj6uKDXxMrHoNpKGInFFjFEMX3lLIuxouvNUhGfqhSTqwKLDMO5P9gTFVKNqIzqK5fPosRiScFoDgN96P50fem/mBWtPSL5k9kIf0Fd/a0ixOWWtp9TmRgBXWb4R3unch0GkituyuN3GBnH6knBo=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MN2PR11MB4382.namprd11.prod.outlook.com (2603:10b6:208:18c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 08:26:13 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 08:26:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Topic: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Index: AQHYquH3IGrZFUfrHU+ZRSwPyGM66g==
Date: Mon, 8 Aug 2022 08:26:12 +0000
Message-ID: <7c67ed6d-584f-61fd-a532-b7ff00a6a39f@microchip.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
 <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
 <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
 <4a182200-cff3-94e7-12a3-379638a52560@gmail.com>
 <43b898eb-cb2a-d905-fba5-cdf707978af7@microchip.com>
 <6ae143ef-5115-280d-52a2-8081c08bddf7@gmail.com>
In-Reply-To: <6ae143ef-5115-280d-52a2-8081c08bddf7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4a434a3-ef33-47e1-2ee7-08da7917a798
x-ms-traffictypediagnostic: MN2PR11MB4382:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLauCDla6Sslgfpyau7yr6y67voTznsmnmbPF3fA2TxgfBdamfcxkEP6d4AroscnlKghru1MrlM2xdGy+L2lq7O22DF9cR6DLAqzfVrzIQkyVQkjIfsqKwXgUzUeuIwj6cTmsyUfeItHWhadvP9+fH1Ls+agjp3O073KRmXqOig0vrWuuybzKColxPyt+2kc3iPDrTRpaliSAZi/Ghbc+HpwrXXYKhZl/RUUxjg+U4icyEOFrvI0h/QePKOVS6F/0dm00VFzv4S/ce0P8/NWk947YGzw+AnAUHiBwyNNmtQ2URtA77ccM3sGUH0+3xEfyEQabhCD/L0ybKMc2aIDwtc6S23M/+TptZtiZhE2CWVsefpDLSr4rmgeRWv7w5el+GSIqwj5WQNDQ8o+iYp1yI0hxBe9j+Wd0fKyHQA1o8V6XhghJO8aerkpGPR9VNn+7WAKS90Rsx7X69mzcdIEKxi7oN+o+c1rhP2q2oIsVw5Pnw+2NKU69V6bjiPT3p1W83w9QqijaWJrSHqB2GEmP76zYmUH/PLsYkrjfkIlPQjt3W6wfCIvI+wpUKTTcKsuCyubm+sBzIhhYpdIQXt5lq9nVpVIOPQwK2ErhTAuV/RKWjhVa7ckeZyQJuff/csgkJU44Rv4DOQW20w7pR6fCInuwoRDVZtbJZUC0fikqTlwDme1ML0sxykvpJlHWTObPUKpx7ZxzFlckFPLYLCItWWai0jDdB4fCjoasa5icsFsBgmKbOPP6KOcpbYs2ULUykl8lrbqz59n4Zvf2IKPdRDEN9MtFV53NZQn3xZdxg2E7uBlKVtFQAym4DpTeQNUhEzEu6r8yeYgIqYz0CmR416Nj2hoUlg/p5RKN4OJd7yD+1PL5a9AVpc6GY13JFVW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(366004)(376002)(396003)(91956017)(66556008)(38070700005)(76116006)(83380400001)(64756008)(66946007)(66446008)(8676002)(66476007)(110136005)(4326008)(122000001)(5660300002)(316002)(86362001)(54906003)(31696002)(38100700002)(6486002)(8936002)(186003)(36756003)(2616005)(478600001)(6512007)(41300700001)(6506007)(71200400001)(26005)(53546011)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnNrZGJwRTNYanJ2TncrVkFyenFuQWY4QTN1SWZLbWJFbjJuMTd1b01QT0pP?=
 =?utf-8?B?blZrenpJWXVBNDZXUHJKekZpbTB1c2dVY1FwNUFMc05keXJ6RXg3dHRwNWZ4?=
 =?utf-8?B?UTBFQUVlTStqMnpQNnZ5V09mUG1YTjVLK2lQSlJkbVlRYWgrK21jY2RTdXpC?=
 =?utf-8?B?ZzBSSzI1bzE1NDJUN3YxVXFBV2xVeVJmZ2xKYzE1QUw2Rkkxb0k3dms0VEhy?=
 =?utf-8?B?WFJRRlkrTlNlOFcvOFNuakN1a05qeWJodHNpTkRuUWZVVGg5R1JFVG5HVzNC?=
 =?utf-8?B?aHBuMDhKdU9vUGhkMGtGRFFZVExlMzdOTHEwZlhGbmIvZWhwdnVROUQ3WTha?=
 =?utf-8?B?QnppRVRjc3RGRFFtRkFURHFDSW1Way9ueEt6MGdyYU02bmJBNUJzWTFtQ0pn?=
 =?utf-8?B?ZHZTNUNkeTVEa3BOcERPOXZJTTl3ZHExYzBzY2pJQTZCTlMwYVRwclpEV0JX?=
 =?utf-8?B?eE0vSzBHcCt0QytYZmNaZTNYMkhSZnJ1SUdCdmdBczF6STA1a1p4WlJDbVg1?=
 =?utf-8?B?bTNuOE9zcnE3QXJxYUl2em0xajdNY08rZ0ttY2hGK0xhKy96Njg1djl0R3o5?=
 =?utf-8?B?N3IwS1FUK0VTVzFVVDNoUW5ybE5mSnZaUi83QVVQWDFQNDBNdmVWUElEbEFQ?=
 =?utf-8?B?QnRlWU1TTW9ma2JuMFlQZEh1N0p1cUJ6ZFk2emdmMVA5SUN0eGhUK0ZFbU9S?=
 =?utf-8?B?bUYrQitHSFdlUXdaU1JEaitsc25DdjdJRWc0UElVc2hSbXQ5clcyMzNKS1R0?=
 =?utf-8?B?QWhWT1lUVE5WYmlzbWczb1RUNUdzMVVzWFNxd09NSUFBdGlnUWRhQjFkVU04?=
 =?utf-8?B?aVJLK0JpRVB6M05nU09SL085YWdjZitJTnA5UVIyM1d1czd5K0RtT2RpUnQ5?=
 =?utf-8?B?ZFBZaGdJUXlWckozV0doS1A1V1FtUi9zRGovM0l6SGdBVTJDcXJ2VWpYSE5C?=
 =?utf-8?B?T09yb21wdi8zdGNMNXhyNWNNcHdLUG01VHhlTE1Uek9SclpBcldqRlhBOFdS?=
 =?utf-8?B?enQvcUhIM3NwVSs2RytpSkFGeFNFWkdSZGRQRm44Z0xGRml0N1UyV0pEaFVi?=
 =?utf-8?B?QzJtMzBybkt2TloyVEQzV1o0ZnRhVENMbFBnU05kc3BwTHBmbzBoeWQzNGhr?=
 =?utf-8?B?ZkpsT2kza3dWVDlmUDdXSXN6NkxQTVdpa2hWeFRMbFhVanV0NlBHNlhQVUcr?=
 =?utf-8?B?RnJBakVJQTNqdFZtVDRDUTRibWJUVFRBaDUvaEp0cGZTdXJmR1Mwc3I2bkhh?=
 =?utf-8?B?L3VLNXBjZGlnSkpIRUV4UFNqOCtub1ZqM0Zpb2dWMzZuQXBaZVV1ckR1QkRz?=
 =?utf-8?B?Z2RYV3NJV1N1YUNEc2YyaTVjUFRJL2NtQlVVbmhWL0IySS9IYzFmUm0wNlBK?=
 =?utf-8?B?b1QwbVgxczJIWkwxVXlHTFNjSTloaURTS0JiQXIxeHJFaEU1NnNNUTZXbVlD?=
 =?utf-8?B?aG1HR1N6T2p6VzVKV2tRVXRSVU55L00wcDVVZ1UwbkZVYlEzelZrWktoZUJh?=
 =?utf-8?B?NC9FM1JRaDN0SzY3WlE3WXV1ays4QU9kRkZOUkZyMThGUlQyVnArMjZKSGxh?=
 =?utf-8?B?YnAvNHg3dTlqNUtKUFAvNVdMVS9oUVJoQWtUczFtZ0p1QzhqbWhCVUdnU0FG?=
 =?utf-8?B?QmU0S3ZybGsvOWZkWnhGbUh0L3VXWnI2UkZqOU11bmdEaGlMZ2xoMnRMM2dw?=
 =?utf-8?B?dnF2TWJZYitLWmM2TGZGaFZIQVBGNUZsZmY5dE5FSUlpN1FUcFdINGw0QzBp?=
 =?utf-8?B?T1BYd0ZsS0lzZys4NDhTMkk5UzExYjA1Nng4RDdpeGp2R2Ura3VNMWp0SVdu?=
 =?utf-8?B?ajhsQUJsS0FTUjdSdW94SDlSd2xJd2NlUCsyMkhRcFhYSXhpbzJtbzJMOXcv?=
 =?utf-8?B?bElyRWpra1dqSlk3QUdZdDB4SDAvRUV1TUJtZFlWMEVTRGhkU0hmSzFvU1Fw?=
 =?utf-8?B?ZmgvdDVMMFNRdnBDQ3ArTlZ4Y25HZ1YvOWRlc0xwekxJY0lneklVRnJybCtM?=
 =?utf-8?B?NStpWXVuN0dBT3lZZ2ZNQnVRUHNKSDRkMk9HREg0UDNTTmEwSjBINWlBaTJm?=
 =?utf-8?B?VysvSjNlM05IbktJVjI3YzNNNVFkekFENStLenJJZ1dMRmFqaGdvZzUyVFc2?=
 =?utf-8?B?QVFTWTN5VHFuSE9kbW9nMFlqSXNDYUtubWtaZ0NIQUtObWs0TmxXcjFUNjhI?=
 =?utf-8?B?Y1E9PQ==?=
Content-ID: <D150741C1DE0014587591661E9995B86@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a434a3-ef33-47e1-2ee7-08da7917a798
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 08:26:12.8698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwyDZGpLoAZlUeGpvh4TiCFtknEEPHeG1XhJREr9IzQCvWK36X4T8kgg5RNUSPZ3uPzdRr97sgxI4eR+8ZO9HOf4BlChSTcVWtk2Iu/oZ5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_012620_785290_5BBA11D2 
X-CRM114-Status: GOOD (  22.22  )
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

On 8/8/22 11:09, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/8/2022 4:34 PM, Tudor.Ambarus@microchip.com wrote:
>> On 8/8/22 09:41, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 8/8/2022 3:08 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 8/8/22 08:42, Takahiro Kuwano wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>
>>>>>> Hi!
>>>>>>
>>>>>>>
>>>>>>> s25hl02gt and s25hs02gt
>>>>>>>
>>>>>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>>>>>> These parts are
>>>>>>>   - Dual-die package parts
>>>>>>>   - Not support chip erase
>>>>>>>   - 4-byte addressing mode by default
>>>>>>
>>>>>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>>>>>> only the first 128 Mb of die 1 can be accessed."
>>>>>> So there are flashes of the same family that are by default in 3 byte address
>>>>>> mode. You added support just for a subset of them and used a generic name,
>>>>>> which is not accurate, right?
>>>>>>
>>>>> We added model #15 (3-byte address mode by default) to address special
>>>>> requirement from a customer who needs to use bootrom with 3-byte addressing.
>>>>> Anyway, I overlooked model # difference. Thanks for pointing out this.
>>>>>
>>>>>> Can we instead make an algorithm to determine the current address mode?
>>>>>>
>>>>> I have just found that we can distinguish model # via BFPT DWORD16.
>>>>> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
>>>>> mode, that means the device is 3-byte address mode by default.
>>>>
>>>> I don't think this will help us. It doesn't matter the default mode if you
>>>> have a non volatile register that can be updated and changes the default
>>>> mode.
>>>>
>>>> Are there any registers/data that can be read successively in 3 byte addr mode
>>>> and then in 4 byte addr mode? We'll then compare what we receive from the flash
>>>> with a known value and determine the mode.
>>>>
>>> As we discussed before [0], if address mode in the controller and device are
>>
>> I remember, yes, but without determining the mode, the driver will work only
>> with flashes that come with the factory settings. The driver will be unusable
>> if someone changes the address mode in a non volatile way, right?
>>
> Yes, right.
> 
>>> different, the read data will be undetermined.
>>>
>>> But if we really want...
>>> Compare SR1 data read by RDSR1(05h - No Addr) and RDAR(65h - Addr 0).
>>> In most cases (without block protection), SR1=00h. The value of 00h would be
>>> awkward to determine if this is 'real' output from Flash or not. So, use> WREN(06h) and WRDI(04h) that flips BIT(1) in SR1.
>>
>> Would be good to have more fixed/OPT-like bits, or if we could change more bits
>> to increase the chances to not hit just some undetermined data.
>>>
>>> Therefore, something like:
>>> 1) RDSR1
>>> 2) RDAR with 3-byte addr (000000h)
>>> 3) If #1 == #2
>>>         4) WREN
>>>         5) RDAR with 3-byte addr (000000h)
>>>         6) BIT(1) is SR1==1?
>>>         ...
>>>
>>> Or simply WREN -> RDAR -> WRDI -> RDAR then check if only BIT(1) is toggled.
>>
>> Both may work, yes, but making the assumption on only one bit is fragile.
>> Can we use the Read Any Register Command with 3 and 4 byte address modes and
>> compare the values? Are there any registers with fixed values?
>>
> Register values can vary because it's register:)
> 
> So... let's use Data Integrity Check CRC registers. These registers do not
> have fixed values but we can calculate expected values by offline. Read
> several bytes (>=4) from Flash array with Read(03h) then calculate CRC by
> crc32(). Issue Data integrity Check command (5Bh) followed by start and
> end address (4-byte for each), wait till ready. Read calculated CRC by
> Read Any Register in 3 and 4 byte address (00800095h~0080098h) then compare
> the crc32() result and register read result.

Much better, yes. I think it is worth it. What's your opinion, Takahiro?
Others, Michael, Pratyush?

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
