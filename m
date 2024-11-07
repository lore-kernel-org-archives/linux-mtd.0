Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB0CD5D696
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxy7O1SeCeclI84muHX3DVSliOQTt8NwnlkTCWaNsm0=; b=nkRbiTnNKb5TG9
	TgmN/dFUxPX3KXDoa9/b8F2nNddaPoKMVVWXBpAmhLzaL+vmBqtY+Cwtb7Ul8PaoN6J1YfG4C7WKs
	uWIQhz8ghxWD8Ub4arbtSxBiHoft63jhPkirEpxGDvoijEugwbHaWMYtzeq0aUP0YILR3caQqwec1
	d9GyJgddAphia0Aj/QG1KNi8GIV9ZW0BqFNGuWKN3yz8JcxKM+bwEThx3vYQkNFkxpUg2v6OCW6Ao
	1LTi5kGBhSa2Uk9LbGFILIjPojzu6gnxHFH7c0DfJHcOAjPl/0lC9JandCx2aZqFt72MSHnh6rC7e
	0450ZFYWak4yGcKXCU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9BCE-00000008ZZ1-32sh;
	Thu, 07 Nov 2024 22:41:46 +0000
Received: from mail-vi1eur03on20627.outbound.protection.outlook.com ([2a01:111:f403:260c::627] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B98-00000008Z6Y-2fgl
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 22:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSIE6KX8OpEExud3aoKBhC7hBuX/cQ9jZuqtxpNjTvD6A9Uu99FS/ePF9ze9M0axn6skJMAyFHVtY5XtziqF74HZBkcZk47DJxYBDMxNlCTgDfc0UxEgK9WYUexQJPOKS+4GW/LbSpaQhHMiv5nOMm7n55gEdG2l1jR6gdcaYteQVel/6GfFqhtzMlg/c5j2uukAU7BtL2YMWFX6Jevj/hMFsZfgxwChWH3NaRaiw9XBQXzoKLwgKnzq7lBZyIOx4ye7QO5oKvMcqDKpdo4j8w/IDLXxVHWxi0f7gJwoO8+Weg3EYlR4Q6f2480P3Hdj0WjrPdmjOnBCMESZ9EM9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhlZX/Gcu96IYqYv/B82Y7GNK8x8PONk0wqE7/iRxhc=;
 b=nJnZBFvV4CC1FKcTkfmt1KUiHtIMhLPetBwU2l5/Wsrc9OkBWqP50Ph5v65/vS6XPQwzkgrsCJWHIPU3QtjkAQZSi4MdSkL5BPzqsaoAb9gv9PA+QwYYFPRJzkIwOu65NpsxQLBWMSovzeJrbkhKWOoS1mr1a4QE2KOfbaXIwg1aVWFdEdoAmSsdXpIMcsirgAsTfrVK1L9rSpLp31D7UZM8p5s4mCiIGLxKlEaV5H2UZcnJlDeBnJ/P0A8xsEhysGTIzGKEZFmZOvo/YGimpPRJSUs/nnmc9JRKIw5XT/A+EvPzBurzt+QILOSu40/9zQS2BlVS5VP8jPi8k26YmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=hotmail.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhlZX/Gcu96IYqYv/B82Y7GNK8x8PONk0wqE7/iRxhc=;
 b=eNFflRqeYIsFM3vNGTDVQSVfy8gROLTT4kEHXfh/8PGaL3DX1XZBClAlin2OAoQcjJQzEps5KEkELkFQg2qGzOkJ5vM5I3xMjLDae8p3q85HdZXGHcnAmFey7mI0HVJX2ldURxu930KK9qJNUm7FYr5XBwomJ9GL/OIKRDHQdR8=
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by DBBPR02MB10823.eurprd02.prod.outlook.com (2603:10a6:10:537::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 22:38:28 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ab) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Thu, 7 Nov 2024 22:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 22:38:28 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 23:38:27 +0100
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryder Wang <rydercoding@hotmail.com>
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
In-Reply-To: <0f040e0a-c27f-2f29-6d9e-9c7152a18513@huawei.com> (Zhihao Cheng's
	message of "Thu, 7 Nov 2024 16:39:41 +0800")
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
	<0f040e0a-c27f-2f29-6d9e-9c7152a18513@huawei.com>
Date: Thu, 7 Nov 2024 23:38:26 +0100
Message-ID: <pndttci1xgd.fsf@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DBBPR02MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: e688b9c4-e18f-46e8-dd90-08dcff7ce665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|32650700017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEhUYkt5aDZhdDVjSHFmY3J0dlYwa3JXQ0xOTlZxODQ1azkyN1BTUVNlY1ow?=
 =?utf-8?B?VG1OaFRVbWhvc0luc0NMck11dWVPeHYySmlwQXlZWU9LY1N5RnB3SHFqT3lk?=
 =?utf-8?B?TTNCZ3lseTF5MkVWS0szMjFpL1IwMWxRUkJiU0dLS2g2ZXl1VlprR3VOTlRy?=
 =?utf-8?B?bGlyRzk0d1Q3d1plUE5DOWdMSnVIcHBPYURic3Z1TS9rYWxqUE5iZFNydHJm?=
 =?utf-8?B?L0ZiVHQyOWkxUW44MnRmVmRtQjljVVc1djlwWGY5K2FMdUYrdFZQVnhYcVlr?=
 =?utf-8?B?UzVTS1VoS3JVUHRsdmJTUEdMc1E0MTNDeHNjMVFXTjNwY0NxdVBVTkdBNmN2?=
 =?utf-8?B?bUx0Q3ZVTng0UnNSK2dPRitONURQUytWcmNtU0xMOVZCM1ZMTjBXZkxyQndO?=
 =?utf-8?B?MkFpS2I3OWFEVnh6bUZwL2dvSm5CUFQ2ZzcxZEpTZWVERk85QTFML3o0Qnha?=
 =?utf-8?B?azE2a0ViMWxhOUljVU9FeU5wTVdVL052a2t2WTBobCtSVTlDTlptNmROMG83?=
 =?utf-8?B?d3FIT2RqYTg0YzgvRG5XMktYbGZCWi9DMno5ZnVtNHo5a0h4dUo0cHc2cWhh?=
 =?utf-8?B?UXF4V2t1MjgveHN0RlJHME90aHdaMmpHK3A5VmNkSkYyaXl4Q1gyMFNDRmg2?=
 =?utf-8?B?MGJ4cThwazBKZkZpQVN5aWpmQTB0Q01Ud2M0cEJBOWhOMWRmaWdDeVJjVmt6?=
 =?utf-8?B?V3gxSVRIRUthV20yTzc4aHk1SVdPVWMxaE9DQjllenp3c29kdXFtNkozK05U?=
 =?utf-8?B?ZjUzamV2cWhOSXVKVHI0UGdvN21BdHR6ZDVCNGd4Lzhwb1F6OEhxYWNkeEp3?=
 =?utf-8?B?ZGc0U0o0UXI0cGdsZUlNNGZVOHl5TFdLN3N1Y3BiSUtLbzc1eWRqM3lzNVBp?=
 =?utf-8?B?bEhBQ1ZjVzFnQUdkZHlZWUJmZTdUeUV5S2c5UXhUSlIza3pnbTZLS2pvL1lx?=
 =?utf-8?B?S2IyVHFEa3VqZEw4VzNjQW5ETTBSYjlJaGp2Q0tpL1V5WHR3TTduSXloNElE?=
 =?utf-8?B?dnNwVkl2cDV1aHRaZGV2bXZ3THgxMUlUTEc0SmFYVGhIZzlrTUNiTzJYWEZq?=
 =?utf-8?B?b1p1QmhTSlQ4TUFnbHE2RjFWcFZCMDhzOGZVbGRJWnFUZ0d1N0NBTlBZNXZQ?=
 =?utf-8?B?VDRVMkNwdHJOeHVHRXFEWlNzWjc2N3gxS21yV2UydFNXRzM0Q1ExTW5reTdG?=
 =?utf-8?B?Yk5qb3R0S1lPc3lFSXJLU25JbXB0dHhla3ByYW9VRE1EM2lKQUM0RUY2YmNp?=
 =?utf-8?B?ZU5Pb0hxTEJwSFMwSG5ueXZSWHp6V1FxTXVrSUhNNHBGcG94OWVVOXNHZloy?=
 =?utf-8?B?N1ppZEkxM0p0MjJGMGk4Z3RHc0ROcG5ITG9US3UxMkl0cmxVcjY0NzQ1R3VT?=
 =?utf-8?B?cTlGZFJVM2hSRnk3cVQxbVdNV0xtbDAxZlEwMGExK3QvVDBtVTQ3ZE44bXBV?=
 =?utf-8?B?MCtqazdxb0lsblgycVBCS05LelM3RzZBNW9yc3I1RytqZEZVNkJwandXK045?=
 =?utf-8?B?WDBkWDh3cWZib0ZrdkRoVDJTeWFvUXVDWlBqTUdoN1ZGQWpjekhDS05yVENw?=
 =?utf-8?B?K0FRWHBiSjBUcm5IQVNlaS81RG5PQXViYnlIR2phRnc3emdBaVBLNmUxaTFw?=
 =?utf-8?B?bkRRbm1aSWZNSXdnS3NUNGFQT0FhR1M0SW5GU09ORTZhc0dTZmQxUlpTYll1?=
 =?utf-8?B?dTc0RlBwOTZHc0htOVloNEw5WVNzK0VxamgzVEI5OXUvelhVelhMWndMeGtC?=
 =?utf-8?B?M3k3SXZIYWxMemZJMWllSlBuWjdqNmVYZjZWK09YSi9MTXRzeHFsNUZyVjVR?=
 =?utf-8?B?TlFzWFVDTjM2eDlNbVF6WTc4UnJHMEZ3Z29rN0hxRENETmVRQ0RvOHpodHdn?=
 =?utf-8?B?MjBJMEZYQ3ZrajBVdndhRzlaMDlCT1BRTjdjUjUyd0d0SGc9PQ==?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(32650700017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:38:28.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e688b9c4-e18f-46e8-dd90-08dcff7ce665
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143834_703419_FF80BE42 
X-CRM114-Status: GOOD (  24.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMTY6MzkgKzA4MDAgWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI0LzEwLzkgMjI6NDYsIFdhcWFyIEhh
bWVlZCDlhpnpgZM6Cj4+IFJ1bm5pbmcKPj4gICAgcm0gLWYgL2V0Yy90ZXN0LWZpbGUuYmluCj4+
ICAgIGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vZXRjL3Rlc3QtZmlsZS5iaW4gYnM9MU0gY291bnQ9
NjAgY29udj1mc3luYwo+PiBpbiBhIGxvb3AsIHdpdGggYENPTkZJR19VQklGU19GU19BVVRIRU5U
SUNBVElPTmAsIEtBU0FOIHJlcG9ydHM6Cj4+ICAgIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVl
IGluIHViaWZzX3RuY19lbmRfY29tbWl0KzB4YTVjLzB4MTk1MAo+PiAgICBXcml0ZSBvZiBzaXpl
IDMyIGF0IGFkZHIgZmZmZmZmODAwYTNhZjg2YyBieSB0YXNrIHViaWZzX2JndDBfMjAvMTUzCj4+
ICAgIENhbGwgdHJhY2U6Cj4+ICAgICBkdW1wX2JhY2t0cmFjZSsweDAvMHgzNDAKPj4gICAgIHNo
b3dfc3RhY2srMHgxOC8weDI0Cj4+ICAgICBkdW1wX3N0YWNrX2x2bCsweDljLzB4YmMKPj4gICAg
IHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24uY29uc3Rwcm9wLjArMHg3NC8weDJiMAo+PiAgICAg
a2FzYW5fcmVwb3J0KzB4MWQ4LzB4MWYwCj4+ICAgICBrYXNhbl9jaGVja19yYW5nZSsweGY4LzB4
MWEwCj4+ICAgICBtZW1jcHkrMHg4NC8weGY0Cj4+ICAgICB1Ymlmc190bmNfZW5kX2NvbW1pdCsw
eGE1Yy8weDE5NTAKPj4gICAgIGRvX2NvbW1pdCsweDRlMC8weDEzNDAKPj4gICAgIHViaWZzX2Jn
X3RocmVhZCsweDIzNC8weDJlMAo+PiAgICAga3RocmVhZCsweDM2Yy8weDQxMAo+PiAgICAgcmV0
X2Zyb21fZm9yaysweDEwLzB4MjAKPj4gICAgQWxsb2NhdGVkIGJ5IHRhc2sgNDAxOgo+PiAgICAg
a2FzYW5fc2F2ZV9zdGFjaysweDM4LzB4NzAKPj4gICAgIF9fa2FzYW5fa21hbGxvYysweDhjLzB4
ZDAKPj4gICAgIF9fa21hbGxvYysweDM0Yy8weDViYwo+PiAgICAgdG5jX2luc2VydCsweDE0MC8w
eDE2YTQKPj4gICAgIHViaWZzX3RuY19hZGQrMHgzNzAvMHg1MmMKPj4gICAgIHViaWZzX2pubF93
cml0ZV9kYXRhKzB4NWQ4LzB4ODcwCj4+ICAgICBkb193cml0ZXBhZ2UrMHgzNmMvMHg1MTAKPj4g
ICAgIHViaWZzX3dyaXRlcGFnZSsweDE5MC8weDRkYwo+PiAgICAgX193cml0ZXBhZ2UrMHg1OC8w
eDE1NAo+PiAgICAgd3JpdGVfY2FjaGVfcGFnZXMrMHgzOTQvMHg4MzAKPj4gICAgIGRvX3dyaXRl
cGFnZXMrMHgxZjAvMHg1YjAKPj4gICAgIGZpbGVtYXBfZmRhdGF3cml0ZV93YmMrMHgxNzAvMHgy
NWMKPj4gICAgIGZpbGVfd3JpdGVfYW5kX3dhaXRfcmFuZ2UrMHgxNDAvMHgxOTAKPj4gICAgIHVi
aWZzX2ZzeW5jKzB4ZTgvMHgyOTAKPj4gICAgIHZmc19mc3luY19yYW5nZSsweGMwLzB4MWU0Cj4+
ICAgICBkb19mc3luYysweDQwLzB4OTAKPj4gICAgIF9fYXJtNjRfc3lzX2ZzeW5jKzB4MzQvMHg1
MAo+PiAgICAgaW52b2tlX3N5c2NhbGwuY29uc3Rwcm9wLjArMHhhOC8weDI2MAo+PiAgICAgZG9f
ZWwwX3N2YysweGM4LzB4MWYwCj4+ICAgICBlbDBfc3ZjKzB4MzQvMHg3MAo+PiAgICAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHgxMDgvMHgxMTQKPj4gICAgIGVsMHRfNjRfc3luYysweDFhNC8weDFh
OAo+PiAgICBGcmVlZCBieSB0YXNrIDQwMzoKPj4gICAgIGthc2FuX3NhdmVfc3RhY2srMHgzOC8w
eDcwCj4+ICAgICBrYXNhbl9zZXRfdHJhY2srMHgyOC8weDQwCj4+ICAgICBrYXNhbl9zZXRfZnJl
ZV9pbmZvKzB4MjgvMHg0Ywo+PiAgICAgX19rYXNhbl9zbGFiX2ZyZWUrMHhkNC8weDEzYwo+Cj4g
SGkgV2FxYXIsIGlzIHRoYXQgbGluZSAyNjM5ID8KPiAyNTQwIHNzdGF0aWMgaW50IHRuY19kZWxl
dGUoKQo+IDI1NDEgewo+IDI2MDggICAgICAgICBpZiAoIXpub2RlLT5wYXJlbnQpIHsKPiAyNjA5
ICAgICAgICAgICAgICAgICB3aGlsZSAoem5vZGUtPmNoaWxkX2NudCA9PSAxICYmIHpub2RlLT5s
ZXZlbCAhPSAwKSB7Cj4gMjYzNCAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoenAtPmNuZXh0
KSB7Cj4gLi4uCj4gMjYzOCAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UKPiAyNjM5ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUoenApOwo+IDI2NDQgfQo+CgpgZmFk
ZHIybGluZWAgZG9lc24ndCB3b3JrIGZvciB0aGF0IGZ1bmMrb2Zmc2V0LiBJdCBqdXN0IGNvbXBs
YWlucyB3aXRoCgogIGJhZCBzeW1ib2wgc2l6ZTogc3ltX2FkZHI6IDB4YzA4MzBmODEgY3VyX3N5
bV9hZGRyOiAweGMwODMxNDY0CiAgClRoZSBvZmZzZXQgYW5kIHNpemUgaGludHMgdGhhdCBpdCBz
aG91bGQgYmUgc29tZXdoZXJlIGF0IHRoZSBlbmQgb2YKYHRuY19kZWxldGUoKWAuIEkgdHJpZWQg
d2l0aCBgYWRkcjJsaW5lYCBhbmQgdGhlIGFkZHJlc3NlcyBhcm91bmQgdGhhdApvZmZzZXRzIHBv
aW50cyB0byB0aGUgYGtmcmVlKClgIG9uIGxpbmUgMjYzOS4gU28geWVzLCBpdCB3b3VsZCBzYXkK
dGhhdCdzIHRoZSBvZmZlbmRpbmcgb25lLgoKPj4gICAgIGtmcmVlKzB4YzQvMHgzYTAKPj4gICAg
IHRuY19kZWxldGUrMHgzZjQvMHhlNDAKPj4gICAgIHViaWZzX3RuY19yZW1vdmVfcmFuZ2UrMHgz
NjgvMHg3M2MKPj4gICAgIHViaWZzX3RuY19yZW1vdmVfaW5vKzB4MjljLzB4MmUwCj4+ICAgICB1
Ymlmc19qbmxfZGVsZXRlX2lub2RlKzB4MTUwLzB4MjYwCj4+ICAgICB1Ymlmc19ldmljdF9pbm9k
ZSsweDFkNC8weDJlNAo+PiAgICAgZXZpY3QrMHgxYzgvMHg0NTAKPj4gICAgIGlwdXQrMHgyYTAv
MHgzYzQKPj4gICAgIGRvX3VubGlua2F0KzB4MmNjLzB4NDkwCj4+ICAgICBfX2FybTY0X3N5c191
bmxpbmthdCsweDkwLzB4MTAwCj4+ICAgICBpbnZva2Vfc3lzY2FsbC5jb25zdHByb3AuMCsweGE4
LzB4MjYwCj4+ICAgICBkb19lbDBfc3ZjKzB4YzgvMHgxZjAKPj4gICAgIGVsMF9zdmMrMHgzNC8w
eDcwCj4+ICAgICBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEwOC8weDExNAo+PiAgICAgZWwwdF82
NF9zeW5jKzB4MWE0LzB4MWE4Cj4+IAo+Cj4gTG9va3MgbGlrZSB0aGVyZSBpcyBvbmUgcG9zc2li
aWxpdHk6Cj4gMS4gdG5jX2luc2VydCgpIHRyaWdnZXJzIGEgVE5DIHRyZWUgc3BsaXQ6Cj4gICAg
enJvb3QKPiAgICAvCj4gICB6X3AxCj4gICAvCj4gem4KPiAgIHpfcDEgaXMgZnVsbCwgYWZ0ZXIg
aW5zZXJ0aW5nIHpuX25ldyhrZXkgb3JkZXIgaXMgc21hbGxlciB0aGF0IHpuKSB1bmRlciB6X3Ax
LAo+ICB6bi0+cGFyZW50IGlzIHN3aXRjaGVkIHRvIHpfcDIsIGJ1dCB6bi0+Y3BhcmVudCBpcyBz
dGlsbCB6X3AxOgo+ICAgIHpyb290Cj4gICAgLyAgICBcCj4gICB6X3AxICB6X3AyCj4gICAvICAg
ICAgXAo+IHpuX25ldyAgIHpuCj4gMi4gdG5jX2RlbGV0ZSgpIHJlbW92ZXMgYWxsIHpub2RlcyBl
eGNlcHQgdGhlICd6bic6Cj4gICAgenJvb3QKPiAgICAgICBcCj4gICAgICAgel9wMgo+ICAgICAg
ICAgXAo+ICAgICAgICAgem4KPiAgICAgVE5DIHRyZWUgaXMgY29sbGFwc2VkLCB6cm9vdCBhbmQg
el9wMiBhcmUgZnJlZWQ6Cj4gICAgIHpyb290Jyh6bikKPiAzLiBnZXRfem5vZGVzX3RvX2NvbW1p
dCgpIGZpbmRzIG9ubHkgb25lIHpub2RlKHpuLCB3aGljaCBpcyBhbHNvIHpyb290KSwKPiB6bi0+
Y3BhcmVudCBpcyBub3QgdXBkYXRlZCBhbmQgc3RpbGwgcG9pbnRzIHRvIHpfcDEod2hpY2ggd2Fz
IGZyZWVkKS4KPiA0LiB3cml0ZV9pbmRleCgpIGFjY2Vzc2VzIHRoZSB6bi0+Y3BhcmVudC0+emJy
YW5jaCwgd2hpY2ggdHJpZ2dlcnMgYW4gVUFGIQo+Cj4gVHJ5IGZvbGxvd2luZyBtb2RpZmljYXRp
b24gdG8gdmVyaWZ5IHdoZXRoZXIgdGhlIHByb2JsZW0gaXMgZml4ZWQ6Cj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL3RuY19jb21taXQuYyBiL2ZzL3ViaWZzL3RuY19jb21taXQuYwo+IGluZGV4IGE1
NWUwNDgyMmQxNi4uN2M0M2UwY2NmNmQ0IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3RuY19jb21t
aXQuYwo+ICsrKyBiL2ZzL3ViaWZzL3RuY19jb21taXQuYwo+IEBAIC02NTcsNiArNjU3LDggQEAg
c3RhdGljIGludCBnZXRfem5vZGVzX3RvX2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAg
ICAgICAgICAgICAgICAgem5vZGUtPmFsdCA9IDA7Cj4gICAgICAgICAgICAgICAgIGNuZXh0ID0g
ZmluZF9uZXh0X2RpcnR5KHpub2RlKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFjbmV4dCkgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHViaWZzX2Fzc2VydChjLCAhem5vZGUtPnBhcmVudCk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgem5vZGUtPmNwYXJlbnQgPSBOVUxMOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHpub2RlLT5jbmV4dCA9IGMtPmNuZXh0Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICB9CgpZdXAsIEkgdGhpbmsgdGhp
cyBpcyBpdCEgTmljZSB3b3JrIQoKSSd2ZSBzdGFydGVkIGEgdGVzdCBydW4gd2l0aCB0aGUgZm9s
bG93aW5nIHBhdGNoOgoKZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3RuY19jb21taXQuYyBiL2ZzL3Vi
aWZzL3RuY19jb21taXQuYwppbmRleCBhNTVlMDQ4MjJkMTYuLjRjODE1MGQ1ZWQ2NSAxMDA2NDQK
LS0tIGEvZnMvdWJpZnMvdG5jX2NvbW1pdC5jCisrKyBiL2ZzL3ViaWZzL3RuY19jb21taXQuYwpA
QCAtNjU3LDYgKzY1NywxMSBAQCBzdGF0aWMgaW50IGdldF96bm9kZXNfdG9fY29tbWl0KHN0cnVj
dCB1Ymlmc19pbmZvICpjKQogCQl6bm9kZS0+YWx0ID0gMDsKIAkJY25leHQgPSBmaW5kX25leHRf
ZGlydHkoem5vZGUpOwogCQlpZiAoIWNuZXh0KSB7CisJCQl1Ymlmc19hc3NlcnQoYywgIXpub2Rl
LT5wYXJlbnQpOworCQkJaWYgKHpub2RlLT5jcGFyZW50KSB7CisJCQkJcHJpbnRrKCIlczolZFxu
IiwgX19mdW5jX18sIF9fTElORV9fKTsKKwkJCX0KKwkJCXpub2RlLT5jcGFyZW50ID0gTlVMTDsK
IAkJCXpub2RlLT5jbmV4dCA9IGMtPmNuZXh0OwogCQkJYnJlYWs7CiAJCX0KCmFuZCBjYW4gYWxy
ZWFkeSBzZWUgdGhhdCB0aGUgcHJpbnQgaGl0IGEgY291cGxlIG9mIHRpbWVzIGluIGEgZmV3IGhv
dXJzCigyNTAgaXRlcmF0aW9ucykuIEknbGwgbGV0IGl0IHNwaW4gZm9yIGEgbGl0dGxlIGxvbmdl
ciAocmVjYWxsIHRoYXQgdGhlCm90aGVyIHBhdGNoICJtYXNrZWQiIHRoZSBwcm9ibGVtIGZvciBh
bG1vc3QgODAwIGl0ZXJhdGlvbnMpLgoKVGhpcyB3YXMgcXVpdGUgaW50cmljYXRlIGFuZCBJIHJl
YWxseSBlbmpveWVkIHlvdXIgbGl0dGxlIGJyZWFrZG93bi4KVGhhbmsgeW91IHZlcnkgbXVjaCBm
b3IgdGhlIGRpc2N1c3Npb25zL2NvbGxhYm9yYXRpb24hIEknbGwgbGV0IHlvdSBub3cKYXMgc29v
biBhcyBJIGhhdmUgYW4gdXBkYXRlZCB0ZXN0IHJlc3VsdCAoYW5kIHRodXMgc2VuZCBhIG5ldyB2
ZXJzaW9uKS4KClAuUwpJIHdvbmRlciBob3cgbWFueSBzeXN0ZW1zIHRoYXQgbWlnaHQgaGF2ZSBl
eHBlcmllbmNlZCB0aGlzCnVzZS1hZnRlci1mcmVlIGFuZCBnb3QgcmFuZG9tIG1lbW9yeSBjb3Jy
dXB0aW9ucyAob3Igb3RoZXIgc2VjdXJpdHkKaXNzdWVzKS4gVGhpcyBidWcgaGFzIGJlZW4gdGhl
cmUgc2luY2UgdjQuMjAuCkQuUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
