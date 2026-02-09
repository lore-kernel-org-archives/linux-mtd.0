Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26012E81BD3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjFIVDK7pKPN/8gReqNSCbdKJxdO4xj63NQQmeTZ0fo=; b=hZ7C+UvaXMCorQ
	qv2JcycvLqBpb+UYXL0dQ9w6MAXHFQdNkL02D27h/P9JpzLW7t/vNqoOSCZLY6DyYS8cM8YMVIbUc
	MTZU8up+HKk78t3IE/Aix610bG0bdFNeG7hT/zPgNtoR53zjU58pCdfToDogVnfOAdMToR3d3DgEY
	A6BWA3d5f6dd6cE/6GQgT+ClyO7h6PfWYd4gT0dlK5rnKWWqra5lAQ/hrE2/JlDQramFA1yaULiHL
	zF+4LKdLYiJBRcVasZg+jfwfxGNcHEJNW+cpWKCxscvBc5ZfQ5tL6ZptgAddxesNSk0OF877tOQp9
	Ncl8RRRp5+TUEmnce9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTSK-0000000FdPJ-3t23;
	Mon, 09 Feb 2026 15:45:44 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTRw-0000000FdL2-07Oa
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 15:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQsduMsMJt4IMDqNN361H/FMOfFsRHsPKzBVbLARYf+mauHiSqe16tVi4vXAOJQrVhhgX7vKnoZfUWsv8N1qD5mhYKabsKgIgyWv37kaj6ZofSNvWoj2yXsGcaebW8xIw9TUpJXwezqRJMuqTw7YbvZZd6x53+pp1eDoVWxHY2lZAbrpJQcSX/tW4Lj8wfor24wMZpTU6uitLqE6b5x61uz+TA3McavrcupUMh9rd7Bjm3xuBDlNVlaUN7KiT8uDGctPsXk7+yd2Im93d+BD0LpxRNwtQ9lXygEXFrbNBp2Krz9TFClu8b6YtdvX71m6MZ6M5pc6qQWZbz95UTzDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQkPtfl6IKlnKwA7uVDSUsewOH6zD8+wqQhi5w05k30=;
 b=N+3fOPIH4TkFbllyapNBycgADcKx34IE8E2s95hIzQaOuBmmRBr7S0qmiJtTaOEcfqz27dHq1JIvUmejWT6ugc4Fsk+K7Gb8OU42z/sYsPHqHb6drzEj3tVDWcyJEjEJ6RpPYWYcA4PVuI4o9RgZoorGHC4ER8n+03eR0m4wxV5DihUVSV3KvSQ7gqNluCU+E4IhBsTw3kLGTgfLTtm8JWL138IB0j0w1wHzexCiLu0OcLet/WQx171vIUFHTqpML8kwxdJFQVbqk55meVZpWqU3uhbBx/sqi4Rv2IOZU7cclFCxqT9lGxwF59+5PFLXirJy83DE16iRzBYWQKG+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQkPtfl6IKlnKwA7uVDSUsewOH6zD8+wqQhi5w05k30=;
 b=fBmr+q1b8/nISe2ljnDl3AXRrsgjc5rrgbwrrVjnwtej5jKFc2cG5gCkI7cAesoyT0jkOpCHjYrsuoVztMgz7qO6SpLYCq056wimAu3CQPjDJvTIqE58XhsvzUNet2qAkVYclg3Dg5zL6CltEzY0X11c4rRTp0fHpUzpZbWAHP8bimLZdhGagWYDmBhT2yQnfCfYNzpP53Y5xtlE9X7Wp76tEeym1BsPluNWw97FSqm5KVswjBghuJh33+vlLVuSDmuya2Fxt9cA3E82q7xcSt2ZI8bqkG3qR9JN241xaS/OHAY4SYC3TdyMgqV05tRKahmOSyBYFg2rJwLmZrKpOQ==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by GVUPR06MB10880.eurprd06.prod.outlook.com (2603:10a6:150:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 15:45:13 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:45:13 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlAAWQcWAAB0NmY8AFokAgAB/U8m+
Date: Mon, 9 Feb 2026 15:45:13 +0000
Message-ID: <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
In-Reply-To: <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|GVUPR06MB10880:EE_
x-ms-office365-filtering-correlation-id: b4dbf68b-5de0-40ff-893d-08de67f236b7
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RgqQ5GBeeRHjPQS7UOSRon5wkS+6UNf3BLXmwUc2DSI68UjdSowGS09uR0?=
 =?iso-8859-1?Q?DMCbFNUI9OQKp3IvEZTonB7HUItv2LhdX5afKSvt9sPBSX8haAM7/qrQHe?=
 =?iso-8859-1?Q?sb2qop3YrmEtpqmqLp7MQ9SzhEbOK0vdlQQLsZlumwriufyvkYJhOVl4Po?=
 =?iso-8859-1?Q?GGFko76nq17waI/DL/6xrQE5O3gOwJGHutbNKI6Fib3hcYPoZZmmOvPNuz?=
 =?iso-8859-1?Q?dLFR8oUnBOcSckRKceS8bXyf418iVB7EiChpnS6Qwyw7U424uIWkRzwkKO?=
 =?iso-8859-1?Q?FtqqigHEkrHoQ708BVgHwBzHW+7oXPDg2ywqz/uqfPY4lYlXJ54Um0Kcws?=
 =?iso-8859-1?Q?g4Qel9AWIwHiBhLyNNB6xHAUg07ZWnDfe4sxQHE4MTMmw1X+cstU6Vd26v?=
 =?iso-8859-1?Q?hXci1h3MbUSQ35v6nhhiyT67juMFX6k+JtMCvir+X9fQLJSGY3RymfxGJ5?=
 =?iso-8859-1?Q?LenpC4bL2Z58b1TfhT2zqIZzh8cV29pXOF3JQzOEjUGRgjYDVwB+Fc93M3?=
 =?iso-8859-1?Q?VJY6S9YnJBJLWzsgwHygVWn+3LzAI0HoijeCOB6rqIxmM35Mu6yV+uJw+d?=
 =?iso-8859-1?Q?3SqCBkwVBXR+MueaDvtH5qlArnRYQTWj08IN+Gdat8sLxVSJ/Qttftl4T2?=
 =?iso-8859-1?Q?39f3R8KaSR9ReyFzNQ/0Jji7U1aASKsiqnA4Dox5s7jLnqdam0C6HH3opo?=
 =?iso-8859-1?Q?RB2b6x6BkFevHmp/76K8RJ4zrDCmxInmwFRbx0Vc+e7495d0qSicW8lMIW?=
 =?iso-8859-1?Q?kO2QGH4XwQTgpEZOJ7IboSUfZR2pjf71qereOY0091bq4mTBYqqrYUuSya?=
 =?iso-8859-1?Q?uI6y9DvNSVf2bLQ3vtsy/cBzA56ciVtd/USYmuX2DUUjWOwWEXuaCUGLur?=
 =?iso-8859-1?Q?/33HusDqFQifkOfyMvxPvU5br2pF5RGPEiV5570p1tqStZBWgS9WR5XvA3?=
 =?iso-8859-1?Q?HdY/q54N3J4jibBoV1BMe9yIcrvxVImvhtenRyA58d1x2rnL/OrYOLiXiA?=
 =?iso-8859-1?Q?fFiNp6C7jk+FmWbbYvF/AWTrmEVxa/Kw4/6pBvlM+8DCAPSyT5Hw8XOFNz?=
 =?iso-8859-1?Q?wtZGVaXJCROyskMi9uAMqWyOUozbzV/zpVdKMpg/c7OpLbWtCt9uOUpvoq?=
 =?iso-8859-1?Q?xkaBM4L8lfKSPQKDo0mfxz2POrZ5giSH/LpKZplckKNezKvqq2f/50vTFY?=
 =?iso-8859-1?Q?e+MMmrQA+kSsuUSkcHsLpEUZfLVTWA9YzepXg8EP7QFuvVemUW7ceXMFkz?=
 =?iso-8859-1?Q?jdl6cq0+BdoQIhjy0WkaVzA07sIXon3Hhq2B5zl4zPlOYIuMwT/8MskeaI?=
 =?iso-8859-1?Q?N6m/HjucrFQd7oe/bEXmndrfvkeqf+pvuaZu8xH06TXsHFRrKGCQ/QLZJh?=
 =?iso-8859-1?Q?NhODE3FDMrkDoqOIFMnhZLfC6Mx6aRJst4JVNV810v16Pyi09SgJiWOjIl?=
 =?iso-8859-1?Q?aGMFCdmfRsUorh2Cb7D/zQEyeILPkJjCkcv/ORRALc9jS7kuX8jcldLnbQ?=
 =?iso-8859-1?Q?XVp6UXNz1GuwKvClEDCfyv5FdrAPkUj7WsBs2E1r0rvc8LmE4ldpN7WQRz?=
 =?iso-8859-1?Q?l/tWV40VPd1y1In5F3+I7iq7f8mv4WfT/Gypo57l7MBJL9oqj1lM9o8tVl?=
 =?iso-8859-1?Q?aY2cmwwZUz0LcphW9LMwjPF0pf3bqz11IitnR+2z7u1oKpuA8z6f1OBBnA?=
 =?iso-8859-1?Q?7KoQfqhJAvnqYaXPjxk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Uh4erGnxXHIHhoFIkisHYCq0fs1h/lus1EySN98Lyo40PWE4y6cN0BM7vs?=
 =?iso-8859-1?Q?1u3RsnMHpO6O0HYTJ3BUYdtaLoIz/703KwjoxXzPOrEU6eN/aJZ0KqMWzb?=
 =?iso-8859-1?Q?OkahVl1YVEAmF5yTn7ER8T7fqfCM8lcPFRk6jPQ66trs+gvHHi5TT87D+t?=
 =?iso-8859-1?Q?/ZrPeiGAnxE3sMEvRklDIXPlVw/nWYwGx3TyNpGOwb9pV4NA8kyJojicH5?=
 =?iso-8859-1?Q?TXpc3adXs0HR0/n0mIpz9u905YeOmKmc7O3CXL8A49RgqJ4SQ9PAXbnRg2?=
 =?iso-8859-1?Q?zT/ZVxjVbqzlI1+h5JL+Ux3fVof+l2wvp7UolW+2+bQc/dwlTUqiWGNpvz?=
 =?iso-8859-1?Q?bxc/kBQWFb6AivqBVwqQE1hDLfK1zldnTMWWA5Dai7Pu7MxYysOLnF4Pa4?=
 =?iso-8859-1?Q?eLpbma8ggKwqoDU2efVT01O4rjWouIqpdVkgKUyxV4oydJtvquYM9W3FXD?=
 =?iso-8859-1?Q?WPyYY/K6Ya9BWAZ7j6f/TIT9GgzIY1rwftZNRg9Noh4i/W+IpLbdPLBcby?=
 =?iso-8859-1?Q?5gk3XxHJyrfA6QwUhoY/Qc/1mTrmuWM+ymJdvkKskD6z/YoG8Y+qtrL1MW?=
 =?iso-8859-1?Q?Tge0D4Z40e/6JWZ7Wy0YNkUaUg2WhEGkd3hInuYO0DMHe1L9HYjEGAbSLf?=
 =?iso-8859-1?Q?GA8J4FYSLsRCQWzgjtdudhxroHK9Pr98UqRFixNZ48tBxdQtgN4q/zZB5M?=
 =?iso-8859-1?Q?c6lOztOuvpUrBea/peysm5R718ssKM9tk15Ps9rtfCtL1flGJ2dBrnWLMn?=
 =?iso-8859-1?Q?+BXAiIi9pP1Wx9aQG6kncCMq8O36dnc/6oYHyVHoVz0ti5xNyF2IA5GyMm?=
 =?iso-8859-1?Q?7PliI8Lf4/SWEBrT0ZuAxjF27jvXiLN0wbu40DOskwtGZDkmQh0Kt2pNai?=
 =?iso-8859-1?Q?buHvcVqIQm2EttttAkSid0i1hzcQSnhhpZnxmqxWfzlP9dgLCCqBCclAyw?=
 =?iso-8859-1?Q?qwWMZSYKNsghd+IobYsYm3huo40T8PbkhQMzm7g+ytlX7lQyGw5sGNjc5C?=
 =?iso-8859-1?Q?N17Yzef/LNJ41dvLbXjOfRzMU9tIiPBsG7coKAX6mjDqgh+oWq8DJ7uxkn?=
 =?iso-8859-1?Q?rqYKtyyStOSKNMY/wdcasHOaYww6Dsf96nd65g20vCALpz/18e0v5UEtHK?=
 =?iso-8859-1?Q?nexKlYyl1WQLH7IN76jdCCC2E82SdzBDGBHMepoOdWrefe0ENp99E5HmZU?=
 =?iso-8859-1?Q?fBf/sgH40ZUnqc+lJaALBzHfYvaifIoeZXZWW3+0kB/F+vkstovU6fqObJ?=
 =?iso-8859-1?Q?wa3OgyF/ZHBAAUPJ/dBsWZq0RedmGCwS7N7K+8PQgOPZtyVXmmZZjkD9Co?=
 =?iso-8859-1?Q?jU9WKfyCN3PoOXqJ1Q8FY3ZRca/poT63masfz+x8mVu5mI3bg1Ho+fmZTD?=
 =?iso-8859-1?Q?Gkv45idmD0yV2QLgxVSZE+NGiy08DpSFCYCDgRsLBtj9eez5zCMxKESiT3?=
 =?iso-8859-1?Q?PTb/QA7SCqORCeB/jCL8EzrFsZHO9Rs83DpMHD4YV01HgTTbdNV4KPHn1/?=
 =?iso-8859-1?Q?03xNyh0ooCpKmj4AOiUYsj/YyzXGdySvVfrvD8GqNHogfDBINw61uLz1Jg?=
 =?iso-8859-1?Q?eVFFNfDwZlJujMjttuGTHolo1mnf8/0ilJ5JSW+7rsUyWmyC0jXqINByQT?=
 =?iso-8859-1?Q?lPCkOsx6+4HncIBMvsAX8KIytlzZHO6dYbYQSLnHYcOPYZO+snTOZk/CdY?=
 =?iso-8859-1?Q?u5dbYgUbL2XAlLa1b9MKRoIxED8pSdaOs8t0gw9J7liktKYihOJbSz9F7J?=
 =?iso-8859-1?Q?Jec2D9xvojyuOCdbAotz1eDNcFRqPpzl47+kvRdoIf44l0XkMV3Ec4cvwf?=
 =?iso-8859-1?Q?MBRHnEbK+Ifj6ILht+MDCSmZxABD8prfTtXXL3w95nnEaD8a+qI3?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dbf68b-5de0-40ff-893d-08de67f236b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 15:45:13.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjbtO5lCBIIbpnymbC3Ssv3LsoKXQvjkMa9ccEZ3hb1qEbO6foZ8V8cuRJPoulzQyoz8BeSBaRXv2eRnQTPGYi1sNVLowjdWoWXnSUfeuWvX9C+NPi8AoXWhBtztKjFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR06MB10880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_074520_084985_26F3BE0E 
X-CRM114-Status: GOOD (  16.21  )
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

>>
>> Just as a summary of the whole thing:
>>
>> - Happens only when we introduce 6.12.57 kernel into our testing system.
>>
>> - The boards go from running 6.12.57, to 4.14.20, to 6.1.75 for 
>> testing old release. When the 6.1.75 tries to access files in the cfg 
>> volume, there we see the error.
> The same ubifs image is loaded by 6.12.57, 4.14.20 and 6.1.75? And the ubi
> volume won't be formatted after switching kernel?

Yes, the same ubifs image is shared by the kernels/applications.

> If I understand right, do you backport ubifs bugfix patches to 4.14?

No we don't. The application that uses 4.14.20 is the read-only factory image,
which is not updated normally. It mounts the ubi volume but it only reads a file
from it, won't do much to it. This one in particular was compiled in 2018 for
example, so it does not include those commits.

> Following commits could corrupt the ubifs image, which may lead to the
> problem:
> 1. ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e ubifs: Check link count of inodes
> when killing orphans.
> 2. 4ab25ac8b2b5514151d5f91cf9514df08dd26938 ubifs: Fix
> ubifs_tnc_lookup() usage in do_kill_orphans()
>
>It would be better to apply fix patches through 4.14~HEAD.
> (git log v4.14..HEAD fs/ubifs/)

By this you mean that these patches can lead to corruption when switching to a
version of the kernel that does not have them? If that is what you mean, I don't
think it is the case because we have been running 6.1 with these patches for
more than a year and never seen the issue, however it appears within hours of
introducing 6.12 into the mix.

Somehow there is some difference in between 6.12 and 6.1 that makes this error
happen, but it could potentially have to do also with jumping from 6.12 to 4.14,
even though jumping from 6.1 to 4.14 has not caused the problem for the past 1+
year.

Best regards,
Tomas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
