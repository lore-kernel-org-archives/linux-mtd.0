Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137EBD0E6D6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3rtWqYa0bTQg6L7PdcT366SH5T2USl4ZSXKDQkBYC8=; b=KQ10M9ERP7a/j6
	xZpZsXvQ7CIhIq4hgmJSoQ5LYnotOKThOgzq2tgGPJrpq9XVEkcDdSrjEY6E5kaSjXq2RfvnryOkl
	u9Gh51Uv5U4XRywzEuRwsBqmDoSu9pCL2r1e3ikUgEl6ScxBiAa6pov87B2IPeubclKKkw53ExU8s
	a6IHDQgWFFZVxQ0gTodrYaX3t/dncjdKwVJGGMQELCN97RjOL8+0e7wIeB0FeNECAi+Ddn/6XRrd6
	Yk4NBqj4Vd4cEngA89h6AKS5ReExH2/bwB0noclJw5Z3nvZjDRn3PoH1OPZYeRrF1+mbZqpB044YZ
	L9q6TU71PMwKdB2VxyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ocb-00000006gMD-414d;
	Mon, 21 Oct 2024 09:22:41 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oak-00000006gBw-3qsD
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 09:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybvUJP+ea1p7PN+xTJ3HoN9dDPJbniRH5vJuHm4G055n36ZpTh4E25GDbqBpR6YiApKD3vXqXjJboKH8nD/+MbK6O9KQDWcFBVCdS9sv1N1hSTaZpE/wy9Fx1+Hlzh+crqcSkp8luuaVZdSGN4owOpybwA3Dw0CMFZ+mHIwPs6Xfp8WfQBJWd3Il2x2u7RO0To/wwQWwceEM4JSssI1HQkW2Py5zWlusZrni1fJEy/drMHOTXvO4ORVezE5q/AEybKpY3RI3fCioISpkscaW78hggTrUMtlHbi5Cvwz7wn4wzL5JvYsXJpbek2T18kr5yVGZEBVWnZoUEH/36PbXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b6zdgfQOZVLzfXbjZIyorKbWbR42BMFeGf7M/uVUf0=;
 b=xUim0dkQsfpH7lRT3ABKpdW4yktvDcWNSascDld7fOigPuO9L5Im0WjaBv5q7OgyenL+L2brrCXKkdoepDSYNovLxsmt0i1oiEWd7mMD/TKezP24uM+Of9zxIUuysGt8refHzC2hY0+fmmmmnrcLAJm22hdjniPPtu0bOajnM2g3F1DoHO6nHtZUQ41EjNHsIs69NQGeEIduiBfCXevOBZiBNI3vcLML3TJE8NLnHrAyF7n8IvJHR74K6di+Hw5wiKJE41JhvY0R9AZKh9dqYTOafon2DsLhmCf0FR+Tuh6rNaK1HBkuWZ+18j2/j9kJEXYWRfwuE0trP1BFeLUOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b6zdgfQOZVLzfXbjZIyorKbWbR42BMFeGf7M/uVUf0=;
 b=MGzp53gumhyOgnW05tSUuSUGWOoTi+UmZ1v+oAjzohRELhMpRdXriAB4rKHgh+DQJTJSAuRg3BLCsFV6oJEph68laA0sk1DlEADMUR0sccLKar2UD6TUuy3CSuUNs5VW8OM5pVqMDAHGPsCCCfqzGiM3WAXrm0g+H1bjSUjEMw4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10622.jpnprd01.prod.outlook.com (2603:1096:400:29b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 09:20:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:20:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Sergei Shtylyov
	<sergei.shtylyov@cogentembedded.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Thread-Topic: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Thread-Index: AQHa4yDjAIy7ZoXJYEqJKCkcnBrPArI1PmKAgFwu4wCAAADWcA==
Date: Mon, 21 Oct 2024 09:20:37 +0000
Message-ID: <TY3PR01MB11346A10426542FFE10EC2B2A86432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
	<20240823173143.366150-1-miquel.raynal@bootlin.com>
 <20241021111526.1882d9e4@xps-13>
In-Reply-To: <20241021111526.1882d9e4@xps-13>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10622:EE_
x-ms-office365-filtering-correlation-id: 4a5e0ebb-d491-4695-67ee-08dcf1b1a009
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bm9LWUw0YUJnNmIxUXQyU2c3eGVVZmdsUnVTbitBSllBNUJ2REhNUGs5eXhF?=
 =?utf-8?B?bFpBUHpPczF4b3dSQzlKRms2SzVpOXllblA2R0FhVFhnMC9QQ0VyZ3cvRnFa?=
 =?utf-8?B?czFzZFVUdkh1QmVLM2V1L3JnK04zVUtVT1had0VLWDYzcGg0SmlGZU02WkFC?=
 =?utf-8?B?d3cxNCsyZTlkRzcxcTR3Zm1qL1grblZEcjcxdU9hZWhDYU5NMjYzZFhCRlNU?=
 =?utf-8?B?MnRqOHRGTzU0cExFNjhES3BoTFJWQ3ZBRnNzZ0NtVkxIWHZuZjFRWlc4Vmt6?=
 =?utf-8?B?M1JudEF5aTlBMlhlQjNOd3ZoTFFkc0ZNbDgxemUrQWRzUUQvT2Ezd0NmNjEv?=
 =?utf-8?B?aVd0cmNTaVliZ1h3Ym54MVdZWDBEWE9nNGY4NXg4ckk2em5KYzdHQ0xiQ0Jh?=
 =?utf-8?B?aUZuV3dTV2k1U1Y1NkFBczFBZXZ1TlhEY3ArNlIva3NMWkVIdFlBaCtPOVU3?=
 =?utf-8?B?dDhLMGNjUGxGa0lvcmVrOXkwRUlteDJFN3NURCsyN0FYaVcvY2RzMmJwZjAr?=
 =?utf-8?B?aFNpSEF2QVVGb1BaMzZCVjBOR09HWVFaeUs3ZUhjR05lWm1qa3JVMW5SQytL?=
 =?utf-8?B?NUQzY1hZK3R0RlREUHJqSmhzYTZteEJOOC84UGV3STRBQjhiRFlYTkxVMWlo?=
 =?utf-8?B?YjNNNmVLWWxFU1NNNzB3Tlhmejd5WEp6ZG5IeElJR3BjVGFFTUFYMWNXMlI0?=
 =?utf-8?B?MVVZQVFCT3doRTcvUkFEOFMxWEN6ME9wbHk3ZG1xUmZtWCtVT1hGTXdENlov?=
 =?utf-8?B?QW9NSHRQSWFTdEk0Vk51OVNFYWU3WldjQmRzZkMvUG1aVUpPMmg4Yk1QMEUw?=
 =?utf-8?B?SFJvYUNVUzIvMTVIanVOaHg2NEQ0ek1NT1ZVVGllTnlFdGRwbnpRWnJBVlkw?=
 =?utf-8?B?OFlJVk5pSFRGeCsxdW9rS3dyOXlMT3N1MENWNE12c0QvYTdqR3dtQlAyNm1y?=
 =?utf-8?B?dXNDa2pjM1U3d2JOSnVvOWlnaFpNZ2pLMy94NmpNd1FRSWt1TmNWTHBSNkxm?=
 =?utf-8?B?OEUwMmJlcEhxRVNxQVh6VHRrL1pNRWh6VmNFTWpZRjJlZnlBVE5YS2plNFJ5?=
 =?utf-8?B?N2F4SzZnNEhEZi9qeHJCbXcyUWQ3czNNVWUxdTZZdkZYT1ZEayt1YXBEYTB1?=
 =?utf-8?B?bDVuMFFGYlJFRi9CWGZhR3BjVDBhcm5FSEZrQjkxZDg1ekNNcEpiTUhMMEZH?=
 =?utf-8?B?MWRvVlFPZUpiUEZOTVpqQS9Sa1pISnljM285WVhVc0hJTjR4a2svV3ZWUTg4?=
 =?utf-8?B?WTB1SjJLVTlNWUg4dWJtYVpCSEN1aHBPM0oxcDdBSnZYaDgvN0w3YUpuU24y?=
 =?utf-8?B?dlBuOEFzdTJZKzZ6dnI5dkE2d3RhTTJIemhuZ093cU1WREJFdnkwSDdwZzQ3?=
 =?utf-8?B?TmRIYlgwSkNGd0lOQ0lFdkQ5OU9zZFNaUmpJSEdUQzRldnFDVDkvamlsekhw?=
 =?utf-8?B?eVUzRy85VW45OFRTaDFycGZybFg3d1RrbWpUUldJNHdObU9zdUVQMXY3V0xX?=
 =?utf-8?B?S2RmNlRRUkJXeUFXb3hhRzhGKzVTYUtCRngvZ3V2RE5pcjZEOVduVjM5dFEw?=
 =?utf-8?B?R0UyR0xRQnEybnNkRlkya3Z3eStIbU5lUkM5V0xvV0xCQysvSGVvTGFFQkVz?=
 =?utf-8?B?NWN4cm51OXNiQkRuWktkVkhyMThKNlZnSDgxOUdDUnZaQW9sQ2NxQlRlcGIv?=
 =?utf-8?B?QStZUXNEUlhiZk5LbkEvbzVGOHVNV2V5cGp6TVdRS28zYzg1NlZISHhZd2Rm?=
 =?utf-8?B?MEpxSk9Zc2RlSDRHcm5XQUFidFlJSzlMZFNqb09uVWtvN0pZZTYzSWs1dDNN?=
 =?utf-8?Q?YAWqplpFkAD2QU4MPBttxAyEKs7VrdvxZP+Ys=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWdEN0t1NSttRktVMTJ5UXN5VDN1eExKcDl6aXRMdWlrRzYyb2lSYk9HTDVa?=
 =?utf-8?B?STN3VmM5VTEzeWhXZFdSdlo4bTRSbWE2ckVUM1JXZGRicVFFYnVsTjFnUWJ1?=
 =?utf-8?B?TzUyNUVXdjhpNUJRcDhsWnJUTi9yZng4emIzUllyWHRKSFlPSk9lUk9ZYmx2?=
 =?utf-8?B?L05neTdxeVFDcFNnenN5TVhMRlRMRVVXYmZSUmI5RU84bHpsdEdCeTNGN0Z5?=
 =?utf-8?B?N0JOZDBtMlF1dnYwanNWWFJ0WktuNlZYaWFNMGxVVmhmekVFRzZ1c1g1bEYv?=
 =?utf-8?B?bW0wNkw2dlRoTXUwTSt4WGFzZ3NOamZhMm1yOENsODZXc3drNVluQ2RJRldu?=
 =?utf-8?B?eWY4S3lqY2R1d0JkQ3FKbVRZUW4vaGlZTko2M0RMUGF5dE9TdnZ3Z3JQMXd1?=
 =?utf-8?B?RVhMRDB1UFNwbFFnbFRjVUpnTHVPM0ZaQTQ2bk94dkhpdkR3ckRianM5UkFR?=
 =?utf-8?B?WWZHS2MxUGZVR0FGOTJrMjdMK2lDVXBrVTBJVE54dmY2c29QK2txVit0T0VZ?=
 =?utf-8?B?Q2ZabnhuT1pjMDNMbWwvWjNScm43ajhjRk9CTlpvNHRqUi9wcDF1TEcyRTRz?=
 =?utf-8?B?czNOWW9WbmlLaUFYeGp3aGh3dWN0dkEvK3RuUFV3bGdGQ0NTYUNPc0pQVDJu?=
 =?utf-8?B?T1JMV0grWEVwNG1USWc1T01tbDZPQTAxYWYvMmlsRG1ITlBaUTZLT21nU05X?=
 =?utf-8?B?N05LUXlzVVp5Ni9GVy9yZ2xsVUF3QTV4aS9KN0REakdVbWpZUHNlUnNrOHdp?=
 =?utf-8?B?VFUvSnhncGZJNENLa3hieWRLRzRNeFZvTFZGM2g3Y005VWIyYWJLbVFnd2p5?=
 =?utf-8?B?Z21wVmQ3bElGbThDMFRqUy80eEl2VGdHcmlNQVp3dlV2S2pKMkEzN0w1M1o5?=
 =?utf-8?B?R1lZM0EvTkxFM21kMzU0QlNRREYydk42eXVtdm13QlBiY3kzSXZmMWhObXN4?=
 =?utf-8?B?NExVTzFtRkRFZ0ZXRnJPRkFhaWN3RVQ5VytXWTJhSjBoNi84aGViMlplNUpL?=
 =?utf-8?B?VUx2WDhuVlFYWHdZa0xScjJBUzRKS1BxWm0xZzNnQVE1cFVNT1BqaTh4UW43?=
 =?utf-8?B?eVBaakoxb1c2ZTU0RHE5S2xYTS9COHJWKzNtOEZ0Y2JtWFhzQ0JHak82bTBC?=
 =?utf-8?B?WStITnVBNk45Tk12dlRNZG5RZkdLZlpocFVLWWlUY0NQd0tHNDJ3eHJURXFC?=
 =?utf-8?B?akRpRmZ1UnR5Z3JpUmJzbFc0Z2tTZjYrNVFXZ1lVU3ozUU9qU2ZlT3J6NVRq?=
 =?utf-8?B?NkNpUU5kWDgzbi8ycGs1SEhwQkpFb2M4U0MzQ3R1dGJjaFNJTDJIZm56bVla?=
 =?utf-8?B?Q2xNZjR6MjgyNENXeWU1dXlWQ2QwRlV3a2NKOWJGZU1rQjZZMjlpc0tYYkta?=
 =?utf-8?B?Z0tobVY2eUZuejc5VHdhamtRMEVXUXJUa0VLRmVjQWtEblNEaXBYcHdWSURa?=
 =?utf-8?B?UG9NYXlPZnJoTStWRzRTK203bVZxTDZNeEFoeVI1YldDSkR0VUdWWXd6dmJz?=
 =?utf-8?B?Rnd3L2JQeUN2Ykd5RVl5OW80OTQweUtyZ0p0ZnljUzNxOVRrS09ieExGY2pw?=
 =?utf-8?B?Z2Jld2JQWFZHbjFaVGx2OFhpSldLajFSNzlCZ2lqNktoWWpEd01RQXp5dXhi?=
 =?utf-8?B?UzhmdXJzWERKYTNZK0JaU1psOGhhT0FQaUNoRlZ6UTJNSGFMZXJGWURaUnJQ?=
 =?utf-8?B?OE5ucENleWpmcjZUdDdqbjJDL1IzQ2VYMlhYcTJyUHQ1b25jLzJrMUdrU05P?=
 =?utf-8?B?NkozSHZNNUU5dThTUzRWUkVUdXlDWXY5ZDBHMkRTNTFmKzByM3ROcFc1RkhW?=
 =?utf-8?B?bGs1V2hpRVFKV1lPVkkvKzlBN1BIdkwrQWU4SE1lYUdJcDBtRFhPMTdDdnlP?=
 =?utf-8?B?bjFGZzBBMUlvSXBpTHlqVlh4cjVOZkh4TEZtTUhVYlc0cWxDdGM3WVkwcjA2?=
 =?utf-8?B?a2c4RW90MGQrQng3S1Zic2tZaVNRcjQ3bW12THVhVWFSUi9oMTBkd25LSU1w?=
 =?utf-8?B?VUpGL2tIVEJJb1NCcUlvNFJwc1huZW5HY20vTVlzcnZ5S1kyd2VqU2d2ckdr?=
 =?utf-8?B?bXE0VXcyT3Z6akl2VVJybkthU2xMV05sbmhjS21UWEk5VXhZR1ZYNno1WmxU?=
 =?utf-8?B?a244TVNQcWdDdmx2cUhvRXhvbDE3R2gxNjdaMGdobER5ODZoVGhZZG5rb3dR?=
 =?utf-8?B?R1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5e0ebb-d491-4695-67ee-08dcf1b1a009
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 09:20:37.6022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jz6JsY76yUnTgOucEIc3m07C41P2ujtTvLYg/a1E4z8k7AIA/Zumti0FcnBpJ2Q1EjAwi8X8/rAMQPcEv9Ia1rQZNXrKaHzAmy/lxswhy4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_022047_336000_4AE0517B 
X-CRM114-Status: GOOD (  13.99  )
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

Hi Miquel Raynal,

> -----Original Message-----
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Monday, October 21, 2024 10:15 AM
> Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
> 
> 
> miquel.raynal@bootlin.com wrote on Fri, 23 Aug 2024 19:31:43 +0200:
> 
> > On Wed, 2024-07-31 at 08:08:40 UTC, Biju Das wrote:
> > > The rpc-if-hyperflash driver can be compiled as a module, but lacks
> > > MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> > > Fix this.
> > >
> > > Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> >
> > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.
> 
> I just realize now this patch got applied but not included in any final PR, sorry about that, I'll
> handle it.

Thanks, I also wondered why this patch was not there in 6.12-rc1, but in next?
Now looks like it is sorted.

Cheers,
Biju
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
