Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBFACD6E56
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4AzPpey5AueHgBBTOCosx2wh0LSKpyxWC+HgGafMsM=; b=pP8phixtVwfjCm
	mj26fbJZ46Soswlzm+lM5tA4e1FkA3sAGhDztHhSZp1lcRljjXjOwyfdj/mIyp70ocjrSevFHYSij
	H0Xf5aacvzPGpYDMjuoWXI7K0pgGqpZfKevv4G1NFYA8Gkxpu42pN823PBIhu1l19uwzCx4mXA93Z
	32PyIthztHSpQNOpIatGDX/sQFk8oWWENabNC3wt3Rmnosln3hA4lwW/iwFShZjqFY1POB2doZLnN
	byRxoyx3lnm6PnN/zJ3JOFn3eZL4yd5fc/DXQCSHGo8HkmhGBWljJXjGgBQ6fa4ocHhDUTeFIrydY
	vy6/yVex8Aa+ESDxZDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyvv-0000000AUWw-3TYK;
	Mon, 01 Jun 2026 09:27:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyvt-0000000AUWf-3M5R
	for linux-mtd@bombadil.infradead.org;
	Mon, 01 Jun 2026 09:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qpiTrhU4b8XaxM7+quIPhOK2GqZLyNikYCoZcor7zjw=; b=a2cH040VI2HZBaMvKVjGv2U/OB
	rZvHEZ8RYQx/JO5Q0moxB3egzHgaDvf6gjWmXtylNVzweUrBqTdafeLf5Xkn8FJxivkOirzskZNOO
	oDMXMD3YaoVJ3y2eIjongFHB+izF8dSsDbTzpp8t7eqTucj9AzWWjzP9jbX8FhamkgEY6MIZsBas2
	Rf7WLuvkDlSnzqgMu7f+UmpHreYXN9jWeMo0/eTL4vkublzGKipov2AA6FzcnGI0kilFSd1oe5EgJ
	lioivj6dBpclGgoXhebT+jeQA+Ulth7GQ4R1lnX8TJp3Btea4LcxzkO9gABhmViVVHDniW6AYkqrK
	jHEx5FqA==;
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyvo-00000006E1L-3ew9
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 09:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAIEM30v1yyGmVbNVgW39L2/Oh8QtxKyB2Ye6g4EH1EtEqnMQaqSz0qIfPTRvWFgfqChLsWO8safD/CYIkE04xBY5BWLjDpdonxZ7w5DAIWSNP6f52F90hMRJh6WmttzFuRPG9AWZT2uEahODr3uvkWro1tskYHVJ9s8XpKNsaR68HNWW19NLnSRCF01fUZ+hyRfGolhpSRJYiXWnkgrwR6ad6EMMJXGOangJAb5vsuNJf8iTF8+LDfXxaH9bAJZ5Z8sXQvwk9eB0s776rq7e9eeRHHnGLbeqQwyX6ASGTOGtuKzybvrm1AIFLHvOi6sNJb/mvid0jKOk7bi47Qn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpiTrhU4b8XaxM7+quIPhOK2GqZLyNikYCoZcor7zjw=;
 b=qw/zJkkZDGmnBKy9es7MNZ0CGFcGIUTtldHthSkNj2H8M5UqIzn8WtXnIQ+FTehpUAtEhVy50MlTNbML3M8MctuLRDM77fYlP2cSaeymrBnWTBvmeFhC/XBpKd/bmDZ3vw1z2XDF0Fh5B8DWQa6YgOBt80Jw9lGSSeiUeeSTrtiqUIvpZgIc5aac5Ckquvm3wRZS0jx/aiUdvJs0hDgdjZ+mk6GJI0GFlqZOE++bOZvfGfxmoGYDHkf35PPGhsS9vlS9nqnz5cfPBIU1M0o+8UAjG7EwBB+cIRTcFk1fKCTYq5bRaREybb5QXgvuuTj2bEWk3bWxvM9M+UWCzFPODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpiTrhU4b8XaxM7+quIPhOK2GqZLyNikYCoZcor7zjw=;
 b=JWvxUuEOoLOyAgzINjlM5nkuzNjVGZ6Q2TV4sRcB0XeqbmRNbSlBskm0+iRqlgbM6gKLoNuA1uxtHHPIPpzWv7xSe4v2XDRAnGOahoMg0LnONlkwXnBjtks5hbX+DF1xbLDqo607VUE67TUWkC/5UFdZV9nvMKyCOeWBBWmajVw=
Received: from SJ0PR05CA0144.namprd05.prod.outlook.com (2603:10b6:a03:33d::29)
 by SA2PR10MB4570.namprd10.prod.outlook.com (2603:10b6:806:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 09:27:27 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::7e) by SJ0PR05CA0144.outlook.office365.com
 (2603:10b6:a03:33d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 09:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 09:27:27 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 04:27:26 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 04:27:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 04:27:26 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6519RLwH716951;
	Mon, 1 Jun 2026 04:27:21 -0500
Message-ID: <0ee42621-f970-451c-82cd-9a1a63ce197e@ti.com>
Date: Mon, 1 Jun 2026 14:57:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] spi: cadence-quadspi: reject 2-byte-address DDR
 ops on PHY-tunable hardware
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-10-s-k6@ti.com> <87y0h3gb6o.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87y0h3gb6o.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SA2PR10MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 0145e690-5cf2-461f-e245-08debfbfff0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|3023799007|6133799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ouBA9Pe3BFAkC4cnXDRJtJSrTKndN2XGjquJI4lpGMMSN8yJap6e2MxT7a/9KrbExqOdkfYCFy89J8ChZtrSzkgenAd3yahv7EQ/Jtebb8g0JLGgJ5dfyhDjyJrdbnc9JrlZr2uFz+vCkLUKt2lJmyBkd2EZFvqybBAzZzeF6FbjE5AscKKa0bWMc/Z+vhxcLIj/UhRYLwsHggXdktsV2umIyDOwxK1QhFxmtsWUd2HrELrbuZO+25Ve16HQeanfCWqbRjb5P8IcHIYMlOdXdZD8BcqcIxIgklas0bRjtfwxXVoOZe9TkyskcE+hENVPf/1sbMLXnN5ixOj9uoi3YRh38UnuUhcFxJTH5q4G/9dEqJB/8c+pNWTKNAU0vJUNNrhCMpilM4WWsZo4cLCmq0CmSeamdkiX+Dis33QisJ1PPKYwuheHtJ17pojSeJXMr9S1zxxNAh9qdwoNVik1BXxbJd/GR42b+NUBKMAwvuGj/Yvw/flcvywZtJ+enEPni3VSCC9gqEqVlGDjb6os/v3HP9BxLOb/viagk8AfaeFot20wPQY5QX658Z4tTw6pINWzQEhf3mQPyxECgvozooz0e+t9rH40svw/kJ5qqVnwVOv6XMVoSklYJEpB+jzCk6nj5qAuvGsT/T3huitvJOzxOo6qCcEIxAtC46hrrpKKVZ996Nijm3/aBzPc+6epXkme0Ko9HE8abCahtyNarYnsoB8xkrRQJQsVRJ7CBF7GVRP8ixD/U2KVL99SwKZR
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(3023799007)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jpP4M49lk0aFQ9u6I3r+BGQi5vBiJDftD44eu2vTyVq2rnRlRrHL7rvGYkFElOOapUxdcoNBoVTwIZXCmkERsm3DeOVHD+dXijeEEpHkikbVlT1Dbl25qZyoNDMb4ehYo7RYyt7kOjR9yCFJ+ltLgBelMcoDSZfhAbQrTfQYlsLFcGhW/IHGx9z3HQmgV/6lnSJ6EocwHkO0MebKg5OmprvyJ505n7p0hIPNFJaRw432O/iu/VssW7EK84Sx1zyG5LMi8ycAxzyQ3wo1SzYzzfbUGqbPMdbJkChp7qYxchrGfjY9Jm4iI49pBNIfWASnU6jVP1nUlKDwPEM2KX5G77cWA2JERD9mXbPVnaBCT2eYWa8MxU8T4fVxTV47ia0tNM5n+4h2EhoEJw7oOo7SBnY+M68hC0/Fsm1drqFOGkkgy1fzN6vI3BSn7X3kaIow
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 09:27:27.0353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0145e690-5cf2-461f-e245-08debfbfff0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_102737_517025_2BCB30E7 
X-CRM114-Status: GOOD (  21.28  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjgvMDUvMjYgMTQ6MzEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
T24gMjcvMDUvMjAyNiBhdCAyMzoyNToyMyArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgo+IAo+PiBFcnJhdHVtIGkyMzgzIGFmZmVjdHMgdGhlIEFNNjU0IE9TUEkg
Y29udHJvbGxlcjogaW4gUEhZIEREUiBtb2RlLAo+PiBvcGVyYXRpb25zIHdpdGggYSAyLWJ5dGUg
YWRkcmVzcyBjYXVzZSBhbiBpbnRlcm5hbCBzdGF0ZSBtYWNoaW5lIHRvCj4+IG1pcy1jb21wYXJl
IHRoZSB0cmFuc21pdHRlZCBhZGRyZXNzIGJ5dGUgY291bnQgYWdhaW5zdCAxIGluc3RlYWQgb2Yg
MiwKPj4gbG9ja2luZyB1cCB0aGUgYWRkcmVzcyBwaGFzZS4gWzBdCj4+Cj4+IEFkZCBhIENRU1BJ
X05PXzJCWVRFX0FERFJfUEhZX0REUiBxdWlyayBmbGFnIGFuZCBzZXQgaXQgb24gdGhlIGFtNjU0
X29zcGkKPj4gcGxhdGZvcm0gZGF0YS4gSW4gY3FzcGlfc3VwcG9ydHNfbWVtX29wKCksIHdoZW4g
YSBjb250cm9sbGVyIGNhcnJpZXMgdGhpcwo+PiBxdWlyayBhbmQgaGFzIFBIWSB0dW5pbmcgc3Vw
cG9ydCwgcmVqZWN0IEREUiBvcGVyYXRpb25zIHRoYXQgdXNlIDItYnl0ZQo+PiBhZGRyZXNzaW5n
Lgo+Pgo+PiBbMF0gaHR0cHM6Ly93d3cudGkuY29tL2xpdC9lci9zcHJ6NTQ0Yy9zcHJ6NTQ0Yy5w
ZGYKPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyB8IDE1ICsrKysrKysr
KysrKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMg
Yi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPj4gaW5kZXggNTA4YmM1YmM0YWI1
Li43MjIwOGQzNzYzMDUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1
YWRzcGkuYwo+PiArKysgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPj4gQEAg
LTQ5LDYgKzQ5LDcgQEAgc3RhdGljX2Fzc2VydChDUVNQSV9NQVhfQ0hJUFNFTEVDVCA8PSBTUElf
REVWSUNFX0NTX0NOVF9NQVgpOwo+PiAgICNkZWZpbmUgQ1FTUElfRElTQUJMRV9SVU5USU1FX1BN
CUJJVCgxMCkKPj4gICAjZGVmaW5lIENRU1BJX05PX0lORElSRUNUX01PREUJCUJJVCgxMSkKPj4g
ICAjZGVmaW5lIENRU1BJX0hBU19XUl9QUk9URUNUCQlCSVQoMTIpCj4+ICsjZGVmaW5lIENRU1BJ
X05PXzJCWVRFX0FERFJfUEhZX0REUglCSVQoMTMpCj4+ICAgCj4+ICAgLyogQ2FwYWJpbGl0aWVz
ICovCj4+ICAgI2RlZmluZSBDUVNQSV9TVVBQT1JUU19PQ1RBTAkJQklUKDApCj4+IEBAIC0xNjI3
LDYgKzE2MjgsMTggQEAgc3RhdGljIGJvb2wgY3FzcGlfc3VwcG9ydHNfbWVtX29wKHN0cnVjdCBz
cGlfbWVtICptZW0sCj4+ICAgCQlpZiAob3AtPmRhdGEubmJ5dGVzICYmIG9wLT5kYXRhLmJ1c3dp
ZHRoICE9IDgpCj4+ICAgCQkJcmV0dXJuIGZhbHNlOwo+PiAgIAo+PiArCQkvKgo+PiArCQkgKiBF
cnJhdHVtIGkyMzgzOiBJbiBQSFkgRERSIG1vZGUsIDItYnl0ZSBhZGRyZXNzaW5nIGNhdXNlcyBh
bgo+PiArCQkgKiBpbnRlcm5hbCBzdGF0ZSBtYWNoaW5lIHRvIG1pcy1jb21wYXJlIHRoZSB0cmFu
c21pdHRlZAo+PiArCQkgKiBhZGRyZXNzIGJ5dGUgY291bnQgYWdhaW5zdCAxIGluc3RlYWQgb2Yg
MiwgbG9ja2luZyB1cCB0aGUKPj4gKwkJICogYWRkcmVzcyBwaGFzZS4gUmVqZWN0IHN1Y2ggb3Bz
IG9uIGNvbnRyb2xsZXJzIHRoYXQgbmVlZCBpdC4KPj4gKwkJICovCj4+ICsJCWlmIChjcXNwaS0+
ZGRhdGEgJiYKPj4gKwkJICAgIChjcXNwaS0+ZGRhdGEtPnF1aXJrcyAmIENRU1BJX05PXzJCWVRF
X0FERFJfUEhZX0REUikpIHsKPj4gKwkJCWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gMiAmJiBjcXNw
aS0+ZGRhdGEtPmV4ZWN1dGVfdHVuaW5nKQo+PiArCQkJCXJldHVybiBmYWxzZTsKPj4gKwkJfQo+
IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHZhbGlkIGFwcHJvYWNoLiBXaGF0IHdlIHdhbnQg
aXMgdG8gcHJldmVudAo+IHR1bmluZyBpbiBvY3RhbCBEVFIgbW9kZSB3aXRoIDIgYnl0ZXMgYWRk
cmVzc2luZywgaW5zdGVhZCBvZiBwcmV2ZW50aW5nCj4gcmVhZHMvd3JpdGVzIGluIG9jdGFsIERU
UiBtb2RlcyBhZnRlciB0dW5pbmcuIEhhdmUgeW91IHRyaWVkIG9uIGFuIEFNNjJBIExQCj4gU0s/
IEkgYmV0IHByb2JlIGZhaWxzLi4KPiAKPiBUaGUgcXVpcmsgc2hvdWxkIGJlIGhhbmRsZWQgYXQg
dGhlIGJlZ2lubmluZyBvZiB0aGUgdHVuaW5nIHByb2NlZHVyZSwgc28KPiB3ZSBza2lwIHR1bmlu
ZyBlbnRpcmVseSBpbiB0aGlzIGNhc2UuCgpJIHNlZSB5b3VyIHBvaW50LiBIb3dldmVyLCBpbiBt
eSB0ZXN0aW5nIG9uIEFNNjJBeCBMUCBTSywgdGhlIGNvbnRyb2xsZXIKYW5kIHRoZSBmbGFzaCBw
cm9iZXMgYW5kIG9wZXJhdGVzIGNvcnJlY3RseSBpbiA4UyBQSFkgbW9kZS4KClRoZSByZWFzb24g
SSBoYW5kbGVkIHRoaXMgaW4gc3VwcG9ydHNfb3AoKSBpcyB0aGF0LCBmb3IgdGhlc2UgZGV2aWNl
cywKc2ltcGx5IHNraXBwaW5nIHR1bmluZyB3aGVuIGEgMi1ieXRlIEREUiBvcGVyYXRpb24gaXMg
c2VsZWN0ZWQgbWF5IG5vdApsZWFkIHRvIHRoZSBiZXN0IGFjaGlldmFibGUgb3BlcmF0aW5nIHBv
aW50LiBUaGUgcGVyZm9ybWFuY2Ugb3JkZXJpbmcgSQptZWFzdXJlZCBpczoKCjhTIG5vbi1QSFkg
PCA4RCBub24tUEhZIDwgOFMgUEhZCgpTbyBmYWxsaW5nIGJhY2sgZnJvbSA4RCBQSFkgdG8gOEQg
bm9uLVBIWSB3b3VsZCBsZWF2ZSBwZXJmb3JtYW5jZSBvbiB0aGUKdGFibGUgY29tcGFyZWQgdG8g
c2VsZWN0aW5nIGFuZCB0dW5pbmcgYW4gOFMgb3BlcmF0aW9uLgoKVGhhdCBzYWlkLCBJIGFncmVl
IHRoYXQgZW5jb2RpbmcgdGhpcyBhcyBhbiBvcGVyYXRpb24gc3VwcG9ydApyZXN0cmljdGlvbiBp
cyBwcm9iYWJseSBub3QgdGhlIHJpZ2h0IHBsYWNlIHRvIGhhbmRsZSBpdC4gSSdsbCByZXdvcmsK
dGhlIGluaXRpYWxpemF0aW9uIGZsb3cgc28gdGhhdCBvcGVyYXRpb24gc2VsZWN0aW9uIGNhbiB0
YWtlClBIWS1hY2hpZXZhYmxlIGZyZXF1ZW5jaWVzIGFuZCBjb250cm9sbGVyLXNwZWNpZmljIHJl
c3RyaWN0aW9ucyBzdWNoIGFzCmkyMzgzIGludG8gYWNjb3VudCB3aGVuIGNob29zaW5nIHRoZSBm
aW5hbCBvcGVyYXRpb25zLgoKTGV0IG1lIHByb3RvdHlwZSB0aGlzIGFwcHJvYWNoIGFuZCB3aWxs
IHJlcG9ydCBiYWNrIHdpdGggdGhlIHJlc3VsdHMuCgpUaGFua3MsClNhbnRob3NoLgoKPiAKPiBU
aGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
