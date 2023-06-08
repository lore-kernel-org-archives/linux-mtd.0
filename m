Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B932C7EE25
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XORflc6nK4osU5wKAOj9JmrfMSd+0FGET4Pxm7nOec0=; b=R92IlBNx0Z3HP29a+AcJZs12uG
	Q3ArDXOfYt2Ugczex4Q0d5uXPlVRUGlLMnO08/h90OFerS6c08XaWqzTlXozpQAuEoxIYElXUymVn
	Q7PDLs546OVLB21+AyfHipZC5tYgymabtB07kaM40uTS838MYZWQKHNSBT1Vsz/rdriOi8sPxFqJa
	nS+JNiKcwNkVY43NM3cd0aNRJ1vcjGVZPXBPkuOmmmS8dpGjG8nY55w8lRUjNLR1uPp96kDrawxqI
	vtHUjLFpynqchQrYdO1fYKU8py7GYhKx5+IjM1DNLoUzeheID2mMG/DmNdjIeehjUrT0ddb0xj64I
	mLPNJZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79pG-008MgI-1f;
	Thu, 08 Jun 2023 07:12:54 +0000
Received: from mail-tyzapc01on2072c.outbound.protection.outlook.com ([2a01:111:f403:704b::72c] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79pD-008MfD-1Y;
	Thu, 08 Jun 2023 07:12:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gy9FiIFR7ZBFxO7sstJJ/wHdz313QUcSb5Y8LIupH1DkW3VmETxnOKW22aooj0VGbyxnmbE0OZRt4EVQtHBYWH9KRRL7nn7dpgj56ThRs/91GClUTRK1fHnIxKmlcfKfvplKClth8SvTfIIAV8guetyLK5yVdHKiF9RAcXRQeEtzCHin25+dnZwTspcEe+UyFLzQUrtwH+HjD8T00chzV03qM32GOKnjC2LA9WHlu/n+SPIiJCQYPUbgYVJnR5D3eSqnxoyaZqRxmKcUBX711xZt4PPoC0G2t51vbeHlUYM3UZWK7XBH3BDmsFgTr7AWPZi+yRgcxANzCosVXyLm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C619iUY2qgeP44Cun/GJ4rPEsog6x1kr/kOEwF7ijH8=;
 b=nddV3hwyZXwneONTCuY/8+6TsCrgqpQmH3XBnSw4VS+oeFdmhgO80ugnnuhJrg/vLlqZS4u49aq3JJP4LWnyImFrbDitcWAZtn5leCDuYrU8fqZewlOGvKfxjr7aDiFlNhMFX09dQoXyyD10rNP6rZUhRgh0fbjgCPK45qwu7IwFNEOsxEkFBuxCBVSqHPYAQ3XRkRjOhc1F3Ia/EM8iSDugGXdgO/+wl/fAS1/fIQAcBeMIy0rkW5DtWMrJgBsqKz7xuxMY2QIjBOHbvn6MLhlqwrul51c6jaIFSyoW/JKKdQMaFiB4c8lO8CC2R+3HIMVDtdF1leg5cUxfwWVkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C619iUY2qgeP44Cun/GJ4rPEsog6x1kr/kOEwF7ijH8=;
 b=Gk4OvmlZyhYKkkca6UX5XwwOxz4D5Ljv1mkHMdLfJXzRNAxIBrc8PgWFlg3EdnRtkfyHwTH13ih5pPCKy/NHPHYoMa6y0xzTt96P/UY77BFXn0Sdj0CbJ6W9lkLzTDaIfqVc5k7nOi19IGYEB2mcSgXo6V55urUc2XpEC5bMiwUT18trl9lmR3VcQTRXH5NACux11rB+CO0BaJ7r1Sug97YX5jl4qCIHwVVywMHKzCLlCGfcPoHt41EOld2gA7QKABmnQhKefF/B8oAFACFGs/VRSHFUn3Iws6eyFjbcizefb2EpG7gB+Ta2F5ePBpqN4LweHaBZnM16UrAY2zwy8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) by
 SI2PR03MB6806.apcprd03.prod.outlook.com (2603:1096:4:1ed::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Thu, 8 Jun 2023 07:12:35 +0000
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a]) by JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a%6]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 07:12:35 +0000
Message-ID: <4e6cd8a8-f618-4bc3-5fa9-eab2b501dd89@amlogic.com>
Date: Thu, 8 Jun 2023 15:12:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
 <9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
 <3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
 <7903580d-685c-14e6-5572-81a4cb31cced@amlogic.com>
 <20230608085458.449a24c0@xps-13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230608085458.449a24c0@xps-13>
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To JH0PR03MB7495.apcprd03.prod.outlook.com
 (2603:1096:990:9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7495:EE_|SI2PR03MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: b9819c12-b9f2-4950-73cc-08db67efbc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GL4hGLLoBryJlAyiYzwBFDkzaBoMuuqRc+d8G5TdAUtc/c0bN0c8k/XE5m0TJfNf1B9oCWiQ1dIThYcTYMGG6j1u4pH9UCDWoA8wKwF4czlfdqwiBmzyaeLBfck5+DXWSQwpz4/oKIr2Pu8uLxVYEQUeuNILd1X0yciLk7iPko/GeFoKYPk7UkMUs9MLqX+F5IION2rKwOsRrbC/YrPq67aYaB7vRRyEOI6t2azU2JDJUuyB3NOSiaDm646xxILpFADomTyrJ268iEuPQVWKcpGm+YR0FPhKci3N9ZIQWvmXb9O7ymieEIiFiY6T2NYn+6fFADsyRGL0Gq2ne80OiIfrtWjYx4IgNqwlKu8u3Io/yvQwYznRGWqanmz2HN3ybkp2Nf8DzzTTRsAXXH5FAdGlOn2u4JWqRbMfeIRbn3mWAD73rQ/zGp351avij8FskiRXM6ESZhgY/Lovmw8/FD7glEW41IvVa0mRQnpSKgop0EmHZh2GyzjBYLteLcyJGIkLobzrvNZRZ9kQSlaRIhgCwFmrqBOHmwK9SQ3O1/czX/fcuXT0XgiaqAaUBI80H9cXOEAJCZOXb80Xb+T+xrvP+cZwm8cNPHD3MLhZwjG0kjPcoTCPYCDWbE2jfU8VrIb+j5llvPmo8v0ni3Xpfnzasr+U1KzmPa3wAqDKHy++TczBtdv2zakPduICIDjA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7495.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(451199021)(2906002)(44832011)(36756003)(38350700002)(38100700002)(31696002)(54906003)(6486002)(66476007)(478600001)(6666004)(8936002)(7416002)(316002)(4326008)(52116002)(41300700001)(66946007)(83380400001)(6916009)(66574015)(2616005)(66556008)(8676002)(6512007)(86362001)(26005)(6506007)(53546011)(186003)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVd1aTd6V211NkRRa2ExcnJVV3YzaGVNcU1HMFVwTWNjenMrd2Y1RFoyT290?=
 =?utf-8?B?TXlmenoxWWUyeWpUcmZteEhDNkxFc0lmMFlpeXp3Sk5TZ3dFUjhndkR3aVAy?=
 =?utf-8?B?V2JyNnlaVy9meUQvMEVBbTVUSVNuT25aL2NCZjNkSTkyQk9VdkFWdm5kdThH?=
 =?utf-8?B?MUU2VTMrSnNLMVYwbkozR2h1aHlkRU03R3RucDl2YkpaTTVhd2VwclNyMllj?=
 =?utf-8?B?TENCaVJWZFNpYng0Z2hvVEovdDhrZ1ovSHZNRFlMOFRRS29md1FNNWR3ck5Z?=
 =?utf-8?B?dHZBQy94TG5MRzRDUDYrTVkwd2VyRUxEQnhScXRlb3ozaFprZ2ZnbkIwM0Nw?=
 =?utf-8?B?NXBHU3RtMkdyMk5Udkp2Z05lNml6VXMzYWVMTHg0clZzQ2g2NS91Qjd3Z3NB?=
 =?utf-8?B?aS9aTGQzYnpVd2pXOEFjUWEycCs2UnpjUFFwSVVXYnRxV0k0YnRjTFhaUm9a?=
 =?utf-8?B?OVZSYmZrbVRydm5YSkRaQUZZK2krWWxNOWZhTE1mZDFrdXdZcHV6SXdyN3BG?=
 =?utf-8?B?WWplY0J3REg1MnZ0YVVtVUZtSjZCM1hoVFVKR1JYRGJxMXFTUFNKOHQvOTVC?=
 =?utf-8?B?bklwZzBqOHMzMmZpNW5YMkxpbVhGeTA1RVdmR2hOWm83emh6YTF0SnBubXdN?=
 =?utf-8?B?QWJuYi9JOVJ0RGtVb1BDMEZSa1ljSVVCL2cxSFZnUFFpSE5GWUIwTHJKNFIz?=
 =?utf-8?B?czAzQ0NqYjBBNHNuUmVxN2dtWUN5QU9udTYyWXE4c1BoOGY0MzJvSUFSb2Yv?=
 =?utf-8?B?SHNFUUVHWTB6SHZWZGpIeDZBK3VYcmNrUVIycEhMbkZRSDhiY3FjZm5oWXB0?=
 =?utf-8?B?dkV6enRZQzRaeG1LaXc0K1RhaTBJKzBCVk9NbHhzUytmc1Rnck51RFl5YlRy?=
 =?utf-8?B?WTVIRTZaRmREdjEvanRyaWJTa1B2M3Q4djQvZktsWG1wMFJHUTk4cjFvTTFo?=
 =?utf-8?B?dTc2dXZyNFRaRFlxWmsrallMVjVrQmxyT0hPbGhPOXlMSm1MS0FRWkRac2dD?=
 =?utf-8?B?MTloWW53NGx4NVRQdmxlOTdxM2JVQ0ZhUlNZdzh6Mkc4cHE4QktQeEV2eWox?=
 =?utf-8?B?cXUwSnM2TDJ4dGJhWlAxK01IWTVEeGZETFBqeXRXZU1jSXlmMkFrbnFPam90?=
 =?utf-8?B?MFUxN1J4NWxNU2phZ2o0OHlOMTBPVExhTmhVU1NnbWhOQXhNQ2REOUw5YnJ1?=
 =?utf-8?B?UlpyN0V2bnl4ejdXeHJIUUJTcnFTTEZYd3VLZzhJU1Y4bVYxUU5hTllUU2xv?=
 =?utf-8?B?aHp0eDRhRFdlNHF0d3I5VzhOajdkUDFBUVJrTkpkMEEwZ0tIWmw1TmVCTXFo?=
 =?utf-8?B?dmc0V1U1NDhDUll0ZDM5NTVTVXpJVEpQc3FBbDFIYlNiSUoxWWVlS2NFdnVu?=
 =?utf-8?B?ZDllOHc4ZEN4cWRZaUFlS28xb0pHNkErdlBSMXB5NitqUmVUNThVS3p2SDNT?=
 =?utf-8?B?VnNqSEJuRytOU0graEl4ZStxT3F1YnlPbDUyTkFtK0ppS2FtZ2pSck9MNHVW?=
 =?utf-8?B?QSsvaFlGbUd5QnZQclJ4N0w5dzlaZTNPRHZ2Y1Vxb0VnNGJ5aTB4SzJnS1hC?=
 =?utf-8?B?alZGMTZzRnJOTm02cHViRHpoRUxJSmFZRXFtMzgwSUhWTGRoRDZRalcrTHM1?=
 =?utf-8?B?cWhoeE5kK3pGMDZ1V3B2aG0vSm5yM05tYjlvMXlsYmdnVWZWSzF6aUxGMjk4?=
 =?utf-8?B?MlRmYnNKd3JvTWNUTkNaWDc4Ri9XbW05NGU3MWdnN1dvN2U0R0xHcHZSZDZa?=
 =?utf-8?B?SDlvdlZmYkdLeno1UTJhKy80dTJCbzhXckRac25pM2h1VGtMMnRWWjl4WWt5?=
 =?utf-8?B?S0hKMnZPQXJNMWt3akhpQVk5OERaNUFZOUJ2ZzUxVHJ4OFhBVDg3UUlhKzh6?=
 =?utf-8?B?N3dGdmVGN0E3bTFLK3AyRFQ5cnhUS3lFeUMyaTBiR21TQkJEZ2tLUDlYRlkr?=
 =?utf-8?B?TE9UdkVwTnQwWUFnZnJqNmY1WndxWGVKNndYcSs1a1dqa2dCMnoyczUzSHBv?=
 =?utf-8?B?SnVlTnNWWUg4bFFaREQ3aDBrR1JmenJYY3BNc3JScHlUTHUwelBYVjdReHZN?=
 =?utf-8?B?QTBLc2NpZUhnYWJTQmtVT0NsRkVkWkMyNmlhZGs4QXNsZ3NvRC8xcG5LYWE1?=
 =?utf-8?Q?vPGivmLVCdDIz/K1U8B4yYHwQ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9819c12-b9f2-4950-73cc-08db67efbc04
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 07:12:35.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8FENwHFER1y/ttPolZzPFE1dHc54DPx7U0OYqjk85jRKSPscb0g0kXhiVCflTgtu/TyE88oWT3tgf7xlh2pNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_001251_635773_D3298573 
X-CRM114-Status: GOOD (  22.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMjAyMy82LzggMTQ6NTQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gSGkgTGlhbmcsCj4gCj4gbGlhbmcueWFuZ0BhbWxvZ2ljLmNv
bSB3cm90ZSBvbiBUaHUsIDggSnVuIDIwMjMgMTQ6NDI6NTMgKzA4MDA6Cj4gCj4+IEhpIEFyc2Vu
aXksCj4+Cj4+IE9uIDIwMjMvNi84IDU6MTcsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+IFsg
RVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IEhpIGFnYWluIE1pcXVlbCwgTGlhbmchCj4+Pgo+Pj4g
V2hhdCBkbyBZb3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8KPj4+Cj4+PiBUaGFua3MsIEFyc2Vu
aXkKPj4+Cj4+PiBPbiAwNi4wNi4yMDIzIDE5OjI5LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4+
Pj4gU29ycnksIGhlcmUgaXMgY2hhbmdlbG9nOgo+Pj4+IHYxIC0+IHYyOgo+Pj4+ICogTW92ZSBj
aGVja3MgZnJvbSAnc3dpdGNoL2Nhc2UnIHdoaWNoIGV4ZWN1dGVzIGNvbW1hbmRzIGluICdtZXNv
bl9uZmNfZXhlY19vcCgpJyB0byBhIHNwZWNpYWwKPj4+PiAgICAgc2VwYXJhdGVkIGZ1bmN0aW9u
ICdtZXNvbl9uZmNfY2hlY2tfb3AoKScgd2hpY2ggaXMgY2FsbGVkIGJlZm9yZSBjb21tYW5kcyBw
cm9jZXNzaW5nLgo+Pj4+Cj4+Pj4gT24gMDYuMDYuMjAyMyAxMzoxNiwgQXJzZW5peSBLcmFzbm92
IHdyb3RlOgo+Pj4+PiBNZXNvbiBOQU5EIGNvbnRyb2xsZXIgaGFzIGxpbWl0ZWQgYnVmZmVyIGxl
bmd0aCwgc28gY2hlY2sgaXQgYmVmb3JlCj4+Pj4+IGNvbW1hbmQgZXhlY3V0aW9uIHRvIGF2b2lk
IGxlbmd0aCB0cmltLiBBbHNvIGNoZWNrIE1URCB3cml0ZSBzaXplIG9uCj4+Pj4+IGNoaXAgYXR0
YWNoLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25v
dkBzYmVyZGV2aWNlcy5ydT4KPj4+Pj4gLS0tCj4+Pj4+ICAgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPj4+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4gaW5kZXggMjNhNzMyNjg0MjFi
Li5kYjZiMTg3NTMwNzEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMK
Pj4+Pj4gQEAgLTExMSw2ICsxMTEsOCBAQAo+Pj4+Pgo+Pj4+PiAgICAjZGVmaW5lIFBFUl9JTkZP
X0JZVEUgICAgICAgICAgICAgICA4Cj4+Pj4+Cj4+Pj4+ICsjZGVmaW5lIE5GQ19DTURfUkFXX0xF
TiAgICAgR0VOTUFTSygxMywgMCkKPj4+Pj4gKwo+Pj4+PiAgICBzdHJ1Y3QgbWVzb25fbmZjX25h
bmRfY2hpcCB7Cj4+Pj4+ICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cj4+Pj4+ICAgICAg
ICBzdHJ1Y3QgbmFuZF9jaGlwIG5hbmQ7Cj4+Pj4+IEBAIC0yODQsNyArMjg2LDcgQEAgc3RhdGlj
IHZvaWQgbWVzb25fbmZjX2NtZF9hY2Nlc3Moc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgaW50IHJh
dywgYm9vbCBkaXIsCj4+Pj4+Cj4+Pj4+ICAgICAgICBpZiAocmF3KSB7Cj4+Pj4+ICAgICAgICAg
ICAgICAgIGxlbiA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+Pj4+PiAtICAgICAg
ICAgICAgY21kID0gKGxlbiAmIEdFTk1BU0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIo
ZGlyKTsKPj4+Pj4gKyAgICAgICAgICAgIGNtZCA9IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIo
ZGlyKTsKPj4+Pj4gICAgICAgICAgICAgICAgd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5G
Q19SRUdfQ01EKTsKPj4KPj4gSSB0aGluayB3ZSBjb3VsZCBrZWVwICImIEdFTk1BU0soMTMsIDAp
Ii4gaXQgaXMgYmV0dGVyIGhlcmUgdG8gaW5kaWNhdGUgaG93IG1hbnkgYml0cyBvZiBsZW5ndGgg
aW4gdGhpcyBjb21tYW5kIGFuZCBkb24ndCBkZXN0b3J5IHRoZSBjb21tYW5kIG9uY2Ugd2UgZG9u
J3QgY2hlY2sgdGhlICJsZW4iIG91dHNpZGUgb2YgdGhpcyBmdW5jdGlvbi4gb3IgdGhlIGNvZGUg
ImlmIChsZW4gPiAgTkZDX0NNRF9SQVdfTEVOKSIgaXMgYmV0dGVyIHRvIHB1dCBpbnNpZGUgdGhp
cyBmdW5jdGlvbiBuZWFybHkuIFRoYW5rcy4KPiAKPiBJdCBkZXBlbmRzIHdobyBjYWxscyB0aGlz
IGhlbHBlci4gSWYgb25seSB1c2VkIGluc2lkZSBleGVjX29wLHdyaXRlX3BhZ2VfcmF3KCkgYW5k
IHJlYWRfcGFnZV9yYXcoKSBhbHNvIGNhbGwgbWVzb25fbmZjX2NtZF9hY2Nlc3MoKSwgCmJ1dCBp
IGRvbid0IGZpbmQgd2hlcmUgY29uc3RyYWluIHRoZSAibGVuIi4KCj4gaXQncyBub3QgdXNlZnVs
LiBJZiB1c2VkIG91dHNpZGUsIHRoZW4gaWYgeW91IHdhbnQgdG8gY2xhcmlmeQo+IHRoaW5ncyB5
b3UgbWF5IHdhbnQgdG8gdXNlOgo+IAo+ICNkZWZpbmUgTkZDX0NNRF9PUF9MRU4oY21kKSBGSUVM
RF9QUkVQKEdFTk1BU0soMTMsIDApLCAoY21kKSkKPiAKPiBUaGlzIGlzIGJ5IGZhciBteSBmYXZv
cml0ZSBjb25zdHJ1Y3Rpb24uIENvdWxkIGFwcGx5IHRvIG1hbnkgb3RoZXIKPiBmaWVsZHMsIGxp
a2UgRE1BX0RJUiwgc2NyYW1ibGVyLCBldGMuCj4gCj4+Pj4+ICAgICAgICAgICAgICAgIHJldHVy
bjsKPj4+Pj4gICAgICAgIH0KPj4+Pj4gQEAgLTU3Myw3ICs1NzUsNyBAQCBzdGF0aWMgaW50IG1l
c29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVu
KQo+Pj4+PiAgICAgICAgaWYgKHJldCkKPj4+Pj4gICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+
Pj4+Cj4+Pj4+IC0gICAgY21kID0gTkZDX0NNRF9OMk0gfCAobGVuICYgR0VOTUFTSygxMywgMCkp
Owo+Pj4+PiArICAgIGNtZCA9IE5GQ19DTURfTjJNIHwgbGVuOwo+Pj4+PiAgICAgICAgd3JpdGVs
KGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+Pj4KPj4+Pj4gICAgICAgIG1l
c29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4+Pj4gQEAgLTU5Nyw3ICs1OTksNyBAQCBzdGF0aWMg
aW50IG1lc29uX25mY193cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1Ziwg
aW50IGxlbikKPj4+Pj4gICAgICAgIGlmIChyZXQpCj4+Pj4+ICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4+Pj4+Cj4+Pj4+IC0gICAgY21kID0gTkZDX0NNRF9NMk4gfCAobGVuICYgR0VOTUFT
SygxMywgMCkpOwo+Pj4+PiArICAgIGNtZCA9IE5GQ19DTURfTTJOIHwgbGVuOwo+Pj4+PiAgICAg
ICAgd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+Pj4KPj4+Pj4g
ICAgICAgIG1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4+Pj4gQEAgLTEwMDcsNiArMTAwOSwz
MSBAQCBtZXNvbl9uYW5kX29wX3B1dF9kbWFfc2FmZV9vdXRwdXRfYnVmKGNvbnN0IHN0cnVjdCBu
YW5kX29wX2luc3RyICppbnN0ciwKPj4+Pj4gICAgICAgICAgICAgICAga2ZyZWUoYnVmKTsKPj4+
Pj4gICAgfQo+Pj4+Pgo+Pj4+PiArc3RhdGljIGludCBtZXNvbl9uZmNfY2hlY2tfb3Aoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCkKPj4+Pj4gK3sKPj4+Pj4gKyAgICBpbnQgb3BfaWQ7
Cj4+Pj4+ICsKPj4+Pj4gKyAgICBmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsg
b3BfaWQrKykgewo+Pj4+PiArICAgICAgICAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIg
Kmluc3RyOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgICAgICBpbnN0ciA9ICZvcC0+aW5zdHJzW29w
X2lkXTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAgICAgc3dpdGNoIChpbnN0ci0+dHlwZSkgewo+
Pj4+PiArICAgICAgICAgICAgY2FzZSBOQU5EX09QX0RBVEFfSU5fSU5TVFI6Cj4+Pj4+ICsgICAg
ICAgICAgICBjYXNlIE5BTkRfT1BfREFUQV9PVVRfSU5TVFI6Cj4+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgIGlmIChpbnN0ci0+Y3R4LmRhdGEubGVuID4gTkZDX0NNRF9SQVdfTEVOKQo+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4+Pj4+ICsKPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+Pj4+ICsgICAgICAgICAgICBkZWZhdWx0
Ogo+Pj4+PiArICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+Pj4gKyAgICAgICAgICAgIH0K
Pj4+Pj4gKyAgICB9Cj4+Pj4+ICsKPj4+Pj4gKyAgICByZXR1cm4gMDsKPj4+Pj4gK30KPj4+Pj4g
Kwo+Pj4+PiAgICBzdGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAg
Km5hbmQsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFu
ZF9vcGVyYXRpb24gKm9wLCBib29sIGNoZWNrX29ubHkpCj4+Pj4+ICAgIHsKPj4+Pj4gQEAgLTEw
MTUsMTAgKzEwNDIsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfZXhlY19vcChzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLAo+Pj4+PiAgICAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmlu
c3RyID0gTlVMTDsKPj4+Pj4gICAgICAgIHZvaWQgKmJ1ZjsKPj4+Pj4gICAgICAgIHUzMiBvcF9p
ZCwgZGVsYXlfaWRsZSwgY21kOwo+Pj4+PiArICAgIGludCBlcnI7Cj4+Pj4+ICAgICAgICBpbnQg
aTsKPj4+Pj4KPj4+Pj4gLSAgICBpZiAoY2hlY2tfb25seSkKPj4+Pj4gLSAgICAgICAgICAgIHJl
dHVybiAwOwo+Pj4+PiArICAgIGVyciA9IG1lc29uX25mY19jaGVja19vcChuYW5kLCBvcCk7Cj4+
Pj4+ICsgICAgaWYgKGVyciB8fCBjaGVja19vbmx5KQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJu
IGVycjsKPj4+Pj4KPj4+Pj4gICAgICAgIG1lc29uX25mY19zZWxlY3RfY2hpcChuYW5kLCBvcC0+
Y3MpOwo+Pj4+PiAgICAgICAgZm9yIChvcF9pZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0cnM7IG9w
X2lkKyspIHsKPj4+Pj4gQEAgLTEyOTMsNiArMTMyMiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFu
ZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+Pj4+PiAgICAgICAgc3RydWN0
IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+
Pj4+PiAgICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4+
Pj4gICAgICAgIGludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gMTAyNDsKPj4+Pj4gKyAg
ICBpbnQgcmF3X3dyaXRlc2l6ZTsKPj4+Pj4gICAgICAgIGludCByZXQ7Cj4+Pj4+Cj4+Pj4+ICAg
ICAgICBpZiAoIW10ZC0+bmFtZSkgewo+Pj4+PiBAQCAtMTMwNCw2ICsxMzM0LDEzIEBAIHN0YXRp
YyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4+PiAgICAgICAgfQo+
Pj4+Pgo+Pj4+PiArICAgIHJhd193cml0ZXNpemUgPSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29i
c2l6ZTsKPj4+Pj4gKyAgICBpZiAocmF3X3dyaXRlc2l6ZSA+IE5GQ19DTURfUkFXX0xFTikgewo+
Pj4+PiArICAgICAgICAgICAgZGV2X2VycihuZmMtPmRldiwgInRvbyBiaWcgd3JpdGUgc2l6ZSBp
biByYXcgbW9kZTogJWQgPiAlbGRcbiIsCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHJhd193
cml0ZXNpemUsIE5GQ19DTURfUkFXX0xFTik7Cj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPj4+Pj4gKyAgICB9Cj4+Pj4+ICsKPj4+Pj4gICAgICAgIGlmIChuYW5kLT5iYnRfb3B0
aW9ucyAmIE5BTkRfQkJUX1VTRV9GTEFTSCkKPj4+Pj4gICAgICAgICAgICAgICAgbmFuZC0+YmJ0
X29wdGlvbnMgfD0gTkFORF9CQlRfTk9fT09COwo+Pj4+Pgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
