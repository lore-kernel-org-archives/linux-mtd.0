Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28135C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 05:36:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C2064D90
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 05:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C2064D90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lrPGl91DaL8PlKYm3/8A3DYIsnQlruXN+H12Vy8LW2E=; b=oP2W8mdlD/wdQpK5sl8/37g5Z
	Xb6BKskjt35wcdQlg+PNth4D1nastHS+ddtBSITBaRGndilOZv0GiLWQKAuNOu6Kva6Es90B25J6v
	rBwipu2ze/s3by+Em+jA21PqGtneMCe7kI27/+Lfk5N2+g11dZBc6+7p7V0c2VHR0azE5SUw1XjXT
	1TW1+JaZjyFsdzHJCYNw+W6dqs3GtaWg8BthS0rF8ywGRjthYVFMkCcreM53DGoY2yczMmLwEDI2n
	JNr4YWnRVAODsNjbLnwCC/SDIs2pDAYptbKABG6/U9WBxFHLJWJWyaXkpcJg8/C5+dcUO+LhHW5kI
	idrfQVxCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJrUD-00654i-Lr; Wed, 10 Mar 2021 05:34:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJrTy-00652S-UA
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 05:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615354446; x=1646890446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/A+93+u4d+K+yOY4aieSGlCqbUGT5rl+u9EmFWxu2sM=;
 b=2BEVhXjYJA2fshxPrrmnO4oUXVDYz5phTFkuf8aSMU9ey5sfnJfPHvXt
 Cp6u7kTsNf44HmxAiLfhAJEcjpjNomBJ3LlyWP6+khop/StJkUA+xP6He
 bppS13hsA1zogEI+yUINmi6lHDkQM2U5lpeY4ZZkPtc1jgZji8yZHN2Bl
 qMOl8blvkQrBw6mTFo/MW/sUJckDx9GbiY97AHlHhFcadLXW4W6kI0OSo
 ZPdxmr5tnaw5yPuWKBERXrV2OMOBGqTBXW7YpzbxqeWYxEmAhHOBPwMoM
 ChZsEG1E0fbFsvYWxJW/5IoRTNv/YkgVrMqPtGJs57s7xQt6QLglsKr5n g==;
IronPort-SDR: CCEi+SG6crueTpPAK91h4e4pkoh3FnnbjYydqZvudS5PBGCMtFtj3R/cfUV8XeqjggFpkwJgQU
 PRTuyAcouA/LMiqQxfHAYq9DnsWqCXLw2EVUug+EoH2hCjLTYRE1BG03YNEG4c1v/UL7jZP17i
 I5mXH4R/E5aXQnWkdWUz8EXNKuZ5EoMJpqq3ElhbPKx162Z/5A68wOrFmD8yePHKGUGJC0o+3y
 1WRdjD5aTE+i+3RID4LjSUIF79hOOW2vvKfSdNxnLzyfXavtqSFKWpkMGxaOz3eJU0W48vJjY5
 HMA=
X-IronPort-AV: E=Sophos;i="5.81,236,1610434800"; d="scan'208";a="112644221"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2021 22:34:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 9 Mar 2021 22:34:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 22:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiTpGU5wCKZEGi91SjChG8aicYIiLhJV3zXrV8lp9o8Bq5JvRU/jxLbCflrIvVRYbyL2oh7mHJOfrUKqOj00+mUY8tnvJhFEy3cON2Ka8J5VUOOHkGhrcYseXxuiZNzDjm1iEQBOHPXLfIhg3+t32bMxuBnoWhWVY8hFrzvAvkBjh4RaYrkN7jOnC4QCugXMy7sC9aMAL1YMdAw5h8yrO3q0R8umts6P2iaPgwLiJr7pPLS1kwBDAMsseOvL8bIZoqQ5WK27PyY5lL9fQl6ALAyuSs2QDqSO6XPrdOlEvZOWWr9pk3lZ4aOcHEYna/dHg0J+XuvqAk4iUdX8aWm7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A+93+u4d+K+yOY4aieSGlCqbUGT5rl+u9EmFWxu2sM=;
 b=kNGESiA4sj1VDST+nmNakuZ7EqCr0sEWHjXlC7tAFXrs2r7MKupJU8EL1Iaj2JBNHiMZJhWoMJFFaWXnOHvKSipVDabz3zckOft3rA1M/EMZX2RAKkNz23nxyBFF4o0owyYXRnfeJc5Phcyut4L4U53Ch8KQEM7XCoIuf4c/xBlYl3bO8FIueuYRR4mOxsRmhe6ej6UyYldXXTGB0pR0boaIvZJt9tBjwbA981KUaVm+EgzQ26wUI4F9VJV33BkUIDowvKlVbU2Seuool3srMOJGIiM5nyx5fsQmP7QNpBxTsJIB5OL/0euLxlT9fNdf52WdIqd417z0Yt9+o4wh8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A+93+u4d+K+yOY4aieSGlCqbUGT5rl+u9EmFWxu2sM=;
 b=ORWQyo+3UuMUdz8d6LySO3l7vRuaswhnhJ5BT5TfQt3MPb7hLlFucMz6zJMcj43RNQawdz+oeO9XBC5a69/WAnICri3hgnanXWxIo0Xx4AjYZ1aQ/ZDHUYNtMAHETqkZagPLPUZlS5uXmuBIgALO6YksHSSyqlIUmYZixBYPPpA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3422.namprd11.prod.outlook.com (2603:10b6:805:da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Wed, 10 Mar
 2021 05:33:58 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 05:33:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <tharvey@gateworks.com>, <richard@nod.at>,
 <p.yadav@ti.com>, <vigneshr@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-imx@nxp.com>, <festevam@gmail.com>,
 <kernel@pengutronix.de>, <s.hauer@pengutronix.de>, <robh+dt@kernel.org>,
 <shawnguo@kernel.org>, <miquel.raynal@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: at25: add Fujitsu MB85RS4MT
Thread-Topic: [PATCH 1/4] dt-bindings: at25: add Fujitsu MB85RS4MT
Thread-Index: AQHXFW73R7x6WEJAKk2JwW64vFUWrA==
Date: Wed, 10 Mar 2021 05:33:58 +0000
Message-ID: <3d497991-1470-e188-8be2-e5992dfa914c@microchip.com>
References: <20210309220014.22205-1-tharvey@gateworks.com>
 <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
In-Reply-To: <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1948cc65-d0b9-4d27-6a3f-08d8e3861aca
x-ms-traffictypediagnostic: SN6PR11MB3422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3422D5AA68CD109F223518B2F0919@SN6PR11MB3422.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gYyP5nphRNYVAKlRo1ccKKgtVRgQ5Bv+qAhTCyhXjvoONkQCi4Qksd1X93ZPr3EMQlZpMionItgD8WTj3Jby2gspS9hgqCvnQKsSX3eILNL1t2/bRtn/kqPKZNnzpoUFQSIhsL7Z6L7sShBa9EVBAkUltUn2lT7Su+mJ28TfCmVkDcudOSq7JdiydrUFOwmr7cSEi/kUEIT2tI3mpd6y/31kSfy7fHYQAboOeNQbbI2LmULDflo8Mk6VfQQe/XL1R2KAgpM8C3gAKXQ77YJ2R/Y1Q8XM6fQPyjm/7LBJzNyFBCYZXZOPUBbHkMtBLLDcQ8mcsrkWuE0T6WYHi9JxaiLwUCcGW2SJrM9wFGh1RzMBuoP+IknZnEXXp5vvWo4ic2/bk5BZh9lzyVi+Oyqqkko1d8IwK/IndfqD86o8KBJGwMRKyJXUlrudNET4+lUzbve4gry48OaBXGD0brnk32LeUC1+HZGZ1/Crbd+OUd7+t9bGWvsQj+vNrsvxJw64Xnc24VNhbTXBCgGrpxvy0H9mgfC9ltsObPdUliA6+QvzkTCoSQw0jMlipkrODtMq+rIA/HldCWpvJ+/dM/wywaRcdcUqFBzMjW9q0nR59GdfLqfXb7RxF6j128pSZD+KF6xtvIDdwM8pcsJdksmTrqn/MLirfRG8BUUojVtHwu4IYG8l0OcFDrawhm7JTjzn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(376002)(136003)(31686004)(6486002)(5660300002)(31696002)(8676002)(478600001)(8936002)(6506007)(966005)(110136005)(7416002)(2616005)(53546011)(76116006)(54906003)(86362001)(91956017)(186003)(6512007)(71200400001)(66476007)(2906002)(66556008)(64756008)(4326008)(66946007)(36756003)(316002)(26005)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXBlY3BZNUxidkJMTkhEYjQzY2dhaU5XUEgrYmtvYkt5Ym1YY05MT1VyeXZO?=
 =?utf-8?B?aEFsWGFKWEpDY1hUQW9teU9BU0JPd1VTcTBCelhXOU9oYmlVclpHNlFUTjZC?=
 =?utf-8?B?c0VNWEdpcXFMcjE4YS9uMG9XSTQ2K3FkWTZnNUJSWFRqSmUzOWxRUWsvK3pE?=
 =?utf-8?B?dUpuVndWR1ZiK0k3ZXZORUVubkpUR0k3ekZnMVVzMlRsbnB1Qms0dk1sdkZE?=
 =?utf-8?B?eW1zZDlxSFMwMTJnNk5ISDJ4N2ppTlZzZVo0OU5wVm52NzdUWW03aW5xcmli?=
 =?utf-8?B?azU3RTRBTGJJdVFtL01NUVN1STFxVWU1ZGUwS2cxSVgvZWtjdVRSblY4eTFC?=
 =?utf-8?B?MTlIR3Q3S3pOaXlUMFpwNG5vMW04bjBKVzZ1UVFKZi93cGo1b0dNTVY3L2kx?=
 =?utf-8?B?ZWl6UVVpOTJ3Y0FHS0ZFWncyMnVWTkZnTERSVEk1aVhJajB2cTlhME8ycExo?=
 =?utf-8?B?V0cwNVJVVmdWY3Vqc1hwdTRqOXFXZ0c5cndHRGtIb0FrRThWZnNEelFRSW5G?=
 =?utf-8?B?S3lxdHhVWUo0Ui9NSDQ5WEc4SlZQRWtQbStpTk1XV1U4WkZtdXFuMTBZR3dY?=
 =?utf-8?B?ZFp0OFdIUjd0N0NXQXNSdjdLdDRxeHhkTXRWU2xuZ3N3dHdSLzlWUFBMamU5?=
 =?utf-8?B?bzZQUjdVampLdFhBeXNEcXQ4R3dzZzdQYXVCclFOblRzL2hvNStqSkU4SlBO?=
 =?utf-8?B?c1UzT1BVbUdxNGF5MG1XNE8vMXplSHBzYlFhemRsc3J6OHgvQWpnZHNteW5C?=
 =?utf-8?B?a25wNmFUdmNVNGwzTDJCTHJuVlJ4NHFDRDl1Tkl5cHFUWVhoczhoYjZCNExC?=
 =?utf-8?B?d25KNis1NWUyTE5GZnRrOHI5R2k3ck4ySUlpcGlKcFpqVUF4ODYyaGc2bWk4?=
 =?utf-8?B?c01qYk5ETVhZZWdDd2FHWE80OVE4bGdFbHlCMU93aXgxVjhyclFZUHR2Rk5t?=
 =?utf-8?B?ZUFOYXVUWVo1VmtUbXVPNWNNdGR1TUVpMi9jZUVaN1BLZXM4Vm5ndTg1OXIx?=
 =?utf-8?B?cjFkWFl2VDNkcXR6VkowV1lzOEFnQWFMYkdlZy8xYUk3UWtTVndMdk4xbGlz?=
 =?utf-8?B?WWEvelU2djNBQlVLOXFQbmY4cWVITEd0RnNLTzAreEV3SkowWkdRWGhVUS9X?=
 =?utf-8?B?VDlRYjU1azI3SUwraUJVVXFzcUxaQ2hxRGc4djZtRjVKdGlRMmxaVERFUHAz?=
 =?utf-8?B?U1d2R2Fmc1hpb0Fad2xUZlpSOUtCendqMVczcFdNeEZSZ3MwR3ZxTG1RcThV?=
 =?utf-8?B?OUdsZURLUmtoS2RWcEtPOC9WU1V2WlVxNStvd3FqRE11OER4aytqNzFNUGdh?=
 =?utf-8?B?bFo5VnU0TzFuenVKdTd0bFR3Y3AySlNoZ0puaURTVzFpMzlrSnIyV0VEVmxK?=
 =?utf-8?B?MWJqTGh1aXk3UWxpRGlLTWR3YTBEMFplUzR2Vkw1b0VYRkJYd003UWFMSnBE?=
 =?utf-8?B?VHRJdEptTTBSYkhoRHNZT0gwaDNicmo1cXBGNldTMVh0bTE4YWpUSC8xbXk1?=
 =?utf-8?B?QUc5TEhuK2w4VnVDVStoOUVCWG9FejFVb1A4VDVEd0hpbHN2ZlVDRHM1WU9a?=
 =?utf-8?B?SVZ6VzJFRUtzZVV2NXFTYS9iMEF1QklPNFIwRUJPS3J6ZjZkYmpPWGRHMnE2?=
 =?utf-8?B?THdHUE9CSkhoTDFWQ0JpQmtNaXVRQ0s4QWVIcytqUHFaalFZVUtEcW1KY1Ju?=
 =?utf-8?B?dXpIbkxlWkNwY0cvTUlsSTA5RTBVWjBkb0dFNUk4MWxhYytpbE8vbldpU2pq?=
 =?utf-8?Q?TNEOCbY5thsMAVMcYE=3D?=
Content-ID: <E119FDC09592784F8D8E1A71D86AAA40@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1948cc65-d0b9-4d27-6a3f-08d8e3861aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 05:33:58.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XzoB0v0PHYVjCpBdGmMyt6B4V7kiq/xKTzExlSr/+mYm4vTDCIN3K+ls0BSJIVvqSMnydPmuUsbbJh7O2khUpjTnVBZKTVHFAtNBl5vqGmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_053407_643582_0A935E04 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xMC8yMSAxMjo1OSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBUaW0sDQo+IA0KPiBBbSAyMDIxLTAzLTA5
IDIzOjAwLCBzY2hyaWViIFRpbSBIYXJ2ZXk6DQo+PiBEb2N1bWVudCB0aGUgY29tcGF0aWJsZSB2
YWx1ZSBmb3IgdGhlIEZ1aml0c3UgTUI4NVJTNE1UIFNQSQ0KPj4gRlJBTSBFRVBST00gZGV2aWNl
IHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgaW4gRFRTIGZpbGVzLg0KPj4NCj4+IFRoaXMgaXMgYSA1
MTJLaUIgRlJBTSBFRVBST00uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGltIEhhcnZleSA8dGhh
cnZleUBnYXRld29ya3MuY29tPg0KPj4gLS0tDQo+PiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9lZXByb20vYXQyNS55YW1sIHwgMSArDQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZWVwcm9tL2F0MjUueWFtbA0KPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZWVwcm9tL2F0MjUueWFtbA0KPj4gaW5kZXggNmEyZGM4YjNlZDE0Li5mNTk0
ZGI3MmI3MTEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZWVwcm9tL2F0MjUueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2VlcHJvbS9hdDI1LnlhbWwNCj4+IEBAIC0yNiw2ICsyNiw3IEBAIHByb3BlcnRpZXM6
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW52byxhbnYzMmU2MXcNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhdG1lbCxhdDI1MjU2Qg0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGZ1aml0c3UsbWI4NXJzMW10DQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBmdWppdHN1LG1iODVyczRtdA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGZ1aml0c3UsbWI4NXJzNjQNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBtaWNyb2NoaXAsYXQyNTE2MGJuDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gbWljcm9jaGlwLDI1bGMwNDANCj4gDQo+IEhtLCB0aGUgZHJpdmVyIGlzIHNwaS1ub3Ig
YnV0IHRoaXMgaXMgZm9yIHRoZSBhdDI1IGRyaXZlci4gSXMNCj4gdGhpcyBjb3JyZWN0PyBEb2Vz
bid0IGl0IHdvcmsgaWYgeW91IGp1c3QgYWRkIHRoZSBJRCB0bw0KPiBzcGktbm9yL2Z1aml0c3Uu
YyBhbmQgdXNlICdjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3InID8NCj4gDQoNClRpbSwNCg0K
Q2FuIHlvdSB0cnkgYW5kIHNlZSBpZiB5b3UgY2FuIHdvcmsgd2l0aCB0aGlzIGZsYXNoIGJ5IHNl
dHRpbmcgImF0bWVsLGF0MjUiDQpjb21wYXRpYmxlPw0KDQpUaGVyZSBhcmUgc29tZSBTUEkgTk9S
LWxpa2UgZmxhc2hlcyBNUkFNcywgRlJBTXMsIGV2ZW4gRUVQUk9NcywgdGhhdCBzaGFyZQ0KYSBw
YXJ0IG9mIG9wY29kZXMgb2YgU1BJIE5PUnMsIGJ1dCBoYXZlIHNsaWdodGx5IGRpZmZlcmVudCBj
aGFyYWN0ZXJpc3RpY3MNCihleC4gbm8gZXJhc2UsIG5vIHdhaXQgdGltZXMgZm9yIHdyaXRlcyBv
biBGUkFNcykuDQpTZWUgdGhlIHBhdGNoIHNlcmllcyBzdWJtaXR0ZWQgYnkgUmljaGFyZCwgdGhh
dCBJIGhhdmUgc3RhbGxlZDoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eC1tdGQvbGlzdC8/c2VyaWVzPTIwODU4NCZzdGF0ZT0qDQoNCkkgbm93IGhhdmUgdGltZSB0
byBhbGxvY2F0ZSBmb3IgdGhpcywgSSdsbCBzdHVkeSBhbGwgYW5kIGNvbWUgdXAgd2l0aCBhIHBy
b3Bvc2FsDQppbiBvbmUgb3IgdHdvIHdlZWtzLg0KDQpDaGVlcnMsDQp0YQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
