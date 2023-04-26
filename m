Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978F0C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pNugj0kHti0MH37uTobDMGjOcqluea50gSZR52DNmw=; b=z1/hlMSRNd4ufJJ+b/OcTyZNPP
	Dk0T2Jrr4C8Vt64Hzc+juQFQPY4hZrSTUS8w+CIWK7JgZDAvjVHRGs2dE269lOSicGnuVZuct1p9w
	7bemUUX5etTrsaR5rRNzgjFjCTzChuKzsGGaV6JlCvHpnth+zdv2+LJRlpnojIGLN7wXTG0PL7mPU
	foyDsG/nybM8cg0BaOxgsLnrbA2z3LAhevp6MR+UMDY0IPyLgkz+FX3yuF0CadlCMZ27+3VAlyA6q
	acdXQgmO4pZyJ0sgv7Z/Y/478Su/vub4Oz7cwtjdoMw2Xz+uF7HK6pJyi033NZh9Oa+FLQJ3HC9l2
	M2AkbEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prfZP-00481Y-2V;
	Wed, 26 Apr 2023 13:52:31 +0000
Received: from mail-psaapc01on20702.outbound.protection.outlook.com ([2a01:111:f400:feae::702] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prfZL-00480x-2l;
	Wed, 26 Apr 2023 13:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipkFZyqdG3+Xn+Fk3Pj/E6430In5yjR3pFEWxXte/C3FO43GGfiGcNs0FuceN2OgbIw7EqK19lx7JMiU1DaljLA9evgMjD1KC5nSlpxq83aNYgZQSPWqlrJPCu0UqWcD8tAjX7SvknvQbHawKtFjDy24C/RgrMOwWTjvKjpv/Gzhxvg6g4tU1K1Pqt3mzTC0aM/w1JFilS5nVy9voZz/ranjG+m5TWoejkBIeJC/TNDmjuNyWvJXHLbuip08nuWvpTa4XDKPAcvU9EAXVANeQEyu3MySl9VRKic0yyKHkkSCS7Ku0Z2sPO82/3BNshdzP6VPhsa7EmP4fW0rDXcn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKRUORcCeOrcq9FVguYifAmOfZTC9j3nK2srGeQHp14=;
 b=M5FSlQp4P5//WcGnIjo2hGYy0no+3va3tm3272AjYrixk2hFgi5AtfFx9EduIXXcx/VFbjkOdZsVjzzv4D/I35xKy0N9ku20MthDTT9csvM2w2Gxf7QgtHqhOprA8lR0AYywIV84TMxJC3CAZhGlHhZDfxVnxN34C6Y+1vRlW2cmasd00va6XVZKQ5xXPjKdWzYaBABe0qITNqtLT4U9o9MsVbWgMFn5xrDiLsVZJE3mnlRvAX2E7NaIA0VmIMifBRDLL4E39C9prhxgKXO5PsoFcm6ZXse7qWqH2IUtcEdZv/3GgoGNAsD81fYQrwMevUDd4HiNbcEztWPy2Pz+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKRUORcCeOrcq9FVguYifAmOfZTC9j3nK2srGeQHp14=;
 b=qLa1G1tb9O40YkTF0Xx7p1uigD+R3QZmA42B6+LjUYRbxROwUQ5hfTP40+W9+rXJdvdIuJfdarmZ9+glpx3VTT0duUbVSha31uIO2nJxZdQiq7Ah7DiUXAqLZesrUQeSF3aOomb9mNU5mqMqF+dBvROQ2/jTM/vxGfdmr7AcL5IjLmMD5hyA47hQgEKqKBYo7US6qVMf5POg4BIC9Ea6ZHjScDKo3BS4M6rYVPdcRAcAsdVOXSnqcfQJkOP0kEpt6p3SmrRohZsr+nFgcIPAnoKFKSmUE3aNlukjMtI04o7ovvYTTrCeflXmfQCWoDCnPxFcrabU4D7EMikNV/ejcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB5040.apcprd03.prod.outlook.com (2603:1096:4:d5::21) by
 TYSPR03MB7581.apcprd03.prod.outlook.com (2603:1096:400:40e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Wed, 26 Apr 2023 13:52:17 +0000
Received: from SG2PR03MB5040.apcprd03.prod.outlook.com
 ([fe80::c90d:11f9:daff:dd4c]) by SG2PR03MB5040.apcprd03.prod.outlook.com
 ([fe80::c90d:11f9:daff:dd4c%7]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 13:52:14 +0000
Message-ID: <a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
Date: Wed, 26 Apr 2023 21:51:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "yonghui.yu" <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
 <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
 <7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
 <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
 <5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
 <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To SG2PR03MB5040.apcprd03.prod.outlook.com
 (2603:1096:4:d5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB5040:EE_|TYSPR03MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 234555fb-878f-4ba7-a80a-08db465d5df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OSMlJdq7GIR0uDD6q3XA2K+vrIsp/CZSoNucncZyZ5IlXVqDhulppvrnJ5RA095CpXL8qtmmuhMYt6P1MH86OC/71DTOCZh4x/IfV91ZVdua3aCaD7sFr4jx1nFTtyTxsoH7GY7nE729eJU5FLEqq0GoensMYLLna6jFiLwXak5cA1+fA1sq92VcMeal5mLe0UT6kZ6Y9UhVX25BA0HuzmTZa12fcfKqCdM5Bhd4yJ9imb2l+XeEa0ocoBLUWcGtJYWK8ze4nL2gzHxtxJ+tDLEdSuVp3RlrszWeAef7Td9xlz2DZMqeWkw1KKCz6GdZgMgZMg1xyqgrxLaOZBCdLb2E01OBwAVqeBzIpxh1/J6dA9XvK/zaflBNpK2u4Zqd04T290YPBvnkUBeWonzEw4A1n2rHhUMwsTCuwKnT7bxU1odPo6pfPgVzinSQlSxJHR+KhzC+sb+pwjFcV8Zq+UTGJ9jY1K8fYMUqLwuqFjtPfB0pj5UjBbMBUEtbgZUkz+NmUGEwsFd8qgmNYNaM4LiekJvL4hAdkrBU0c8mAIekyi2MSQN1j4VAlePwORyxnlcGuzFLxWdOEASh5pOQ7XxdWb45xtQimLdpcw0uIGv9IAT2fZautfDOwRHnc8asfVB4NV040e5WHZdQVRF4BeTlsSWIZjJ2WGP+h9tcnvY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB5040.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39850400004)(366004)(451199021)(2906002)(107886003)(53546011)(6506007)(6486002)(31696002)(86362001)(7416002)(52116002)(44832011)(966005)(2616005)(83380400001)(66574015)(38100700002)(38350700002)(26005)(6512007)(186003)(6666004)(4326008)(66946007)(110136005)(66556008)(66476007)(54906003)(31686004)(8936002)(478600001)(36756003)(5660300002)(8676002)(41300700001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QnBERldnWi9SL0VqSmJwUUd1bUJFMHpwNStLRHZZWFJYUC9SZ29TeUhUNEM4?=
 =?utf-8?B?a1ZPa3c4TXhuWXRaa0JnOGwrMzRXbmxjamtib1FkN3FBRXFnMElCWVBIcjgr?=
 =?utf-8?B?MzBoNWtEbm5LNGFpVkpMdWlXS01ZVXZOMm9ucmxsb0pkUG96ckxQcWlrNXA4?=
 =?utf-8?B?UXo1cGpha3AzR2RqaWsrMjhvNFhPSW1QRG56L045VUxCblVuUkYvK0tMd21X?=
 =?utf-8?B?Zk5HN0xjRzNPRnV4ak5oVEtVdU9MVWhDZVREOEpmVkx1ZlVNME5kd3lreGRO?=
 =?utf-8?B?dzg5MU51TFF1aHVUbEh1SFpMb2F0Rk81VzRRVjRSbnhGQTdQd3J2VjhCT0hR?=
 =?utf-8?B?Lys1SU5KTU8ybDUrclZETy81YVN0eE9MQVdDNnNJOURnV0VqWllXb3JqMEpF?=
 =?utf-8?B?TjVQd2lkTitXV3NpOTIvTys5Rnp2V3h6L3dKOWk5NFhhOHlGUVJSWmJPMVh6?=
 =?utf-8?B?ZVVsbXpHL3c3cml4WEswU3kwZHJYV3k5TjltcHdJVDhuVENEd0g1d2RlUG9U?=
 =?utf-8?B?RUl6cmQvdGdNZ0xKb2dIWDQ4amRnanNCeW8vU05JQmdBZVBPWjJNZHlaRGlX?=
 =?utf-8?B?Rnl5UGhqMDJrcitpVVQyU0U0K3RWQ3VQWWZxLzkvK3lObmt4L3NZMmo1WFRZ?=
 =?utf-8?B?QkR2MExwMGhGdGRHSytUTkxuZHFUcGtjTTNJNXllQ2NlcjR4WnJCcC90bE90?=
 =?utf-8?B?eGF0QXpJdTZ4R3JWMFVHQlZIa1g5M0JjSHRhVWY3RVdBZDlidDJYeTJNYzMx?=
 =?utf-8?B?NStzTVpsMXRSQkdQamhqK0luUW5EM1ZONjVkbFczNE9nQUFFWllXRTQ0Q1JB?=
 =?utf-8?B?K1lLRUZWenNnbzYvL0ZYV21RYWdHclY2M0hBbWtSR1JoWk5kWFhMSDdoN291?=
 =?utf-8?B?YXNxWWIvSXYxTjh2VGtmeW1oalFzTm9qK0hvUHVDOXIxNEZMSDYwalB0MEl1?=
 =?utf-8?B?cDM0OU9aaWR1SHoxU1hmY2trY3labk8vUnFja2xYcHhjMDQ5NzZVV3A3MFhy?=
 =?utf-8?B?eFRUOTBGbklFVy9VemdvMjhzSEVBUENUS1g4ZGhoZHg4RFkza00reW9nbnBl?=
 =?utf-8?B?ME04Vm1hSG0veWxwdmUrWGtKb3htcjVDdWtKcFFNRlhEbkVmNGprRlVNeGRC?=
 =?utf-8?B?eUtiQ1d1TTgxVlhNZXdHMlJad1JrWEVXMEpKSnFpMzFnZ3BZbXRaLzd5bk1I?=
 =?utf-8?B?YlAxS25EVW02V1VidWJOSXJKMU9jQzlFbnNLbjRoSXdzenFuajFyajRoRFl6?=
 =?utf-8?B?blk5OVIybE9YUHhlaExwQTZOdEhURVhGSVV3ajY5QTRiYnN6VnB3aU9ReGIv?=
 =?utf-8?B?bTNWR2pFY1RRaFVaVmp6RG1PeTROYS9LdEx5T1g5aFhENlFIRHE2Vkp4R3Zi?=
 =?utf-8?B?WlVpZFZlZnBrYnlHWlJQSXRkT2NpMDVaaE1MQlVQUFlOeldtUE1rY1UzNSts?=
 =?utf-8?B?cCsrVXV4SEY4a2JxR0NHb1I5bENjSVNSeGlnenZ1ODVUbGVwaG9JOU1uZXBN?=
 =?utf-8?B?cytXNVFSekxiYXh0NytNcXJZQk9TKzlMckk2WFNxSlk5S2pNZXI5N1ljRmw0?=
 =?utf-8?B?a2RqdU8zZ1pyVitNS1N3cndsUlVYUWwrWVkvdWFVTkZKS2lYYUZ6QWJvUHhM?=
 =?utf-8?B?WDFqQU95aUdKeUNFK04zcWVCcWhXWjk5WGNZVXhKSzhXdGJTZC80UGM4Ry92?=
 =?utf-8?B?bDhRdG5rVnpXZC9yTGZCeXhEOGRnVE1HZ2M2a0RITlR2bzVtS2IwT3JjaGRY?=
 =?utf-8?B?NjdiRHVaZVoyVHRvUi9jVVIwWWFHOW9TNGYrSFR1UDZoLzRMVE9DbmQwdWYx?=
 =?utf-8?B?akNxMHUvVFpmcEJWQnBEVExsd050QjR2T2orN0RhUXI4cE1QY083UjdDb0JD?=
 =?utf-8?B?czIzMHJsZklMRjFkZW9DNjRMVXlvdHVrRE1Ec0t0amRvQzdnaUpMMnVMQW9a?=
 =?utf-8?B?bkYyRXFaNmg3SnJMRmpQeXB6SlU0TGV6OThMeW5ORUdteUI4QmVsZC9QcDVx?=
 =?utf-8?B?aTk2WUMwL3NXQUcvb3pPWXpvSkxvMzBKQ1VIKzh6RXBvZ3NrdW92WjRmU0hK?=
 =?utf-8?B?enBQS1RqVUpucktjL3Ftbm5XTDh0V3AvM0pqYnFyY0twZURodnNudTZiWnNq?=
 =?utf-8?Q?E+3+Mfv1O1KJ8ufPxk8Tw6Xia?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234555fb-878f-4ba7-a80a-08db465d5df8
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB5040.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 13:52:14.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6oxGNGkpnrjygbsUul8kwOpUD7SMMxDI3twOwUIMBJ+4kMPS0I8JVKvMCyfsjzsfKwjiNkEX5c9U4lz+6gdog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_065228_049085_7F30D20C 
X-CRM114-Status: GOOD (  24.12  )
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

SGkgQXJzZW5peSwKCk9uIDIwMjMvNC8yMCAxNzozNywgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIDE5LjA0LjIwMjMgMDk6NDEsIEFyc2VuaXkgS3Jh
c25vdiB3cm90ZToKPj4KPj4KPj4gT24gMTkuMDQuMjAyMyAwNjowNSwgTGlhbmcgWWFuZyB3cm90
ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gT24gMjAyMy80LzE4IDIyOjU3LCBBcnNlbml5IEty
YXNub3Ygd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4g
T24gMTguMDQuMjAyMyAxNjoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGkgQXJzZW5p
eSwKPj4+Pj4KPj4+Pj4+Pj4gSGVsbG8gYWdhaW4gQExpYW5nIEBNaXF1ZWwhCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IE9uZSBtb3JlIHF1ZXN0aW9uIGFib3V0IE9PQiBhY2Nlc3MsIGFzIEkgY2FuIHNlZSBj
dXJyZW50IGRyaXZlciB1c2VzIHRoZSBmb2xsb3dpbmcKPj4+Pj4+Pj4gY2FsbGJhY2tzOgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiAgICAgICBuYW5kLT5lY2Mud3JpdGVfb29iX3JhdyA9IG5hbmRfd3JpdGVf
b29iX3N0ZDsKPj4+Pj4+Pj4gICAgICAgbmFuZC0+ZWNjLndyaXRlX29vYiA9IG5hbmRfd3JpdGVf
b29iX3N0ZDsKPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gRnVuY3Rpb24gJ25hbmRfd3JpdGVf
b29iX3N0ZCgpJyB3cml0ZXMgZGF0YSB0byB0aGUgZW5kIG9mIHRoZSBwYWdlLiBCdXQgYXMgSQo+
Pj4+Pj4+PiBjYW4gc2VlIGJ5IGR1bXBpbmcgJ2RhdGFfYnVmJyBkdXJpbmcgcmVhZCwgcGh5c2lj
YWwgbGF5b3V0IG9mIGVhY2ggcGFnZSBpcyB0aGUKPj4+Pj4+Pj4gZm9sbG93aW5nICgxS0IgRUND
KToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gMHgwMDA6IFvCoMKgwqDCoMKgwqDCoMKgIDEgS0Igb2YgZGF0
YSAgICAgICAgXQo+Pj4+Pj4+PiAweDQwMDogWyAyQiB1c2VyIGRhdGFdIFsgMTRCIEVDQyBjb2Rl
XQo+Pj4+Pj4+PiAweDQxMDogW8KgwqDCoMKgwqDCoMKgwqAgMSBLQiBvZiBkYXRhICAgICAgICBd
wqDCoMKgIChBKQo+Pj4+Pj4+PiAweDgxMDogWyAyQiB1c2VyIGRhdGFdIFsgMTRCIEVDQyBjb2Rl
XQo+Pj4+Pj4+PiAweDgyMDogW8KgwqDCoMKgwqDCoMKgIDMyQiB1bnVzZWQgICAgICAgICAgIF0K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU28sIGFmdGVyICduYW5kX3dyaXRl
X29vYl9zdGQoKScgKGxldCBkYXRhIGJlIHNlcXVlbmNlIGZyb20gWzB4MCAuLi4gMHgzZl0pLAo+
Pj4+Pj4+PiBwYWdlIHdpbGwgbG9vayBsaWtlIHRoaXM6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDB4MDAw
OiBbwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4RkYgICAgICAgICAgICBdCj4+Pj4+Pj4+IDB4
NDAwOiBbwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLi4uLi4gICAgICAgICAgXQo+Pj4+Pj4+PiAw
eDdmMDogW8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweEZGICAgICAgICAgICAgXQo+Pj4+Pj4+
PiAweDgwMDogWyAwMCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiAgXQo+Pj4+Pj4+PiAweDgzMDog
WyAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gM2YgXQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBIZXJlIHdl
IGhhdmUgdHdvIHByb2JsZW1zOgo+Pj4+Pj4+PiAxKSBBdHRlbXB0IHRvIGRpc3BsYXkgcmF3IGRh
dGEgYnkgJ25hbmRkdW1wJyB1dGlsaXR5IHByb2R1Y2VzIGEgbGl0dGxlIGJpdAo+Pj4+Pj4+PiAg
ICAgICBpbnZhbGlkIG91dHB1dCwgYXMgZHJpdmVyIHJlbGllcyBvbiBsYXlvdXQgKEEpIGZyb20g
YWJvdmUuIEUuZy4gT09CIGRhdGEKPj4+Pj4+Pj4gICAgICAgaXMgYXQgMHg0MDAgYW5kIDB4ODEw
LiBIZXJlIGlzIGFuIGV4YW1wbGUgKGF0dGVtcHQgdG8gd3JpdGUgMHgxMSAweDIyIDB4MzMgMHg0
NCk6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDB4MDAwMDA3ZjA6IDExIDIyIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8LiIuLi4uLi4uLi4uLi4uLnwKPj4+Pj4+Pj4gICAg
ICBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+Pj4+Pj4+PiAgICAgIE9PQiBEYXRhOiAzMyA0NCBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfDNELi4uLi4uLi4uLi4uLi58
Cj4+Pj4+Pj4+ICAgICAgT09CIERhdGE6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+Pj4+Pj4gICAgICBPT0IgRGF0
YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4u
Li4uLi4uLi4uLi4ufAo+Pj4+Pj4+Pgo+Pj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Pj4KPj4+Pj4+
PiBJIHJlYWxpemVkIHRoZSB3cml0ZV9vb2JfcmF3KCkgYW5kIHdyaXRlX29vYigpIGFyZSB3cm9u
ZyBpbiBtZXNvbl9uYW5kLmMuIEkgc3VnZ2VzdCBib3RoIG9mIHRoZW0gc2hvdWxkIGJlIHJld29y
a2VkIGFuZCBmb2xsb3cgdGhlIGZvcm1hdCBvZiBtZXNvbiBuYW5kIGNvbnRyb2xsZXIuIGkuZS4g
Zmlyc3RseSBmb3JtYXQgdGhlIGRhdGEgaW4gTGF5b3V0IChBKSBhbmQgdGhlbiB3cml0ZS4gcmVh
ZGluZyBpcyBmaXJzdGx5IHJlYWRpbmcgdGhlIGRhdGEgb2YgbGF5b3V0IChBKSBhbmQgdGhlbiBj
b21wb3N0IHRoZSBsYXlvdXQgKEIpLgo+Pj4+Pj4KPj4+Pj4+IElJVUMgYWZ0ZXIgc3VjaCB3cml0
aW5nIG9ubHkgT09CIChlLmcuIHVzZXIgYnl0ZXMpIGFjY29yZGluZyBsYXlvdXQgKEEpLCBodyB3
aWxsIGFsc28gd3JpdGUgRUNDIGNvZGVzLCBzbwo+Pj4+Pj4gaXQgd2lsbCBiZSBpbXBvc3NpYmxl
IHRvIHdyaXRlIGRhdGEgdG8gdGhpcyBwYWdlIGxhdGVyLCBiZWNhdXNlIHdlIGNhbm5vdCB1cGRh
dGUgRUNDIGNvZGVzIHByb3Blcmx5IGZvciB0aGUgbmV3bHkKPj4+Pj4+IHdyaXR0ZW4gZGF0YSAo
d2UgY2FuJ3QgdXBkYXRlIGJpdHMgZnJvbSAwIHRvIDEpLgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDIpIEF0dGVtcHQgdG8gcmVhZCBkYXRhIGluIEVDQyBtb2RlIHdp
bGwgZmFpbCwgYmVjYXVzZSBJSVVDIHBhZ2UgaXMgaW4gZGlydHkKPj4+Pj4+Pj4gICAgICAgc3Rh
dGUgKEkgbWVhbiB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlKSBhbmQgTkFORCBjb250cm9sbGVy
IHRyaWVzIHRvIHVzZQo+Pj4+Pj4+PiAgICAgICBFQ0MgY29kZXMgYXQgMHg0MDAgYW5kIDB4ODEw
LCB3aGljaCBhcmUgb2J2aW91c2x5IGJyb2tlbiBpbiB0aGlzIGNhc2UuIFRodXMKPj4+Pj4+Pgo+
Pj4+Pj4+IEFzIGkgc2FpZCBhYm92ZSwgd3JpdGVfb29iX3JhdygpIGFuZCB3cml0ZV9vb2IoKSBz
aG91bGQgYmUgcmV3b3JrZWQuCj4+Pj4+Pj4gaSBkb24ndCBrbm93IHdoYXQgZG8geW91IG1lYW4g
cGFnZSB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlLiBhbnl3YXkgdGhlIHBhZ2Ugc2hvdWxkIGJl
IHdyaXR0ZW4gb25jZSwgZXZlbiBqdXN0IHdyaXRlX29vYl9yYXcoKS4KPj4+Pj4+Cj4+Pj4+PiBT
b3JyeSwgWW91IG1lYW4gdGhhdCBhZnRlciBPT0Igd3JpdGUsIHdlIGNhbm5vdCB3cml0ZSB0byB0
aGUgZGF0YSBhcmVhIChlLmcuIDB4MCAuLiAweDgxMCkgdW50aWwgcGFnZSB3aWxsIGJlIGVyYXNl
ZD8gRm9yIGV4YW1wbGUKPj4+Pj4+IEpGRlMyIHdyaXRlcyB0byBPT0Igb3duIG1hcmtlcnMsIHRo
ZW4gaXQgdHJpZXMgdG8gd3JpdGUgdG8gdGhlIGRhdGEgYXJlYSBvZiBzdWNoIHBhZ2UuCj4+Pj4K
Pj4+PiBATGlhbmcsIEknbGwgZGVzY3JpYmUgY3VycmVudCB0ZXN0IGNhc2UgaW4gZGV0YWlsczoK
Pj4+PiAxKSBJIGhhdmUgZXJhc2VkIHBhZ2UsIEkgY2FuIHJlYWQgaXQgaW4gIGJvdGggcmF3IGFu
ZCBlY2MgbW9kZXMgLSBubyBwcm9ibGVtIChpdCBpcyBmdWxsIG9mIDB4RkYpLgo+Pj4+IDIpIEkg
KEpGRlMyIGZvciBleGFtcGxlKSB3YW50IHRvIHdyaXRlIG9ubHkgT09CIC0gbGV0IGl0IGJlIGNs
ZWFuIG1hcmtlcnMuCj4+Pj4gMykgSSB1c2UgcmF3IHdyaXRlIHRvIHRoZSBuZWVkZWQgcGFnZSAo
cGxlYXNlIGNvcnJlY3QgbWUgaWYgaSdtIHdyb25nKS4gRm91ciBieXRlcwo+Pj4+ICAgICAgYXQg
MHg0MDAgYW5kIDB4ODEwIGFyZSB1cGRhdGVkLiBBbGwgb3RoZXIgYnl0ZXMgc3RpbGwgMHhmZi4K
Pj4+PiA0KSBOb3csIHdoZW4gaSdtIHRyeWluZyB0byByZWFkIHRoaXMgcGFnZSBpbiBFQ0MgbW9k
ZSwgSSBnZXQgRUNDIGVycm9yczogSUlVQyB0aGlzCj4+Pj4gICAgICBoYXBwZW5zIGJlY2F1c2Ug
ZnJvbSBjb250cm9sbGVyIHBvaW50IG9mIHZpZXcgRUNDIGNvZGVzIGFyZSBpbnZhbGlkIGZvciBj
dXJyZW50Cj4+Pj4gICAgICBkYXRhIChhbGwgRUNDcyBhcmUgMHhmZikuIElzIHRoaXMgYmVoYXZp
b3VyIGlzIG9rPwo+Pj4KPj4+IFllcywgaXQgaXMgZXhhY3RseSByZXBvcnRlZCBFQ0MgZXJyb3Jz
Lgo+Pgo+PiBJIHNlZSwgc28gaWYgd2Ugd3JpdGUgT09CIChlLmcuIHVzaW5nIHJhdyBtb2RlKSwg
dGhlcmUgaXMgbm8gd2F5IHRvIHJlYWQgdGhpcyBwYWdlIGluIEVDQyBtb2RlIGxhdGVyPyBBbmQg
dGhlCgpPZiBjb3Vyc2UsIHRoZXJlIGlzIG5vIEVDQyBwYXJpdHkgYnl0ZXMgaW4gaXQ7IG9yIHJh
dyB3cml0ZSB0aGUgZGF0YSAKd2l0aCB0aGUgRUNDIHBhcml0eSBieXRlcyBwZXIgdGhlIGxheW91
dCAoQSkgeW91IGRlc2NyaWJlIGFib3ZlLgoKPj4gb25seSB3YXkgdG8gbWFrZSBpdCByZWFkYWJs
ZSBpcyB0byB3cml0ZSBpdCBpbiBFQ0MgbW9kZSwgYnV0IGJlZm9yZSB0aGlzIHdyaXRlLCB3ZSBu
ZWVkIHRvIHJlYWQgaXQncwo+PiB1c2VyJ3MgYnl0ZSAoZnJvbSBwcmV2aW91cyBPT0Igd3JpdGUp
IGluIHJhdyBtb2RlLCBwdXQgaXQgdG8gaW5mbyBidWYgKGFzIHVzZXIncyBieXRlcykgYW5kIHdy
aXRlIHRoaXMgcGFnZS4gSW4gdGhpcwo+PiBjYXNlIE5BTkQgY29udHJvbGxlciB3aWxsIGdlbmVy
YXRlIEVDQyBjb2RlcyBpbmNsdWRpbmcgdXNlcidzIGJ5dGUgYW5kIHBhZ2UgYmVjb21lIHJlYWRh
YmxlIGluIEVDQyBtb2RlCj4+IGFnYWluLgoKeWVzLCB5b3UgYXJlIHJpZ2h0LgoKPj4KPj4+Cj4+
Pj4gNSkgT2ssIGRvbid0IGNhcmUgb24gdGhlc2UgRUNDIGVycm9ycywgbGV0J3MgZ28gZnVydGhl
ci4KPj4+PiA2KSBJJ20gZ29pbmcgdG8gd3JpdGUgc2FtZSBwYWdlIGluIEVDQyBtb2RlIC0gaG93
IHRvIGRvIGl0IGNvcnJlY3RseT8gVGhlcmUgaXMgYWxyZWFkeQo+Pj4+ICAgICAgNCBPT0IgYnl0
ZXMsIGNvbnNpZGVyZWQgdG8gYmUgY292ZXJlZCBieSBFQ0MgKGJ1dCBpbiBmYWN0IG5vdyAtIEVD
QyBhcmVhIGlzIEZGZWQpLgo+Pj4KPj4+IElmIHN0ZXAgNCBoYXMgZXhjdXRlZCAicHJvZ3JhbSIg
Y29tbWFuZCBhdCB0aGUgcGFnZSAobmFuZF93cml0ZV9vb2Jfc3RkKCkgZG9lcyksIGl0IGNhbid0
IGJlIHdyaXR0ZW4gYWdhaW4gYmVmb3JlIGVyYXNpbmcgdGhlIHBhZ2UoYmxvY2spLiBzbyB3ZSBo
YXZlIHRvIHJlYWQgdGhlIHdob2xlIHBhZ2UgaW4gdGhlIGRkciBhbmQgY2hhbmdlIHRoZSBjb250
ZW50LCBlcmFzZSBibG9jaywgd3JpdGUgaXQgYWdhaW4uCj4+Pgo+Pj4gSSBkb24ndCB0aGluayBK
ZmZzMiBoYXMgdGhlIHNhbWUgc3RlcHMgKDEtNikgYXMgeW91IHNhaWQgYWJvdmUuIGFyZSB5b3Ug
c3VyZSB0aGF0IGhhcHBlcyBvbiBKZmZzMiBvciBqdXN0IGFuIGV4YW1wbGU/Cj4gCj4gCj4+Cj4+
IEkganVzdCBjaGVja2VkIEpGRlMyIG1vdW50L3Vtb3VudCBhZ2FpbiwgaGVyZSBpcyB3aGF0IGkg
c2VlOgo+PiAwKSBGaXJzdCBhdHRlbXB0IHRvIG1vdW50IEpGRlMyLgo+PiAxKSBJdCB3cml0ZXMg
T09CIHRvIHBhZ2UgTiAoaSdtIHVzaW5nIHJhdyB3cml0ZSkuIEl0IGlzIGNsZWFubWFya2VyIHZh
bHVlIDB4ODUgMHgxOSAweDAzIDB4MjAuIE1vdW50IGlzIGRvbmUuCj4+IDIpIFVtb3VudCBKRkZT
Mi4gRG9uZS4KPj4gMykgU2Vjb25kIGF0dGVtcHQgdG8gbW91bnQgSkZGUzIuCj4+IDQpIEl0IHJl
YWRzIE9PQiBmcm9tIHBhZ2UgTiAoaSdtIHVzaW5nIHJhdyByZWFkKS4gVmFsdWUgaXMgMHg4NSAw
eDE5IDB4MDMgMHgyMC4gRG9uZS4KPj4gNSkgSXQgcmVhZHMgcGFnZSBOIGluIEVDQyBtb2RlLCBh
bmQgaSBnZXQ6Cj4+ICAgICAgamZmczI6IG10ZC0+cmVhZCgweDEwMCBieXRlcyBmcm9tIE4pIHJl
dHVybmVkIEVDQyBlcnJvcgo+PiA2KSBNb3VudCBmYWlsZWQuCj4+Cj4+IFdlIGFscmVhZHkgaGFk
IHByb2JsZW0gd2hpY2ggbG9va3MgbGlrZSB0aGlzIG9uIGFub3RoZXIgZGV2aWNlLiBTb2x1dGlv
biB3YXMgdG8gdXNlIE9PQiBhcmVhIHdoaWNoIGlzCj4+IG5vdCBjb3ZlcmVkIGJ5IEVDQyBmb3Ig
SkZGUzIgY2xlYW5tYXJrZXJzLgoKb2ssIHNvIHRoZXJlIGlzIG5vdCBFQ0MgcGFyaXR5IGJ5dGVz
IGFuZCBtdGQtPnJlYWQoKSByZXR1cm5zIEVDQyBlcnJvci4KZG9lcyBpdCBoYXZlIHRvIHVzZSBy
YXcgd3JpdGUvcmVhZCBvbiBzdGVwIDEpIGFuZCA0KT8KCj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+
Pgo+IAo+IEBMaWFuZywKPiAKPiBTbWFsbCBhZGRpdGlvbiwgaWYgaSdtIHRyeWluZyB0byBpbXBs
ZW1lbnQgT09CIHJlYWQvd3JpdGUgaW4gRUNDIG1vZGUsIHRoZW4gc3RlcCA1KSB3aWxsIHN1Y2Nl
c3MsCj4gYnV0IGxhdGVyLCBKRkZTMiB0cmllcyB0byB3cml0ZSB0aGlzIHBhZ2UgKGluIEVDQyBt
b2RlIG9mIGNvdXJzZSksIGFuZCBpbiB0aGlzIGNhc2UgRUNDIGNvZGVzIHdpbGwKPiBiZSBicm9r
ZW4sIGJlY2F1c2Ugd2UgY2FuJ3QgdXBkYXRlIHRoZW0gcHJvcGVybHkgd2l0aG91dCBlcmFzaW5n
IHdob2xlIHBhZ2UuCj4gCj4gUGxlYXNlIHRha2UgYSBsb29rIGF0IHRoaXMgcGF0Y2ggZnJvbSBt
eSBjb2xsZWFndWVzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMyOTExNDI0
MC4zNzg3MjItMS1tbWt1cmJhbm92QHNiZXJkZXZpY2VzLnJ1Cj4gSXQgaXMgcmVsYXRlZCB3aXRo
ICJXZSBhbHJlYWR5IGhhZCBwcm9ibGVtIHdoaWNoIGxvb2tzIGxpa2UgdGhpcyBvbiBhbm90aGVy
IGRldmljZSIgZnJvbSBhYm92ZToKPiBpbiAnZjUwbDFnNDFsYl9vb2JsYXlvdXRfZnJlZSgpJyB3
ZSByZXNlcnZlIDIgYnl0ZXMgaW4gbm9uLUVDQyBhcmVhIGZvciBiYWQgYmxvY2sgbWFya2Vycy4K
Ckl0IGlzIGFib3V0IHRoZSBTUEkgTkFORCBhbmQgdXNlIGFub3RoZXIgY29udHJvbGxlciBjYWxs
ZWQgc3BpZmMuCmJ1dCBpbiBtZXNvbiBuZmMsIGl0IGlzIGhlYXZpbHkgZGVwZW5kZWQgb24gdGhl
IHByZS1jcmVhdGVkIEJCVCBpbiBOQU5EIApkZXZpY2UuCgoKPiAKPiBUaGFua3MsIEFyc2VuaXkK
PiAKPiAKPj4+Cj4+Pj4KPj4+PiBUaGF0J3Mgd2h5IEkgYXNrZWQgWW91ciBvcGluaW9uIGFib3V0
IG1vdmluZyBPT0IgZGF0YSB0byBub25wcm90ZWN0ZWQgYnkgRUNDIGFyZWEgKGFuZAo+Pj4+IGxl
YXZlIHVzZXIncyBieXRlcyB1bnRvdWNoZWQpLiBJbiB0aGlzIGNhc2UgT09CIGFjY2VzcyBpcyBm
cmVlIGFuZCBub3QgbGlua2VkIHdpdGggRUNDCj4+Pj4gY29kZXMgd2hpY2ggYWxzbyBjb3ZlcnMg
ZGF0YS4KPj4+Pgo+Pj4+IFRoYW5rcywgQXJzZW5peQo+Pj4+Cj4+Pj4+Cj4+Pj4+IEEgcGFnZSBp
cyB3cml0dGVuIGFmdGVyIHR3byBzdGVwczoKPj4+Pj4gLSBsb2FkaW5nIHRoZSBkYXRhIGludG8g
dGhlIE5BTkQgY2hpcCBjYWNoZSAodGhhdCdzIHdoZW4geW91IHVzZSB0aGUKPj4+Pj4gICAgIGJ1
cykKPj4+Pj4gLSBwcm9ncmFtbWluZyB0aGUgTkFORCBhcnJheSB3aXRoIHRoZSBkYXRhIGxvYWRl
ZCBpbiBjYWNoZSAodGhhdCdzIHdoZW4KPj4+Pj4gICAgIHlvdSB3YWl0KQo+Pj4+Pgo+Pj4+PiBJ
biB0aGVvcnkgaXQgZG9lcyBub3QgbWF0dGVyIHdoZXJlIHlvdSB3cml0ZSBpbiB0aGUgY2FjaGUs
IGl0J3MgcmVndWxhcgo+Pj4+PiBEUkFNLCB5b3UgY2FuIG1ha2UgcmFuZG9tIHdyaXRlcyB0aGVy
ZSB3aXRoIHRoZSBhcHByb3ByaWF0ZSBOQU5ECj4+Pj4+IGNvbW1hbmRzLiBPZiBjb3Vyc2Ugd2hl
biB1c2luZyBlbWJlZGRlZCBoYXJkd2FyZSBFQ0MgZW5naW5lcywgdGhlCj4+Pj4+IGNvbnRyb2xs
ZXJzIHVzdWFsbHkgZXhwZWN0IHRvIGJlIGZlZCBpbiBhIGNlcnRhaW4gd2F5IGluIG9yZGVyIHRv
Cj4+Pj4+IHByb2R1Y2UgdGhlIEVDQyBieXRlcyBhbmQgcHV0IHRoZW0gYXQgdGhlIHJpZ2h0IGxv
Y2F0aW9uIGluIGNhY2hlLgo+Pj4+Pgo+Pj4+PiBBbmQgdGhlbiwgd2hlbiB5b3UgYWN0dWFsbHkg
c2VuZCB0aGUgInByb2dyYW0iIGNvbW1hbmQsIHRoZSBOQU5EIGNlbGxzCj4+Pj4+IGFjdHVhbGx5
IGdldCBwcm9ncmFtbWVkIGJhc2VkIG9uIHdoYXQgaGFzIGJlZW4gbG9hZGVkIGluIGNhY2hlLgo+
Pj4+Cj4+Pj4gVGhhbmtzIGZvciB0aGlzIGRldGFpbHMhIFZlcnkgaW50ZXJlc3RpbmchCj4+Pj4K
Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwKPj4+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
