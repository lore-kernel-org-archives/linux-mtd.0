Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443FCC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/1VEqcsuUZQAXECwzQi7ovHDiSd6kyC7MwSnXYhi+k=; b=kJV8jfvHrNcgEt
	/Jz/EpoPhMaYfbeYTHHln/fWuC0c26p/mLum2v00ewAYrL3O9HRR4VDQSNIu3mGRRcvN3dGqpcMdz
	Z/1ssdF4nXylXGURs6ySkzV4U0UbMVJREhYRexLUGbV7AA9w0ln4KvaQYBUWj3iKuygQzyB51nnrg
	4yXQoPEdVo7n+/LzfShwtztEWilvnWErTsnRkztSU0JJKqvNBA0t+LPtRMt4HcRRDDWKi9eEYfSHX
	MGh0DcoXZhkuEcB0FpB/zvyaDKso6JaVxOPIb7aRnkl26W97NacX7Z6+mv+LSdrwlMjWztT0JcM4T
	CNm0kXCBsdkYQB+XwXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv44-00CfvY-Qd; Tue, 01 Feb 2022 15:27:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEv1o-00Cen1-59
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 15:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643729107; x=1675265107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=58ocPU0uEnMkUKLqY1tubTsVog/8TMEKNzAvLjD0vGA=;
 b=MNGk8gDeCopnBNQU5rLJjp17AQxxT9oTMuntSFRIfHrhZIEwz3TuCFXf
 MKy25h6KMYyf+nptkp/TmDijE30mU8uaHzdnvFnRWe7F125z6//O0c0Mv
 5gmvMe4WjU9DQV1F5TH9UGgQUIk7POJe5QaZLcZkoTRxIp5Y2rIyNo535
 PcD2zfTd/U1+HHuxEwj9f2VMpPyGXbzdnwFPN3cbr4zH1L+kHz4dJ1UYd
 i/+1CGzJ020IdJ5rPL2dUSR0/6EPGJG//ylvVu8qk8wVJpBQ07cEkDKmg
 JTReoV6pM5qFjSO/hBBdM+x4TjDBYqoCh/uryd66H5eLA6tiQVLunQQGq w==;
IronPort-SDR: N4jCE5cA/wRD9GlqTQk+CNSrOhnDVsgRjusACa9pQUZ0AKSmbU5J0wAIPlv/WdubvEP7E065z3
 DD1mmQdCYNWB007hZ4i9kpvLn2+2B0jCVI8PO4Mg5HlLdr0zcUpATGg2xWaGQjsFlmuGPgvLcE
 agV915rweq9WG0zeiTnx8khoTLoklaoJIrDfl3hZ27fADr7ecLyjSnS+kIKhawTrPbmLEdPh+k
 0qCBnsY/90UEjDatEncYYKumybI8j6V7E3OjNZM609mwtt9wfFDRAs816bEg2nOdqpjxWvHj6e
 m7wUDV8VSb0boNoQdRecFPCR
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="84324086"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Feb 2022 08:25:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Feb 2022 08:25:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Feb 2022 08:25:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaB6wqciglKigeGSjogvpIXnagoUacJabJLj+/lzvavTLtozPog8uEgsbdI2m5S0tmNYNjsLmIHmXeeyRlGEA+ljdPjAA6MB6a4j87lCYvW5fU/xMDUEEMHbZRr1PBOTpdUNDmdpvKfMwTq3ITMcstGYgVrrVayEdgPLPPHDUS5FmUoSoFsauJkwCNBI8LiK1I602Zs1fntRRn7q1TxaqgTRpDvozf2tibALLZ9NyKXX00IenFurdUAwE/aEqpeuf8GaZ3O0Eif7QILnC6oXvz9SQmChbzB1hM0bEQarVEMq202BGaQl9MyA4uAX6v6khPQz17GOgJE+LFcsfpA9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58ocPU0uEnMkUKLqY1tubTsVog/8TMEKNzAvLjD0vGA=;
 b=Fx8zt5qjIKlTtLsgNkru0ogH/V47lB3kX77UOEq+dq4HWWa3cjg0lwP7FooNsx2lr7A96vycxKBJ9Sm7G1ErD3jhaXYMYy41oIkn2nuHLaXJVWWIrS/kJRMG9zP+TqMFuAT8VXRHs04SDTnldTG4u6ede8dTynKNsGL8zz9/hJGMY7NDan5iz5dS7kR0QuBhn1/e0aYbyFj0oplvBXGVF14r7h3WtdtlWuk7n1fyAfQypLPBVubhK5it952l/0g4fc0nPE33TrFXPC17AIidTHP079XkNRlDd/u4NcuLEPr2ZSaHCCnbwPsbdBBmyeJ4UZqPAEP2qUyZcgvc5/fVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58ocPU0uEnMkUKLqY1tubTsVog/8TMEKNzAvLjD0vGA=;
 b=V92U8hHyOg+MjbveuXXu9FraKwsmY9bn0imahI3kO8SfX/9tX6ZUkJ8bMZu61zf9ntAmp7HsEC1IuTIxICCk3R6YJ7+TG/oQfEpD7cOWbwAE7dsoEiIkasMDqqFDczYrk6r6eNdDIZ5r46owNS+w6nmKpgXu9q7eDnj6zN0dP14=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 15:24:59 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 15:24:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <broonie@kernel.org>
CC: <lee.jones@linaro.org>, <boris.brezillon@collabora.com>,
 <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <corbet@lwn.net>,
 <mauro.lima@eclypsium.com>, <alexander.sverdlin@nokia.com>,
 <andriy.shevchenko@linux.intel.com>, <hans-gert.dahmen@immu.ne>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Thread-Topic: [PATCH v5 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Thread-Index: AQHYF3/fLAfXZX5xPUSyfvHuaqhb6g==
Date: Tue, 1 Feb 2022 15:24:58 +0000
Message-ID: <ed2a0fe0-c78d-7f09-6f68-b378cb09931e@microchip.com>
References: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
 <20211220164625.9400-3-mika.westerberg@linux.intel.com>
In-Reply-To: <20211220164625.9400-3-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33f66622-6e55-445b-0b49-08d9e5970234
x-ms-traffictypediagnostic: BN8PR11MB3556:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3556038A99FA297770482339F0269@BN8PR11MB3556.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6vRFsbe1/Q0aysnHR5GuFvQ0IHymwd89BpG9PKjUkUMUNOQc7qHJ4nulFCvYqIO4/kDccuFTHIR0mJz108NS8cWx4JDwBwyKsoKwIQgMA3j4w7DcAuD0Tg8luJ7mlFFNf7SAw0DSSO1F46djXwL1WWH1AOGU2fQ55kaU3aNSPOBM9t9FM3ffv4DWAsybTvoxkCw5nM5V0kMAUcmFXxqybihhH6jg/iE2FbSLqpeLTWMYCcSEulp1Z42ssGwUrIaewd7QbHWx+MZP/EwASlnd3uEqPBwbqoEG0VLT034wO0kN1yI78Tp6Qj3hh9qi3ZbypLBMF8pJniobF7i1bHii9CD9FklLV6vChN76XwQnS566ECz+9RNv330LOfbTglor1POKE4B79Oxbo4hNHzSBnhrm15mlD7YynRZLgFe4wcSgvg0pKLF9ijGrVg0IcgrQPJTAP7e8cGGduH+KDeyXFYXPRJKpYKG1u4uMscA7x3gD4WmnzLHL0IK1tAUUlnbjRCtyAqMCM9LAxldllavUaRI0NFhwO6oR/FeHusH4XDBhxqpz9Pw87Y98MRwWtts8GSN+zKDP2Rr8SVT3OnCvSx3sHI5yWT/ndBB/gU2Mt95rqn9DGuVfs8A778nh3NQIH0pPufbcoI+ObmKu2y8q9PWJVKVKGD3btoZOlpAd57ng6u9Mf9EOLgt26pWhq9ZtWuM/uG8AXhmUpHQTO/iq5q3HMV9xHSslehKWZnx+Yrfd+tUxVYv59nq/KMBrvuyytz+3clsOqCAisZOi/WS8Ig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(31696002)(31686004)(26005)(86362001)(8676002)(6486002)(83380400001)(122000001)(4326008)(36756003)(2906002)(186003)(5660300002)(91956017)(76116006)(8936002)(66446008)(66476007)(64756008)(66946007)(66556008)(7416002)(2616005)(54906003)(38100700002)(110136005)(6512007)(6506007)(71200400001)(316002)(38070700005)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1ROVy9iNW53b2hEWENWYnFNaVNMUEVIbHllSXFPaGE2UmtaTEtHeGprc2pQ?=
 =?utf-8?B?Qm9WdVA2K0RtaG5QTEM1VUNCUFhhMUhCdno1b2VEOHNRMmo4S0tEeEc1cDdY?=
 =?utf-8?B?Z1VQTDUvWHMrQk01QkFZaGtXYmVpY2w2TUFlQllLOHFPSUtSaEJhdm9zU3hp?=
 =?utf-8?B?NTE5dC91cHNLOHJueThhT0JzQ2s1VkVadElYK3crL1dMV1k0cVlVaHB1bHpW?=
 =?utf-8?B?T3pnaXlJdVN3R2pyVlpGbVZXZjBNV01HdFI2dG9ncFdQdHh4UlUyS3A0NVY0?=
 =?utf-8?B?VHB0ZnMrWDFpdWMxS1dPeFc3NFF1SUgvWXFDRkpBbFVua1d0ZkJJY2Q4Vnlu?=
 =?utf-8?B?RThWQ1FwRm01VXBtMzFpNjZaaFlISVpMMHhnOWxiM2gzVFRKbFJydmZTTE9q?=
 =?utf-8?B?YzFGYUpOSzRKd1ExZEpqTG00RWpMTWhuSmZUbTlQWWlSa0FkV0xzNkFpQnJQ?=
 =?utf-8?B?WDZ0MGRSek5aQmdTL0J1bUxBWWNSZTNTS054Q25iemV1ZHE5WWIvUE0vMGJT?=
 =?utf-8?B?TW9McGpUSDJudE83bUFpL29NdmZXRlBkRWkxYkhZc1VBYzRQenBoZlU4RHNM?=
 =?utf-8?B?L0YrT0VPY3Z1OEhvb2xiZW5uOHo3a2U1TlhsSHZOK2x2b3VMMldseVE0TURy?=
 =?utf-8?B?a2NSUmdGT3hsc2RXdmpJTDFpVkdCRzluV3BqcGtBRGpQQkQ5L3o2a2VOUzZ2?=
 =?utf-8?B?aUxsQWFHZW5GcGpubStYYytTZFAzV205eng5YzV6RWFzWVlaWnd2NjBWZnJI?=
 =?utf-8?B?MXIwbnZpb0QvSXNhaXBlZk9LMXQ3bnhiMzFaY0YvZGRaaU56dGQ0SWJvOE54?=
 =?utf-8?B?enNZWE5VdE1KSzJjdDVFWlg4YVFHREpvZDQwUlF0ajl4S3hTaE5zSDY1L2w5?=
 =?utf-8?B?VUk4akJDQWtCY2JuTGE1eU1VUnBESDJQRlVYeW5pLy9qbWJJSUxRalUrcURi?=
 =?utf-8?B?TGxJSVdQYVBENnduaU13a293emd2aE9sZ3lmOGtyaHJrM1c1YkRxQks5QWxD?=
 =?utf-8?B?WUcyOFE1cVFLZnVYQnlJUEgyc3dXWFpZWWtDNURsUm5Gcnc1aVNDVlU3OEdV?=
 =?utf-8?B?VjR2ZEJ1dy8rdkpVeGNMRWdIaVZtNzRXYW9jcDFVNUVkcytpdytXQys1azVF?=
 =?utf-8?B?MitrblJlQzZrY1dld3ZreHB5NjE1MmZvbG9aU1JjcjhwckNYZE5lR1JDRGpJ?=
 =?utf-8?B?ZWcyUUNaelZ5a1ZPSHl2ZTFDVDJMMEtmUlBvUkJwM0hsS2NJaGdnN25mOVlF?=
 =?utf-8?B?RkVZeExacDhFRTJNMWFPNjB2NFRpcTlicFIrMjhGd0xMVTJOeHJJN2svaTRV?=
 =?utf-8?B?MDEwV2ZDY3hFUkVBQ0VxYnljY2NMM05jaDJ5bFdLaVNZemozZUNld296bk9X?=
 =?utf-8?B?ZkVzSTBlTDFVRzRBSVIrZE95bHVvSmErMDhCZkdHN0pvS3RJM2cwRTNpOG9S?=
 =?utf-8?B?Tk5vaEgyaXZHemtaNXFucDNuOEtjTU8wUDlCSnFjY25oUVBMSUJMZUE3ZVZF?=
 =?utf-8?B?SzRkL1lnUXR5K2NpS21EcE9ucFJScHM1ajVWbzFwOWQ1YUV4UHBvS3hWalIr?=
 =?utf-8?B?ZitidHY3NVY5ZGZ6Z0pZbTR1cm9nUzhDeVpmN1ZQdGZBQktObmYxa2hKYk9Y?=
 =?utf-8?B?THhpYytUQlRvbGY1TnB3SnkrM09PVWs0NWNvNnF4c1pJQXlnam5YTnp6VTF2?=
 =?utf-8?B?cVJCWU5sWng1VFQrTVR1T1ZUUGtWTS94VXdHRkFla3FhekF4ai9HMVRUUHhv?=
 =?utf-8?B?M3pRdHd6NW5XaEZBSVhNTktFK0VHWno4TUUvNTBQOFF3VXZlOGxFazRpdFFJ?=
 =?utf-8?B?OVZaMmdyVzIwWlBETGxRRWFraEt0cmthb2cxcEwxazd0U01ONi8zRi9sVGJv?=
 =?utf-8?B?bVJjeWVtVDJ2TXpURGNXN1k3d3NabS8yOVY3aXVkMFc1T1lMajNoZGlzY3ZZ?=
 =?utf-8?B?M0xnYWowVWowakZ1WkdvYTlod0IzUkFUMG16TmM0ZUFPZkNiYkQ1TkpYTDVp?=
 =?utf-8?B?TVE2RXlobFp2L2VBNjR6ZVhQT2owN3VraGZyYWVnNzJWa3ovaTRXUURSTzJ5?=
 =?utf-8?B?alVqdU0rSElSU3RiZ1VacUdLZGVsdzFsVGMrVFpQQlVIdE5LRFd6SzlIekhj?=
 =?utf-8?B?NWN3aEdkaEE5cnIxTzRqb2U1ZnRablVhYnBZalBweW9XVktIMlh0Tm5xbExn?=
 =?utf-8?B?MWJsTmVFMEs2Vm53OUpRdDhRQ3VYTFpLTU1aNE5VOTVzYStCelRyS1MvalhX?=
 =?utf-8?B?bC9UUUIrczFOUkEyTDhVbHVNbjNnPT0=?=
Content-ID: <FC8C3396C5BE6644A69C70A0584B1CDE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f66622-6e55-445b-0b49-08d9e5970234
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 15:24:58.8173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mTd6Lzor6GLokID3MACy1vPxS6NkQU1W2cA1IPr2JmiLWLZ7HABfRYYrEeNMYwyugb8K/w4akp/TpL2UzW5S5eETum1Cim7+spe9gQUIoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_072508_416867_DB9A6F50 
X-CRM114-Status: GOOD (  19.55  )
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


> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/spi/spi-intel.c
> similarity index 59%
> rename from drivers/mtd/spi-nor/controllers/intel-spi.c
> rename to drivers/spi/spi-intel.c
> index f35597cbea0c..3b126927419c 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/spi/spi-intel.c

cut

> -static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
> +static int intel_spi_erase(struct intel_spi *ispi, const struct spi_mem_op *op)
>  {
> -       size_t erase_size, len = nor->mtd.erasesize;
> -       struct intel_spi *ispi = nor->priv;
> +       u8 opcode = op->cmd.opcode;
> +       u32 addr = op->addr.val;
>         u32 val, status, cmd;
>         int ret;
> 
> -       /* If the hardware can do 64k erase use that when possible */
> -       if (len >= SZ_64K && ispi->erase_64k) {
> +       switch (opcode) {
> +       case SPINOR_OP_SE:

Would it worth to extend the intel_spi_mem_op struct and introduce an
u32 replacement_op; member and use it directly here without doing the
switch, so that we don't mix SPI NOR code in the driver?
Also the cmd assignement can be done after if (ispi->swseq_erase), right?

>                 cmd = HSFSTS_CTL_FCYCLE_ERASE_64K;
> -               erase_size = SZ_64K;
> -       } else {
> +               break;
> +
> +       case SPINOR_OP_BE_4K:
>                 cmd = HSFSTS_CTL_FCYCLE_ERASE;
> -               erase_size = SZ_4K;
> +               break;
> +
> +       default:
> +               return -EINVAL;

you have a INTEL_SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BE_4K_4B, 1), ...) defined.
supported_op will return true, but you get an -EINVAL here.

>         }
> 
> -       if (ispi->swseq_erase) {
> -               while (len > 0) {
> -                       writel(offs, ispi->base + FADDR);
> +       writel(addr, ispi->base + FADDR);
> +
> +       if (ispi->swseq_erase)
> +               return intel_spi_sw_cycle(ispi, opcode, 0,
> +                                         OPTYPE_WRITE_WITH_ADDR);
> +
> +       /* Not needed with HW sequencer erase, make sure it is cleared */
> +       ispi->atomic_preopcode = 0;
> +
> +       val = readl(ispi->base + HSFSTS_CTL);
> +       val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> +       val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> +       val |= HSFSTS_CTL_FGO;
> +       val |= cmd;
> +       writel(val, ispi->base + HSFSTS_CTL);
> +
> +       ret = intel_spi_wait_hw_busy(ispi);
> +       if (ret)
> +               return ret;
> +
> +       status = readl(ispi->base + HSFSTS_CTL);
> +       if (status & HSFSTS_CTL_FCERR)
> +               return -EIO;
> +       if (status & HSFSTS_CTL_AEL)
> +               return -EACCES;
> +
> +       return 0;
> +}
> +

cut

> +static int intel_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +       struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> +       const struct intel_spi_mem_op *iop;
> 
> -               val = readl(ispi->base + HSFSTS_CTL);
> -               val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> -               val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> -               val |= cmd;
> -               val |= HSFSTS_CTL_FGO;
> -               writel(val, ispi->base + HSFSTS_CTL);
> +       iop = intel_spi_match_mem_op(ispi, op);
> +       if (!iop)
> +               return -EINVAL;

return -EOPNOTSUPP?

> 
> -               ret = intel_spi_wait_hw_busy(ispi);
> -               if (ret)
> -                       return ret;
> +       return iop->exec_op(ispi, op);
> +}
> 
> -               status = readl(ispi->base + HSFSTS_CTL);
> -               if (status & HSFSTS_CTL_FCERR)
> -                       return -EIO;
> -               else if (status & HSFSTS_CTL_AEL)
> -                       return -EACCES;
> +static const char *intel_spi_get_name(struct spi_mem *mem)
> +{
> +       const struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> +
> +       /*
> +        * Return name of the flash controller device to be compatible
> +        * with the MTD version.
> +        */
> +       return dev_name(ispi->dev);
> +}
> +
> +static const struct spi_controller_mem_ops intel_spi_mem_ops = {
> +       .supports_op = intel_spi_supports_mem_op,
> +       .exec_op = intel_spi_exec_mem_op,
> +       .get_name = intel_spi_get_name,
> +};
> +
> +#define INTEL_SPI_OP_ADDR(__nbytes)                                    \
> +       {                                                               \
> +               .nbytes = __nbytes,                                     \
> +       }
> +
> +#define INTEL_SPI_OP_NO_DATA                                           \
> +       {                                                               \
> +               .dir = SPI_MEM_NO_DATA,                                 \
> +       }
> +
> +#define INTEL_SPI_OP_DATA_IN(__buswidth)                               \
> +       {                                                               \
> +               .dir = SPI_MEM_DATA_IN,                                 \
> +               .buswidth = __buswidth,                                 \
> +       }
> +
> +#define INTEL_SPI_OP_DATA_OUT(__buswidth)                              \
> +       {                                                               \
> +               .dir = SPI_MEM_DATA_OUT,                                \
> +               .buswidth = __buswidth,                                 \
> +       }
> +
> +#define INTEL_SPI_MEM_OP(__cmd, __addr, __data, __exec_op)             \
> +       {                                                               \
> +               .mem_op = {                                             \
> +                       .cmd = __cmd,                                   \
> +                       .addr = __addr,                                 \
> +                       .data = __data,                                 \
> +               },                                                      \
> +               .exec_op = __exec_op,                                   \
> +       }
> +
> +/*
> + * The controller handles pretty much everything internally based on the
> + * SFDP data but we want to make sure we only support the operations
> + * actually possible. Only check buswidth and transfer direction, the
> + * core validates data.
> + */
> +#define INTEL_SPI_GENERIC_OPS

checkpatch --strict complains:
ERROR: Macros with complex values should be enclosed in parentheses
#955: FILE: drivers/spi/spi-intel.c:826:
+#define INTEL_SPI_GENERIC_OPS

                                          \
> +       /* Status register operations */                                \
> +       INTEL_SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),             \
> +                        SPI_MEM_OP_NO_ADDR,                            \
> +                        INTEL_SPI_OP_DATA_IN(1),                       \
> +                        intel_spi_read_reg),                           \

I like the idea	with the array of ops. Maybe you'd like to order the ops and
put the ops that are highly used as the first elements in the array, so that
you speed up a bit the op selection at run-time. No hard requirement.

Neat work. Thanks for the patience.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
