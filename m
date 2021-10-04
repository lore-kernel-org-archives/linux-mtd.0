Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA40C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 03:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E540611CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 03:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E540611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JZtAA9xS6OIthDcJmHBbOCgeGBtj7Akkn2kTxtL90E=; b=C7gNkqTYN4+z9U
	FGHA2HL4DxU0c3mxNnajhLPNZzRKsRBp3uVRiJGXj+yUtDhMqikIB2Sl1a16iJbMEUQF/IACXwBEY
	+dujVnSlHvJ1eZvywuR9YJme4t8Miqf2IU/KnyNbpQyz7LXGyqlOwbT/PadwjxBQeKPQUV9ZZ+aUm
	WRHIHbDAETYIqBdzAXI3G0XRja8AEcmgEbZfR/lY1ftJEVG9wvs5wpUL1yUOYW6yZq/03OLfVqOYU
	NnHU1HWt9md8lj0mE3QsQow3KrkPxDLlYCKVMnOnX+nhFkaawDMkY6jGiAvRM5lnPPI92CEkXS10G
	Cq2ER71I6KVDU0D4wCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXF1h-0050LT-9P; Mon, 04 Oct 2021 03:52:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXF1Z-0050KZ-Tk; Mon, 04 Oct 2021 03:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633319541; x=1664855541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E2IxoYwjXAbt9kj/BLD0NSXOF0HeVx4vwxXokBTzMnk=;
 b=JxB0n8nf2vLVMW1M+hh72ci1zV7Fw/cfl1hrfg0XQFh5WEq434Zfhrag
 zFXRtAZjx4k0miSXWru+Kvh1PF4cPdP/RpId4lIln/ZHVkZIvR6fzTxNi
 hCtKBQUqAmRzB09FZ6pbT/cwGndbdwmB2D1hRgZzN5dQKWZk97zyLzNbo
 1/wugwIwuZudZXNJ5z56x0jBJ9q+R6q97ArHcDmegTMJMoQMO28UKQ4sq
 mcpc2Cxa6JynN878RvFgcChW1MLSRhL6HcSSdhCdGbsdiMvIVo8likbLi
 zdQQC/Xzo8d6HSG0Fx01cVGIvQRLFeySB1XpPF9zizpgtyne4PSx267gG w==;
IronPort-SDR: d68T2JGXH7YHUnSVHlQn4t7igIJWui07RegmxxlbrbkZ4o1gIrpNXgZM2NYMD9F0jAw3nRZ/VL
 12pLHxuWh0PWYgGIJKGnbGfC2VKlyK7cmuqmKQTD9TKk2YVbUobOe6WCRXJPBl2s6q1RWHm82v
 e1s0chvkcc+vevTdHH1WmkDbkFiLn3Cj59air9+oFfjNNZr1Aq59mEdi48y/0hL01nbdDtADhI
 06Tvk5MRCbA5AkF7HHvbX0knfB4foq363su8IMF4MLZVtjCN6qjWw660GWgJ/G2kJfSj9FBzTg
 W6hrQRkNajCxazHEegkufh+3
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="146617558"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Oct 2021 20:52:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 3 Oct 2021 20:52:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Sun, 3 Oct 2021 20:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMN9mMAS9Y+nFlvXlwjTO8HeCwx8bUVY9rt/APoDtGHkkg/quoQsGHBJomFcAtAqqtGfVM1KOsZOvL8eI6dgtpQWvKG5NL0d59uXmZp1+BD249lOv1zcYplgQiEBz5WtpT0bAFen2OMC8rr3XHhf0lkIfbtWqBhC+jwA+WGOH0Oka6FPtldqj82t/QyMJOYd5vGOwIlwHUs6t/U9cGdGtcR311Qc93VPRdDvxbyfPUEsVIrw51kKMHsN77V79CUSBlZm9lruduEYXPeUyHU67YdZEPy5JaYaPX/HU5qbKLgbFcNdNeFxmlHPAfZi5V/FoYuV3xCNdQWJSEhiEZYzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2IxoYwjXAbt9kj/BLD0NSXOF0HeVx4vwxXokBTzMnk=;
 b=MTVIeoS+TBNkDXW45DL0VOC+Z9jvVGwNli+R6DiHzQLj1zX0/o0SCpM/rYpDTMxhH2eg2h3VL+/csRq0NYunyuQLFlylkdLU9QpWIdrWqwMc/82c+DHweabnT1kaiHUYUl3n0eICWfRuLWQq1OYVZEBcLEKX2ixsGP+ic5qwPcvho+Q8s5UOOQqkHTK71J4+GtJM1b3RMW70D53kd8XNFRRzly4Lc480CIFOf1LjVG6YPVn0dPEaSF71+fZs+utwQ9ZCqSx1rMHlAl2OjVEUMroa3qG1qv64oC4qKV0Dxul8neqcLtQwypH2qCd61ohoImpr6YxevpTrYcrQ3Q5MVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2IxoYwjXAbt9kj/BLD0NSXOF0HeVx4vwxXokBTzMnk=;
 b=k/NxyDgvUVlVECJpE61yXb1zJmjFGwXCJBVhy4MjZMnZGCPqaYklyVaGZ/XpvpaU/F1Ts9PeQQuADfAA5uKOVIsa1fTVeMxgq61sCj/vX+FAxe8k1gspaEFtRZSdK7ELmjHmvhwg7aJ/3p1MilkAM3NSEc4Mfy6Rk9oDNz+vgzg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3149.namprd11.prod.outlook.com (2603:10b6:805:d5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Mon, 4 Oct
 2021 03:52:16 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 03:52:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 19/35] mtd: spi-nor: Get rid of
 SPI_NOR_IO_MODE_EN_VOLATILE flag
Thread-Topic: [PATCH v2 19/35] mtd: spi-nor: Get rid of
 SPI_NOR_IO_MODE_EN_VOLATILE flag
Thread-Index: AQHXuNM4KwbrNgNCTUGql7puzLwhLA==
Date: Mon, 4 Oct 2021 03:52:16 +0000
Message-ID: <490dc958-1033-5807-5a67-8e7f6d064fd7@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-20-tudor.ambarus@microchip.com>
 <20210817122108.nr2elnkiyatdp2hz@ti.com>
In-Reply-To: <20210817122108.nr2elnkiyatdp2hz@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58ead789-4ab2-4021-2030-08d986ea5b72
x-ms-traffictypediagnostic: SN6PR11MB3149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3149978C048F895D195B74FEF0AE9@SN6PR11MB3149.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPJtWAvciFZUdiv10YQ9lL9Qoe81BKaS8pprIjICPmYaMAhy9h38PwWx+nntryeH2YAeLKPo7ePiO+03dC+1HGfYAaMaueiHlnzsxezM4n+pawKZ6GvMiNumDDGJbnvQf0+Kn0OAnfy3tPQGxvuoY8sVe/rSknk+frjH02mLsJGI49KLwOAM8v/9L1HSgNkbsZJD0Df6td/P51Gr1injTTszEB7WhcL/TRwMwGhTQLZU6PMY4AtZ6/EoYMVNOO0Ye7uwTHZu9Ql52u42fLlwaXdmkR8PfEmdJNg3lh3/FPLdIMp6ZtNAbi7d3Qvtht2+LLLyNe50be4j8f36AC/jlX5rb0deYnmlscdZsvtX6IlZan4ekQ1EEN4S1tFPCO1ve8xiDqwTRQCFgSYxllPsNfG49yviP2XJBAdiFV6joMygq5lvRt7BAc41qnbH3YZ6E65AXNrjbOvc7mYEyw/lhaKrlGFRXGqrIp/fv04ys7/JXoUmP1RbmVf4OXmC27qqv2hEqd0+4MAYMFyiOcV5T+YVxoFgvxUAX3UBHxRAgsmQRmUtiy0WLlBttbosreUk9p6eHjrPQehsxDg++6Ncq08KvDR7FCu5fl+NedVcNoT1UjI4vhMxfImMaSUoU0FnVOnKYDkcIEOkD4C5Gd0tGkoY0M/EuhxQkSr3lfw0wwZBRtvtlva01NQ2Np7wZh1135nc0p0pu1cNkHlUKP/wDo/wL+icDHjRKkZWVeIH9QMqUPf17FXwbQYQNXDLM3lZe37MVRJz7BNRQtWIu7BZVysbRw+xhqstHZZxupw5PjA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(91956017)(66946007)(5660300002)(8676002)(107886003)(31686004)(36756003)(38100700002)(66446008)(54906003)(7416002)(508600001)(8936002)(64756008)(66556008)(66476007)(316002)(71200400001)(6506007)(53546011)(186003)(4326008)(83380400001)(26005)(2906002)(31696002)(6486002)(2616005)(86362001)(6916009)(122000001)(38070700005)(6512007)(26583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkswVy9wb1lnRmo1K0J5OVZOWXVGNkkvT1gxOVFLWG5OZ3RMNDRnRkR3QkFU?=
 =?utf-8?B?Z1g3ZU9PTU5uZHk3VCtLQ2F0Rm42VkNBaTJ5a0cvY2o5Z3lTQnNOOWhDMHI1?=
 =?utf-8?B?NlAzNXl2czY5WTI4UjZ5eEo5Y01PYmFscHdWTGFVZXdGNjQ2cTR5a0Z2YmF2?=
 =?utf-8?B?TmJndmkzTVh5c0tMNERPV0lUdTFFVi90b2Q5WFduNHVSdHhMb1hwVFAzN2cz?=
 =?utf-8?B?blN0Ny9jSUNvV2xtQ0t6K21zOUhmLy9jU3VadDdPTVNnblNsSVNUOFRaYXpt?=
 =?utf-8?B?dUMvbFQwRzdyTjBsb0ZSR2lnTWJwVWxRMGZtVDZnT0JYVWx6YVBaMUJ5U3dy?=
 =?utf-8?B?RXZsRDVlYzlQb3hZN3g1dGF5SE5oVUZZcUoyR1ovWVZuUm1nTGZic2JIQWRP?=
 =?utf-8?B?bVQvZkdJcTlvREN3VXhLenJJM3YxYjFGc2pDSjNVRnFEWkdJTDRqS2VSYnNw?=
 =?utf-8?B?MkMvQUFCRkE3WTRMZXF6bGhnbU1LakVGdE80UkRxVjF6c2hjb3NlNkoyQkta?=
 =?utf-8?B?elRVZ0tLNzRSOTcxYnpKT0tJKzNhWUJxMGtZUjJMTWJjdGRDYXpDOEhLbEJO?=
 =?utf-8?B?Ymd6NDJOU1F0Y3Fha3k3TGZQbzkzbFV6Qi8wcWI1amFhbmNnM0o4TEpWQi9W?=
 =?utf-8?B?VUFMNTlvZmVIWUgrbXdTQmRMajVJTlcrbGhMTDNCdmszVDNwTVdGc1JSZlFj?=
 =?utf-8?B?ZGo0Z0tlditBK3k2MnlsNUNaMWtLUWVqOTYwVWFEZEFBelhWcHAxa0Y2Q2Fh?=
 =?utf-8?B?czh3dzJsSXBhY2NSNGVmTEhnYkpmQWhUeVc3ZjArUytWMk14T3YyV2E5R3Vn?=
 =?utf-8?B?S2Z2YlQ5NFdTRWxUR25IUmZDNnNnT044ZzNTcVptYUFaRlZBeVQzbEk3OWhQ?=
 =?utf-8?B?NlB5VEMrVEp1TnA2a2VGbkk3cHgydFovUjVFVHRSczU5ajJlOWcrWlc4eTVl?=
 =?utf-8?B?Tlk4N2lLVEU0ellVZnZUNDRFcFNDQkxYTnExZGlsZ1RCYkVSb3FRWGxTUmZE?=
 =?utf-8?B?SXpXN3FwMGRRelZSWkpGZFV1eURDU1ZRcmxLZ3JYdHhmdUVSUGkrMDhyUnNZ?=
 =?utf-8?B?K05XVGY2NnFwTXdIRSs5cjFUSU5JZFdZY3U0QmJrcjR4Ri82dHRwc3Zoa21n?=
 =?utf-8?B?ck1ObXFCNHRVa1Z4a3V1bHd5Y0dRUTlvY0pNOTZOTzg0UXZLR3NpUStCVVkr?=
 =?utf-8?B?OXIvYUhxZ3hvMUhETlc3QUMwZWYwR05hQnA2dTB1NTAyWEh0N1dvY2RHTEov?=
 =?utf-8?B?c3Zlc2ZlRVFJTmxvc2ZIYSt6OWFwa1VwR3AxWUhPRjJoRW9oMTU5Wkg0NzM4?=
 =?utf-8?B?RGE0RU1qR3JDK1V4dTZRUDVEcWpDVTB0UXZ6MEVkK1poZld5WWdPdytoNEpp?=
 =?utf-8?B?WVpNdVVkaFV2aEptM2FBbTRtZUhGZTlZSUVrc2JqOEJ5aHhBQUMyNUZ4NEdT?=
 =?utf-8?B?c1pBQjIrV2NBMGwxdWhleWNIb1VnR3IyVERzd0JEKyt6SGt3SGxnNEhuSGph?=
 =?utf-8?B?QS9rK0VzSzZ1b21Dd005cWxHZHhtNmpySzlVZE5tQ0JnSlFmMlBKQmNBdEcr?=
 =?utf-8?B?NWNDaWNwc0tMazRpK1BkVFM1TlpROWY1bWxidXdnT2w3cE1vdVRzWXNQaHNK?=
 =?utf-8?B?RzBBMUNIVjBZQVZiY0Q2dzNUNDVvM2F2V0cyUEhqRlY1SnJTNm9DbnFXcWtX?=
 =?utf-8?B?YUQrc1RiQWZwYlN6SDFHOHRYcHJqVTVOTHJ4QTlGY3RKbXNOWFFFNjdzbjM2?=
 =?utf-8?Q?b0RRZ1jQ9SCY0BUG/c=3D?=
Content-ID: <DA0282103716D5419CD2FEDDF0917590@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ead789-4ab2-4021-2030-08d986ea5b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 03:52:16.3315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rl+SeSOmfroIVB4kzmdZit9sFeCkqnD6yyWtu+XXGg7QG2ErmO4nVsojJSeTovXSL2VhIP37exvnY2VdzE/4IV+K3ra3TmFmYbSgM142Sxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_205222_001912_35EBA417 
X-CRM114-Status: GOOD (  21.35  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/17/21 3:21 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Get rid of flash_info flags that indicate settings which can be
>> discovered when parsing SFDP. It will be clearer who sets what,
>> and we'll restrict the flash settings that a developer can choose to
>> only settings that are not SFDP discoverable.
>>
>> SNOR_F_IO_MODE_EN_VOLATILE is discoverable when parsing the optional
>> SCCR Map SFDP table. Flashes that do not define this table should set
>> the flag in the late_init() call. Flashes that define the SFDP optional
>> table but get the value wrong, should fix it in a post_sfdp fixup hook.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c      |  3 ---
>>  drivers/mtd/spi-nor/core.h      |  9 ++-------
>>  drivers/mtd/spi-nor/micron-st.c | 11 ++++++++---
>>  3 files changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 240d5c31af88..9885d434ea83 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       if (ret)
>>               return ret;
>>
>> -     if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
>> -             nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>> -
>>       ret = spi_nor_set_addr_width(nor);
>>       if (ret)
>>               return ret;
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index dfdc51a26cad..987797a789c8 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -367,17 +367,12 @@ struct flash_info {
>>                                        */
>>  #define SPI_NOR_OCTAL_DTR_READ       BIT(18) /* Flash supports octal DTR Read. */
>>  #define SPI_NOR_OCTAL_DTR_PP BIT(19) /* Flash supports Octal DTR Page Program */
>> -#define SPI_NOR_IO_MODE_EN_VOLATILE  BIT(20) /*
>> -                                              * Flash enables the best
>> -                                              * available I/O mode via a
>> -                                              * volatile bit.
> 
> We are losing the information contained in the comment. I think you
> should move it to SNOR_F_IO_MODE_EN_VOLATILE's declaration.

ok

> 
>> -                                              */
>> -#define SPI_NOR_SWP_IS_VOLATILE      BIT(21) /*
>> +#define SPI_NOR_SWP_IS_VOLATILE      BIT(20) /*
>>                                        * Flash has volatile software write
>>                                        * protection bits. Usually these will
>>                                        * power-up in a write-protected state.
>>                                        */
>> -#define SPI_NOR_PARSE_SFDP   BIT(22) /*
>> +#define SPI_NOR_PARSE_SFDP   BIT(21) /*
>>                                        * Flash initialized based on the SFDP
>>                                        * tables.
>>                                        */
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 72cc4673bf88..31ebd4c9b431 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -118,13 +118,18 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
>>       .post_sfdp = mt35xu512aba_post_sfdp_fixup,
>>  };
>>
>> +static void mt35xu512aba_late_init(struct spi_nor *nor)
>> +{
>> +     nor->flags |= SNOR_F_4B_OPCODES;
> 
> Like I mentioned in the previous email, you can drop this since the
> flash populates the 4BAIT table.

ok

> 
>> +     nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>> +}
>> +
>>  static const struct flash_info micron_parts[] = {
>>       { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>>                              SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>> -                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
>> -                            SPI_NOR_IO_MODE_EN_VOLATILE)
>> +                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
>>         .fixups = &mt35xu512aba_fixups,
>> -       .late_init = snor_f_4b_opcodes, },
>> +       .late_init = mt35xu512aba_late_init, },
>>       { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>>                           SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
>>         .late_init = snor_f_4b_opcodes, },
> 
> I forgot to say this in the previous email, but since this flash is the
> same family as the one above, it should also have the 4BAIT table, and
> should not need this late_init. But I don't have access to this part so
> I can't say with 100% certainty.
> 

yeah, we don't update flash entries solely by datasheet, we can't update it without
testing it.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
