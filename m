Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5FAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYkWrZGRjsM6XxwHBomskHmMzqIg56LA2zmw/sZWLeE=; b=YcFLr153lp5LD1
	kFsz8aUYWYZLyL13ED7EMFF7ooGk7bqZ69gQXyBHEs3BYNoU0m2aVDAJ5pLccP1eoSA7qcbt2TPYs
	bvcwQHA/M10mDUifwKx2Q4u/V9CoslO9g1snVMw0EkQfAMRXgkdWrgxAzHI0Xt7u4LHdHUKegyPE4
	b8HevoCoHLCnz9/gt6vh+cA+5aP1VdF+5xcJsJv1CIVZH1mgLwnFXDhC1dIr556orxrRoRjk7qVtB
	boyKULXbspRFNBOw1aC2Bb5X+2ob8Y2SIyWM3n/5+ngimTzovmeXJAcjWVfw+HJfJk52NpamRYvkj
	vq+H9as11CXQKpBolXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbBm-005JTY-0e; Fri, 25 Feb 2022 14:03:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbBj-005JSH-4P
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 14:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645797794; x=1677333794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B34EZUXnFYqm41OF0+N7NChbcaUh4YkL1vucE1SGYlQ=;
 b=1//1gXXgz0g9yDAp+BTlittwqwcEHgHso9s40erkUk9IjVrcEs3+MMtQ
 KBGvIdqZeCCPifi7I2empiUpHkFFe/BHMkPUo3xkTG1ofHrCCLjEQ3odU
 wA26Ol7soja//0ykUpYtdSvW/Wm/21D3NJzsmoTiQCm3tCLWYinaX1raD
 hEQqAvIXJcOMcZkqBtY8q8kdbCJSFbZ9VMMIM2PXPgd2Nb/VCU6zsOrzH
 YhIOdEfVbRrNFLJXPuvo9mdCtUWJoQmi0jaKO7hi6KBcMnGLH/9N/ehPo
 80laAiCzHOM4PkcOeFULKzcFzQxr8yY0dmZFOrY3l9D012dZfPeyLVnuv A==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="163650514"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 07:03:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 07:03:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 07:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbyZmBxGToNzjS/7DWbxwpCoG9lBM5rA5mctFOIa2DnqiuOYP9YRlEMa2KAQVdtJO5nlP5YQjHkF1tmZrv2GzkGvegSauB4sCOnfNCZjAd+z4OWGEDhsUoYSm/Dms/H8Rit94yaixaM1J64UmO7BAB96ZGoHVUofQKkUWoolnR6RcEtIiKRsbkf+6Lxg0YzfcoxOVjfXaiyDyZp/C9ZKzKGMp2HsBYW3BYxeFNffI81v4Qjrb61fCCZUIpp6Eg8uLqjnuGTCSMcK/q4o8DhpbqodSIFwOs71Qdz/XBZI1UE3j6geegygsl0HtlcdDb7FTBFFjEUZ272qGkbk7VTBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B34EZUXnFYqm41OF0+N7NChbcaUh4YkL1vucE1SGYlQ=;
 b=GsW6j4vfCxdJ/4v38L6yoWOE8BoKi7KF48kHVqRrQ/Co0/uvs1UgGXVwLIPJ0W7RlSYqBwwSiAP2qtk/fGKldtbHnzgr/ODClqPP3HX2cAMHTC6Hbeab0LoTA78miYxpVjVEaGp0zB9XbbYE/eavtkFBXGm/gIsDWVuuTLjh+E9SEgUILTzXtFlhbtdj3S8blh3qkyqeH4X3oW/YIorVdQfdHFiLJNVVaLewsvxvWCrsMf3yzgCvnfLXUAPZ5+FRt1YdjBu2ACN1JIMlbs8gtgWzleb1tUqI7IM1HJBn3SCW1EFtQ3MFiCTodjlfu+udCNflRFAll4BvoX5Yr+7+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B34EZUXnFYqm41OF0+N7NChbcaUh4YkL1vucE1SGYlQ=;
 b=db/8wp/y9Yv9R3MWfiT7w9Cn5VcWK47fQA2KGVDx81mbQIqRu7wqSvOuVr3CePWO1PpCGHUyQL6dYZjfVXfX52jyyRUa/1v5YTmyzkqesC2BiDfr0LVkleobiEQB/PQfVPMmY5I5XrYWrQRx9hT7BAKRyEm1jT+JA3Y6tyyIV78=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB1298.namprd11.prod.outlook.com (2603:10b6:404:48::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 14:03:08 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 14:03:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Thread-Topic: [PATCH v5 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Thread-Index: AQHYKlBqRJ8KViEGekaFpWEnk7/QxA==
Date: Fri, 25 Feb 2022 14:03:08 +0000
Message-ID: <3bd0bfad-7f04-a972-0f65-21dea2173dd7@microchip.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-27-michael@walle.cc>
In-Reply-To: <20220223134358.1914798-27-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9716044f-d964-42f6-4640-08d9f8678d65
x-ms-traffictypediagnostic: BN6PR11MB1298:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1298AA677D80BE00C55A6E10F03E9@BN6PR11MB1298.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t85WyNxO0W4zkafPzdzdRxFQJbZLng5CpbKsSVDquZQrLimfaIF94mZVsQr+p8P0PFh2fhpJK87Wqdv0qLt1T1jdlydEJ+1sJbVgdwdY40OSvoy4e4cl53v+GS5wWV9kVlaDzpoqggbVArTinHwV2GKV0HhXRjMrQv12jWhN1/tnglqa4L0GVmELZpjBMXtyXKtRZsyvMVddR+jAN1446AmamQ58puC0oOGoZkY+hGGqhK+S7Qdi0etwVEAAle0z+mV1TioIjMO7tH0RvJvzR5OncFPPJOgXqMd0Rk7gqeOomo6ESSHwJmwypBtKc2878pVHOV3pEpwaNkkhBa7bCTwrKNH5O6MhBnpuGA4mZJbfrNnkJPLvNvevzfL3b91bwQ7ebwlE7iz1fyU1haUthRz1W0NDORIyufMQWhZ095cxCX/uBDXgTaLmefvMa1qx5pwheJubquDto5OP2X+4d7pSrzj56Shl1Kl2KDaiMQ2q6KQgeLxHrkG9Rqw+gTd9mxLBotrf/CiN907eztUi7kDK/J34NP8bqKCtMVR1rfWQIp35WG1Xq/wOhD0c75TGb503bqxo/nNjIO7ylhZWCdwCkJB2LUvVEkAw2RQhV2A4w+eP48dYJ3X13AbE7Myu6H4nLwaiBXbY63lchEEx3hzWZXPtELzRIFWf+1J89zgkX7GYAjt7ljuDou/8AL5jD7GdDc//x4Q27B7DUQfk129rF79EQzFBpH8B+Mh1E72F1W+bNvnTt5f+1yoVXYkfoJ+YjFlnyGPrqvMzcpj/kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(26005)(110136005)(2616005)(71200400001)(54906003)(66446008)(186003)(2906002)(66476007)(31696002)(86362001)(38070700005)(316002)(76116006)(66556008)(66946007)(64756008)(8676002)(6506007)(122000001)(91956017)(83380400001)(8936002)(38100700002)(4744005)(5660300002)(36756003)(31686004)(508600001)(53546011)(6512007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3F0SUtpU1g2bmtTbVphUnpmbTZnK0loaCtZamhOcEZ2OWdTVnVyaWc1UGg0?=
 =?utf-8?B?ek1IYUZkMGVYZS9VcHY4SVZJemJzNWdqdytSSGhtSXVMQmcyVGNES1hkMitT?=
 =?utf-8?B?MFhYREZlaVEyK2pLY3NSVVJDS0ZsanhQL3Q0eVZHUUFEczRWNUZMVmRLZEtQ?=
 =?utf-8?B?dk44TWJNaFJNWE9MWXpsbitJS3JsTGszTExNQTNxSmZiYjF5RW1aQkNib3JW?=
 =?utf-8?B?RDd1Y3RZdXJ4cUlmMlJVcE13b0dBcWU3V3R0L3J5a3NXZG5kN0UreWFZTGVB?=
 =?utf-8?B?SnhaSDl2eXE3N0xGZElsTXpGTU5WZ3Q4dnFmL0pMNHlaMEdNbkE2RXo1QTky?=
 =?utf-8?B?TnN1SXNhWlBNZlREQkF1b0ZaQ003WlBVVktYbGdOYnVlZlNIV1FqVnRqZ1Zq?=
 =?utf-8?B?RDJYOGNqS1BObFdHS2NRSnlMcWJ2c0ZLeGF0c3JhclJNR2hnVmJzT3crWHhS?=
 =?utf-8?B?NDJEOVpNNTJDZVVPYTA4dDBySlgzTndUWFF6Rmx1dFk1MWN5dFBQck83c1Jh?=
 =?utf-8?B?MkxVVmVwcEJ5QWNUZkJuRWR2QXJuNDdXVXJzK2RlNXJzUGlBVU9aNCszQU9v?=
 =?utf-8?B?VnNwN1hrK2M5aFA0YUlmNkVmejUzMXJqbDhxdjZWb3hTVThSdVo2UVhSaW4x?=
 =?utf-8?B?cjBiZDUvTHJpZTEyZGpBY3UzaWVuSHNxa0dlcU5ycmhGVWFoUklSNGxKajBy?=
 =?utf-8?B?bGVpeHlYSEd5NXIra3VGSys2dzFFUGJUblJLUGZUeXVVUXFWNDFHd3JrRElz?=
 =?utf-8?B?b25VbnFLbW1pS3o1ZkhLQW0vRjR6Q0NGN21sZkdtZ0FoQy9rUm1PVUdaRldT?=
 =?utf-8?B?NTBwNE9IRlYwMTI0THdwQjVFbTBOK2JtMzgwc2FUMmhSZXkrQndONml5Y1Q4?=
 =?utf-8?B?QmxaTzB0SmhBNm9rMGZIcXY1aXVhbWtpTUVGSkZUSjNxZmNRUU5VNmJ1T3ND?=
 =?utf-8?B?TWhmLzdENmgxeGoxOG4xeEl4R0orSGtxR3d2UXkzWjBqU3g3YzZOM29DUjRr?=
 =?utf-8?B?MGsvOWRGU2plMTZSa3doeFhNNDF2b1p1OUpZVGVCeGtsdFROOEhTYUpCOXdp?=
 =?utf-8?B?Z2hHdW9yWDlkeXFQWW9vUjdEelk4MGYrQ2gzWEg4RHJYdnNEWEVZR09uTis5?=
 =?utf-8?B?U0hOMnBBRFFzMTI0VUNBMXlFVjd5cTlMeVpJZVFaUnJETnBuVUxPb3ZBUUsy?=
 =?utf-8?B?bVlNYWlUbzdaMzFmVWZtejBmbVF2V0J5K08zUXFBcTlRMjYraHBQVFllWXIv?=
 =?utf-8?B?Tkt4YW0rVVhqS1J1VWJXeHlzdnM1d0VTQmdwQmZITWdlVnA2Ty9mdUpOanha?=
 =?utf-8?B?VG1RYlhYRzVSMGZXSlVRejhwaXgydDNtc3hKZXNrUDBKeGNGK3Z2amg2ZmRs?=
 =?utf-8?B?eDZwMEtEVG1PV0pJT0VDdytLN1hvV3lPZENqUHJRRDlZTmp3b29TQVpzWnhq?=
 =?utf-8?B?S0JndlowNk8rdHczbEhYbVR0OTF4NHgyQThMS3JaWjdoRjVreFZYaklsc0dR?=
 =?utf-8?B?bEtYaFBYQ1E0S3loRUxFRGw4dUVRSERhUUNjRnhpZ2s5LzJTRzFUNkVOY2VV?=
 =?utf-8?B?d2RuTkcrSWJvY05nVnNyS1lnREs5L2hHN0xzQU1iQlArWTFlNFNOa0xYSnVG?=
 =?utf-8?B?cDFVYWhUTUk5ZFUxb0hNVzVPOEFLODN5VjBQY2NDTlNtRVNpdGdaZU13dWtM?=
 =?utf-8?B?OUZ1aUhheGNxYWFzUm10UU56Q0ZtY1lxV0U2SXplYnlRNEtmcE9GTVI5N1BC?=
 =?utf-8?B?L1g2TVFXVjBESWw2TDNqNFEwcFVVY08rQVJNcVZFM2JqeVBtbDVhTDFXY1ZR?=
 =?utf-8?B?Szg0LzJ1bkk4QVAwUVRSM3hFUFRnYnlpMGVmU0FKanZleEdRNThwcVFzb05O?=
 =?utf-8?B?YVppV2Q3ZVd0ZFZYSmZXSzEwV1p2Lzk0M3ZuUHF1aWFzYnhRMmdROTJ1dWJ3?=
 =?utf-8?B?MEduc3c0Z0JpRFlEMy9RZU9lTFduRHVrSXZ0VHdJZjdjTEk1VnZqd3hVT05w?=
 =?utf-8?B?S3dZR29BQ2hFNXhTQUp4SXE5aVlESDA3ekp6TVpaM1U4VitMS093Zy9TclV1?=
 =?utf-8?B?R3R5KzdyZGVLMzBZWWhraHNOVXl4Nm9iYm1xZ053eE9qRVFXcVg2ZVdsT1gx?=
 =?utf-8?B?SlA2MjBqUDhCQ0k1MVpveEwrNVdQNzdqaWQ0MVZDYWNONm5GNzd2VGkxeU54?=
 =?utf-8?B?TVNUL0MzMFQ5OEF1T0wwMVhpZ0hMREtVQkZuS1hiNUthWENLWjJiejM5akN6?=
 =?utf-8?B?TmwvMTVaNTk4Q3NUcFpVNlhKTWp3PT0=?=
Content-ID: <AF46775ED6C706489CC865AFD4977684@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9716044f-d964-42f6-4640-08d9f8678d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 14:03:08.6555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+udRpdNGjnTlyupbXR0v0G4D2m6seHqO4IhN4QmOXqZGOi8asKdKnQRjxIRDheva32Lti0wq4O/DHjyg/Vfw9sIfMjF2nbOgPd96xPfZBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_060315_271184_27E5A108 
X-CRM114-Status: GOOD (  11.89  )
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

On 2/23/22 15:43, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Drop the generic spi_nor prefix for all the micron-st functions.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, s28hs512t
> ---
>  drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 1a7227594bf0..8a20475ce77a 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c

you forgot to rename the macros, as you did for xilinx.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
