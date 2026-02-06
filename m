Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC3EE6B4C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BX7nRe5TlKn5uCC++lIe03hJ7xvKgvApC6QM1iGtivw=; b=GfVV3PLOAXOyNn
	6meZqoesO+dlwLBN6xEXgKrOMK2Kh7sff0Kw/bUx+72Jm/KkrPTD+CEkOLQp2DTEItipxnUK75sBC
	fNTOT5Z/mUiZYhtNq6eLhlUseK+mv3XAZpe4EryKhMAJZwL5ArgWZIJLAn+tQU7hEnxOO7M77XBXc
	jlHyijALBgrp7cjoImMFO7IHBCwVtybk6Hw/QK3UgnumXPAqitAbRpMxfLaxJuWDSp9h+lWn3AXbr
	Jq+5zUcUjE/w18dX1+e+acfk60gtD1dhLkmLIY1lSVHDzpHVzXQkwEE71rrSWykziPdjsTVoXr5n+
	J/ult2bg7zea7nq2FWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRV4-0000000BkHz-05rl;
	Fri, 06 Feb 2026 19:28:18 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRV1-0000000BkHJ-0uRH
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 19:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE2BcoPDn/KbrhxSo7fmoZYDpLbFAhiemXkAXDHV3gVvQXIK/QOiA0J0sWHHmeGAx1cQUiuDPF+dZtIhyoeHnVwD8TieLO/XY6pufWpOBfz+Mdm3pEjspMq9TCq0/zR5Pg7AI8YfaDhPU95Na8Yk2E5Z91ZPeRTV4cJbYO0+8PBW//1LfAc6pwyLcjrmC1h7C7iDZVckGe0d0ZWa9ROSR5+48R6i8H2NdrfJKTGdbzbBupoQitY9fcAzUZ1l5W4BVynS31eziKpd74eM8UzsvNVC6U8OpUf+OJt2tSd8wJVuit/i3UqfakK+PMmG/93EyRpjfNYIBDC9/nh+0BTOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY7Zymg7WCBxQ1m95nLz/OOLP2QaEvtLAGyzDcH/Gvc=;
 b=QzWspRddBp6rZ1P5OErDF/Za08luDGsUD2A43IRD1s/CEz4NKeiMuTSBE2m2miCkj80elTSceX6q/j4SCD351S+qY5uiebqifAAjL1S5W6O8o9w+OVJy45olhnLdy0GfJhsfkJR5n5LyIzbBxQFUsh2H3Qc4dbAcPAsnQ7F9Pw4y9tb2SRchvWXLZmcLuCbiDWHK6oOQlo0XKZfqLN6oAmXvHnOnri/buIZKd8tlOOB40g0TaVpeE0FXOJuPmh+Z07k0LgfpFpd6czT41P9IAmx3ER5exUsNuR/EY0JRrtODN5L92XBXmb/6mTdfDY5f8gotlG4OMwMjEzzDujG17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY7Zymg7WCBxQ1m95nLz/OOLP2QaEvtLAGyzDcH/Gvc=;
 b=eAdj0OWMMjR/yYXZhEnurabnu1xEXq/zY6q9mRZAfc/1mLNdJbNdqAvdZR8w2bjOkVS5Lw0f31YJDhRq7oZRJb0QDJGkCbsoJjtowlJYMP4ozXqrlkq1PPmkhL+wFioXI6oKi+xmCvJCvMTvYKhrk58TnckHu5ZMBqjCxcU86EA=
Received: from DS7PR03CA0258.namprd03.prod.outlook.com (2603:10b6:5:3b3::23)
 by MN2PR10MB4125.namprd10.prod.outlook.com (2603:10b6:208:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:28:11 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::d1) by DS7PR03CA0258.outlook.office365.com
 (2603:10b6:5:3b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Fri,
 6 Feb 2026 19:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:28:10 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:28:09 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:28:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 13:28:09 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616JS4U91840601;
	Fri, 6 Feb 2026 13:28:04 -0600
Message-ID: <775d8dce-b567-4f21-963c-a843e409fea5@ti.com>
Date: Sat, 7 Feb 2026 00:58:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/12] spi: cadence-quadspi: add PHY tuning support
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <87343ghkek.fsf@bootlin.com> <87v7gbdwdh.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87v7gbdwdh.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MN2PR10MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2746b7c8-6209-4a29-15b1-08de65b5dcf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDJiZDFCcFJpVituSlBmZkxNUGh6MldoYnZiN3RUWDV3QVdmRjJkTXJsZHU2?=
 =?utf-8?B?Qk9TWmVvZ1MrNjIwRU9xWWx6cHFMd01ZcnlrV3FRSjRKc1VHSEJSVWVSZjVN?=
 =?utf-8?B?Qld0OXB2K3Y5dXpsMU96ZjBDRG1zQmVOeHVXZWE3VFlmdWNEQ0JnYTJnL0JP?=
 =?utf-8?B?RVc2cU9hRnJZNkM3QUt4aDBXUmtuT21HYmEvYmJEMS9RMlBtNDlINC9BMnhw?=
 =?utf-8?B?VityKzBGdEpzelNCM29jYkgwK3BBN29tb1JndVhhODF3NDJZZlJoQnp5Y3Z0?=
 =?utf-8?B?NzQ4TjVZZ3VSTm5wSEVLcHpDRWVRWGpqa08wR2pvTTltTUduSGhocHE1VHY2?=
 =?utf-8?B?TERwZ1F4TlpQZmVzN0FhVzJVYzcvNmVnK1RjbFUxeVg1aExadjlqeEo2Y3lk?=
 =?utf-8?B?QnBUR2dmUFhXc2J6MDlZNXRKL0hrVUZTWStWREc1U0RqdXMvZVliTERQV2sv?=
 =?utf-8?B?ekszVXdySTV4R3pucHpLN0tzc25CWm9TbDg4cmVEZmRhaGlHanlFUWNDYkJH?=
 =?utf-8?B?Z2hPSE1xa3pmdFlkL1N1N05NQlVTYWtxUlRpekpFcWVLQWozZ25LcitsdWtj?=
 =?utf-8?B?VUhLYWpBRmR2MVJGRGpwR0tUQ3lBbC9nbFBnWC8wVXhGVE90Qm8vN2dXVGww?=
 =?utf-8?B?NWtmZjRjSzdhdFNMRER5SGdZSW5GemNmWUxvUzhaL0hWVkFlQ2V2MkNvelRD?=
 =?utf-8?B?eW9mOFlPeEZnZlZxdjIxWkdsMVQxWUk1SnJqeTFXNXgzY0VXbzdZTkNNVGs5?=
 =?utf-8?B?SVAxL3AvclVtdU9BUTBiRlV6K2dPNFBlNGFsN2NPMktlL1UrVFhjZ3VjQTlB?=
 =?utf-8?B?eWI4RWN4TkRkTW1DMVJFU21tMFZoVW9IUmh4bk55ZHhSTmpITDBubWxpREFS?=
 =?utf-8?B?TFBHekNQVmJyS2xBc3FWaFhzWjQydS9pQ0JXelYyVFVMT2h6dFRPQmN0bWo2?=
 =?utf-8?B?MmlMUHNFMHRUVEsrcy9pTXliQkRiMnM0UVhWVGpsV1NocVVRaVN5WjFiOWpM?=
 =?utf-8?B?dXNYckNKenJMcGlkeS9EeXloSTFtRzdVaVZnK2lhUmNnempPeTRHUXZTeHN4?=
 =?utf-8?B?amlYOUlaL3Q2bUw4NGVnbjlwMUJ2ZHdzMndvMGY3Smk5VitZVm5MQU9hVUdY?=
 =?utf-8?B?NUtBUXd4bnJFc2puVm5yVzVXNFFyQ2Z1US9BTzRkVExIQUZSSXZ2SjNHdWJ3?=
 =?utf-8?B?L1Nqa3pqeXhpUkdZbFJmMy83dVNKU2JFdm05NVhLSjE1bEFJL0NMaDFQSENJ?=
 =?utf-8?B?aGYycHhmSklmZmFUNGY0MmVSTUVDN2FESWFNa3g1anBGWUdDZHZtNmZCNWts?=
 =?utf-8?B?ZGoxRW9wVDZKWVBnL3Z0UFlGV1ovTHFSZGFZMUM0anVYaDVlbHNGNm9ScFdP?=
 =?utf-8?B?QTJtTHh3VmtvRlBZRVBSZURGNUFxbEVESjUzRXFFak5zSWJmUUFpcHA2V0VD?=
 =?utf-8?B?RXlnTnJURWhXYi9kMjZub2w4WW9aNk5qN1o4R01CcjRiWm4rS21CaWVuUVNS?=
 =?utf-8?B?VjRlbSsrN1dTSEtVWjZHNDFvdzI1QmRvSUl6N09kQVhZNWdGWjI5akdPbU1t?=
 =?utf-8?B?TDNiTndoMWsxK2ZPWUlERUpjWng0VUdLcEYxTTRzejk0S0hZeHl5SG1kUlpC?=
 =?utf-8?B?alFlU3hEVEZEVXNnbTUyQXRqWnI1WFA1aEU3ekt5T0JtWE15c21sRmh0dFV6?=
 =?utf-8?B?SE02RG1Ec2VLSXhVRlhLTFdOakFBNzlYTkl6VVY4VExuRXE0ZkZRelNadCti?=
 =?utf-8?B?K1VxQkZPSVdOdGFoUDNDdDBIZFZxWlpGYzFGU3ZyMHFOZ2FJalBCZVhnNHl0?=
 =?utf-8?B?dWprWFpzd0xwZTRLaGgxVm5NKzR3Zlo4bnBHODdhb3NjYTlpMVpjUWlacWlW?=
 =?utf-8?B?R0JGRkhnaGd2WDJIOEpEK1U0WENycHd1MlA5R1N2R2t2Tk96dGk3RzEzalNt?=
 =?utf-8?B?UmtCSmZ4WlJNbTFUQXFrK3N1N25maUQ4SS9BUjBFSUt1c1lHc1pRRnVpVmRR?=
 =?utf-8?B?LzY0OXJOaWp2bHpFMi95dVVabDVaeFgxMGpJZlBQajVjejRVdFBzZFdvU1cr?=
 =?utf-8?B?UGhRdWo2ak5ibW5TV2J1Ui9ZL2s5WUEvZkRXRWhWTUNheGlGR0k1ZDdaVEc0?=
 =?utf-8?B?N3hTNyt6R2ZoN2w4c2Ziano2aXM1N0k3NFQxaVA3TFZPeXJnWlk0eUZ3cFhT?=
 =?utf-8?B?M1c2cXVMOEFXNnNNQXNnTVdIbGRXeUlyeEdHWm90ODV5ZisyS3drVjJyRTYr?=
 =?utf-8?B?QjQ5QjV2ODRDMUl6ZWd0RVhUT1dnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vAmKBrYzfH4ReIFYfnuaIJIsR9dBdFYGgM6WJs7Ec+i/PuQHLSOswQhB7lwo/9XMuUBCxyzQ+BP8L3qknhxU9QaSIQ5P9w7PWYRQThecgprsBUcG2J7/2oRD1u96oeMCZOO0nMCTtYFbo0kpMl5IQcgRdfTvonXrCLa2DHFZIdttVRpXyWVeTIyL4AOJiBj3B5ygzMwxEDudII5tRvY1cobHCspApSNPKKPZGTXV402uJxgwxRji6pE3N5PKhVEAT10IQEHKEoGQnpd7s2EZDOVW/vakeOEJcuUkl+fG//tZyU95AQkkZspQKA/bVjDb8LWLcheyWn9+MRR9wb7VIGr6uTjJ8cb7Q8TWpVlDkDv45jQ0Ps+TwH6BbIpT8UjZi3bW4HHNdz1Bzby3wQbahgxyfzjbqCo01qoR5K88Ydxeba9ezAGWxmJu/GONdqXj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:28:10.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2746b7c8-6209-4a29-15b1-08de65b5dcf0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_112815_253726_E4816961 
X-CRM114-Status: GOOD (  16.10  )
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

CgpPbiAwNS8wMi8yNiAyMToxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBTYW50aG9zaCwK
PiAKPj4gSSBhbSBzdXJwcmlzZWQgYnkgdGhlc2UgbnVtYmVycywgSSB3b3VsZCBleHBlY3QgdGhl
c2UgdG8gZ2V0IGhpZ2hlciBmb3IKPj4gU1BJIE5BTkRzLiBJIHdpbGwgdGVzdCB0aGUgc2VyaWVz
IGFuZCByZXBvcnQgbXkgb2JzZXJ2YXRpb25zLCBlc3BlY2lhbGx5Cj4+IHNpbmNlIHRoZXJlIGlz
IGFsc28gT0REUiBTUEkgTkFORCBzdXBwb3J0IG5vdyAoaW4gbmFuZC9uZXh0LCBzaG91bGQgYmUK
Pj4gcGFydCBvZiBteSB1cGNvbWluZyBtZXJnZSByZXF1ZXN0IHRvIExpbnVzIGZvciA2LjE5KzEp
Owo+IAo+IEkganVzdCB0ZXN0ZWQgdGhlIHNlcmllcywgaGVyZSBhcmUgc29tZSBudW1iZXJzIEkg
Z3JhYmJlZCBvbiBUSSBBTTYyQTcKPiBMUCBTSyB3aXRoIGEgV2luYm9uZCBXMzVOMDIgU1BJIE5B
TkQgY2hpcCAoc28gaW4gdGhlIGVuZCB2ZXJ5IGNsb3NlIHRvCj4geW91ciByZXBvcnQpOgo+IAo+
ICAgKy0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKPiAgIHwgU1BJ
IE5BTkQgICAgICAgIHwgbm8gdHVuaW5nIHwgUEhZIHR1bmluZyB8Cj4gICB8IFVuaXQ6IE1pQi9z
ICAgICB8ICAgMjVNSHogICB8ICAgMTY2TUh6ICAgfAo+ICAgfC0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLXwKPiAgIHwgT2N0YWwgU0RSIHJlYWQgIHwgICAxMy44ICAg
IHwgICAgMzQuMiAgICB8Cj4gICB8ICAgICAgICAgICB3cml0ZSB8ICAgIDcuMiAgICB8ICAgIDEw
LjIgICAgfAo+ICAgfC0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLXwK
PiAgIHwgT2N0YWwgRFRSIHJlYWQgIHwgICAyMS4yICAgIHwgICAgIE4vQSAgICB8Cj4gICB8ICAg
ICAgICAgICB3cml0ZSB8ICAgIDkuMCAgICB8ICAgICBOL0EgICAgfAo+ICAgKy0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKPiAKPiBQbGVhc2UgbWluZCBJIHVzZWQg
TWlCL3MgYW5kIG5vdCBNQi9zIChzbyBraUIgLyAxMDI0KSwgSSBkb24ndCBrbm93Cj4gd2hpY2gg
b25lIHlvdSB1c2VkIGZvciBtZWFzdXJpbmcsIGFzIHlvdSBtYXJrZWQgTUIsIHdoZXJlYXMgdGhl
IG1vc3QKPiBjb21tb24gdW5pdCBzZWVtcyB0byBiZSBNaUIuCj4gCj4gSG93ZXZlciBQSFkgdHVu
aW5nIGZhaWxlZCBpbiBPY3RhbCBEVFIgbW9kZSAoeW91ciBzZXJpZXMgYXBwbGllZCBvbiB0b3AK
PiBvZiBuYW5kL25leHQpIHdpdGggdGhlIGZvbGxvd2luZyBsb2dzLCBjYW4geW91IGhhdmUgYSBs
b29rPwo+IAo+IFsgICAgMi4yNjE2NDddIHNwaS1uYW5kIHNwaTAuMDogV2luYm9uZCBTUEkgTkFO
RCB3YXMgZm91bmQuCj4gWyAgICAyLjI2Njk1Nl0gc3BpLW5hbmQgc3BpMC4wOiAxMjggTWlCLCBi
bG9jayBzaXplOiAyNTYgS2lCLCBwYWdlIHNpemU6IDQwOTYsIE9PQiBzaXplOiAxMjgKPiBbICAg
IDIuMjg1MjU3XSBjYWRlbmNlLXFzcGkgZmM0MDAwMC5zcGk6IFBIWSB0dW5pbmcgZmFpbGVkOiAt
Mgo+IFsgICAgMi4yOTA4MzVdIHNwaS1uYW5kIHNwaTAuMDogRmFpbGVkIHRvIGV4ZWN1dGUgUEhZ
IHR1bmluZzogLTIKClVuZm9ydHVuYXRlbHksIGR1ZSB0byBhIGtub3duIGVycmF0dW0gaW4gdGhl
IENhZGVuY2UgY29udHJvbGxlciwgUEhZIEREUgptb2RlIGNhbm5vdCBiZSB1c2VkIHdpdGggMi1i
eXRlIGFkZHJlc3NpbmcuCgpSZWZlcjoKRXJyYXRhIGkyMzgzOiBPU1BJOiAyLWJ5dGUgYWRkcmVz
cyBpcyBub3Qgc3VwcG9ydGVkIGluIFBIWSBERFIgbW9kZSBbMV0KCkFzIGEgcmVzdWx0LCB0aGUg
Q2FkZW5jZSBjb250cm9sbGVyIHN1cHBvcnRzIG9ubHkgdGhlIGZvbGxvd2luZwpvcGVyYXRpbmcg
bW9kZXM6CiAgLSBQSFkgRERSIG1vZGUgd2l0aCA0LWJ5dGUgYWRkcmVzc2luZwogIC0gUEhZIFNE
UiBtb2RlCiAgLSBUQVAgKG5vbi1QSFkpIEREUiBtb2RlCiAgLSBUQVAgKG5vbi1QSFkpIFNEUiBt
b2RlCgpbMV0gCmh0dHBzOi8vd3d3LnRpLmNvbS9saXQvZXIvc3ByejU0NGMvc3ByejU0NGMucGRm
P3RzPTE3NzA0MDQ2MzA4NDMmcmVmX3VybD1odHRwcyUyNTNBJTI1MkYlMjUyRnd3dy5nb29nbGUu
Y29tJTI1MkYKClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBUaGUgZmFsbGJhY2sgd29ya2VkIHdl
bGwgdGhvdWdoLCB0aGUgbWVtb3J5IHdhcyBzdGlsbCB1c2FibGUgbGlrZQo+IGJlZm9yZSwgd2hp
Y2ggaXMgYSB2ZXJ5IGdvb2QgcG9pbnQuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
