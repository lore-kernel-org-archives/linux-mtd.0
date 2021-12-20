Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E0C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJqxz4x43xlg3Y5R6RXwTX71JrsFsem7IVg+58s7Dfw=; b=HyeoobtY8sQO9p
	KXrz3nHGvlMZCVVUckDT3Ywxi3eqny66r3c1Ccz89h3Y2RAKBvucBLvWlpAvSCQC0qXvvWZvgzy31
	gu4YOVQtRIApdw28jXEKo9eHSWMk+Y3yTpUc8boP7+pEaegu4l9N9asWP7YyrYb2YZdMwJQJx1pko
	BpkWLtcN85tHsWHjlhbdzj7zoQbtC6S31AnFc4k2SkcMZGtCPM2lfrsIprC6m0vfwil1BzkWVmnWX
	uaCDLF/V+ZNAvfhMJ/qXfH/QnLz/NkyFb4vMKE3vNk1Ro6CMwAkZ7Rj4OOsyLVhmaSGZ7AHrvYPiG
	PUm8I0kp+A+BtgGhd/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzGlT-001xKI-0S; Mon, 20 Dec 2021 11:23:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzGYe-001qC8-TO
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 11:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639998620; x=1671534620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tusYmzE5TaDf1PW52Pio01i7G3Esl6bKNTt+CAHXr3A=;
 b=j/lH+u20sqpocDKb57cqBXNWi8DVv4OsD/06OnHNKjfz93+41TkyBjva
 RTIXQh3dbGy0QdqsX4crcAlbToNbyx4dbbhrghl1dsF7g4C2sbybypYNv
 5/rjtBEb8rmvKOQBUa/4v8AK68t+0utMA6H+aLwG/fWKSHFn/AH1QYtsj
 NvPGCCNJ3TAYN2OupecI2QDP+hIDUs0B2lOlXiZoSigP0O8THBYc6nZUP
 UB3qVLFl4TQrkLJfVS2ms0aNz3Gv6dpagy9KkaggupCfFLUs5tLA+FIpt
 77G3cnBt3pAXDrXi5mWKCHWv8cpYHmRuvrMjMkyWmYlnvPt+uNkxnPLFV w==;
IronPort-SDR: tylhvHnyeRyxcnCZkCicUrp6EziIHHaeAh9RadAK6bTGQKkdqO1PLKpZJKV7tP2qK1o3lz5hSE
 yJtNIp1axzs0hLGoj/tk4LynC4KrbZXRP/hUs2rGj/BN1y6H2KAGBn2aAa5ao9murlPPapOKfz
 fhaakogheS+INTIQGgSzq/rnbAmj31T10xHinUHd80uRR5mhtEWEmSQzb9idDwaQVT+wRZ7C1a
 EmT1+GMdmnaPrLK041j3d/zy0HL+SBZ8zIi1W7KIsPURs37O07y40YqP5iYadidpR7Neg9h0g0
 BxFwiQhdh13QdLB86yOFBjnf
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="140334471"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 04:10:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 04:10:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Dec 2021 04:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vjm7HhtlYTdwSDWX9ercOtaRtV0c40jID/OPjtbVKVUa2xXoDoN/v0Km8KaSTR25dHlF9dkghbXz4z+xJMcTMIrBqfgse0np94LzoctX9Bhyzq8kZEGvcpUq9/r71LmNyNn9f1hz/J5OmoONWrV/c6jQhMm99jj2ev+Z/l+dp8t2TDi4J2rodNIzmeSVIFbZY2AsrggUsZiik7LMWvpwwEnVGrkdlxoBc+pInISyYenMH/5M12rNMYdPcrxtMyntznvEvO0CBXDHM/DRgrlRtzTeQmBA0YBB+98L1HzdTmRBiAeLoAPPYhdueXXJ58n9w1mL8c8c7MO1YaNnYUmp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tusYmzE5TaDf1PW52Pio01i7G3Esl6bKNTt+CAHXr3A=;
 b=B0KjjqGu+NtUCyoe27CBCOjfCAS3i4/nvQllBSXNz1UtM1vtwbWRPa3+fzHlZQ6Txi+PavF01hHWik4fKA8SNCGoGxHwH5AnqUTtTXf3n9+j5BSEDf4QlSk5EAZRisovJ1leqe+tfsTs7DPHvyS8YjUx+oSdMgZfU572aAIROOz97cOwXzseJkEOx5CZjZgpu9mF/hW6tGTBzCykyW3WYlhPEvlX9dC84TivTUoTIl7nEz3Qor4XrCe5p1PNZ8nc/zdRM7XTn2GNktTPnjuHeRnkMyHjtHJCAWcyEG8/zI66GAmGik0sumC03QrIZnlr5o1JGAjF6GbfRbUaNat5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tusYmzE5TaDf1PW52Pio01i7G3Esl6bKNTt+CAHXr3A=;
 b=ZrIj7KEFT/YQzZaiOdlneflmPfeiM3wuueLJhXLRXRwUzrEKttzi5tptjGYvaz2CKZstZ9QeLcz5fO7VmmmPKJa3jrNZeM/Sgjtv/mG69BBi1UG5Viq1mhSOjnWAPrD5cU0JNRjcMEBAXhzmlalARoN1fT2dx3GVMdZ560vekjo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 11:10:12 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:10:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Topic: [PATCH v5 2/2] mtd: spi-nor: macronix: Add support for
 mx66lm1g45g
Thread-Index: AQHX9ZIoiHDp/cIQZ0mqLWmoNk2VfQ==
Date: Mon, 20 Dec 2021 11:10:12 +0000
Message-ID: <213719a3-ed81-b1c6-9c9e-85dbeee85ff5@microchip.com>
References: <20211217180601.585825-1-tudor.ambarus@microchip.com>
 <20211217180601.585825-2-tudor.ambarus@microchip.com>
 <20211220102514.bnws67ks5uia5yfh@ti.com>
In-Reply-To: <20211220102514.bnws67ks5uia5yfh@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69be9ff8-4732-40b0-5bde-08d9c3a94ae3
x-ms-traffictypediagnostic: SA2PR11MB4907:EE_
x-microsoft-antispam-prvs: <SA2PR11MB4907F935ADAB9FF6EC546598F07B9@SA2PR11MB4907.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rnfOBhziSnz4IauxY9f0pP5jE7E6HCeV+Uxdfk/x2pfuvUjN9elytM/knVYh6J0vDvNI5ntnUO8cGIvLG3l/PyYhj8IYB/xLvnpIMuqjHP9WFbKxCPk7JwLB+DXormttLd8I62Njl30syXPV8mqhhuIHIKFpIqgT85vnJH2qwFCRyTCoDcXakaBOavkBRw0Nab8DQf+Q09KITP6Sa1VoZXo2vircLmCr9xqR7srBm6uGs8f1NDkuzD3ZVKZt+9Lm6BPMoXFhv1XShy4cPupB0DCemILgBgILD+J+4egzcEnwMksqOJpZiYPXE1Osc+sU70csfsOOgWt1+KRJwA561tVtR+wsWMMjLTBtV/WFxNvbmyoHKCOFNfYADllGqq8GsWDkOsxcldUReHto3ZRWP94ZBlcpOTSOAuZwvzDWrdgiAyiMyD+daUsb44I+alU5oyYDxGi4BccsX+Qm7ENeBNdPu9c77l+ZCtx2oFNgOlw2SPrZDXSJ0J4xROrTyfQkwYBjn10rm2h0dMEXbbi5XNOgP6imwujEVTgh+GsicfxR7+k81Lj03ND4c8PfxFkgWyKLvU0qYsfIdesJVGnhfMJmP9VvOPmWOD0aKoNwjjDUgdJ1QQon2y2OoOk8wd7fI0VPMLU5+k9zFGVkvqUcwcqkngjdeg9RnT/szD2eNxBEUHai3+T30OMVtVxRbfaoEFecacwziIn5qhCb0Sa3Zkrue/nz3eY//Rd8PyVV4BH4tCrodpx35uJD6CDCM+HJTostd7bO/RUUko4kjQmryLLhEuShv62gyhQgyV4zOXx+SjqQYaGs9XqOTU5RdXZX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(6506007)(186003)(6512007)(508600001)(4326008)(107886003)(31696002)(316002)(26005)(53546011)(2906002)(54906003)(6486002)(8676002)(8936002)(71200400001)(2616005)(6916009)(5660300002)(122000001)(86362001)(36756003)(38100700002)(66476007)(66446008)(66556008)(64756008)(66946007)(38070700005)(83380400001)(76116006)(91956017)(138113003)(98903001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkR6RXVPRlJwRXVVWHZoemtUNVAvWjkwRHk0Nm5PVnJYRE9NaWUyaEdobHdU?=
 =?utf-8?B?RkJ4Y0l6MWxlZE9GTEkwc1k0d05wUCtsOEsyMjRHVkwxNjdVOGxRQVRkNGds?=
 =?utf-8?B?b3JFMjdXMGw4d09zdFM0S3grdk1ZYzlBeXZnbnpqWUdRRTdSc3lFakxHeXpv?=
 =?utf-8?B?akZQaW1KMXo1Y1FmWms4RGhwcVBvUittZWR2anFUNXQxODJjOG9CQjBpNTFO?=
 =?utf-8?B?V0szalFyVERiN3VlQWFWdGhycWlZN3RYSVZ0V1ovZWgxaDBXSlpCSEVNczVL?=
 =?utf-8?B?NHV1YUkreDBlUEQvRXNWTlRpRG0vZjRxeC9tR1dyVmdBcHdhcWZTR1F1RFBt?=
 =?utf-8?B?T1lUdVM0NTNwd05ZdFRyNTVyQ25LbkxJNGtmbTlLdkR6M1JWTjI0dHBwUFpD?=
 =?utf-8?B?VjJkVVJGQzVpa1BWNDMyUFZSZm4wMHF3TGxLVDE5Uy8zZVE2NFFiUmZubjAw?=
 =?utf-8?B?TGZVd2xOMkdYc0ZXSTVVRGxJeVdHZ3YzdXVhM2NWQWhQNTdFUm5tUENpZ05p?=
 =?utf-8?B?WXdLK1ZUWGtneVZROHBUS1Z0bmlUdTNCUnlHNDhudmlRbnFBSUp4MDZ2dXJz?=
 =?utf-8?B?MUpnaHNUejgyYXZ0Z3Z6YWFwc3IzemlPZTI0bWttdXA4YzBMa2x1aVg4Yzk3?=
 =?utf-8?B?SmlYYmF5RS9mVXJFc09xL01aMGRBT2FaQU1TeDdEOTIzRGlnTlZaOWF2K2Nv?=
 =?utf-8?B?aHh3L3JIY2VHNnY0cDdJeWNkK1R2SzM3YU1kOWEwSU5SVVJPa0ovMlgveUg4?=
 =?utf-8?B?cFpJcUluMDVjVVZvcmdJL2g1THpiclZlK21Lei9jOUF1YmJyZi8xNkpVcnh0?=
 =?utf-8?B?S2tPSzMxSHpJbE1Bc0N2MHQxbDJ4YU1mTHJRRjI1V3VLQ2xSa2ZTSjdHcmdV?=
 =?utf-8?B?YVZseUxIVVA3bzhVTDNhcVlPMTFtZHpYYzhHd24vOTJVYW9OUWtBK3BGREV3?=
 =?utf-8?B?cmhOQkpLM2QrTnkybWJYUXRrUUJHUUp2Ukp1ZVA1QnhpOGFYWVBKK3VtWHNn?=
 =?utf-8?B?Z3I0a2tNanNBUXVLd2cybmdFTGxueXN0WE9jNTJOeXpEYUNZRGllNmRoYWdk?=
 =?utf-8?B?SCsveVBHdGpWbXhEVXpoOVIxNE9nVVZKTi9WcU5Xbk1VUkU0U004N1FkWUky?=
 =?utf-8?B?WG5WMUNBbEpLQ2I3ckgvTnBkcnRqbW9ic0RsbVZhU1puSGwycks5aS91Yzkv?=
 =?utf-8?B?TDFDQUpzcjhjQ0NMU3psWlZsRU8xTHVXNlp3TXU2YTFwZnp5TVlSck9FVllj?=
 =?utf-8?B?eitjRCs5NTlZcUk1cEFuV0VBa2JzL2pvN3VVZ2NFWjVuU3d6NU1FQmtCWmRM?=
 =?utf-8?B?S3FZRjh1T3YwdXE2aVlwZ1FZTytvc2ZvOEhJSjM0OFd3YUdkNE05UXFCMC96?=
 =?utf-8?B?RTVKTXJsRlYyajBGazVTNU0wRmcxbVRXK1V4cW1sbmdQckxOY1NySmNSSVdN?=
 =?utf-8?B?NG1ob0NJbXFkaDk2MmRWeThGTUh0VXFHSHJsZUNBZlFmQkc3S1lSQWV4VFhC?=
 =?utf-8?B?U3laQ1ROcXJiVThMekgvVDNzK0h0NEIwMjlwUGZBODVQQ0VtdUM4U1BabDI2?=
 =?utf-8?B?WUYvWGNjaTF3VnNDNlFjOGpzNmRCalpRL0FyRnF1OXpTMmJxOEtlU3pKdnht?=
 =?utf-8?B?bzMweDlTOS9pVVNtSEVHb3pyWHR6MmI3WnVHdGdjbXVwd01QZjUxQ2ErSnZD?=
 =?utf-8?B?VUtQYUdrS25OSkszdVZqZlVQRGl5VHZ1Lzh5Q3JWUysrR0JwaEQ1dzM0OEp2?=
 =?utf-8?B?c1p0VTI0YU1kUStZTy80L0NLUjFnZnRoNG91bnI5TEZjU1BNOXp0VjNJZzJI?=
 =?utf-8?B?clpoSHFzRGlsSlNCbXFTLzk5TGF1Y2pCdDhOZWdsdElEYmNGUlBnalBiWmRD?=
 =?utf-8?B?RVBvZ2V3QTBmSnkwaXNRTGdKNi9XRWJJMkxpdm1mSTJBeC8wYzdPbGtNQVpn?=
 =?utf-8?B?NVFvNmtQRU9YbC9RQ0g4Uy9NRlhwSmJRNlVVZTFwbGFpVlUyeE40T1Z0U05H?=
 =?utf-8?B?NnRWSTM0R2I3SFhSQVVFR05tdVBmYk5uejF6UzA0c0VVOG8yR2V4c1VMaTVk?=
 =?utf-8?B?b2s4RzdhSFEwS2IxaXVELzNoQlIvL3U5aEtFRHhSTjVJeko0U1l6SnBMYk9N?=
 =?utf-8?B?dnp3S2duUkVBdlNpNkIra05UVUg3Ty93WEg5aHNQcWVOUndYZjM1UFJoam92?=
 =?utf-8?B?Z0Q5K0JYTmJUZmFCZ2xHNWh1TWM2T2s3Z3pvQmt5RWdNSlhGcjJkcXM1ZXdX?=
 =?utf-8?B?blQySWRTeXlWU3FEK2RmU3g5RnR3PT0=?=
Content-ID: <46706AE1DB0A4347A719CD1204FBA2AB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be9ff8-4732-40b0-5bde-08d9c3a94ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 11:10:12.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KyCcP4YegHCOuDz13di7ppJ/3Oy5hfZlRQHlf8ol0E1KUC7pEZsqR0+xF2j25Xg4jG85t3s4171X+G+yZGJU/lsbwdPh8/wZDKq+N3V5Qoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_031021_043979_209C2D47 
X-CRM114-Status: GOOD (  20.35  )
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

On 12/20/21 12:25 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 17/12/21 08:06PM, Tudor Ambarus wrote:
>> mx66lm1g45g supports just 1-1-1, 8-8-8 and 8D-8D-8D modes. There are
>> versions of mx66lm1g45g which do not support SFDP, thus use
>> SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
>> interface outputs data always in STR mode for whatever reason. Since
>> 8D-8D-8S is not common, avoid reading the ID when enabling the octal dtr
>> mode. Instead, read back the CR2 to check if the switch was successful.
> 
> I replied to your v2 just now about this.
> 
>> Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.
> 
> Link to datasheet in the commit message would be nice.

Do you know if there's a standardized way to add a link to a datasheet
in the commit message, i.e. should I use the Link tag or just a simple
link will do?
> 
> As discussed on IRC, this flash reverses byte order in 8D-8D-8D mode. So
> the data you write in 1S-1S-1S mode will be have byte order reversed
> when reading in 8D-8D-8D mode. Do you have any plans on doing something
> for this? Or do we just leave it to the user to figure it out?

I don't think we should amend this in software. Reading/writing in
8D-8D-8D will give sane results, the problem is just when you
use STR for write and DTR for read, or viceversa. This is just a bad
design and we should leave it as it is.

I'll address all your other comments in a v6. Thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
