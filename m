Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327E8C7EE43
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvVbAj5KsE1u9ygwFK7ZGWmGA/YFI1sb0wgZoGRJEBI=; b=L0CjzBafLcIMMYrm4BYlT0RtDM
	fGAEZJDDaXMWaID1rJJrtlO0KKgRL8hs6azC/PCx1xqmbeo//5m8Hl7TWNMmJCwyui7e9w9eHLdPh
	Upo0PpSO2H8sPlPZGuzy7E56T5ZvFI+6D3EF8l0aL5h5B3MQQzMHaYNwuFGmhXNna33v6sqQVI8h7
	WpvS1w/GqkHM+K4hAS2emjhfvs8f/aZ8YlnHjW/0CPLTP5A6Do4EINxWpnax8euyGpNhBtObDG4ui
	LEEzHyZ+sRbj/NdvrFrgoEoouf0HgnCE9ukK0SLmPSxYtMx+sH0BFon57+mDZidrCUm15FIrAAQg3
	sKACncIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Etr-009MC1-2g;
	Thu, 08 Jun 2023 12:37:59 +0000
Received: from mail-psaapc01on20713.outbound.protection.outlook.com ([2a01:111:f400:feae::713] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Eto-009MAN-2k;
	Thu, 08 Jun 2023 12:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC1rXmgapwIVZOSEzW01DwoPng4j3pWbmC+OKDYk7PFKzhGOQyJeg/8tYKO6ggrbis6bAEmM1Bbs0hM1uMSOCHtrQJVx0ZDVSCwdMbyKI2BjX8ndEg4r+uqyQ8iG2Ar/a5RD2S8f8VO/z6iHG/I1lBU9R3aGhNf43FLeKMJtf7N8ZLMVPd+ouVuqjspgEAb3hqLrL20i+NkgmB6iDf1U8G9LaQjiZltXyCkiiy9xaiDUzeth76MkFtyutUmtFLEkYNFoq85utdhSFjcTUSmEhwE3tAPFwKCdAa5fRhj+v8oFO8JCmxUrVr7uaqbGSIEyiehu0jXQ1HdiqncAJZltSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60OfE/y1Y5llXFsGxhXJohNWdkdbNZKF6eK59ADDXI0=;
 b=ARAs7CG0S0F++thb2h7fnALCW/GgWfR/7TIfL0UDAhkApUhteVi4eee+FXq1DJ+UNlDclEBljPGhLEitAU92Urt9iPeVLRf9ddBLNfeFyQRdCRseLaUgxKuDjPswds50lFsX4Yi5jJv7FieS26u1XMheVNgnAHwzZ5/fw3i4N1lCmzg4oMIWRmVdqlHULACCq24CV+S2rpTnbW6ht9SKr0lzyCsh9UL7enjfbYi1txVvG+uXCPP3+rcvTQZzXgk2Ea612t1F0LtrxkvIjpZNw5vbPdqjgaR/lrNTiyv/1OnmC44cXZN7afb3Fh0dNNTrComW0Vk20wzbB68Gp8VgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60OfE/y1Y5llXFsGxhXJohNWdkdbNZKF6eK59ADDXI0=;
 b=cZsD+P9xSeTYaj5dZw72W7habpiHi3Tbo6crqb8PyZG1JpfSinGocaCxpwMBcRVqyJPGhwskPl8mNenIZ+7UBhjUilseVQoNYiCDkdWnKmdd0lEKtKN5nTlMUzdUL7OD9iSwdALv9WrnN2g+yV9YU72yM8g7AtoWTTcxRdW+3OyRJEGM45nX4hvSF4tXYyKfhxguswZoa1Z1wrWjn/uK/MYOZZRLhM5zTFwB/58REIETift/LjFKzZzVY4/XW2vn1Qefe6hGyJzcOp9QtXJ5XpSLSD+0VyK9tvLR60WRDOB4J/2apcaL9x5iipSaF4WP9F9wvRTrCuUmipBdrtK4bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) by
 SEZPR03MB7702.apcprd03.prod.outlook.com (2603:1096:101:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 12:37:46 +0000
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a]) by JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a%6]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 12:37:46 +0000
Message-ID: <a6a20b50-02b0-53c0-1e65-75035bc59c87@amlogic.com>
Date: Thu, 8 Jun 2023 20:37:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
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
 <4e6cd8a8-f618-4bc3-5fa9-eab2b501dd89@amlogic.com>
In-Reply-To: <4e6cd8a8-f618-4bc3-5fa9-eab2b501dd89@amlogic.com>
X-ClientProxiedBy: TYCP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::9) To JH0PR03MB7495.apcprd03.prod.outlook.com
 (2603:1096:990:9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7495:EE_|SEZPR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e5e945-eb8a-490b-caf3-08db681d28ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYQi+2zPAYqzjruX1slpvi6EyJkWOoemsuyG4WSU5KqNtCEPfLHpUIRlyGPLQdYv6RXqGLtulswY1BVYaMDLfSR32E2yY97jDCmfWjsrt0pwDsLaOOMfpWlQjk7BJDHaLiQz3UwKW9GQZoidYZvzWjY6rOJdYOfHj+gdOnsckN9xDWx0K3M1Gpjishgvk4mSJbaimUOjCTmDIdxjx1SUGcxOfnnA4fzVf2H7AtC8zsMSTZfETT2dDRedcS9eifcVlUuO8IZhJZRcxQ0S92NGsE1MVg/w0mnXDE74aPYq695SjLYTKO1Lo7lAKofC9Pd3wtnE0O8pdj9DHB2IPDUq62xqPcTgRy43cnV38NYLInQ1kMuKuZyWPGJCTHFs1iC1Y7WRtgyH/0/IhjNP9uKU/ib0zHvWs0tQNusMBDIDc4hd2PAmy7RCf+mUDAGTWpkFVDON8vqIjTWBdx5FXA4wYj+18xLVN/EFe3Ow2CvS3sDmtldIUU+tIBhdU/JCKQAlQ4BP0B46/BNcqzpHiCO9EePTiQY4heipSAg65FeZtjPd4UzoPzTUE/9ByypCakFjEpLEYnSXcX4ngBWBtfSyg5i0vRBmx1n/nqfYeybjteobF5s0wX4E5ABUZaJnH24YVhhrz84n+DIv1B7FQ/+lxPPw7YeHt7wFUadtw1o41Dr5tpotIq5TSxbENw6MPNFQx8563B2AEZeV+VwRsA0CBWv0bWe5/DKXtKhaAE3EmUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7495.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(136003)(366004)(346002)(451199021)(2906002)(44832011)(36756003)(38350700002)(38100700002)(66556008)(31696002)(54906003)(110136005)(52116002)(6666004)(478600001)(6486002)(66946007)(6512007)(8936002)(8676002)(4326008)(66476007)(41300700001)(316002)(66574015)(83380400001)(2616005)(7416002)(53546011)(6506007)(186003)(26005)(86362001)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y01aSDNYNTEzWTNCd1IrK1VlT3JRM2FMTzlneENiL1crRHBETmJVNnZmNVkr?=
 =?utf-8?B?T1lITHQ4Uk9WK0xUL1gzLy80Tm9XZkdaejJnREZFdmlyUWF0YTdXZkx2NnVQ?=
 =?utf-8?B?czQvQ2hGVCs3UHhjMDVoWE1QV0d3L05TOW1iNVJaZW9Nc2NuVkFzRCtwWFZx?=
 =?utf-8?B?bVBlN1ZTSk9rb2thYlBHSDVPenphN0o2R2w2b3hUMEJYdWczUThFSGJQRElz?=
 =?utf-8?B?TlJScUpUZURQMWRSa2dHRE9yNFlzQlJONkszQ0phaHlvbCt5OHVTRDRsdVc3?=
 =?utf-8?B?bFJ3MDdhZGZmQXhIVit5d25PNFFCVFV3OVVIMkdoRjRCZkpkUnM5SzZQNjI1?=
 =?utf-8?B?U1dTNWg4VDQyQURLOWtzLzFMQzFTWVVQYnIrYkUwYVYxVDJ1MHdCTlhabnhM?=
 =?utf-8?B?ZjcyR28zS2Z5MmV3ODlWUXBSYVdrUU9NUHpoMEZBcVVYeHBvcHFLd29OWWts?=
 =?utf-8?B?V2ZxNFl1S2Q0SVNNbGZoMTZNTWVqR3NJSjhMVm9vd2NyaGV6M09CU05uRkJw?=
 =?utf-8?B?cDJMa2t0aDNUZ3d1czVpcTluMzhva0lsR0FaVGM4LzFjQi9qNUx2Zzlza3VO?=
 =?utf-8?B?V3dqMTVZeFEvL0tKbDJMc3pkbVdQc3lyYVdjR1lYMU0rVUNkbDJtR25KYlM2?=
 =?utf-8?B?bnFzV0ppYUwrYU15WUdjQzAyMi9mOG11MVNaODJxTHpkMXB1Mms5TDdGRmdG?=
 =?utf-8?B?VFgyaDZzOWU5N0QwakRYVlRiWTdGQnlMeUtuS2J4TE1rb2x2QTdkemVLVW5F?=
 =?utf-8?B?WndueVNqYmJCNnU4UE1RaVNQWFBKYU81VDhvMlZmZDVOckl1dUF5bEFEMzN2?=
 =?utf-8?B?dCszd1RGTEtaalVOTmMvZEFOZUdrTVNKNzEyQ0RIeFUrSm13YTVpd2ZhaWZ6?=
 =?utf-8?B?YzFySXdPL3p4eVFMa0o3WFRzeWdWRGlQc25scHkvS3pyM2R3TzkwS1p0ZWpw?=
 =?utf-8?B?eHNhWEJodHlodFo4VnN1N0RJL1B5ZEZXV2FRaE44OFUrc3F0MFJJbHhCdFRE?=
 =?utf-8?B?ckp1Q2VubTdjMVBjN1FQU0FRUDRUREpQRXcvMmF6dVNFMkY2OXNDTzlQbGZF?=
 =?utf-8?B?S2QxaEVoSjFYZk51VGliZm96TXhVTUo5RUwvUXRXQStUSHdSNHhXZXdkVG83?=
 =?utf-8?B?a2ZneGJ4ZFR5ck94cXJ5T0VXSVhpaU5UaW5ZU3luUkZjTmR4MTZzOHFlaFJK?=
 =?utf-8?B?Tkd4bHhSa1pSd2NTdUw5Z2ZDTk8xVHRWb0c0dWRydWMyNWlhWHcrNCtXVk1E?=
 =?utf-8?B?QVErTUh5d29JOWVnVng4RHIzVCtRSCt1YmhPcWU2SFoyZE40eGtES1ZyNTRm?=
 =?utf-8?B?VDNYODE5NmUxaVhxN1puMXVWbjZRODkweVUzSnhtZVZzZnVleHM4QVdDeTdp?=
 =?utf-8?B?a2JPU0N1a3h6SFhVN2JHeWhSU3dUQ29pZi9lVGZyeGNHSDFndmpaMDlKSDg4?=
 =?utf-8?B?djUyQUR6R1UyZTBEa2VCWGNzMGJUQ2V1S0tiUFhYMzJVZENLQW9VZkkwakdm?=
 =?utf-8?B?RFg4TlJyN3hzVUNqUWdqZ2dlRE5jeVg5M0FIRnZ2M1lNVzZ3L2hBTDY5YTlt?=
 =?utf-8?B?dmlwODBUSVJUQzJ1b3o3eWdPbi85NTBuNHdkdmJUTVIzbVdYaWcxUFl3aUZI?=
 =?utf-8?B?bndwd3pLdXpGNEMySmVYMTUwWGZLZFkrdkNDS1RtdVRJTHNEa0VjaXVoMU1E?=
 =?utf-8?B?a3plcEY4YTdGdnVpZ1hRZU5ydVRRbkZETCttTkVnWkh3SFJHdmlmZDBqb21p?=
 =?utf-8?B?cTRQc01hczVocVdWMks2UEpSZTY1cVAzSlJFUlZqS2M1eXFQYXdtNHBVc0hZ?=
 =?utf-8?B?cGtaL1l3MFFBMjJkd3cvY0JhZEs5YVhzcEozZCtIRDF3a3BZcDV3MkZHWTdZ?=
 =?utf-8?B?VmRSN2srMldTQjU2RlN4ZXJRQzJJNGY3TGhPZHN3OUw1ek05bWl1ZlVaNDNi?=
 =?utf-8?B?N1dQdkF1SlhycXNRQVZGRlF3TmxPbXpvTzBvSEt0WHB5eEhZamIyTCtRVkkr?=
 =?utf-8?B?S3lXUng4dTREbW1Sc25vVGozWlV6bnZJWGQ1ZHN2cjU4NjN3KzY4NFB3VDIy?=
 =?utf-8?B?aCtnNmMxRzJzNnU3empPSG5xZ1F3WXo0K2ZFWnQzcDZ6aVl6M2F2cXVaeXl2?=
 =?utf-8?Q?zHANzZP/39uNxcosiKA5HWmYo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e5e945-eb8a-490b-caf3-08db681d28ed
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 12:37:45.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDXDOiO3uFx5SNWdSrdBWYdbSaax/dRmvmQPmXsRxYHRxlAWDjo9qOJx1NiUTEACf1RY+cP9deCLAyd+uGqJEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_053757_085828_64710A20 
X-CRM114-Status: GOOD (  22.92  )
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

SGkgQXJzZW5peSBhbmQgTWlxdWVsLAoKT24gMjAyMy82LzggMTU6MTIsIExpYW5nIFlhbmcgd3Jv
dGU6Cj4gSGkgTWlxdWVsLAo+IAo+IE9uIDIwMjMvNi84IDE0OjU0LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gSGkgTGlhbmcsCj4+Cj4+IGxpYW5nLnlh
bmdAYW1sb2dpYy5jb20gd3JvdGUgb24gVGh1LCA4IEp1biAyMDIzIDE0OjQyOjUzICswODAwOgo+
Pgo+Pj4gSGkgQXJzZW5peSwKPj4+Cj4+PiBPbiAyMDIzLzYvOCA1OjE3LCBBcnNlbml5IEtyYXNu
b3Ygd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+PiBIaSBhZ2FpbiBNaXF1
ZWwsIExpYW5nIQo+Pj4+Cj4+Pj4gV2hhdCBkbyBZb3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8K
Pj4+Pgo+Pj4+IFRoYW5rcywgQXJzZW5peQo+Pj4+Cj4+Pj4gT24gMDYuMDYuMjAyMyAxOToyOSwg
QXJzZW5peSBLcmFzbm92IHdyb3RlOgo+Pj4+PiBTb3JyeSwgaGVyZSBpcyBjaGFuZ2Vsb2c6Cj4+
Pj4+IHYxIC0+IHYyOgo+Pj4+PiAqIE1vdmUgY2hlY2tzIGZyb20gJ3N3aXRjaC9jYXNlJyB3aGlj
aCBleGVjdXRlcyBjb21tYW5kcyBpbiAKPj4+Pj4gJ21lc29uX25mY19leGVjX29wKCknIHRvIGEg
c3BlY2lhbAo+Pj4+PiDCoMKgwqAgc2VwYXJhdGVkIGZ1bmN0aW9uICdtZXNvbl9uZmNfY2hlY2tf
b3AoKScgd2hpY2ggaXMgY2FsbGVkIAo+Pj4+PiBiZWZvcmUgY29tbWFuZHMgcHJvY2Vzc2luZy4K
Pj4+Pj4KPj4+Pj4gT24gMDYuMDYuMjAyMyAxMzoxNiwgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+
Pj4+Pj4gTWVzb24gTkFORCBjb250cm9sbGVyIGhhcyBsaW1pdGVkIGJ1ZmZlciBsZW5ndGgsIHNv
IGNoZWNrIGl0IGJlZm9yZQo+Pj4+Pj4gY29tbWFuZCBleGVjdXRpb24gdG8gYXZvaWQgbGVuZ3Ro
IHRyaW0uIEFsc28gY2hlY2sgTVREIHdyaXRlIHNpemUgb24KPj4+Pj4+IGNoaXAgYXR0YWNoLgo+
Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNi
ZXJkZXZpY2VzLnJ1Pgo+Pj4+Pj4gLS0tCj4+Pj4+PiDCoMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYyB8IDQ3IAo+Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQo+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jIAo+Pj4+Pj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+
Pj4+IGluZGV4IDIzYTczMjY4NDIxYi4uZGI2YjE4NzUzMDcxIDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+IEBAIC0xMTEsNiArMTExLDggQEAKPj4+Pj4+
Cj4+Pj4+PiDCoMKgICNkZWZpbmUgUEVSX0lORk9fQllURcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOAo+Pj4+Pj4KPj4+Pj4+ICsjZGVmaW5lIE5GQ19DTURfUkFXX0xFTsKgwqDCoMKgIEdF
Tk1BU0soMTMsIDApCj4+Pj4+PiArCj4+Pj4+PiDCoMKgIHN0cnVjdCBtZXNvbl9uZmNfbmFuZF9j
aGlwIHsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cj4+Pj4+PiDC
oMKgwqDCoMKgwqAgc3RydWN0IG5hbmRfY2hpcCBuYW5kOwo+Pj4+Pj4gQEAgLTI4NCw3ICsyODYs
NyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfY21kX2FjY2VzcyhzdHJ1Y3QgCj4+Pj4+PiBuYW5k
X2NoaXAgKm5hbmQsIGludCByYXcsIGJvb2wgZGlyLAo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKgwqDC
oCBpZiAocmF3KSB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlbiA9IG10
ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY21kID0gKGxlbiAmIEdFTk1BU0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGly
KTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCA9IGxlbiB8IHNjcmFtYmxlciB8
IERNQV9ESVIoZGlyKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVs
KGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+Cj4+PiBJIHRoaW5rIHdlIGNv
dWxkIGtlZXAgIiYgR0VOTUFTSygxMywgMCkiLiBpdCBpcyBiZXR0ZXIgaGVyZSB0byAKPj4+IGlu
ZGljYXRlIGhvdyBtYW55IGJpdHMgb2YgbGVuZ3RoIGluIHRoaXMgY29tbWFuZCBhbmQgZG9uJ3Qg
ZGVzdG9yeSAKPj4+IHRoZSBjb21tYW5kIG9uY2Ugd2UgZG9uJ3QgY2hlY2sgdGhlICJsZW4iIG91
dHNpZGUgb2YgdGhpcyBmdW5jdGlvbi4gCj4+PiBvciB0aGUgY29kZSAiaWYgKGxlbiA+wqAgTkZD
X0NNRF9SQVdfTEVOKSIgaXMgYmV0dGVyIHRvIHB1dCBpbnNpZGUgCj4+PiB0aGlzIGZ1bmN0aW9u
IG5lYXJseS4gVGhhbmtzLgo+Pgo+PiBJdCBkZXBlbmRzIHdobyBjYWxscyB0aGlzIGhlbHBlci4g
SWYgb25seSB1c2VkIGluc2lkZSAKPj4gZXhlY19vcCx3cml0ZV9wYWdlX3JhdygpIGFuZCByZWFk
X3BhZ2VfcmF3KCkgYWxzbyBjYWxsIAo+PiBtZXNvbl9uZmNfY21kX2FjY2VzcygpLCAKPiBidXQg
aSBkb24ndCBmaW5kIHdoZXJlIGNvbnN0cmFpbiB0aGUgImxlbiIuCgpJcyB0aGUgaGVscGVyICJt
ZXNvbl9uZmNfY2hlY2tfb3AoKSIgbmVlZGVkIGJ5IGV4ZWNfb3AoKSBhZnRlciB0aGUgCmNvbnN0
cmFpbnQgaW4gYXR0YWNoX2NoaXAoKT8gdGhlIGxlbmd0aCBwYXNzZWQgaW4gZXhlY19vcCgpIHNl
ZW1zIApzbWFsbGVyIHRoYW4gIm10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplIiBub3cuCgpA
QXJzZW5peSBpZiBpdCBkb2VzIG5lZWQsIEkgdGhpbmsgdGhlIHNhbWUgY29uc3RyYWludCBpcyBu
ZWVkZWQgYnkKIm1lc29uX25mY19jbWRfYWNjZXNzKCkiCgo+IAo+PiBpdCdzIG5vdCB1c2VmdWwu
IElmIHVzZWQgb3V0c2lkZSwgdGhlbiBpZiB5b3Ugd2FudCB0byBjbGFyaWZ5Cj4+IHRoaW5ncyB5
b3UgbWF5IHdhbnQgdG8gdXNlOgo+Pgo+PiAjZGVmaW5lIE5GQ19DTURfT1BfTEVOKGNtZCkgRklF
TERfUFJFUChHRU5NQVNLKDEzLCAwKSwgKGNtZCkpCj4+Cj4+IFRoaXMgaXMgYnkgZmFyIG15IGZh
dm9yaXRlIGNvbnN0cnVjdGlvbi4gQ291bGQgYXBwbHkgdG8gbWFueSBvdGhlcgo+PiBmaWVsZHMs
IGxpa2UgRE1BX0RJUiwgc2NyYW1ibGVyLCBldGMuCgpATWlxdWVsLCBGSUVMRF9QUkVQKCkgaXMg
YmV0dGVyLCBidXQgaSBoYXZlIG5vIGlkZWEgd2hldGhlciB3ZSBzaG91bGQgCmFkZCBGSUVMRF9Q
UkVQKCkgaW4gdGhpcyBwYXRjaCwgb3Iga2VlcCB0aGUgcHJldmlvdXMgY29kZS4KCj4+Cj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4+IMKgwqDCoMKgwqDC
oCB9Cj4+Pj4+PiBAQCAtNTczLDcgKzU3NSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRf
YnVmKHN0cnVjdCBuYW5kX2NoaXAgCj4+Pj4+PiAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPj4+
Pj4+IMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPj4+Pj4+Cj4+Pj4+PiAtwqDCoMKgIGNtZCA9IE5GQ19DTURfTjJNIHwg
KGxlbiAmIEdFTk1BU0soMTMsIDApKTsKPj4+Pj4+ICvCoMKgwqAgY21kID0gTkZDX0NNRF9OMk0g
fCBsZW47Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5G
Q19SRUdfQ01EKTsKPj4+Pj4+Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgbWVzb25fbmZjX2RyYWluX2Nt
ZChuZmMpOwo+Pj4+Pj4gQEAgLTU5Nyw3ICs1OTksNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY193
cml0ZV9idWYoc3RydWN0IAo+Pj4+Pj4gbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVu
KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pgo+Pj4+Pj4gLcKgwqDCoCBjbWQgPSBORkNfQ01E
X00yTiB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7Cj4+Pj4+PiArwqDCoMKgIGNtZCA9IE5GQ19D
TURfTTJOIHwgbGVuOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIHdyaXRlbChjbWQsIG5mYy0+cmVnX2Jh
c2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqDCoMKgIG1lc29uX25mY19k
cmFpbl9jbWQobmZjKTsKPj4+Pj4+IEBAIC0xMDA3LDYgKzEwMDksMzEgQEAgbWVzb25fbmFuZF9v
cF9wdXRfZG1hX3NhZmVfb3V0cHV0X2J1Zihjb25zdCAKPj4+Pj4+IHN0cnVjdCBuYW5kX29wX2lu
c3RyICppbnN0ciwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUoYnVm
KTsKPj4+Pj4+IMKgwqAgfQo+Pj4+Pj4KPj4+Pj4+ICtzdGF0aWMgaW50IG1lc29uX25mY19jaGVj
a19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlv
biAqb3ApCj4+Pj4+PiArewo+Pj4+Pj4gK8KgwqDCoCBpbnQgb3BfaWQ7Cj4+Pj4+PiArCj4+Pj4+
PiArwqDCoMKgIGZvciAob3BfaWQgPSAwOyBvcF9pZCA8IG9wLT5uaW5zdHJzOyBvcF9pZCsrKSB7
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0
ciAqaW5zdHI7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnN0ciA9
ICZvcC0+aW5zdHJzW29wX2lkXTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN3aXRjaCAoaW5zdHItPnR5cGUpIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2FzZSBOQU5EX09QX0RBVEFfT1VUX0lOU1RSOgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpbnN0ci0+Y3R4LmRhdGEubGVuID4gTkZDX0NNRF9S
QVdfTEVOKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1RTVVBQOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+
ICvCoMKgwqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gMDsKPj4+Pj4+ICt9Cj4+
Pj4+PiArCj4+Pj4+PiDCoMKgIHN0YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5h
bmRfY2hpcCAqbmFuZCwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wLCBib29s
IAo+Pj4+Pj4gY2hlY2tfb25seSkKPj4+Pj4+IMKgwqAgewo+Pj4+Pj4gQEAgLTEwMTUsMTAgKzEw
NDIsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfZXhlY19vcChzdHJ1Y3QgCj4+Pj4+PiBuYW5k
X2NoaXAgKm5hbmQsCj4+Pj4+PiDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5z
dHIgKmluc3RyID0gTlVMTDsKPj4+Pj4+IMKgwqDCoMKgwqDCoCB2b2lkICpidWY7Cj4+Pj4+PiDC
oMKgwqDCoMKgwqAgdTMyIG9wX2lkLCBkZWxheV9pZGxlLCBjbWQ7Cj4+Pj4+PiArwqDCoMKgIGlu
dCBlcnI7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IGk7Cj4+Pj4+Pgo+Pj4+Pj4gLcKgwqDCoCBp
ZiAoY2hlY2tfb25seSkKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
Pj4+Pj4gK8KgwqDCoCBlcnIgPSBtZXNvbl9uZmNfY2hlY2tfb3AobmFuZCwgb3ApOwo+Pj4+Pj4g
K8KgwqDCoCBpZiAoZXJyIHx8IGNoZWNrX29ubHkpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZXJyOwo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKgwqDCoCBtZXNvbl9uZmNfc2Vs
ZWN0X2NoaXAobmFuZCwgb3AtPmNzKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBmb3IgKG9wX2lkID0g
MDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQrKykgewo+Pj4+Pj4gQEAgLTEyOTMsNiArMTMy
Miw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgCj4+Pj4+PiBu
YW5kX2NoaXAgKm5hbmQpCj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IG1lc29uX25mY19uYW5k
X2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+Pj4+Pj4gwqDCoMKgwqDC
oMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4+Pj4+PiDCoMKg
wqDCoMKgwqAgaW50IG5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0Owo+Pj4+Pj4gK8Kg
wqDCoCBpbnQgcmF3X3dyaXRlc2l6ZTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4+
Pj4KPj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoIW10ZC0+bmFtZSkgewo+Pj4+Pj4gQEAgLTEzMDQs
NiArMTMzNCwxMyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IAo+
Pj4+Pj4gbmFuZF9jaGlwICpuYW5kKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgfQo+
Pj4+Pj4KPj4+Pj4+ICvCoMKgwqAgcmF3X3dyaXRlc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsgbXRk
LT5vb2JzaXplOwo+Pj4+Pj4gK8KgwqDCoCBpZiAocmF3X3dyaXRlc2l6ZSA+IE5GQ19DTURfUkFX
X0xFTikgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihuZmMtPmRldiwg
InRvbyBiaWcgd3JpdGUgc2l6ZSBpbiByYXcgbW9kZTogJWQgCj4+Pj4+PiA+ICVsZFxuIiwKPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYXdfd3JpdGVzaXpl
LCBORkNfQ01EX1JBV19MRU4pOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+ICsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBp
ZiAobmFuZC0+YmJ0X29wdGlvbnMgJiBOQU5EX0JCVF9VU0VfRkxBU0gpCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hbmQtPmJidF9vcHRpb25zIHw9IE5BTkRfQkJUX05PX09P
QjsKPj4+Pj4+Cj4+Cj4+Cj4+IFRoYW5rcywKPj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
