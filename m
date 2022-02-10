Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95322C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34rZpjsK6pPtrWcRuJFlRif6qwD//hfKoDhK3RxAlJ0=; b=eNavuuoJ9PnL8R
	E4r4e1G8cplBdzW2rfWqyG96SJ5LhJFFIk0NBj5sN9zbwqc3UFAT4XyRTA04OwEzyK+eVF63vOFCC
	fakgi2cfF8SuFrd0r6UTJYb58vQ14pJzMeakxwPp8hlqnrLzTwYhOo7/obbokEKu1rE5TAoM7qNRj
	EH/KWevUsvuE8iz3JUvGILpqWZtyJpuasTuJu6Da828DZe2i/dTjuRnIdJk5fXt29u57nKbD7nKqb
	gz0NQ5FnvFSpJUREYUkax+KfYBYRo+ddTwxUZNS/5nfiGJpSTOpuy7Q9KRFAuzbneqrQuQn3p7cHo
	wqR2SZdR0Hr/Gk6A7juQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHztj-002O1E-9N; Thu, 10 Feb 2022 03:13:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHztf-002O0I-M1
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644462807; x=1675998807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G19YS/ACCrWGuRS9BHgoQEAr/N6gde/BBYQf93HzpIc=;
 b=V62yAL1OwSk7Yqr6lQwbsVTM6BS7fsLyAHB4PH6HAln1RvhOEOrHAPOP
 L9OayqJZhvajGS6lGkFr04yaioaBOewIh/CowqDj2xQI1YUutJTu68FH+
 SO5LVvXYqMXzXl7PjD2IXtuqF1+OGKpw+JT6U36jlW2GDFMfpz8k2JffP
 8Hm78rlLI0Zxv+a8VTAAQsyVOCoPMfDtdPJkYIeRGG2SoM9ua9Wn828HW
 EPrJlCWerWOfOL1TathorGMkxbOcGajqmXinFoDBxkQLc5S/qRCEyV/dM
 7SboRZXB8F9jRvkRUVuulI0LiSAM7QMASafD7y6FgOilCWgr92CLR884b g==;
IronPort-SDR: QZORQy7LMoblBKpjhjp+nHTo7Tkx/cSFtIZU+x3xJEW7jRsfgfwZHZN4sm2WcjLnh+wB4SKj98
 D3aiYZS5gp2SccCPVQz9GNVJq6bafTuWrnM5i3EB+cjoiWo8/BiwiffiGpfm/Kbhmf/eKAGnT3
 rhIPk/KHXvSMpME0DBno6GrbufJ9REPcXeUVdqCny+QHmQZHPCwg8LB+hKLggl1T9sgmlxfOIw
 5tE+NIg71toPOSghGz0mp5ogetCpPHzsjr2IF5Jd1n0Cl0W6e5FFxpvId6yrmgX3/RJzb7Qgfg
 DOqpPVLEyBd+h7Kb1OtcRSgn
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="145478636"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:13:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:13:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7EBRiJp3YxODRlj0JJLFgcXVWW5kbL6a+djjHyaFGeBfEzIA+OGplrVUYrrq45QaZLM8/ll3dJH+aiT9YudJjJEYQBqBdbwYnjKb9l7uyylNkOIV8HRtB/P/kaeLL+tkrZ74mNOzxsu9elQNKtzz6dRCZue+mNJlo8o1dO5huH+j5hfSwTjueoKGTtYon6tXLbtkf/55c7NvbsmrsneB0MZWBx2v53G05CQSS4BgxodpqhoamWa7ZuL85ydt9jRdFc1mfwbzT/Oh4qUUQSRHiCfLIGm8Ez3NiZR7yPRRWsAI1sn3mpiC8mDH7M/rCTpGIxxvAQZA97GpNB2n/djiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G19YS/ACCrWGuRS9BHgoQEAr/N6gde/BBYQf93HzpIc=;
 b=V/SjVbDqRiVCHlgn4SnI2PzjHViC7eSu8YDz+/gL6VliaqAuHf2isNCK2nxpwWeg45O4R7tA43uJ8QvaydPxvxAl7r0K4USNPjUz+R8mS4eId7ig81SZHhuIk7ofnRifUa4E0JykHmpoMXq7nj8nBjpuu582WMYYee/kpe5jVDjMaTFgkEHQKmiK0ZtRGgGB/e4blnN+TGR6N+wmQ0N7J93VEvfZjRvAdmbmqpB+cp5FgYa532Ar71iAUmk+bsWtSLYu3CN1SazD2w9DqApuAq+aO3pqjQtEFLXis8SCLO5DCHGlBlyyzNMDkZhMenxag9vSl6IRHCkywhgf4FFqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G19YS/ACCrWGuRS9BHgoQEAr/N6gde/BBYQf93HzpIc=;
 b=l0YxesIfCbI36t5qH1pjYYu7QVT9L3i1C0bnt4BkKdhXwU4TOtzZYaDbpqzuvYMBVqY+BPZH4DuwkAn6Cp3C23SOFsiMX9QOW0e89hGiUixdp5S7j2SLXbJuRg62Lbr3vaCLP4kLEFbIxoVRGPKiC9RVs/9jGZYWw4b9J3exehM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2896.namprd11.prod.outlook.com (2603:10b6:805:d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 03:13:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:13:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 01/14] mtd: spi-nor: export more function to be used in
 vendor modules
Thread-Topic: [PATCH v1 01/14] mtd: spi-nor: export more function to be used
 in vendor modules
Thread-Index: AQHYHiwonZ596/xtb0qSZFGQwAhfPQ==
Date: Thu, 10 Feb 2022 03:13:21 +0000
Message-ID: <6551933c-9283-8fba-c918-fa9acc4660bc@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-2-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 754ec60d-3bdc-49a2-8cff-08d9ec434aca
x-ms-traffictypediagnostic: SN6PR11MB2896:EE_
x-microsoft-antispam-prvs: <SN6PR11MB289687F4C44E421B5D0B7522F02F9@SN6PR11MB2896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aiNBsJsoETZtO3sQHDl3X1Id4eOONCA8Q8ounzcnqzCpdomSXUqKN9XdlyKXLa0eMzOWkAEZFGG3GH9aaBOWvLztbqyKYGRvshwDzQyvNqtE3J6nUPEf6653AY6OFaWoR6sLc45t2lawl1RgX9C20hekmcb4L/k/poN2yvQhVV7QwKzznWlqXk0gxxl9hOQhzvvEvsMnGoaZ1YPFF7zYVjpMWzF414jLJOAAUhW/ULh0LgPdMvmXV1Pn2szENwzjwWktMK2OjF2XyIwWCaZ6YfuZYNJd0rpHZzlKRUOaEgPp1MqHcrz06YgKPREAw1X3sTP4ZJOVHtZoHVClNY3yRxzMAmNZeEDNOtz9AOxReG8hyFeUj+WYVJltek572lQQUIGot4c47ZMEQYCHRGEaYgDRFEY6dJloy+93Twpv99Fkgqizv/0rU/SvKbprx/hicLVmWFMAJQ2145k36OIKzGWr5zR7hh+L1yS6rEF3/216QmXOIRt+FrYTyFhp3bLo6iLBmzNWvbvMJHXLKXGZgL5aWWLjgaJOi3JDIv5o0YIKbhau/6065Q6ZV4BW2hl2UQKA0RZkglkLECxAeHF3gTN7tZE3XQMWGrR6mpIuBYQh4/DstdMWytOvR0wKRhWIQcPfGxrce2THLM0cwT+rc8SjGDK3v6zZvnJXzDpZIyo8EB/yVXoWw7b9EXteoIsDTiSr4oNxwFLsH2F9sdrVEOYskWAaQW7+xPV7IIb4qdxPnzDltKcgHjjqf+Xbud0o9y7ympwjDnhhLvk498zgBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(83380400001)(6486002)(2616005)(66946007)(66446008)(36756003)(4326008)(38100700002)(122000001)(31696002)(76116006)(54906003)(110136005)(86362001)(5660300002)(91956017)(8936002)(6506007)(71200400001)(6512007)(2906002)(53546011)(8676002)(66476007)(38070700005)(31686004)(66556008)(508600001)(316002)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkoyZUZFSjVMTXFFTjhkelMxVk94VExwc3pSemhMdVJFMklKdVBwYzlWbVpK?=
 =?utf-8?B?TjNzOVNPZVZsdjgyRFB1YXN4aVp0eG44WmVRWFZDTEQ2MGlQYWpSN29XZ2Mx?=
 =?utf-8?B?WEV5V0h1Yk1KR05ndzB5WXFqRm15KzBmdDVQNWZBZCtnUGdGbThaZm95alpW?=
 =?utf-8?B?THRyUXk5RkdZOUZFaDN0WjM3dGtTWDF5Y29rUjE4L0M5eEhVSFlORTNEV1lw?=
 =?utf-8?B?K2xxN0lLZTM5MXBYdGNVdWtiK2t4M2RVektyV2wra0lpbzBYcXQ3SG9oSC95?=
 =?utf-8?B?QmZFMVlQRTFoaDczamp3eWU4bmIxNUp0dkpTRGw5Vm1YYUpjQlpCYVk1K2Nr?=
 =?utf-8?B?WDhoUVpsRzdTaEhzWStnTzNFY0ppeW05bHc5cXFwUmdTYkx5eDY1em1Pd2xD?=
 =?utf-8?B?NXhCc2FZRzNjQ2NRc0ZhTCtDUlg3YVJmalMwNzZrWVVZelBnNVc2WE1rSlVs?=
 =?utf-8?B?Vi80bFN5dE83cUh0K0t0SW1DdVp2TWFCVHlIV3BXNjFKU3FQL0hBMUROK0Np?=
 =?utf-8?B?NWZrc3Q1L2l6YlRGYWVKc283SVRBZWhpV2hoblVhKzE2SUpCOUtOOXNZVE5X?=
 =?utf-8?B?UE8vdzVJOXdremRzdC9DZGh0SmpaeDZPSVloVi84Yklwc0M4bTNCNEx6UDZV?=
 =?utf-8?B?QVFST0lKdTluS3NrZ2ZadE5wWFhWSEJvOWNINmt1TTVhWDAvWW8zTzhEYk5R?=
 =?utf-8?B?Zi81NTllaHZjbVkxS29EM292YW5pNDlTZWY2K1crS2czaE5aM0krMXVqR1Qw?=
 =?utf-8?B?cDY3VlM5UUZwRFpVVEtueWZyNHdIek5KR0JWNWJuYjBsYkYwbWdIUW1qYkxq?=
 =?utf-8?B?dnFqQTdVOTVrWmVURVhNRHV3WVhWdUduWnBqRW1OaXVLYWR3QW8wNUp6YjdK?=
 =?utf-8?B?cStCRHhFT1NSMW5FR1RuSUNkZktwdlczczdkTERUaTFteXBDMFhuekk5SzVR?=
 =?utf-8?B?QkN6eFZtVkE5SkJtb0xkVG1hNm44ZFFPWDRycmFyc0NWRXBYNzF5Yk1HM1FS?=
 =?utf-8?B?NiszZnBDeGJTUnNPU0k2MGo3Q3ZnSHFiN0JUc0oxakl0Qml2K3h5SW1pTFFr?=
 =?utf-8?B?NDY3MjlVOUJ6aDI3S3UzYmtldlNsT01QWWRYYXZSTlRoVDRFM0crSTl1VlZL?=
 =?utf-8?B?MEhRUzlCSEtoRmFOVllrdkNVcm5rK2w3U1l5d3ZlVTVzT2Zua1hFVlA2a3pQ?=
 =?utf-8?B?alZTNmg5WmJLb0RQZS9veS9FSnpzMTVYbG8yd0hsanYyT1dpYUFPcUdmMFlw?=
 =?utf-8?B?VW9uaEI0ODNhSmpSaTE1ZXQvTnFDYU00VUlpMGE0aE1PUnhnY2FwK0h4NEFt?=
 =?utf-8?B?ZkJwL3l5WVdIeGVrb2Y4cDc2Ny9SeE9KNnBUMGExY1FzcFNhdkN0a1c2aTZ4?=
 =?utf-8?B?QVFUU21hUzZpU3BIZ0tCeDJzWEdaSzdjUHpEWG1QcFY1YWRhQ2owWGJpSmlv?=
 =?utf-8?B?bWdtNnlNc3FJN0JzQ3BDa0tFYW1tTXdYdmJ2R1ZTN3lnYWl3Q0dJSDBKQ25T?=
 =?utf-8?B?TzJ0QTVwcnRuVTdhMGpMTjYxbXA3c09pK1h5MGV0OEpuL1RuZFJyVjJLTXc5?=
 =?utf-8?B?VGpnSzZvd3d5cE9taStrUzlBTGtZRHVUYTh1OS9rMTU4WldOQ3paTUJZdklH?=
 =?utf-8?B?WktSZ3VBYjdDcXlPTnNWNlYrSnZqY0Mzdno2K0pzaWh0SytIalluTkgrYTBi?=
 =?utf-8?B?N29YbGJ0MnJrN2JnWHNJakk2ZHFTK0N6emtiZVJTS0RzZ216emNKaVJaajVC?=
 =?utf-8?B?NVlLb1BGQ2NDU2hUcDFDVm0xYS9NaThsSTRvQTFBWUFqelFvc0lIM2k5K1p0?=
 =?utf-8?B?VnhWVFBsbHFRUWNnUzZqQm9JU0ZnTWhrU0hkRFRmSE9wVHNxZG5Ob1lGMHpZ?=
 =?utf-8?B?a09QcTI2OStXay9mOUJ6TTh6VVNKS2k5MkR5UXVwRnhJdUl6cEhtT1FFVno2?=
 =?utf-8?B?US83SGRQYVV1VWg0SElzS3E2OFZLTGNXQTlnWkNoVFRvdkZpY2pjbkM0Y0NL?=
 =?utf-8?B?UC9HM2VLRVJvOEw5cVlteFVOWk9sMWhSSU1rNmN3aG5qY1E3aXZXblRxZmNh?=
 =?utf-8?B?NTg4a1JVV3JRSU1ZY3BYajBiSnB5dVlHUzhiR2VyZEJha25IU1FVN28zM241?=
 =?utf-8?B?QWJQN1ZmMVR5Skx0RGNBdzA3aVl5NzJtNjJJY29mN3dvM2dWN0lrLyswSHFV?=
 =?utf-8?B?MitGNFFZeWVzaGwwMW05OXVxZTFXUEV5L2tBUGdhQTE4ZW9Kc0VQU2l2Umox?=
 =?utf-8?B?czhUZjdIWFk0dkJlUXNpbHN3dHhnPT0=?=
Content-ID: <119B8319F44C8F4FB6E6C6438A0DBEC9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ec60d-3bdc-49a2-8cff-08d9ec434aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:13:21.0763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsC0nBFPLL2C0YnH/Ak7NYf8iaa6Gafi6AoqfywwwfWrL7o+0M7jIFPXmQvfuT54C3PMrcrK2Z7Vff7kxz76Jk/964qiunL5fZJP1zas3iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_191327_899045_BEE29817 
X-CRM114-Status: GOOD (  19.76  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> We will move vendor specific code into the vendor modules and thus we
> will have to export these functions so they can be called.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

please move this patch closer to where the vendors actually use the methods.
With that:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 10 +++++-----
>  drivers/mtd/spi-nor/core.h |  6 ++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 04ea180118e3..f05ece6018dc 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -157,8 +157,8 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
>         return spi_mem_exec_op(nor->spimem, op);
>  }
> 
> -static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> -                                          u8 *buf, size_t len)
> +int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> +                                   u8 *buf, size_t len)
>  {
>         if (spi_nor_protocol_is_dtr(nor->reg_proto))
>                 return -EOPNOTSUPP;
> @@ -166,8 +166,8 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>         return nor->controller_ops->read_reg(nor, opcode, buf, len);
>  }
> 
> -static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> -                                           const u8 *buf, size_t len)
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +                                    const u8 *buf, size_t len)
>  {
>         if (spi_nor_protocol_is_dtr(nor->reg_proto))
>                 return -EOPNOTSUPP;
> @@ -683,7 +683,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>   *
>   * Return: 1 if ready, 0 if not ready, -errno on errors.
>   */
> -static int spi_nor_sr_ready(struct spi_nor *nor)
> +int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>         int ret = spi_nor_read_sr(nor, nor->bouncebuf);
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 2afb610853a9..c6578d3f598b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -554,6 +554,7 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
>  int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
> +int spi_nor_sr_ready(struct spi_nor *nor);
>  int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
>  int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> @@ -599,6 +600,11 @@ void spi_nor_try_unlock_all(struct spi_nor *nor);
>  void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>  void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
> 
> +int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> +                                   u8 *buf, size_t len);
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +                                    const u8 *buf, size_t len);
> +
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>         return container_of(mtd, struct spi_nor, mtd);
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
