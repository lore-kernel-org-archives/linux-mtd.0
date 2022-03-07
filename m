Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4DEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTs5pY8nYQVhh53mcTpExTwE+MINLxOWPBMaZN5mwO8=; b=vxKs0pDIoiz0gv
	/iou2yzI/u91vTqkknWs897g+ag5Bz+LEb2NEP2ZG4IFAHQbcd/yBDY46SIu1NWOh/R2LS4BiV6gY
	V+ZyUG9XuQG0V6HFbkblldgqIDmyOVqIvE9jrxa9mlfnFD5DS/nFfF10+6FxvHNhbLvm6EtYqMEdm
	VaL5y9YNMEd1zoTzCLJmAy+/zNAOV00Zpmxb9xYMKI4jCmnKi2nP8p3Kzi+5Q4xsBH/qht62Im1U5
	D9nX3D6PeUR5VK3hiaTuc0lEYgTsO1PQ1ahYaW7N0rtUyuIOO8ML37sbaoZnqQ7WIZBGIY40f8P6N
	OTR+OMNmCFNpgGNbd9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR7Xg-00GFyC-20; Mon, 07 Mar 2022 07:12:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR7Xd-00GFxZ-2O
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 07:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646637145; x=1678173145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3P+wI4fc8qal7pO1VcRlGIIcSBtxgYJ6lMrmqKRoQMY=;
 b=Zs21GHj7iS/A1Vtlh0iMWHMKXW5XOTOSdKwU7kAC96CfANVJGNZQJvzK
 haDGUPMzsVCiziYFOdsJXn1XJhdZGqA5CC9j1LEoPaTWqFXZOOGeEoIxA
 qB29R+tUpSDckXJOjxHToikIfyJAZCVh3o7dNPOuE1ppnCKRlgzEr638s
 PQx6FwOo9+xEM0hHC6yp0jFngGtebI5eR1q6SjmptTCXFoFxLsYbwTwEe
 +vUgavhmK60ADBEykBdk9pg6OF5ctHD3vrr6gaHcOrHfpY+31p/J9oveQ
 VGxH6uGav1/ipyh4ANZB5BlMqVuIsNhxUp+aF9eeZPq5jU+pRHjNLEz9x g==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="148291603"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 00:12:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 00:12:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 00:12:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/U+YktXu7sNhDHAnrcGXfw9h351lbA+WpDjzBPoj2SpWF9I4NwB7tXBRj0FRttptE1LuCKbFEXOgZvPhhOM22Nvyy5BEyy1mmPXNfo1652gUAN55EagvzkK2UZyLuihFiYdCJ/1PzhUApHm4i5wMw9K3hO9gzwfa2psxa7fNZ5Sn4dfR5vBIWdjT3+eTGVS3niB1CfqGai5bv4LWJHyki6bwityJQ5LLi8GkSlfiPI/CRHNzoSqFhwZOxS6l2XiNWY2Lb9AOmZlex4nHHpJvayOZ1nx0s+X3/hBKwib13TAC+MUfK2YLwBRRHf96aXkxVdbcsaRMzsmhbYgjHRy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P+wI4fc8qal7pO1VcRlGIIcSBtxgYJ6lMrmqKRoQMY=;
 b=CcKcvi9SaNsfW0tRxSg8HUL+J+NQ/T5Jm76Ty1YNm8l418DnBv8wJKuO9JISB5DnkXBpl6rnpimldo4zSC7qJnx3yKpGvRKIT/iZ1Uis3ex6h7jKDBjC1SXAka1JTTU0x7EAmj/UUGWoaZyn5D5laljjbUUjOLHAUGkfeiYg2RnTHmMK41qcBvWOzYir3J64huU1XWz8pHPSwY2xbJYT9gz5Ei6CMNbSGcTHKOWLcKEIbh7dOaYwZeRM4oR2WT/x2Y2sLHw4m+ZvlU6UpNtiBIs+3fcacgbl4XxSHkJ48uHV/5CJpHhGArOQVVoRb/E/yHDqoSpIsc6UTD9xjgyXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P+wI4fc8qal7pO1VcRlGIIcSBtxgYJ6lMrmqKRoQMY=;
 b=V0cyri/pSsG5lD+CgPPseIY3aDfAMknxVtIpe+DCN3+YoL2FnKd+CeedCoSKASILVu7Uw3uK4IdsikVZuWWCgNq19XN+j0c2N01eKpgOzms13C+eK9KE+KEJMvQq2G8CB/M1HU8+RAhxdSW6VyxBeyhIc2I38I0mLrAA2uvWWLg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH2PR11MB4311.namprd11.prod.outlook.com (2603:10b6:610:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 07:12:15 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:12:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko.thiery@gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Topic: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Index: AQHYMfKsE2aD0LVQO0KmbZoSG1RT0g==
Date: Mon, 7 Mar 2022 07:12:15 +0000
Message-ID: <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
In-Reply-To: <20220304185137.3376011-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 683f177c-5a03-44e1-a86e-08da0009ced7
x-ms-traffictypediagnostic: CH2PR11MB4311:EE_
x-microsoft-antispam-prvs: <CH2PR11MB43114D5079F2F22C2E6354C3F0089@CH2PR11MB4311.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6aPKxVZSSoPj1T0IgxD6CsyxD3DckiAQla2aaJNnwzhXFw3VIAPJc/yTJ1JbX+5rZ+TDXn2pBzyOyGJ+lStXk8SgB137fcGJwcjdNjE6norKFXL8uGoNBf/vbsKelJMDSKYOITj3LKAQTWs3mQEXHTQTMz0iPZlg/MB9bA5NzgxhVHlTG9eduqCBg2BRyF/tf6F/6DaSdT0ognAlDT1kwCrDZqMdoOR6tVZmweaYUe0sCY1ZZpa6CTmMAh4vDIzwg3KpcTKfdMA9Dk90PTNgzGV5mcqIMor6wJWminMUXdghjVwOt5FG4EeVDloVORUyvj6yYigzKNPhSTPqAUYinkG0iZxQ+PVlkE7830OWaee+Gy3brZZjGfYsvzF5k3VyW2BWDNCxyua9pHIlRyquoE2GpzHosfoTOHHuqkgQz5BOI6+jaM9y61g+5qZPo/lCcCiXagB1P5Dtuh4V7Ug/IPrui3jCJnCR3lmZKWNJhZF39b/SNq3Q05UPIG+omF/0Rsv1yI6VIpicmIORjuHmXVRFuIQ2Pg5yIlQBs3wGqdZsJSn9653DgoosK6gSQt2Qc3oVyP1io2XBs57Hu4wcO6IhnpakuaHv91VoijvJpjU3jyiYrffXbjNUPgvAP+q3BYYn4Y84kH7uIFq4S3mxRH2FqP8ihyUEMhBfIGNIZHNxtDP4JSDFzqsU7ZAAaXcGHclMwsFpNxCvFgfsLiswoacV6eHQajXAg9ILNZxUJv+vJbG32jIe7KpRfrHJ6oRgmvkGuJgN9a633t5SefN6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(54906003)(38070700005)(110136005)(31686004)(66946007)(2906002)(26005)(316002)(122000001)(6506007)(6512007)(53546011)(71200400001)(38100700002)(8936002)(6486002)(2616005)(83380400001)(86362001)(36756003)(4326008)(8676002)(66556008)(508600001)(64756008)(66446008)(5660300002)(76116006)(66476007)(31696002)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjRKbWxEdFJiakxvZjRta1EvK0JpSXFOckNNb1ZhY09JK2RHaHh5Q0duazBx?=
 =?utf-8?B?bmQ5akFuWThPUlNuRkV1KzliNWg4WVRJYU1jeGlOSWVFYlY1UmE1U3owaExF?=
 =?utf-8?B?czR1YTBHM1E2OUNkY0tuSGlLRll6T2xWdEdyVGZzSWN5dHQyZ25UcUE2cG9w?=
 =?utf-8?B?YjMyVHZaVWNObVFXMEZVbWFmTi8yeTVkU0hhbnFHRGQ0aDk2RnB6aGxqOWd3?=
 =?utf-8?B?R2VrdWRBUlF1ZlpTQ29pYWJLRXhHVXBrT29NY3FlN2djQkNDK1llVG1lVUkz?=
 =?utf-8?B?Z25Bc1VYN1I3VFVMdjROOXAzbDNKU0VBM1A3MVlvcWdYTUxZc01Zcm15THVX?=
 =?utf-8?B?dkN6eW1scTJ4eG1sZG9Hd1NiNVF4NklxeFBNNzFWM2s1aFNrQ1NXTVlIdEFR?=
 =?utf-8?B?YkVmNDRkZUY5Q1NmTElUazRaRytTYnJXK1hFVnBvZnIxK1F0RXczSUFXZmNE?=
 =?utf-8?B?ODc0L2taZ0hoc1h0RklVblZSRldKMXNrN3dlMXlZQzhJMjR0TFBaaUw1c3ZG?=
 =?utf-8?B?NlRkd0pRdjlXSGxtWGZXUm10cmRmeUczZkZIdlVWQlB1TG94NCtsMmNNZUg0?=
 =?utf-8?B?Z3NGbFA1WmE0T0FicWFrQlRjbTVlV1drWEtuSDlVek1QRkdXbDRaeGhyZmsz?=
 =?utf-8?B?b2pUczhUbWNLR1hqOUg4S3I0TVRlWjZldG9jdnV5N3psUWpUOThqaVkvYzZJ?=
 =?utf-8?B?eUpVcWtiTmJUdCtHejZoeGw2TDYvZDJQdVJxMS9OMEtESFdUNDhQcGh6VG42?=
 =?utf-8?B?S2RrS1VGVm1rb1pSQk5SUnpmSnV4VFNWejRJWVlNZG1EcHBqa3cvd3FrR3Rt?=
 =?utf-8?B?NE5QTFg5WERITGUzUnVaVTE1TkFheThRNFpnZGkyRitrODM3UFB0SVFtN2dn?=
 =?utf-8?B?ZlVBNEVydzNhRGlteHo3U2dGTndQMENVTGlDc0V6NmQ0L3dKazVYT0JvMWFE?=
 =?utf-8?B?K3JsbFlmZTBtRGtNTnJlQkx0RTNySFJKZy9YTHlzS21oNjlPem9GS2F0NFA1?=
 =?utf-8?B?djM1MTJ1NmhWQVlPejZOUElWM3NkYy82UVR0OEhZSGtheDlKaVlnbnlFYmw3?=
 =?utf-8?B?cDljOWhiVVhHTTFIczEycXltREJxb2V6MkZWT1Z2UUMwU3V4R21qT2xtd3l6?=
 =?utf-8?B?cHlpYisrMUZvczRNMkxOY1QyRzF5T1NIcTcxM2FleHFVSGlydllNaEIxdzFu?=
 =?utf-8?B?S2pIc1o2MFdyNXJVdjg2MFlub2QzUjcrZ0hvVkpEd2VkVFNxSkdwSHpZYlph?=
 =?utf-8?B?OEM1U0tOVFFpdkJGRkRmYi9kK3BXeGV2dnF0d3BMNldSQldrckg3MzNjdkJ2?=
 =?utf-8?B?Zm5nWC90Zy9sdkl1QkQyYmlMK1BpbFgxSC8weXBKZVEwRSswVDVONnQ4elRz?=
 =?utf-8?B?ZTBMcm1CalRvd2lwbUFabFhVZG5DKzVSamNPYVpyVTVraXNaRU02K0RPemg5?=
 =?utf-8?B?cnBRL3FrR3pWU28zdjBHbzBQS0V0THVUU3lMcnM2UGE2V25YVmdNYjJydk1j?=
 =?utf-8?B?a2JoTk9FWmVWSUtZRlB4RmZLeGpHNkhUbkI3QmZxYTJvalpoeGN1Q2ROUnVQ?=
 =?utf-8?B?VXhVU2RISnVjekJXLzlSRXVWT0NDWVI0bGpvbkhkLy9mVnFyblRHditMdlQ3?=
 =?utf-8?B?VGhNUEZvN1d2RjFvNTBtSXN2dEZmMEh2M3JZaWpPZEN6SXVacEtiNHoycEtR?=
 =?utf-8?B?YlJyNE1GUEp3R0FQdm9aUEpBNzhhSjlTQ0I5NlFBV01Ya1ZEWnZDSXBtTytY?=
 =?utf-8?B?WkhDb1RFYnF3eVRJMmdibGhUU3FaMnp1YVdCMDZpaEEwOHJNcUIxS3hqRkV6?=
 =?utf-8?B?bUlRN1BNblFUK0RHL0FMQzFqbUx0ZGQzSUJueGtqY3FsOVlobUJmKzI0aVVl?=
 =?utf-8?B?SDlYOVJLV3BWdXNQelh0MmJUbmF1MHhwRFVtTHUwRkZzd3dyeFQrK3EwRlU5?=
 =?utf-8?B?TEdocUcvYW04YkpjS1BObk41M1JOY1V3dGRUakJ2Z0lXVWt2dkloSy9vRkxV?=
 =?utf-8?B?M25RendRY094YkhCQ0dwQjk5aGt3MGJ5Zm42dEdrYlVOVjQ3NWZaRExwN1ZR?=
 =?utf-8?B?amRQTmhGakpPSHBSdHlhNlJ6Y1h0T1BjakFoRlFiZFpHT0RQWmFNK3NNOENH?=
 =?utf-8?B?TlJVUUF3YmxmTDltNC9lVFVNaUN3U1NkY3FzdGtyT2FJVDQ5VndReVBETXF4?=
 =?utf-8?B?WWgrMGszK0pKbTN2c0daNlpvMkZuZThXUytBNXVtQklSY0w1Rm1KRlVEamFZ?=
 =?utf-8?B?STBZekIyTThwelRkYlJnSFdUYnBnPT0=?=
Content-ID: <4CF5A2BEE4543E48BA2A1B89AD196551@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683f177c-5a03-44e1-a86e-08da0009ced7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 07:12:15.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghnm+t7VVVY0oUUip7St4FAatPRxVQ2vhlrOvfVMA6dPDkWJVkloESK3/HMc1AeuMMufYFrRaVLR/eeeOibl0P7DOoU8wlIJgKcBweb2d5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_231225_248493_C151CEE0 
X-CRM114-Status: GOOD (  32.98  )
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

On 3/4/22 20:51, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> While the first version of JESD216 specify the opcode for 4 bit I/O
> accesses, it lacks information on how to actually enable this mode.
> 
> For now, the one set in spi_nor_init_default_params() will be used.
> But this one is likely wrong for some flashes, in particular the
> Macronix MX25L12835F. Thus we need to clear the enable method when
> parsing the SFDP. Flashes with such an SFDP revision will have to use a
> flash (and SFDP revision) specific fixup.
> 
> This might break quad I/O for some flashes which relied on the
> spi_nor_sr2_bit1_quad_enable() that was formerly set. If your bisect
> turns up this commit, you'll probably have to set the proper
> quad_enable method in a post_bfpt() fixup for your flash.
> 

Right, I meant adding a paragraph such as the one from above.

> Signed-off-by: Michael Walle <michael@walle.cc>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> changes since RFC:
>  - reworded commit message
>  - added comment about post_bfpt hook
> 
> Tudor, I'm not sure what you meant with
>   Maybe you can update the commit message and explain why would some
>   flashes fail to enable quad mode, similar to what I did.
> 
> It doesn't work because the wrong method is chosen? ;)
> 
>  drivers/mtd/spi-nor/sfdp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..6bba9b601846 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -549,6 +549,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         map->uniform_erase_type = map->uniform_region.offset &
>                                   SNOR_ERASE_TYPE_MASK;
> 
> +       /*
> +        * The first JESD216 revision doesn't specify a method to enable
> +        * quad mode. spi_nor_init_default_params() will set a legacy
> +        * default method to enable quad mode. We have to disable it
> +        * again.
> +        * Flashes with this JESD216 revision need to set the quad_enable
> +        * method in their post_bfpt() fixup if they want to use quad I/O.
> +        */

Great. Looks good to me. I'll change the subject to "mtd: spi-nor: sfdp:"
when applying.

Cheers,
ta
> +       params->quad_enable = NULL;
> +
>         /* Stop here if not JESD216 rev A or later. */
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> @@ -562,7 +572,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         /* Quad Enable Requirements. */
>         switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>         case BFPT_DWORD15_QER_NONE:
> -               params->quad_enable = NULL;
>                 break;
> 
>         case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
