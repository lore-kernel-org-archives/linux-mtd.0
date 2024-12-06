Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692BE77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOg50hG9vw8KnDmQrzOWL6ICL1lUngJxPEC6hht+cc4=; b=muWy/Aw+MK3wvT
	eZ8tBk5IjPj44JJGVYx66b9JYNp4JaqpMvKDYpxfNe9ivTP7PsfPsPYGStQAM6hyKeK4NTwXdbFl4
	jf5ESzekDJojCCNeRcENYjYg0wGG6mrTZ6Ku3WwCRMMOnFW6AeZazt5BQ2LYuDTQy6mQ4fma+rIYO
	+zNx68N/UUv9qhaMQTLP4i9n79aMyYr6kUQCJcpA2Y9mBh1U/Yrrhs2GZ7vUkWqUsQKLVxE3QnMfz
	47CthJ/eIJBMirF375mjVzDEOx/fuHU/H7IzRGO1Ow1Jwk5nnZZDxEyCuE8dFfUw+an86A8zobssB
	xIyPISCXQFasWJNB3jcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWsm-00000001V4H-16gW;
	Fri, 06 Dec 2024 11:52:28 +0000
Received: from mail-db8eur05on2061b.outbound.protection.outlook.com ([2a01:111:f403:2614::61b] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWsJ-00000001V2G-2Nqn
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 11:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEEcglqihc3+xZg5AghThTS8vHmk5QMy9Uau0hVhKXIOjGoD7PObQYv2rl9f3RWkZGvkqPhttjUXy+k3jdnNkzYi5M1gEohwfFL2AXVtAkRt5UT3R4g8/ddJ2DyrF4x0abBiAKsG8qDOaxDoFgezrGYfm6brtY+XttZ5FvAeKpzPR6L6DlNThoNTPeeY1IONeG+EHukHO2eV3UrdP2io03R2vsQgd3w1ehxXoD6ZCZjSgAaWRolyP4Yl5oVJcW7ViELT94bXs1ZoL1nNGpjVHHaHRG5n8RmrnzzRP2jKCCfbO+S/AhjWTaADrQDpbIWMUvmHaBP7n8qb0vW0H4HoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zceAkUobksuFBbFIQwel+uQ3pXjZ6hos/sckszK8MO0=;
 b=yNHdYuxxdmsotwRypNhcsutjninv3LWV5WlcWaZ1XIZmd3MZcqU8m0F18spE0xUWfIpajbEFNAcFpzHCo5YxNPe1GYCUa3RLfEoVr8Cuop6kLzp4mlgNgumlwSGzG9955Mx/hCmcWBP4vB7anDbhLTwWQ7qZ0mQrwY+HUZz0fkL09xIhLuBVsobxR+Z2X5Qs1fe8ZHwYI+mTcH2ZhBbhavzwR0HQWWukKUELaIsiiOE0YtZ/ETUucfDZ8ZDo08zNZhxlAczPa/Ok+a3NRJnb1Jgp+y7VFqGJ0iQA6HDz8nVRo/H5tPolQOKaSqyum616bnLLGmFppueLhZNYVXL8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zceAkUobksuFBbFIQwel+uQ3pXjZ6hos/sckszK8MO0=;
 b=fOSrZFvUOA0hdiVP3moAb+8KtFnHvYuwsx+zIkJMLqubFxX54CDUiWyJDAhaYK6GMn0iIbCVYBxQRBcIONr2tHo0BO7vkCzqg6GVh3u1rhYCSILo5dbV1zPQqcaNPSAHGYe/8WzIBma5OLafeH6T6I1BWsl/+rQ5Ady6QCTjpkA=
Received: from PR0P264CA0282.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::30) by
 DBAPR02MB6279.eurprd02.prod.outlook.com (2603:10a6:10:190::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Fri, 6 Dec 2024 11:51:52 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:100:1:cafe::da) by PR0P264CA0282.outlook.office365.com
 (2603:10a6:100:1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 11:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 11:51:52 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 12:51:51 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
Date: Fri, 6 Dec 2024 12:51:27 +0100
Message-ID: <20241206115127.2304701-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241206115127.2304701-1-rickard.andersson@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|DBAPR02MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 161007bc-852f-4bba-3666-08dd15ec602e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVYzV0VIbUZSdGRZSmNRVklSUXZBQzloRENRMGY5WVgrSklQWnNKNEUvSlZ0?=
 =?utf-8?B?RjFUbHUwTUpGM2xxa2VEUVRnaDgxTTRKZTFwMEh0NGV5K0Nrbmk0WlQ1VjFK?=
 =?utf-8?B?UDZKOG8rUkRrRnVVMDQvaFRLZ2FabjJJZjgrRWU1ZGxhbWRlbklNZUw4cCtL?=
 =?utf-8?B?eDI0dkxIOS9uTmkwVmhoK2h5UnhNTHFxYjNxVkF4RE9jWVI1RWwrTjladUg5?=
 =?utf-8?B?K0ZNblVsYTBFMmNTRHpuelhmYmFUbDMxNzZNMEp0QWZTQU84WXlkdUZJNGs4?=
 =?utf-8?B?RHdXWFNTWFBsWEZxVWcvOTMxQUVhSmNCYlhhcndDcWpjc3B4Z0xWMWZNbVBL?=
 =?utf-8?B?NGFBRHdNVmEvN2VMT0ZmSVBjZlI5OUQ1N0VoQW5DVVJmdHVnWW9qTkhUYVNC?=
 =?utf-8?B?TnlpSjZIU2loN1BIRGUxL093MWxvMGl5YTVtYnBRK0xydm5xL0JyR1VRK0xv?=
 =?utf-8?B?WmdGRTkvNnpPYStLOTFiZW9tRFRDZFhQd1h0Vkh4UlMwTGhmaGJkTGdLb3lF?=
 =?utf-8?B?QUs3M1lQNmk2V0dncmNnL1AyenFLT2Rqd0twQ0dyYmdBNGFOa0c5TTVoNGk0?=
 =?utf-8?B?Uzc3ZitZa2M5bUNLeTRCRG5jRDZrcUtMcS9MMGRzamJWTlNDVDI1Sit1RVJT?=
 =?utf-8?B?OWJOT0hrazJNbkVEYmVQQlVvaWdTRUUyZHl2bjVUd1B1TXdHaEVrQ0M0S2FK?=
 =?utf-8?B?TTFZcTV3QXZzSTcvclI0VmRVNXc3T0hSSzlZaldPVWxjbjdUcFUxZjN5L3Vm?=
 =?utf-8?B?TUxndHVFVjN3em9CYkhvVW5WMEFBU0crc2NSL3g1Tjk3ZTBRcmJDZW9zenFC?=
 =?utf-8?B?S3pZb045ZGcwYmxDRGxhY0puSStWcFF5Z2xLNC9uR3gzZktZZ1orVHEzWTZo?=
 =?utf-8?B?WVNDNHFieDNlaWZod1ZGbWFBSVJXenlQeFFGTWt5MHczSTMvMXVxMldSeHVJ?=
 =?utf-8?B?aktFd0Rpb0dkWUgxdUUyd1IwWHVoZC9GVXRGcFZQZjNIeXp4N0cydzlPaysw?=
 =?utf-8?B?anlTMDQ1WFhtbCtZM0l0MnY0eW1DdkVrdkNvU0g3ZW1idS9zZHByL0NWRHVk?=
 =?utf-8?B?bWlGWHIrR0ZLWVdqRVd1MXgybnBSM3doL1FRRHpYMWorb1pIRjhRQStTazJI?=
 =?utf-8?B?bVVoU01USm5ka0ZBbHFRd2VlcVFhQmQvTUJUaFAzT0VIVCs4UUVndWdicU9R?=
 =?utf-8?B?bkZoUUNpMUZVdW9FUWwrTHhReS9DdnluRzFwdGZKMHN0UlVjeFNiWUNlNDJx?=
 =?utf-8?B?QlFydmVXcHN3WmNjUnNNNk43V2FETkFwbHN1bW9RQXo2UkZiU1NJeW53VVVn?=
 =?utf-8?B?QU1SbFBCTHN6bTh4VkpQY3duK3VQbllwdUx3bWNlaXgvWW1tOVJvcWRnN0pQ?=
 =?utf-8?B?b3J1cUczL05NWHhINzhGcVVqdDRxRER2S05xamduRVR1dGhNNnBJOFM2T09o?=
 =?utf-8?B?ZGQvUTNkTjRhZEtPb014UHRORW1zSGVwM1FjSGdDc0pLQWpzc1N4WURCTmxP?=
 =?utf-8?B?eE5YcncxbXhUaThnc2dPRG1PcFNRM1l4WVJ1dTdYZWs1N2VEN052TWQ5YW1I?=
 =?utf-8?B?WlBCczlzU1Q3MkxpR2pSbldubWtib3ZxaDhhRFc4bGVxNGthMHFESDlVOFkv?=
 =?utf-8?B?MVNmNmVnZXRDcXc1dlNTZy9yVkpYdncyYkRxeG5yY01ud2hXMmlkY0llM1VE?=
 =?utf-8?B?WTNodnJlTlpWRmYyYi85ZkUzR1FzZnBCbTNvNzJMRXFKUzR4SkdBSTlWdzc2?=
 =?utf-8?B?M0dCVG1aeWxqY0NOL1l1N3Vsa041WUFnQVhuZVNOYlFHTGJ4RU1sS2pOVEhN?=
 =?utf-8?B?MFlLcjJSWC9uOERjSkxsV2xseVFPeTljM2JwWExFMkdyOEoyRDNuZWt2YnZN?=
 =?utf-8?B?MG5RQllrQjV3UTBnMDh2TnkyRXZ3UWpyeHV1YVVTWnUwTEVPaVVOb0dsSFFN?=
 =?utf-8?Q?cpWccOPkyyhpop/+J0HsjrzaJCdjOJsY?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 11:51:52.6272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161007bc-852f-4bba-3666-08dd15ec602e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_035159_722997_4D649C7F 
X-CRM114-Status: GOOD (  14.26  )
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
cy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8IDcyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYwppbmRleCAwZDhmMDRjZjAzYzUuLmJjZGM0NzM3NDU3OCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2NkZXYuYworKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCkBAIC04Mjgs
NiArODI4LDcyIEBAIHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwKIAlyZXR1cm4gZXJyOwogfQogCitzdGF0aWMgaW50IHViaV9nZXRfZWNfaW5mbyhzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgX191c2VyICp1cmVxKQor
eworCXN0cnVjdCB1YmlfZWNpbmZvX3JlcSByZXE7CisJc3RydWN0IHViaV93bF9lbnRyeSAqd2w7
CisJaW50IGk7CisJaW50IHBlYjsKKwlpbnQgZW5kX3BlYjsKKworCS8qIENvcHkgdGhlIGlucHV0
IGFyZ3VtZW50cyAqLworCWlmIChjb3B5X2Zyb21fdXNlcigmcmVxLCB1cmVxLCBzaXplb2Yoc3Ry
dWN0IHViaV9lY2luZm9fcmVxKSkpCisJCXJldHVybiAtRUZBVUxUOworCisJLyogQ2hlY2sgaW5w
dXQgYXJndW1lbnRzICovCisJaWYgKHJlcS5sZW5ndGggPD0gMCB8fCByZXEuc3RhcnQgPCAwKQor
CQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChjaGVja19hZGRfb3ZlcmZsb3cocmVxLnN0YXJ0LCBy
ZXEubGVuZ3RoLCAmZW5kX3BlYikpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKGVuZF9wZWIg
PiB1YmktPnBlYl9jb3VudCkKKwkJZW5kX3BlYiA9IHViaS0+cGViX2NvdW50OworCisJaWYgKHJl
cS5zdGFydCA+IGVuZF9wZWIpCisJCXJldHVybiAtRUlOVkFMOworCisJLyogQ2hlY2sgYWNjZXNz
IHJpZ2h0cyBiZWZvcmUgZmlsbGluZyBlcmFzZV9jb3VudGVycyBhcnJheSAqLworCWlmICghYWNj
ZXNzX29rKHVyZXEtPmVyYXNlX2NvdW50ZXJzLCAoZW5kX3BlYi1yZXEuc3RhcnQpICogc2l6ZW9m
KGludDMyX3QpKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisKKwkvKiBGaWxsIGVyYXNlIGNvdW50ZXIg
YXJyYXkgKi8KKwlpID0gMDsKKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3BlYjsg
aSsrLCBwZWIrKykgeworCQlpbnQgZWM7CisKKwkJaWYgKHViaV9pb19pc19iYWQodWJpLCBwZWIp
KSB7CisJCQlpZiAoX19wdXRfdXNlcihVQklfVU5LTk9XTiwgdXJlcS0+ZXJhc2VfY291bnRlcnMr
aSkpCisJCQkJcmV0dXJuIC1FRkFVTFQ7CisKKwkJCWNvbnRpbnVlOworCQl9CisKKwkJc3Bpbl9s
b2NrKCZ1YmktPndsX2xvY2spOworCisJCXdsID0gdWJpLT5sb29rdXB0YmxbcGViXTsKKwkJaWYg
KHdsKQorCQkJZWMgPSB3bC0+ZWM7CisJCWVsc2UKKwkJCWVjID0gVUJJX1VOS05PV047CisKKwkJ
c3Bpbl91bmxvY2soJnViaS0+d2xfbG9jayk7CisKKwkJaWYgKF9fcHV0X3VzZXIoZWMsIHVyZXEt
PmVyYXNlX2NvdW50ZXJzK2kpKQorCQkJcmV0dXJuIC1FRkFVTFQ7CisKKwl9CisKKwkvKiBSZXR1
cm4gYWN0dWFsIHJlYWQgbGVuZ3RoICovCisJcmVxLnJlYWRfbGVuZ3RoID0gaTsKKworCS8qIENv
cHkgZXZlcnl0aGluZyBleGNlcHQgZXJhc2UgY291bnRlciBhcnJheSAqLworCWlmIChjb3B5X3Rv
X3VzZXIodXJlcSwgJnJlcSwgc2l6ZW9mKHN0cnVjdCB1YmlfZWNpbmZvX3JlcSkpKQorCQlyZXR1
cm4gLUVGQVVMVDsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgbG9uZyB1YmlfY2Rldl9pb2N0
bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKIAkJCSAgIHVuc2lnbmVkIGxv
bmcgYXJnKQogewpAQCAtOTkxLDYgKzEwNTcsMTIgQEAgc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJCWJyZWFrOwogCX0KIAor
CWNhc2UgVUJJX0lPQ0VDTkZPOgorCXsKKwkJZXJyID0gdWJpX2dldF9lY19pbmZvKHViaSwgYXJn
cCk7CisJCWJyZWFrOworCX0KKwogCWRlZmF1bHQ6CiAJCWVyciA9IC1FTk9UVFk7CiAJCWJyZWFr
OwotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
