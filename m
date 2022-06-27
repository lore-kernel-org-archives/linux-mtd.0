Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98954C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Haj3zGUEHesi+naUxJVk3BG1lfhtBE8urGaYntP9W/w=; b=5F8d2K1ijBAaep
	5+gf/pe7UIRLNxTgo9dwB6syKLctRlMjKsJAK7whtRYs6N9H0bzisft+ET5hvixqjk7KEeo9xJqCa
	SsXKnUPKRoimaS4B0And/o/FsqkIK8HYGkOBKAVeujr5iqYZOaUcP+Alq22taEpcI8eXMKiiAtL9L
	ADHQs0Q7jZHmj/j+CBGffJvoFxlRZTtIHzj4Mjw8c+qpWNN6J0yHWSzvClUdWpCAKKtyGz9U3cgHM
	NJIEkeP+7I15B1ynwwRpmS/HjKrqlVn/RZps+vS4udZ8Ut+RbGbRkigNc8+1q5BRosuRLkBuTnWo0
	4BGFeWO/b/vT2zHvfPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5o0O-000vhe-IA; Mon, 27 Jun 2022 12:38:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5o0H-000vdr-RG
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 12:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656333489; x=1687869489;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7hxYpHyJlORtvS97/bpr1vI/CDvUwSlEjzCF6K/BsYM=;
  b=qz8mLCm8X7TRPttAJ0XAlnPBHXiEaz+lc68GlPCnqgAzIccCn2I9mZpF
   jZ3hGfu4ps7obqruFe1nURym5tJ5T8w5QCEHD0QvEVvK0X8xgBkLlz5hf
   zTBjuZghu2mJjy8DKF74dTh2LVRa7GY44OOfr5AwvcqizrMuxomJ5einF
   Xx2Z0fIf1zP2ohpp+Bf8cQ2VkDJkIrnZG+6ygvz5yGr/Oxz/53cFIuRiL
   CLqr01+0hCYiboZ7p1mE4AF/ohFMk0/kt9KkJfhs9y2IMhNdm9RWHvPxa
   wmEgbSHIK5bW+mxswdj8Jq6clMpn3LSZ34zNszuoh5l6wmQNSh2eyXlCT
   g==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="101886819"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 05:37:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 05:37:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 05:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGqcIlXjymFmhv/+pA5Vz4ohlLc3xemer9X0eoC3RtmjdhGcjT+wYoTcQLsSKJXCSv/qu5MxGscCW1whc64Mi4BVaj6XJPlWRpWmJTSS0jyf6awmHxucnpb1+6fGJR4RbhUlXcXXehDCwBjT2ncGeUMpUJFbLEdDxEVpANSnLcij8qjNA7dvO37tXkc3FEVe3FbR3CB1wwUsh9P54Vc0dWVdnwEafyMbX8HHbim9qS9cH21BbAMayOYV7agCL2nbVMLqVcWwfsnUWRhWCzKHp36zRLoApbzCg8Ku1fBiX7GgKyvcYMTeYCxm9v0tkIk0X/Zi/89sV1fNVl5x6KtNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hxYpHyJlORtvS97/bpr1vI/CDvUwSlEjzCF6K/BsYM=;
 b=THRomhlpu62AWKcjACo0qrF05K7kKtmkPxLXHuNWQhhcyEwfWKlLGMALiQ6tuO01J2sqmtgqd6oYdvY8Avrhk5j532wrz3cV/dAtVYbKH0REiJNwYFXv3EP0urlqcZp512RZYSGLy7d4qvovKoKQqQmZy/jtiup6nmXarEBIVU2+/xGzelrLM9jb1P6eKntoZ/P904HmjBq3oXM8HsUAlnqnbtAu4iGws8LOqpmpK2azLaEhWZdiUUBENJlCLYl8Bplc8OWA/8T7WC4s01EgOC+hOyscn8pXJQs3rzVaziN+PzEyepiaaojGh84pkyvr2mZ32izaMb+KqpYngL+KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hxYpHyJlORtvS97/bpr1vI/CDvUwSlEjzCF6K/BsYM=;
 b=HTSkWBASU8JYKBjfIRUUXVNQM2uOQbM6E5P3V5r+QESS47ePCfwGTzCrB04yFtQhrojhmmiFZe+a+kmMF+XudJUxXc4qlxL9Cz86XuFeZhQWq44ICZh4xaiYCiP/1d31W+G6CTMSmMCVGajK6+9C7uKtW2CbCG64GZWfx6IEctc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MWHPR11MB1454.namprd11.prod.outlook.com (2603:10b6:301:d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Mon, 27 Jun 2022 12:37:46 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 12:37:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <michael@walle.cc>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v16 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Thread-Topic: [PATCH v16 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Thread-Index: AQHYiiKzGRRRTeJg7Ua+yoirFmSQCQ==
Date: Mon, 27 Jun 2022 12:37:46 +0000
Message-ID: <0691a022-49d7-a07a-ef37-d63d2cbb377c@microchip.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
 <51c3b5f0a73bd6d812122f45c3b19b310332ead1.1654741888.git.Takahiro.Kuwano@infineon.com>
 <20220621055153.7dw3veo7z2hankna@ti.com>
In-Reply-To: <20220621055153.7dw3veo7z2hankna@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4c400f7-a423-4ea8-d34b-08da5839d674
x-ms-traffictypediagnostic: MWHPR11MB1454:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: loHtZLYr0++QAI5RfuGr7gwAsXWJSuS8x1cMMZS3p6DG9xNIIuPgplpOn0mgCLmKN9McMXM6Oyn3PuCGbjKRUjCAJCUK4zeukRkAkeeYG+tnJsTfXE629WQbFGNi+cAZnRI+fIT41cd1l//IhC0Rr0HtIi3MxJxDMYcxQzjy8Uf5Ff1Rt8VgxYAW3i0MBThnjcuPecQl16u2aUAjF0u5ccKcEXcSk/5m5GeFmxAMOxVZUTdj8bh+39r7KgPGgX51XAp8qyiWZdh2SA94UBRFxjpFNUXhFzr6r+T4+RLrKlMss5wPDqVWNqA4M70sQEcQs5besd4Ku5TAzgXIyhKbxamWL1rtx0l33fn6HbJmMGW3ub3C4jj30l5S7bNOlzpGVh9qMJKBuIa1w95v70VrJRbk45ZhE9FYUSqR544yDsVvC0PnkLPWwwdmxaCZ7G/DujrFK+eGCs7KjULehy7j+imnZ/4KXRolxqDwvA/K5Z3ZLZqGeNM2ls110m06po0f2+ZQJoYO7AnL4jn6a7sfqbCLUGKbYbyFw/NINPvqamn1e0LvU/EGtBkqpoBQ3DoFndvKp1keXw6XTDdwnLPqebxs33LKYtLn/4VnKRnyHaCFhYJvQn0hMtxHfVtztqaw9gv1NbIECPQfKfdl7uArUtwwyXj6WygDwKZZwNW+P/gXJyUL4LIQVExB4FqRFDfV5mPHTpM5KMCIxGl5V6/+qwJJBbCf8HcxbVo7YTcSdC0eZaOBSyK9qc55bM+UyK4xkzYQQp7rqmSKmk2D3+tF2D0sBFM6fKVtA6IDXP5HBehaZFXkKxfup7tLTC6xJAv+091Eb5VJywCo7mChWCU2PZDPnfANp+hWLz9FTUerME8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(366004)(376002)(346002)(122000001)(76116006)(91956017)(6512007)(66446008)(66556008)(66946007)(38070700005)(316002)(110136005)(66476007)(64756008)(54906003)(8676002)(4326008)(31686004)(26005)(4744005)(86362001)(2906002)(53546011)(2616005)(71200400001)(6506007)(38100700002)(5660300002)(186003)(478600001)(36756003)(41300700001)(8936002)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3hnM1R0emRnNzFnb3NzQWtJSnhpYlNTSE1CRkVvNzJUR0VPaTZ3VlhLN1VW?=
 =?utf-8?B?QkVZc0ZZTHkxQnlWWUFQeWRuUmJrMzdMMUNVMWUvZUtYcGpCYS9IVENaYXd2?=
 =?utf-8?B?YUMvM0pQbVZXZnhEZFZPUnpNclVBNTNsbjJodURkRnB3elhaby83Rktqd0pO?=
 =?utf-8?B?MUdUMG9wVFpwWEc2ZVJ1UlZnUmFnU2pQbENiRkFJQU5ZS01BcUJpVVJZUWVU?=
 =?utf-8?B?eGl3cGxyb3NMUVRiTlpPOFdSWDNNd0tMbDQvaGxMblJ3NlpBblJGcm12Y0lv?=
 =?utf-8?B?MGxKUGw3Q1ZWRTZGdUR0ZnI1UzZrdklQdlgvVHR1bWcvL2NVRit4aTlJTUtL?=
 =?utf-8?B?eGhRd2Jxdnc3QlEvWjI0SmFCTXQ1eTl4djgxTDc3cytCbEdXWVlIb1NBbGVS?=
 =?utf-8?B?eWJDQ0xQUnRxV0VFa2RueUttc05SeVFUN1BrYnBpMjljSVVmcDVZV3AzZWhS?=
 =?utf-8?B?cGpHMlE3clRCTGlvQ1dzZWs3RW1lMDh2U3FqdjlOWDdCenFsSGVpeTc3REox?=
 =?utf-8?B?ODloenk3eFhoZ2FYZ0hlbWMwNFhjUGtERmVuU0tjWGZIRmpPME8xajNFUlA1?=
 =?utf-8?B?WFFwRjk1TS9tRExKbTI2dmYvUnhvcnNLY09SSWhJamhTZU1WYmtaTmZlZzFI?=
 =?utf-8?B?em0rUjFiOTF1Ry9YSEV2c2plaXUrVFYvWThSRGVjZFQ0NnFwOTcyTCsxSEVX?=
 =?utf-8?B?Z3N2R3hxcmJMS2lLTFhjSVBkRTgzYVh5ek44M3Nzb3Z6UzZqZGZKTVZ2aXVZ?=
 =?utf-8?B?eUZUM0k5dStvMkFOZkl1KzlIM09EemVuV0tNaG5OaCt1VUhYdzcxTVVaZjdN?=
 =?utf-8?B?TmRtOVkzMzJMWm5vUDNid29qbnB3M3UvVGtDNXVNYW5La1BBc0Y0Q21YT1Vo?=
 =?utf-8?B?NXFCd2Rpbmp5N1pKc295dXVwZ2xFUkRHMktoZGV6bVFyVm5ML0pYNGxiQTVn?=
 =?utf-8?B?WDVhcTlMdzBERU8xWlpwR3BKVXMwdDRzdGltQStraDFzdExFczJNYUxVeDRY?=
 =?utf-8?B?cmN3eHJ6S0JFR1hYSk9UOUNpUC9PZFVqeTFZbHUrMW1kTUVzeks1alVuQm9U?=
 =?utf-8?B?VmpwMlZISVI4V2d3MkZYZ1R6dFIvbWowM1ArVnhHTUhFbVJ6QzM2RzY2U0dL?=
 =?utf-8?B?OFF0dFJ5SXRFZTdSaGJxeTh5dWhLamRaYVJObzh1VVAyU3VCU1BLMmJtMk02?=
 =?utf-8?B?SVZHbmhiWThvQTVSdThta003UjdlTzR3cGxnRHAxeWkxc1B0L29JeDBWKzdI?=
 =?utf-8?B?R0FXNmxYU2FJZ3V2Z0xmemZOSjNnektCZmdOTjNFZkoyYWhYRVNYaStCK0tW?=
 =?utf-8?B?VTFOYnl4NENYNnF3d0VLZ1BLQ3J5Vy9WT2xBZnBYMDNUQk9BTXpJSGorL0NW?=
 =?utf-8?B?YXNQSVF3WGFNVW9kYnFiMzdNSDFRREwrRm94bEYrOE1YemR2YzRyZ3VZS0kx?=
 =?utf-8?B?RU9vZlByOTRuTUxXdC9FZ0JkLzE5ellkRWJZeXN4K0xsKzVmalprdDFVYXdC?=
 =?utf-8?B?elBzb2c2VW1Sc3l6eUthbnpSZXJXSk9yM3pvNysydnVLT1FYZkRXRU5IRnVW?=
 =?utf-8?B?aWdHZUhqb21pd1NMQTJPdWdMUjk2RXdRT2VjZFRtT2VwV2lGc3NJLzRucy9O?=
 =?utf-8?B?NDd1UitKb0l6SUV3QjNHOTA2RDFtTUxJWU4xWFNRY2Y3TWZaMjRaaHdXeGU2?=
 =?utf-8?B?ZXNFWFd2M2dleVFDOXJlajFPRjZLWWd3dUpIWXY1QjI2TjBhRkRJTE02alNa?=
 =?utf-8?B?b09pbjY2ODdjME1qNEZ6bVVxeTZFZDRTQnJvamdoa01oSk9KQnhNWTkvSHk0?=
 =?utf-8?B?YW9RNEN5L1UxM2NSekhudjdHVnZYK2lidnV5SnR4R05WWnR4TEFBU0oxSFF6?=
 =?utf-8?B?bnhTK1B3WWZEbmhMTGJDNWhVTy91ODhvQlZIVVBnWlVHRmkwczRxZTNEM05T?=
 =?utf-8?B?N1RTWm5yTUI3bVRMM2xha0JSUmFFRHdBSW9Scml0QlFQSTN2TXZpNkpLbURO?=
 =?utf-8?B?cG9PZ29hNkIrRG5BZmhQVlZJT1lieHR3ZmZwZDN4emwxTzJ6WFZrd0Q1bTQ2?=
 =?utf-8?B?MmlldTlRZ3M1NW5wNVFpbDFaSEFockoyK0pTRVpOVnhxYm4zUGlNVVowN0Fo?=
 =?utf-8?B?Z3hyMG5icUhkbFRCRERBVWNsR0V5QzN2dndLaWFkOG1CYTBVczROcGJSZzdW?=
 =?utf-8?B?RXc9PQ==?=
Content-ID: <1673F81A99B19B4BA9058E5079B63928@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c400f7-a423-4ea8-d34b-08da5839d674
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 12:37:46.0238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arSmPKomkeuikYdkKNvjEsMpWlcr10+8g1mVRLpFY1wVdgyFlhkeXdy+3uPr5ntAa2SUNaiZae4cOHXGe2MZpoO9s3o3q8qMwb7PZxeM5/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_053810_001886_AC195F9A 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

On 6/21/22 08:51, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Takahiro,
> 
> On 09/06/22 05:57PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Didn't Tudor write this patch? Please attribute authorship to him.
> 

Takahiro, no need to respin. I'll check the series these days.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
