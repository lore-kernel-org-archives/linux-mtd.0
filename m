Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D85C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGOT32mmuyMXRn+a6BCGJyzj8io3yROgDVt67gRRRYk=; b=cO33FgkpYn/IjV
	11lls0Ag4FlC5UNujZ59Bwfp50jpbU3T9hMRIrWHEkUFVUretGSsd4QYDObodY0qv+r3YqVYqqhax
	qFDN8cF7mdR+H2ckdQ6xYEE4LoP9qzx9zBYxQ+Y/X/U3Xz9smuWM/z7L/AhGJBuLo9lLKgBmg6SWn
	cdXm6g8Cmj/gfkmFlgzGF9U825MmxTu8Cr3S8NShWlPclSMpUphCO+yJP8KXgODMmQEGACmYuNR2s
	xWSh/NUbxZrNNR5YSb2C3G3aw2CMuzowoSX/q0iZXgp8iQdYNlRWcna9hpvfUsLBT4rV9+2f0+1KY
	32aQlBMM0PhCymxFQm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklqm-0000000DVQ8-19LT;
	Wed, 19 Feb 2025 15:19:00 +0000
Received: from mail-dm6nam11on2053.outbound.protection.outlook.com ([40.107.223.53] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklqj-0000000DVNc-3NMR
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 15:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGbNbRGXxzIA8/PkjWclIEM2f3ceK9nlEI6XJavETMPemKlJJoHQzuxVLqGbHSgFAeVDr1IAyRInhILEMHs0bE6BJtxs7YWjBtQOzUVwdFHcf76ic8ZcnncJNJYIkN56ek/ZyRGsfLYRm+8kPiK3nD5XhKNaw1HbIjXEUnS5CGl4JiNIkxDNwjKyPJClRiWqz7Rb/Z93ektmyDXKICXAMtFt44TsmGX8w4242hGI4FEwgZUlIvZhTkcE9cFFS709swb73MQUGto2ewCDPrCt3IqOAIy6hN1e7cinhclBYPggM8MuSn5Fz2KXAoIUixSm0lWxzAECTIp0UHApVawWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZmUzaeZjB6gy+TqBUcAL6ciVyed7MAGaRHz1ZyEzPI=;
 b=fY/vee0xXa9cyqqCf3etPopeR86HmvRjZzGDkjmrdM+vsONxiwPDAASReQCoc4xdmxvUW1VSmQnQF73w8Yyg9KVdHQZ8fyPlpLgsHtKlBzsmHsCNSHzlp7LDFbKSBOcLU4kOsBS7bvCcYCzPNj5YJmymxJqzBOoTOfDapyVfWtamYCPryym1Jb5WlVmxuD8J+69AqlYWeTrutd9uyDF79HlbJosW+8cd0mWsmqelpFDnNQxj6uarhynj4NpjllJ0/S0Uc+51qa2KP9hGCVotuPeWiXlFrm2f6o6rNFqDdOAo/L11GClwsbS1egV4CEN65Miy6j+VEha5x15ADf9OTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZmUzaeZjB6gy+TqBUcAL6ciVyed7MAGaRHz1ZyEzPI=;
 b=bvvl+RIxFbQT4gjOmTRJLIj6no1ZyhOH3grWn3U1xOXx+8FmmgidpEd7EKeHXlUsU9wCrfVreImUtJXG2LIbZXDHB24LpXL44LS/p3Vlb4bbGOWtFbtRTlcsG6kg37EbjsTWsR7HTsjCMdug01n0YUOrBVDuzRJokRbV+38j9sTS55l3qEirOsIVBL0l+YHoYX77PbEVzbEkKxqyHsNUZ52l203iAlqVBbv7Pb7w5Malni0pBth5lSDnlipU8U+4d6spS4GH7F+AkPvax+BOgcCTNyHeNLQUPMTZsIcuyvmQGenekCDr6OOPofoKGlfzYVyriMy2rVuhq1QKQejgKA==
Received: from BYAPR10MB2616.namprd10.prod.outlook.com (2603:10b6:a02:af::10)
 by PH0PR10MB4774.namprd10.prod.outlook.com (2603:10b6:510:3b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 15:18:52 +0000
Received: from BYAPR10MB2616.namprd10.prod.outlook.com
 ([fe80::263c:bb57:12dd:b77a]) by BYAPR10MB2616.namprd10.prod.outlook.com
 ([fe80::263c:bb57:12dd:b77a%4]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 15:18:51 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "chengzhihao1@huawei.com" <chengzhihao1@huawei.com>, "pchelkin@ispras.ru"
	<pchelkin@ispras.ru>, "richard@nod.at" <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "yang.tao172@zte.com.cn"
	<yang.tao172@zte.com.cn>, "lu.zhongjun@zte.com.cn" <lu.zhongjun@zte.com.cn>,
	"wang.yong12@zte.com.cn" <wang.yong12@zte.com.cn>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] jffs2: initialize filesystem-private inode info in
 ->alloc_inode callback
Thread-Topic: [PATCH 1/2] jffs2: initialize filesystem-private inode info in
 ->alloc_inode callback
Thread-Index: AQHbOSDW2WKmxrrjS0S2QDHBQjrZnLNPUOYA
Date: Wed, 19 Feb 2025 15:18:51 +0000
Message-ID: <ab62d0cf3782e8342b29639af420691083274228.camel@infinera.com>
References: <20241117184412.366672-1-pchelkin@ispras.ru>
	 <20241117184412.366672-2-pchelkin@ispras.ru>
In-Reply-To: <20241117184412.366672-2-pchelkin@ispras.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.55.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB2616:EE_|PH0PR10MB4774:EE_
x-ms-office365-filtering-correlation-id: 076bce18-198e-4309-9ee3-08dd50f8b7a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bUhYVWI2bDVVOWhTY3lqKzUrdndrRG5qUjRZUDlEUzhCM0VrRHEwL1liY284?=
 =?utf-8?B?eFQxS3ZpdXhiNnhZdU5USWhoQm0zZTl4WHI3TktFYTQydFBrZHFlODBxZlRP?=
 =?utf-8?B?dmE2OGdNTjZtc3EyL25TenR5NnhON0E1Z0ZPRGRtVjdBNkxkdnZDWXkwSHZ3?=
 =?utf-8?B?NTYxcGo3TjZuSVM0K08va25PR3VrY0haallEd0Y1aEsrSkxleTh0SVJYZUxt?=
 =?utf-8?B?WitIWmloY1g3TmZMYTRnd2tOLzJvZG9XdVBxeXY1Mk4xdjBRR1luTVBJeUN2?=
 =?utf-8?B?aGZyTEIvcGpiOW80QWx2NFhOcWUzcTIxV1FHblNPeGdOT3Z0akFvbFNoMkdv?=
 =?utf-8?B?dHE4YnNSWEQ4S1pYWDYzY1BZcDF0blhpOGJ6OHlyU1Z4ZVJlUXFaakpZQVFX?=
 =?utf-8?B?c1NKdC91Um5YbVlWVWM2Q1BiejFLYWxoaHlMTTQzNVFiQnc0bTIrZk43aHF6?=
 =?utf-8?B?MHV1WUhLUGJxejhLYnplcHk4UHo2RnZmaHZqN3hBN3IvZ1l5V05vSkxEYmxi?=
 =?utf-8?B?aFpXSEw4YUxjQUxkU0F0NG1obnBzVUFMZ05abzJFZzBPM3VTR1pEVWpsWkdm?=
 =?utf-8?B?WEh1czMrdXlwV0cyUUZXOElxRDRaNU5EZDFBVWNiZlM1d3ZYRDVIeGdyNjAv?=
 =?utf-8?B?NktUaGFrcjZoOTBKWVpYZDFKRStuRFMvRHBESm5EVlJxNkxMSHhqT0VnVHE1?=
 =?utf-8?B?Q3hyNk5zL1dKV3NacUF4d0lYb3VyL1p4c2ZHTTIraHNIenVlbjhNZStKVjZw?=
 =?utf-8?B?OGZySnhKUEJscnZhdGdRaW1JS1B3RThXRUZrRzd1WXpWYUxpUnp3dm1maC93?=
 =?utf-8?B?ZWtkSi9YeGp1V2ZDRU43WUxHUEdrbWNCdzBpNnV4RERmZzJZM2lneUsxYnp5?=
 =?utf-8?B?THE2TVBxTloyd3JSVTNpL2hpVjcxaC9VVFJCT2VXNkQ5aHlHMnFtVTIyZFJT?=
 =?utf-8?B?MndQMWZjK2ZyQkFZYmF3T21jaWc0d1U3eTBLTG9TVUNsQVBsa2dQUmFZMEsv?=
 =?utf-8?B?ZHNHUmJwakNLdXNGc0ZlMzFJK2hFR0tRTE5nVGE0QkN1ZWNxOHJCTUhUZXBj?=
 =?utf-8?B?azNDVmpFYTk2VnBIcC96OXVJRkdvdytDMW9HM2k0WVFGcnU3ZEtQVDhnYnNx?=
 =?utf-8?B?OXFpVkQ5SFNkY1dZdVFnTEdqZmNZaHJqL3dDcVg1T1FGMmduUHhaQytoWU53?=
 =?utf-8?B?T1VuWEVGZXJCSUVka1ovTGdGWkgwVjBWQ3dpdXpLem1EbG5TZGRpMjJST1Ay?=
 =?utf-8?B?QzQ4cXRUajI3VXd0QlFObUdpK0VqT0YxWm02ci90Y1dzKzhveVhLTDFEbGl4?=
 =?utf-8?B?TU01NjV0RDFCMDIvRlFTVzVQV3I1NmZhWWJ3MGlQT1kvZ2FNSWNxNGhOZGp4?=
 =?utf-8?B?Q05hMkhyOCtVUFl5cG0za2k4ZmRFcnptZktVUlhJZUE5aWp6eTRnSXNybzNQ?=
 =?utf-8?B?UWpRK0RlRENwVUNYaU9WWDB2K3lrbFh1K1RxaXNBQVNpb3J6aDIzeTVNT2Nm?=
 =?utf-8?B?Z25kNDAxMmo3WmpMc1hzeG1KSmdKMExCWnJqWW9DQndva1Mva0lsNjRKVEJk?=
 =?utf-8?B?S2k2cndqNVc5SlFRWmg1VGhYUnhERkNWTGhUMmNiekJrMnFOK3J6ZTYwWk1k?=
 =?utf-8?B?czJsdGd4alYwRFE5TEV0c1JGMThzbUFXTzNiSXplbzM2S1JkM3ZyQ0d1MDdt?=
 =?utf-8?B?M08yZjA3SlplUU9sZXlFcEU3eXNVaXRaNkliLzc3UUZPUSt1bjlGTE8wY3lk?=
 =?utf-8?B?UUVRSFFId0dTcDU0RE9qVUFRUXAvV25pUEhyMlloczU2VERlZ0tmZ1BHUDdU?=
 =?utf-8?B?TUN3UWw1blp2b3NRSnlEcTQrT2ZZcnpKSC9kZXVBUmNrU3hoNGtZTnE0VTNT?=
 =?utf-8?B?OFZNZ1dYRFd4WjBuWjhZaFYvTlA0WEFhZ3V2NVdtalQxWWtuVXRvaFdLenZM?=
 =?utf-8?Q?mPZFKfqOdJ4SWaLlBR5NP6AcxG/Ga4VR?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2616.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG05eko3bmxRc3VSYnpCaGlMQVNJQ082MFVyRjZHMmRqaS9mREVsVTIydHcy?=
 =?utf-8?B?Z0hId1k4UmlheFJNb1ZVNlV5K1NyNy85UENvWnNHTEwzVVhBL2ZyZC9VY3RS?=
 =?utf-8?B?U09kd2FhajA2SDQrUzhSY2pubHZidUxOV2diVGtaSkhxTXRyN2pjckNkMStH?=
 =?utf-8?B?L205WEdvcEJJNzRuVWVhNE9FTm1pZXM2b2dHSjZSM2xhaytTb2tSUFlRb1h4?=
 =?utf-8?B?NzhEQ1lYcGJoYVNvR21ab2FPUDJFOXBjMjRjOHdlY3RDV3BPVnZ6VkxVT2U0?=
 =?utf-8?B?eTJ3ZVlIRjNSK3ZQRVUxZFN3QStCNDc5dnhlM1RKNGQ1Z3JsM2VXQ29jbVlw?=
 =?utf-8?B?ekNLWUVzcEg2Z29PWWcyRlAyZkowdHlsc2VqdzhaVjgwcURkM05reUhtbFRR?=
 =?utf-8?B?bDAxcmF3UzBRd09HK25XN25ITytkd01oOUhXbDNXZWR6b25LdkVsWGNpbkNZ?=
 =?utf-8?B?MjJyTWZsMURQN2NCakF1V2J3K3gwa3FRbEx2ck0xNHNsd0FHVkloRUtnMzRm?=
 =?utf-8?B?SitwNkE5YWJaS0xOOUdnN0tYTEUrUHo0UXh1c29tSFFqbHBPOGxJLzV4MHVE?=
 =?utf-8?B?LzNYSUtJT3IzcEdRQzRuRlVkeS85T0puMWZtQlZsUERpa0tPSnF5RWRrTGdp?=
 =?utf-8?B?Q2xtN2szaG1BSUpRR0RicG1sN0VaQjU0TlBiM1huT0JELzFGNHJPcC9mMTlz?=
 =?utf-8?B?VHlVY1VzQllBejZMV3RUeXhIcUxucDc5SFlmVFMxeGxVS3FTM1ErVzFTdG51?=
 =?utf-8?B?L3N6UXFndlZmMlJab3k5ZmxDa0JQTDl1T2NGWXpHSmdaVEQ4UllHeGNPdXk5?=
 =?utf-8?B?YUtyVEhYME0xZ0UwaGlPelJFUG9lWHA4ajhCbkJrTDJ3VVNDZWsrM3hIUVBJ?=
 =?utf-8?B?Q3pDR1o2Y1dvVG55TEc1c20rWGJsQWhBR2NNdFBUYnhkNmE0Zk9OTnVyOENt?=
 =?utf-8?B?b0QydCswTzNwL2xOREZ1UGlJU1hiMG8vZ3N4ZlhjSUZ5RDlOd0l5NWNlSUts?=
 =?utf-8?B?NXB1b2xxS0trdHZ3M3hObWM4bTdaUDdpZ3NVd2NPUGZWbU9nOVFiU0g5WnpL?=
 =?utf-8?B?bGxQOGNUYndESnQ4ckNBcmdnbDlHaXBnZWF5VFBNd1VPZTYwdEtFNU1aQjJn?=
 =?utf-8?B?bk1yWUd4eDltMGMzMUtlODh1ZjNjeXczUi9mZFdEQUZZUFZFcU9wOHpaVVhk?=
 =?utf-8?B?cWd2MW1hUHkvZ1RYZmJsc1FURE05eUhrYVB1UXNDazFwZDRnN0VjUW1ic3ZX?=
 =?utf-8?B?OHd4Zm4xYjdyblZJR2xmMThhZGlVUzQxOTBMRm95bmYrWE5KQlg4akRVajJZ?=
 =?utf-8?B?a0VYQW9idU5Ic2RUWHJwWnlIQUVobWRmei9FcEthRVJyRmp6MEFtR1krN1p5?=
 =?utf-8?B?ZGVVcXJ4U0xuZTZFbWdPMGZ4TDd0UXdvb0cwallGa1hGM2huNUJrWHVMUTdC?=
 =?utf-8?B?b2JjQTlFdUlKS3ppSkhwWmFjd1FpanVHSzBIMlN1dmd4Wk5UNXZ4YzdKTUVp?=
 =?utf-8?B?ZFlaVS9ycXhqd1pzUjhYMHhYREkzZHhoM0VDRDJLNVBoNmZKL1NoeDVLVjF4?=
 =?utf-8?B?L3lLOXZJVW1YU05UelBzYnVBYnRyeDE3dGlXcnhGSStnZThzbzMxT21IajZE?=
 =?utf-8?B?QzNteU5wSnFKV05ubmlhdXJIVXllQk9MYXdMNEdrM2ZQOW9OZ2liQmF6cm0y?=
 =?utf-8?B?Q0wwQmFRci81RmVkWkVHaTQ1dUtVazFkbWFUT3VTMHJrdjVVL3BuRkZmWXNK?=
 =?utf-8?B?cGZoa0tVUFJreWFVaGFNYk50ejlnZzhQVjFHM0NLT3hRU1pqNHJIbHlNRGt3?=
 =?utf-8?B?dEk2SytEVU1GR2NqeWNnaVBMT3BhYUR3OWNqRUM4Q3hFL3JzbXdaclV2dGNn?=
 =?utf-8?B?elVCMzhIYU5ERWRCMXJ6eTlEWnQzcE1PUkM1cDlrSjUxZE50Rys5cUg3eDZY?=
 =?utf-8?B?OEVRU3Jlbmozc3l4bHRORThzQjB6Vnl4ckR5M2NhY3VzMWRQQzhDRjRkNDIv?=
 =?utf-8?B?TXFYZ3l3U2FKS1hENTlFN2I0N3orWUlab09aTWZ0NS82WCtzTVFRY1VBKzRO?=
 =?utf-8?B?WmNJUmNMdUNiV01HTVpDTWZtMHJ6YThUS2U0SFRxNHV3b2wrOE1xNys4MC92?=
 =?utf-8?Q?HEy/Ll2m1Eog1vhidPxaHfvyl?=
Content-ID: <B7E8C0AF662AF846868EF8CB68D29564@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2616.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076bce18-198e-4309-9ee3-08dd50f8b7a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 15:18:51.9048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tn4IL13OBlB8x1pswhcvKYp3dV9J7Sg1dMIUzZYCDl3He8qanE326yD19qFwKJztgz4db9idSri8qcwp29fwHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_071857_838215_158A5B3B 
X-CRM114-Status: GOOD (  27.37  )
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

Ping MTD maintainers?

On Sun, 2024-11-17 at 21:44 +0300, Fedor Pchelkin wrote:
> The symlink body (->target) should be freed at the same time as the inode
> itself per commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"). It is a filesystem-specific field but there exist several
> error paths during generic inode allocation when ->free_inode(), namely
> jffs2_free_inode(), is called with still uninitialized private info.
> 
> The calltrace looks like:
>  alloc_inode
>   inode_init_always // fails
>    i_callback
>     free_inode
>     jffs2_free_inode // touches uninit ->target field
> 
> Commit af9a8730ddb6 ("jffs2: Fix potential illegal address access in
> jffs2_free_inode") approached the observed problem but fixed it only
> partially. Our local Syzkaller instance is still hitting these kinds of
> failures.
> 
> The thing is that jffs2_i_init_once(), where the initialization of
> f->target has been moved, is called once per slab allocation so it won't
> be called for the object structure possibly retrieved later from the slab
> cache for reuse.
> 
> The practice followed by many other filesystems is to initialize
> filesystem-private inode contents in the corresponding ->alloc_inode()
> callbacks. This also allows to drop initialization from jffs2_iget() and
> jffs2_new_inode() as ->alloc_inode() is called in those places.
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  fs/jffs2/fs.c    | 2 --
>  fs/jffs2/super.c | 3 ++-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index d175cccb7c55..85c4b273918f 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -271,7 +271,6 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
>  	f = JFFS2_INODE_INFO(inode);
>  	c = JFFS2_SB_INFO(inode->i_sb);
>  
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
> @@ -439,7 +438,6 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>  		return ERR_PTR(-ENOMEM);
>  
>  	f = JFFS2_INODE_INFO(inode);
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	memset(ri, 0, sizeof(*ri));
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 4545f885c41e..b56ff63357f3 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
>  	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
>  	if (!f)
>  		return NULL;
> +
> +	jffs2_init_inode_info(f);
>  	return &f->vfs_inode;
>  }
>  
> @@ -58,7 +60,6 @@ static void jffs2_i_init_once(void *foo)
>  	struct jffs2_inode_info *f = foo;
>  
>  	mutex_init(&f->sem);
> -	f->target = NULL;
>  	inode_init_once(&f->vfs_inode);
>  }
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
