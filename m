Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322DD609B9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2024 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3EBirXkCrbV9o0PHHJl+a5KELxALh2xdBUKfnkZrr8=; b=W3XANbfh8c1ySD
	CiYBgnxdO6zfCq3xJmjiUttIQSUgTuO5dl7Jbms8TMetmLDIrNY8rEWK0niu092ZfWwB+7yeji1NH
	HJi8cKEKz9uQQk9/OVDzTGEKVFqOweVMvZeTf3mLQOZrnsNkkAVn/agtQmHknt+rCSrFTjIFnsyvD
	NiXu3O3b5i4A6rbfP15Rq81v/hQ3GnGBeMicTiQsnu6AzNf+GT9XtVAVXT8AkhTomNkRyDVVXaUEl
	ZWDiYzFylIXF5/PZ1x8NfnWsXEqgK2q8pIpRNLJDoRUkDVW/cAAU4gX+Ro4jKcYIk4YBt2zEfLwY+
	eYFQiNrO9PijaM32F9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE4z-0000000CfgX-2cO1;
	Wed, 27 Nov 2024 09:11:25 +0000
Received: from mail-db8eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2614::609] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE4v-0000000CfdX-282T
	for linux-mtd@lists.infradead.org;
	Wed, 27 Nov 2024 09:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kndd0W8jJbWCpNopnQAGAxKVXqtWcDpXP6e/iIVDM/OKHGZFFHD1X/cYT+Fl5PAaUQ8gMQ0yn0B+KP+KHkY5uz9b9DNr0iE9Erq3CtZsYfRs52rTcBalKxe+jPoS/Sfsc42gnd9zR3c1Z8gXRXa7oQjcfVK7EkydaGT9M/N6HFVH00N+bUIXd//Sb782GzDM2iD6h1cN8Dwd8jFUMGq3C0MWfjJd0kfp6GHS0JXRGOC9ZncGO5qJblK7gOdmoU6TJ82i1QnzBSHp0kejotfRyFIVibwxnH8eJNcUPdsMLGiXcXu0wz/f/03dZecDWzVjzUtyynY4vtc7KZeXfsAbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiRNd/+OjIQrYCwRa0mePankLSnY5EcvqqV+5AGNlxw=;
 b=kZZjuOGvbqtP00KS+pezQB4zDtRhK04ZbxV6DYAW4PYvTNJUmnG8orcMhecQI7oAl/q37HXK2zp2XwiBlEb+jFQ45fzArEeWWqUwh1z1iyRRK1IUeQpWVa7Gfxnbf+8BCefzJ9Nqj2ZO8PcmqVMgpYuZTZSOVrLteNIT9epkIzqPpUMgCRaGxKzOGMwicIVVBgjKPxq87jwRtjWHdF2Cqi5bEy3YDfUBEQTbIUG+0EHg2oW+OCoRCLdn/WhbNu0QUVYrDClQoChk/zzvL5Pq4vmb5FsluisqrsqvC9nndsGBnLqiGCQuo8Nn3+FwlVFj9zZAYq75EgD+D+uZm56D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiRNd/+OjIQrYCwRa0mePankLSnY5EcvqqV+5AGNlxw=;
 b=N0FD8WsRihmq2hBO4LQaqcRbNhkATdvX0xgMgPaaOmdUyNh+XcC+AXPOgdSccH35XmwZo6Ju+ZKG8K7i1p3ZPd827o7V0r46RUz2120ZFfsOPm4HFPIS53mpxpOnT6vNXF1r93W7ZWua8weV0l8SLdMUhGvxUSGaOgD8BWjW5rg=
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by DB4PR02MB8510.eurprd02.prod.outlook.com (2603:10a6:10:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 09:11:13 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::25) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 09:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 09:11:13 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 10:11:11 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 2/2] ubi: Implement ioctl for detailed erase counters
Date: Wed, 27 Nov 2024 10:10:50 +0100
Message-ID: <20241127091050.1254359-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241127091050.1254359-1-rickard.andersson@axis.com>
References: <20241127091050.1254359-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DB4PR02MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: feee3140-14ae-496e-07e2-08dd0ec370fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdmRytIenlOMGpCSUx4SUFNTEt6bmhOMFZIbmI4MUlqQ3dWVUErckp6REFj?=
 =?utf-8?B?WklYTFN0NXBzTDZmczNRalRoZ3hDMjVDS2NCYnVpQytINjJpdjhFWDUxYTA1?=
 =?utf-8?B?VEY3SjNydXJqd0JDOFZhd29mQkgrYVg0T3RhTzA0eFgrOW1xWkFPVWFVdVN2?=
 =?utf-8?B?eUpPOVRSS0ZuNW5hZW9UUlZhN0ZtaU5tYTg5Vnp4OGg4WFd5clFqMThlVTVQ?=
 =?utf-8?B?SThXZGxjVGM4am96dTR1R1kra2xRTnpoTFBudStybW1xZzNOYkU3NjdmcVo2?=
 =?utf-8?B?WWtsOGtJL3JIVDYwZGZzSkl1eWd4RzZqS1NhMHZmOXFtK1cwbzlLM0dCc0Vs?=
 =?utf-8?B?Tk5MS3J0Z2NNeFNQYmdQYW5rNWhMcTVXVndTdnA1TUUxTzgwTXBNQndmTjVz?=
 =?utf-8?B?Uk1PTzhqUWEvZ3dCMERHNlEyMG44NFlsWGxJaTZFcVF0cVYrdytkU0ZyRzFT?=
 =?utf-8?B?MnZNb0lWdURpYS8vNjQrZWZIaXU3a2VoQS8wYmF0SGxRMVBWVE1pRGMrNXE1?=
 =?utf-8?B?R29jZEY0em16YkI2K3M0SWVMTlR1TUF5dUQ0NnFaUHZ6dXNpZGNmcFRqemtq?=
 =?utf-8?B?Q3lyU1p3SjhHdmNMaW4wemRzcmwzVnkyRVI1cnkyaXo5Nkl4bkYzRnp4L0Rp?=
 =?utf-8?B?RHR1d0daa0Z6SlhBNitvL214T3p2M0RrNGp5K2V3cHJvcGhwOW9iZm9DTE1Y?=
 =?utf-8?B?cVB0R282TXhJSHFaaytxdVNzbnhEUHdEam83VEJUSWZJb2x3SzVheVJ1bG9y?=
 =?utf-8?B?OU8vMVJZS3RmaHowamtHVitYc3RySWs4UXhOT1o1ZUJDVW4rYk9JUHJ4WWdI?=
 =?utf-8?B?SWk5UlRMM3hueDRJOEpQa045WEtra3Y5MjBlcENDaGxOUFNTUmNoMjNHZmVk?=
 =?utf-8?B?cmZ3ZzBhV2VSU3dIZFpzMFJrcjlnblVUL3NxMVNBaExBVTFzczNTT3JlSFdG?=
 =?utf-8?B?NXZ1blI4bHYwZ3JBODFZdlpZYmZlaE82ZDhHVk5zMmsvNzVFc3czZTVjNmEv?=
 =?utf-8?B?L2Y3Y09HQW41UlVKdk5JWitseDlYQkp5MUJZMFdtbStHdFFLdldacWJCSWlF?=
 =?utf-8?B?US9PK1BoL1BtT3FnZHFFVXJkS3NTZkNKV29tMXdkZlpHVkhDZWE4OURMNGdt?=
 =?utf-8?B?UHFDRDBRMlVPdnkyZ1M1Sk9IYXF2VmNua0I2MG1hWlY0TDdyN09OdGNtdVov?=
 =?utf-8?B?eU5OYUoxWHBwT1paYlh4bERGY0V6am80eWNoRHEyVTZhMXMzT0RybFpqNGZ1?=
 =?utf-8?B?WW9aZ3YrUmsremZtYXVPNStOTEI5N25aSFRpdnY5NXVrOE1lSm83a2xYNFR3?=
 =?utf-8?B?a01DbG56Qk0xWnQ2Q1dIWC90ZldjOXo1R2Q4RWF4ZmVvK1N6V2x3RWs2Q1RQ?=
 =?utf-8?B?UW14dkpScEtNWFQwc3ZjQVpMbG9GNEhwUHhZaEJaMC9rRWpVMWNMMnRSVEc1?=
 =?utf-8?B?aDlqby9xUHJRSG9yckJVVFh2OUlQSWFvMUk0dHJJOW9WTlFyNXNVQmhsR1hk?=
 =?utf-8?B?dGVsUFNpL3lhM0tpbEd2dWNrcFE1Y2NHOXZxbExUcFZhZ3lhSTh1cncyRGx6?=
 =?utf-8?B?dmgrNk5kK2hmdUtRWkVsSDdMUnh5VjJoVkQ0SzM2QWJlNXkxa21TcEs4amJ2?=
 =?utf-8?B?YVNUbjhQc2ltOENNcnNhTGhQWDliYzFFOGR4eTNwQ2ErbWZzdUYrQUZKMWJJ?=
 =?utf-8?B?SWUxZ1NiVk85WGJYa1B5b0hKYjhMMHFIKzhkQXJldHFXVUVSZWpkdGNhSXBG?=
 =?utf-8?B?bUN3VUZwRGtiNWlzWUNZSmszdDFXamFVWWMyY0FIU0FobG1odWd3b21veUxV?=
 =?utf-8?B?azV3aktETHlHVnR6RDcwdWRwdlhQQjlaRTE1aTE3S01BWWNKY3BHbHhTOFVm?=
 =?utf-8?B?YllzSEN3cXhYalU5ejUvZ3N4WXVqNXRHaGV0MlJ6TEZXNVNVSFdid2t3ak45?=
 =?utf-8?Q?cuJbTwEJrEE5+4jCdOt5A93SZMJuy/u+?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 09:11:13.2699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feee3140-14ae-496e-07e2-08dd0ec370fa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_011121_546744_B563939E 
X-CRM114-Status: GOOD (  17.20  )
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

Q3VycmVudGx5LCAibWF4X2VjIiBjYW4gYmUgcmVhZCBmcm9tIHN5c2ZzLCB3aGljaCBwcm92aWRl
cyBhIGxpbWl0ZWQKdmlldyBvZiB0aGUgZmxhc2ggZGV2aWNl4oCZcyB3ZWFyLiBJbiBjZXJ0YWlu
IGNhc2VzLCBzdWNoIGFzIGJ1Z3MgaW4KdGhlIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtLCBzcGVj
aWZpYyBibG9ja3MgY2FuIGJlIHdvcm4gZG93biBtb3JlCnRoYW4gb3RoZXJzLCByZXN1bHRpbmcg
aW4gdW5ldmVuIHdlYXIgZGlzdHJpYnV0aW9uLiBBbHNvIHNvbWUgdXNlIGNhc2VzCmNhbiB3ZWFy
IHRoZSBlcmFzZSBibG9ja3Mgb2YgdGhlIGZhc3RtYXAgYXJlYSBtb3JlIGhlYXZpbHkgdGhhbiBv
dGhlcgpwYXJ0cyBvZiBmbGFzaC4KUHJvdmlkaW5nIGRldGFpbGVkIGVyYXNlIGNvdW50ZXIgdmFs
dWVzIGdpdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZgp0aGUgb3ZlcmFsbCBmbGFzaCB3ZWFy
IGFuZCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBjYWxjdWxhdGUgZm9yIGV4YW1wbGUKZXhwZWN0
ZWQgbGlmZSB0aW1lLgpUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRlYnVnZnMs
IGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCm9ubHkgYXZhaWxhYmxlIGZvciBkZWJ1ZyBidWlsZHMu
CgpTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlja2FyZC5hbmRlcnNzb25AYXhp
cy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8IDk2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYwppbmRleCAwZDhmMDRjZjAzYzUuLjY4MWNmODUyNmUyZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2NkZXYuYworKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCkBAIC04Mjgs
NiArODI4LDk2IEBAIHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwKIAlyZXR1cm4gZXJyOwogfQogCisKK3N0YXRpYyBpbnQgdWJpX2dldF9lY19pbmZvKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfZWNpbmZvX3JlcSBfX3VzZXIgKnVyZXEp
Cit7CisJc3RydWN0IHViaV9lY2luZm9fcmVxIHJlcTsKKwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3
bDsKKwlpbnQgaTsKKwlpbnQgcGViOworCWludCBlbmRfcGViOworCWludCBlcnIgPSAwOworCWlu
dCBtYXhfZWxlbTsKKwlpbnQzMl90ICplcmFzZV9jb3VudGVyczsKKworCS8qIENvcHkgdGhlIGlu
cHV0IGFyZ3VtZW50cyAqLworCWVyciA9IGNvcHlfZnJvbV91c2VyKCZyZXEsIHVyZXEsIHNpemVv
ZihzdHJ1Y3QgdWJpX2VjaW5mb19yZXEpKTsKKwlpZiAoZXJyKSB7CisJCWVyciA9IC1FRkFVTFQ7
CisJCWdvdG8gb3V0OworCX0KKworCS8qIENoZWNrIGlucHV0IGFyZ3VtZW50cyAqLworCWlmIChy
ZXEubGVuZ3RoIDw9IDAgfHwgcmVxLnN0YXJ0IDwgMCkgeworCQllcnIgPSAtRUlOVkFMOworCQln
b3RvIG91dDsKKwl9CisKKwltYXhfZWxlbSA9IHJlcS5sZW5ndGg7CisKKwkvKiBXZSBjYW4gbm90
IHJlYWQgbW9yZSB0aGFuIHRoZSB0b3RhbCBhbW91bnQgb2YgUEVCcyAqLworCWlmIChtYXhfZWxl
bSA+IHViaS0+cGViX2NvdW50KQorCQltYXhfZWxlbSA9IHViaS0+cGViX2NvdW50OworCisJLyog
Q2hlY2sgZm9yIG92ZXJmbG93ICovCisJaWYgKHJlcS5zdGFydCArIG1heF9lbGVtIDwgcmVxLnN0
YXJ0KSB7CisJCWVyciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0OworCX0KKworCWVyYXNlX2NvdW50
ZXJzID0ga21hbGxvY19hcnJheShtYXhfZWxlbSwKKwkJCQkgICAgICAgc2l6ZW9mKGludDMyX3Qp
LAorCQkJCSAgICAgICBHRlBfS0VSTkVMKTsKKwlpZiAoIWVyYXNlX2NvdW50ZXJzKSB7CisJCWVy
ciA9IC1FTk9NRU07CisJCWdvdG8gb3V0OworCX0KKworCWVuZF9wZWIgPSByZXEuc3RhcnQgKyBt
YXhfZWxlbTsKKwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQorCQllbmRfcGViID0gdWJp
LT5wZWJfY291bnQ7CisKKwlpID0gMDsKKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5k
X3BlYjsgaSsrLCBwZWIrKykgeworCQlpbnQgZWM7CisKKwkJaWYgKHViaV9pb19pc19iYWQodWJp
LCBwZWIpKSB7CisJCQllcmFzZV9jb3VudGVyc1tpXSA9IFVCSV9VTktOT1dOOworCQkJY29udGlu
dWU7CisJCX0KKworCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CisKKwkJd2wgPSB1YmktPmxv
b2t1cHRibFtwZWJdOworCQlpZiAod2wpCisJCQllYyA9IHdsLT5lYzsKKwkJZWxzZQorCQkJZWMg
PSBVQklfVU5LTk9XTjsKKworCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKworCQllcmFz
ZV9jb3VudGVyc1tpXSA9IGVjOworCX0KKworCS8qIFJldHVybiBhY3R1YWwgcmVhZCBsZW5ndGgg
Ki8KKwlyZXEucmVhZF9sZW5ndGggPSBpOworCisJLyogQ29weSBldmVyeXRoaW5nIGV4Y2VwdCBl
cmFzZSBjb3VudGVyIGFycmF5ICovCisJaWYgKGNvcHlfdG9fdXNlcih1cmVxLCAmcmVxLCBzaXpl
b2Yoc3RydWN0IHViaV9lY2luZm9fcmVxKSkpIHsKKwkJZXJyID0gLUVGQVVMVDsKKwkJZ290byBv
dXRfZnJlZTsKKwl9CisKKwkvKiBDb3B5IGVyYXNlIGNvdW50ZXIgYXJyYXkgKi8KKwlpZiAoY29w
eV90b191c2VyKHVyZXEtPmVyYXNlX2NvdW50ZXJzLCBlcmFzZV9jb3VudGVycywgbWF4X2VsZW0g
KiBzaXplb2YoaW50MzJfdCkpKQorCQllcnIgPSAtRUZBVUxUOworCisgb3V0X2ZyZWU6CisJa2Zy
ZWUoZXJhc2VfY291bnRlcnMpOworIG91dDoKKwlyZXR1cm4gZXJyOworfQorCiBzdGF0aWMgbG9u
ZyB1YmlfY2Rldl9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKIAkJ
CSAgIHVuc2lnbmVkIGxvbmcgYXJnKQogewpAQCAtOTkxLDYgKzEwODEsMTIgQEAgc3RhdGljIGxv
bmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJ
CWJyZWFrOwogCX0KIAorCWNhc2UgVUJJX0lPQ0VDTkZPOgorCXsKKwkJZXJyID0gdWJpX2dldF9l
Y19pbmZvKHViaSwgYXJncCk7CisJCWJyZWFrOworCX0KKwogCWRlZmF1bHQ6CiAJCWVyciA9IC1F
Tk9UVFk7CiAJCWJyZWFrOwotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
