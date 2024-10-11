Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89BCD0D786
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QufIkkAAUWR0S30Qu4OSSfpHIQ7U4+zy3wW6rQ45PDI=; b=Auj68iEX4RaSzo
	BklkyV6Pw0lgToClbe9akUKIq+jKLdR2G3VwH1m5HDNeEpym7ss1r87EGD/OwlK1Zj4VEG2tgwvV9
	18hK2FOdOlaAOZPdK5gcvYz0U3R7QUqtAqIhQm/HvNtxp/We1DMoUx53Njf0lJfcSHYE99BLBdjtt
	yzNNoC/E5HLhuRvQc9tNoty41cb3kss888BH1GuEOiLA2ga5b29Pp89s/qH5eySJCwr6p8VYHUlTK
	moISLCMd8nN4+1kMvKvFjl5wl0ZaYT4zC9mMQhDQOoQhieZcAUqI8sTq3SdV9qzq8WE+Kfi3qoaRs
	xLaSKZlUAdNYQ+gH3yNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGf-0000000GNKd-1Hhb;
	Fri, 11 Oct 2024 13:01:17 +0000
Received: from mail-vi1eur05on20623.outbound.protection.outlook.com ([2a01:111:f403:2613::623] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFF7-0000000GN9J-1UV9
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEYTl4/+lOkja6GLFdwCkq624wM/75si8N/VdkmSRnBAdra1+y32qnVohWS5UBbTonUd1MX4xz1/TiJlbsY7pMTnoBfc0PUdCVOPnGQiKKjX9FhU6hlqZ9G2BkHowNh1eUkdP1oo3nMm+1zAJGAiE6/G0YmQpX0jqLxdKt0MAIPvg/8Ltx+HmgaRHvfSpYdARVIyQAgxR3QEuSiUOWAUEX5Tw3CaP1IsZXaydqvBfedyLO62nyvNNR6UzdXLLSbqCcExnzBfUtYDdW2eeE+p0fnqNojaFjfKLtiYjsGqveQLH1iIMGKOewwxqUbTvOTooRdQ0RNiTWItOydGxyfXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePJo+YH6xkbXpK17Q2z9SnNytDpsAXkh4w8DwIGy3Jc=;
 b=MmX1jGNiFggrR25jUA+xoet9P9ZkRk9pHT1xh7uGU9iB0tB5INGUHcKPX0BT42sZ/1QKysXM5WAspSzQDhE1N9MeuVf17ut5bH7Y9iEF5n2WZhrC+NGzetRVr1M1Ma94NuZ9XneJpPBjzxRat2TcgR8pgujYKj2SpOUwbO7T+XHw0TlfFgee2kuMO2rZNsUwzVRLhQ1CucSNxHjsUSmToeYdiC8CqJWY6fQRg9WGuRiA2ip6HmRq/wAECWU4Zu0c74791iIo046stmBPZdgDEJAVVXo9rGOpkGAF6QuJFf4y7ANawFxieZPCk9WwX50quidNcZmqcymydJ3WxOTNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePJo+YH6xkbXpK17Q2z9SnNytDpsAXkh4w8DwIGy3Jc=;
 b=kb4n2/yHfWYUrg7KwpdaqmaeyWg064qHb62jXKJWlokuEubD983YpJCGV/B47sFIW7EqsZp4XarqTLo/bEM8yoJDQv4POgN5weax/hSPFsiVH8fhAbKtZWiwzga0cXjf3KeL5ot75WnHsPIJ3qJluDI7p9FQ9N1OPQwxrVPMDho=
Received: from DUZPR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::25) by VI1PR02MB6256.eurprd02.prod.outlook.com
 (2603:10a6:800:19a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:59:34 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::87) by DUZPR01CA0163.outlook.office365.com
 (2603:10a6:10:4b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:33 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:32 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
Date: Fri, 11 Oct 2024 14:58:55 +0200
Message-ID: <20241011125904.2915983-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|VI1PR02MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 542d1109-8e70-4d0f-d458-08dce9f48db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1NKUXJKRnhET1dCVk82c2VEQkRUVWFPa3haV2RVdnRNcmpWK1l3UmJMM3p4?=
 =?utf-8?B?M1VUZkV6T1lLaTNXblpYd3dHS2ltOCt0ams2N3pjSHlxb3E1RUswU3FmTzQ3?=
 =?utf-8?B?YnB1QmlGUE1rYlEzeHVYcWRVcjI0WS9hQndwYkFyVC9CM1pzZG8xWTBjMEor?=
 =?utf-8?B?cVdpbHU2ZDMyVkl5QmlhTE9XQXJ1QVZFNDZ6RjhYRVRpWjU5djBaWkZVWnRL?=
 =?utf-8?B?UmwwQ1dNWFIrUW5nNFdTS3UxNFdrQ3MrVDAxLzJWaE5ORjJHbitmMldXbkhv?=
 =?utf-8?B?b0sra3B0bURoL09WL3RUY3IxV0x3YXVVVkpoa1MxUW1CenR3Zkh4YkpEZ1cw?=
 =?utf-8?B?MVBsdWw3WFdPRlR3U2VoRHJNZm5vdUU5NkpHOXNGbGJLeEJtdWhEMGJtS2Ft?=
 =?utf-8?B?WFgzQjUrbktpM1JMZlROTHQraHRDYjg4U053N3lReHJjR0tRUVptdmVxV3J4?=
 =?utf-8?B?SmRGaENxKzRuWnd6TFJ0YktuL2VGM2psMmRxWWZHdTdUeGt0VlJuNW4rNFpk?=
 =?utf-8?B?eGo3Vm96WGRjRXdGQ1pTbTl0YVVhcC8yRkROL243SElacUJxTzc5STh6TUda?=
 =?utf-8?B?VWpBd1NPamJPUGd2MWUybjRvS2NoeHpSczNtY2pNWGN3c1pqRTZDbEJYUlBu?=
 =?utf-8?B?NXF6Q0N2RTJoWWVvRTY3SUZHaHNPcDJ5emF2dWpxQ2plY2dZVlRJYWNWUzBC?=
 =?utf-8?B?c1JNUHd0OWRvSkNyVmltQmxWV2Fvd3ZFS1lMRXJ2eHVVa3lPRmdlbzJ1cVIx?=
 =?utf-8?B?UE1KbHZyMTRod0lTSmFhSWVnUDhIeW50THkvb00rOHFBOWZrSkdtUmpRK2FX?=
 =?utf-8?B?MXpsQnZhTklSTkFDRUMyd0RDei83ZDJabnBvbU5xWlhrY3J3SUFyRjdMTjZB?=
 =?utf-8?B?cTNsR3lxN2tCTmFpRFJ6R1dHWVEwaGkyY3grYXQ5eXdDYmR2TkRDUnRDWkli?=
 =?utf-8?B?S08rcGtpeDJJaUFHcm5VRy9RZmR0TWQrcGxHZDY2c2VWS2IyMTBnRDdXNXU3?=
 =?utf-8?B?UGZWUzlydHpEUUppb0NrL0hDRy9yeWV1ay9YYkVWQ1RpVlZKYzZGa2MyV2J1?=
 =?utf-8?B?RXpmdG9FaFdtY3ZQUnlyY2NQa1pEOS9QMTdoRDJyajBQVmRBWUR2RUpwUlFN?=
 =?utf-8?B?RVk0d2d4SFFFNnhNdHdFY0gyeUxiNEphb1Vlc3pNaGNoRHRvczFyNDRkYlVs?=
 =?utf-8?B?emNlS3NXVGZRT29RRldTT2RJT0FzU3hKMjc3SmFPL1R2NUMvTzgwSkI0eDhY?=
 =?utf-8?B?cmszZHF4TGxGVFpVenVtcXNhLzFMam5pbE1zZGJ6cWc4bjJBQjZZeU95L2N1?=
 =?utf-8?B?SkRQbUpnc2VaV2M5ajQvOGFSQ1QzZnZ5MXhFUytJQmVrZDVCbFpjM3ZCcHNQ?=
 =?utf-8?B?WUdhZysxcnFBd0N1SFAvNkVEQWxWbE5nZEcrazRUWWhZbGp6MWZXd1VscnZL?=
 =?utf-8?B?VDBHQ245L0tIRzR6aml2eVdPYWxXK3EwUHJUTHRWd2U2OEFKU3BKYmpvRUIx?=
 =?utf-8?B?dmc1U1BGenpSZitHb3M1WjdKYVNkUFYyOEhqU01jNk9YbzZkY1I0ckt1aFJ6?=
 =?utf-8?B?Nnhadm16RlhWaFY1VzUzWkpCdnhybUJjeEFBYTdHL016STZ5TlIrLzAxWk5s?=
 =?utf-8?B?ZGZtNTB6WFJUUHFoR0cxUnJRRDFQandseVI4L2ttNkZJZVVZTTJRczdiQlZQ?=
 =?utf-8?B?d2lENEExbTNoK1N1V2M3QjNmdVg0dHVXWWVGei9nbi9LMWlobFM4U2JRNHZG?=
 =?utf-8?B?L1pkN1FEb2Q4WWlKcDdydVJtV051QlhkM25IcWRNZ0pJMzhmblc4bGhFeHFN?=
 =?utf-8?B?TG5yN2dOQWJUbUtTMi9USWdnMTRhOFBmbC9ueWY3aGJ4bExPOUlLdTNGbVRT?=
 =?utf-8?Q?+PsavmLSC/u8E?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:33.8200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542d1109-8e70-4d0f-d458-08dce9f48db9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055941_568149_638281B2 
X-CRM114-Status: GOOD (  15.75  )
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

Q3VycmVudGx5LCBvbmx5ICJtYXhfZWMiIGNhbiBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHBy
b3ZpZGVzIGEKbGltaXRlZCB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNl
cnRhaW4gY2FzZXMsIHN1Y2ggYXMKYnVncyBpbiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0s
IHNwZWNpZmljIGJsb2NrcyBjYW4gYmUgd29ybiBkb3duCm1vcmUgdGhhbiBvdGhlcnMsIHJlc3Vs
dGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIFByb3ZpZGluZyBhCm1lYW4gZXJhc2Ug
Y291bnRlciB2YWx1ZSBnaXZlcyBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBvdmVyYWxs
CmZsYXNoIHdlYXIuClRoZXJlIGV4aXN0cyBtb3JlIGRldGFpbGVkIGluZm8gaW4gZGVidWdmcywg
YnV0IHRoaXMgaW5mb3JtYXRpb24gaXMKb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4K
ClRoaXMgcGF0Y2ggY2FsY3VsYXRlcyB0aGUgbWVhbiB2YWx1ZSBvbmx5IHdoZW4gaXQgaXMgcmVx
dWVzdGVkLiBUaGlzCmNhbGN1bGF0aW9uIHR5cGljYWxseSB0YWtlcyAyLjcgbXMgZm9yIGFuIFVC
SSBkZXZpY2Ugd2l0aCA0MDkxIGJsb2NrcwpydW5uaW5nIG9uIGEgc2luZ2xlIGNvcmUgQ29ydGV4
LUE5IGF0IDc5MiBNSHouCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFA
aHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5k
ZXJzc29uQGF4aXMuY29tPgotLS0KIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgNDYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgYi9kcml2
ZXJzL210ZC91YmkvYnVpbGQuYwppbmRleCBmNTE0MGE3OGE0YTguLjIzMWNhMjg4ZjM5NyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1
aWxkLmMKQEAgLTEzMSw2ICsxMzEsOCBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUg
ZGV2X3ZvbHVtZXNfY291bnQgPQogCV9fQVRUUih2b2x1bWVzX2NvdW50LCBTX0lSVUdPLCBkZXZf
YXR0cmlidXRlX3Nob3csIE5VTEwpOwogc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRl
dl9tYXhfZWMgPQogCV9fQVRUUihtYXhfZWMsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywg
TlVMTCk7CitzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWMgPQorCV9f
QVRUUihtZWFuX2VjLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwpOwogc3RhdGlj
IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9yZXNlcnZlZF9mb3JfYmFkID0KIAlfX0FUVFIo
cmVzZXJ2ZWRfZm9yX2JhZCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKIHN0
YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfYmFkX3BlYl9jb3VudCA9CkBAIC0zMzcs
NiArMzM5LDQ3IEBAIGludCB1YmlfbWFqb3IybnVtKGludCBtYWpvcikKIAlyZXR1cm4gdWJpX251
bTsKIH0KIAorLyoqCisgKiB1YmlfY2FsY19tZWFuX2VjIC0gY2FsY3VsYXRlIG1lYW4gZXJhc2Ug
Y291bnRlciB2YWx1ZS4KKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Cisg
KiBAc3RhcnRfcGViOiBGaXJzdCBQRUIgaW4gdGhlIHJhbmdlCisgKiBAZW5kX3BlYjogRW5kIFBF
QiBpbiB0aGUgaGFsZi1vcGVuIHJhbmdlCisgKgorICogUmV0dXJucyB0aGUgbWVhbiB2YWx1ZSBv
ZiBhbGwgbm9uLWJhZCBibG9ja3Mgb2YgdGhlIGRldmljZSB0aGF0IGFyZQorICogaW4gdGhlIHJh
bmdlLiBSYW5nZSBpcyBoYWxmLW9wZW4gaS5lIGVuZF9wZWIgaXMgbm90IGFjdHVhbGx5IGluY2x1
ZGVkLgorICovCitzdGF0aWMgaW50IHViaV9jYWxjX21lYW5fZWMoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwgaW50IHN0YXJ0X3BlYiwgaW50IGVuZF9wZWIpCit7CisJc3RydWN0IHViaV93bF9lbnRy
eSAqd2w7CisJaW50IHBlYjsKKwlpbnQgZWNfY291bnQgPSAwOworCWludCBtZWFuX2VjID0gMDsK
Kwl1aW50NjRfdCBlY19zdW0gPSAwOworCisJZm9yIChwZWIgPSBzdGFydF9wZWI7IHBlYiA8IGVu
ZF9wZWI7IHBlYisrKSB7CisJCWludCBlcnI7CisKKwkJZXJyID0gdWJpX2lvX2lzX2JhZCh1Ymks
IHBlYik7CisJCWlmIChlcnIpCisJCQljb250aW51ZTsKKworCQlzcGluX2xvY2soJnViaS0+d2xf
bG9jayk7CisKKwkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJdOworCQlpZiAod2wpIHsKKwkJCWVj
X3N1bSArPSB3bC0+ZWM7CisJCQllY19jb3VudCsrOworCQl9CisKKwkJc3Bpbl91bmxvY2soJnVi
aS0+d2xfbG9jayk7CisJfQorCisJaWYgKGVjX2NvdW50ID4gMCkKKwkJbWVhbl9lYyA9IGRpdl91
NjQoZWNfc3VtLCBlY19jb3VudCk7CisKKwlyZXR1cm4gbWVhbl9lYzsKK30KKwogLyogIlNob3ci
IG1ldGhvZCBmb3IgZmlsZXMgaW4gJy88c3lzZnM+L2NsYXNzL3ViaS91YmlYLycgKi8KIHN0YXRp
YyBzc2l6ZV90IGRldl9hdHRyaWJ1dGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQkJICBz
dHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQpAQCAtMzY2LDYgKzQwOSw4
IEBAIHN0YXRpYyBzc2l6ZV90IGRldl9hdHRyaWJ1dGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
CiAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaS0+dm9sX2NvdW50IC0gVUJJX0lOVF9W
T0xfQ09VTlQpOwogCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9tYXhfZWMpCiAJCXJldCA9IHNwcmlu
dGYoYnVmLCAiJWRcbiIsIHViaS0+bWF4X2VjKTsKKwllbHNlIGlmIChhdHRyID09ICZkZXZfbWVh
bl9lYykKKwkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpX2NhbGNfbWVhbl9lYyh1Ymks
IDAsIHViaS0+cGViX2NvdW50KSk7CiAJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X3Jlc2VydmVkX2Zv
cl9iYWQpCiAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaS0+YmViX3JzdmRfcGVicyk7
CiAJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X2JhZF9wZWJfY291bnQpCkBAIC0zOTIsNiArNDM3LDcg
QEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnViaV9kZXZfYXR0cnNbXSA9IHsKIAkmZGV2X3Rv
dGFsX2VyYXNlYmxvY2tzLmF0dHIsCiAJJmRldl92b2x1bWVzX2NvdW50LmF0dHIsCiAJJmRldl9t
YXhfZWMuYXR0ciwKKwkmZGV2X21lYW5fZWMuYXR0ciwKIAkmZGV2X3Jlc2VydmVkX2Zvcl9iYWQu
YXR0ciwKIAkmZGV2X2JhZF9wZWJfY291bnQuYXR0ciwKIAkmZGV2X21heF92b2xfY291bnQuYXR0
ciwKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
