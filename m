Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FDAE77184
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGbnIKs1Om8/8dx2W5qx2YjVzDWr4tiUAwadQvhEGkk=; b=dmvtqzapqxSHmH
	pUz3IKlp0HDCglX4lgzoEqZ/hUwvv4GCN80MBbg9U1PqdjVdtZy5pZ4SE07XCsJcMlyvAY4OBEPbW
	29XnHQaEMPTQAb8Q/+Y+3PP7/SiFuQosNF+NJYb3zL+smGATaInXs1dvrlcMPDQgpMndsL0Op/Gvf
	tFxLMLa7eGzy80OHN9aFFTAPBjnR5hY2GAiIrOAAMVDkvqV0ZzYgbbeV8k2plh/n63u1Ca79txm3S
	1spbo6VFdqg2P1/gep4arbNx7pmOg99t4APMqCMYfXWqnzfWvka3/y5qubwkvXMZMOZdrj99L54EM
	LHGCv6k05I4Ext72f+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN82t-00000009e9K-3giU;
	Mon, 16 Dec 2024 10:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sP-00000009Sdk-1Dy9
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Dec 2024 08:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zJ18AjbBAKdqYx+NQI6eJOJQGwG3Klv1wMQtVATOYTc=; b=IW5r+k9juEXWSY0vAbdEBa4Ls6
	zkMpIZsoqMqADyGNPzbtzGL0YCnQi36IsVqk8VmFVWWrpdmloV155BdR4EnWeJExn4o/ErrZ0tKn9
	/Dtg5rbCoYDaILy7y8c6hAI/3VcPk2boQ3GpsyUEDgrBfYtjDS+wzPbaE/Aswe5wrFj4pPRZXSYwB
	YGQsAowhVow049j7QdjP3m/HzgvESKsQzuJQ+qx5bolyZvy/uNr7JvyvKPYHsps60EXzhfS92dKfd
	wGO40FwsgUuJdVbR5RgePVfs2Hw9fMl5MIrYWN8MP7elOmz+cKzEcU7d/nFD7dPQZqWrpSHYNO8Zs
	OkW/rYzg==;
Received: from mail-db8eur05on2062f.outbound.protection.outlook.com ([2a01:111:f403:2614::62f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sL-00000004o6l-2PCq
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 08:54:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6mNIpkvgDpt1+6NY5IGYaFEBWDNOaIg4IDaWX3Xqz0VDI2wyIVF/ariTY9e0Gh3RITtRk+O6oaJqFoMj1oXK0Kla8QKOhey8qF9C7VANLCx5sVx3hTFKK3+ra62Y4Lbs1HuWL+X9gfXcDOnONNp63dW7m4lA6mxcy3sm+9Ec1mTVbGP2R/1PfDGQnz0yJeHUF0sEGWqRCU/Kins3u2Nyd+Vgy7qitJfarwN4XPsXCktv2p2LpSHWM9wqt35O9ah0BmAw2ZS3koVYMW63enmByi0XJrg2aPFLRge7fBLm/L/6rK8MOO0ggMPHCS1PTXe6tsjaSdRv3skDAB9WJJZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ18AjbBAKdqYx+NQI6eJOJQGwG3Klv1wMQtVATOYTc=;
 b=xQadsK+o7Q1hbGwMm7qWrpM0GywuXgkZJWAgCOU7/rcx5F+/+jCcsePfBWfg4PgEimDqq1vUZAJj6gz56RWukEJOYD7RBF+a7wmkTxTiyU0/o5nkeI4AyObaxO3Uku5LCyoe3opTU2YrULKBTdA++cbz9uju0oD8A9DEuw99HWPCaoqdIRtP3SkaESmrtHobJ42Zu3nNVCGjMlN8STTwibJKjO7bRlv6j0gkjW1LYx/sEzkxbl1fOqfwnWgoxzy5AhNdycn9hYHeITe9HG1qA0Qgo0m5pdTyeSjOnkxTK58b1jWJedLsyz9K/wUka2sjPiTjV+1J2yfJfx62oHk+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJ18AjbBAKdqYx+NQI6eJOJQGwG3Klv1wMQtVATOYTc=;
 b=en1CKDcPovRCwP95n6mj+qViRfNyyERsXpzkwUJf54ENwhMVeHHQgv25BMOLzsaH3HpGrOzcwjMOuHkIqolaDULnr6KATYRsT3p2Q5/6X+6Wxs7eTKjkp2gZm54aeqae6+49Ayrv/DrvHs4Dow1uZIZMOgJ1Yq5Tj1BEuywvMhg=
Received: from DU7P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::32)
 by DB9PR02MB7339.eurprd02.prod.outlook.com (2603:10a6:10:249::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 08:54:41 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::a9) by DU7P195CA0019.outlook.office365.com
 (2603:10a6:10:54d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 08:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 08:54:41 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 09:54:40 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v5 2/2] ubi: Implement ioctl for detailed erase counters
Date: Mon, 16 Dec 2024 09:54:20 +0100
Message-ID: <20241216085420.2696104-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241216085420.2696104-1-rickard.andersson@axis.com>
References: <20241216085420.2696104-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|DB9PR02MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 6456ea68-82ac-4482-11ce-08dd1daf478b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVA4Y2tpZlVnYk00enkrQSt1eUFlSFRFRENmSWQ4NkxwMFRnWG5kOVNJdlVa?=
 =?utf-8?B?M2JsdUxSdU51M2JyeGg5TU82ZGVkNGJCYzJYbjBlSkx0b1JQRHBGalZuZElw?=
 =?utf-8?B?Y0RJdENQVUZuS0QyQXhqV1NnVDlYS2VsR0xuOHBaaUwzSWVoWXhLRFRQcWNY?=
 =?utf-8?B?MHFoOU9RUkovNkdKa2ZDckxKMzJSUi96V0FnOWpjOXFpMkRxLzNEci9RRzBh?=
 =?utf-8?B?dHJUZGJBaC9zK0twZnhybzg3dGxtRzNMMXpDQnlsOEJkRlVBUUsyOVJmSERa?=
 =?utf-8?B?SFVRLzhKOWdRYmJIVDN0cGt2d0hFQmxSTFMwWTdJbC8zb2hiekR6RE90SWFy?=
 =?utf-8?B?L1F2NW56cFMrRHo3dmRLcHN2djd4TmsvZG1PKysrOEpML1ZtMnFCVHlJSm5M?=
 =?utf-8?B?N1hqMHZDUDlIM25kczhURDNEZG9UOGVLVEFSamh2bnJpYjI2dkVhV2RVU1lJ?=
 =?utf-8?B?TEZVSVRScjJBQlpXMlRaZWFHb1J5c1pCVFk2UkFMT3ZWQXhubTh6VEh5N0F0?=
 =?utf-8?B?eVNFVmxvZ1ZDcHk1bVR0dGhwcWVuYmNBVTEvVldrQzJoa210Y2FqdEExUUJz?=
 =?utf-8?B?Wnk5ajByS2FvdUZod1NiL3J4dDZtOC9kZVN4TVExUEx3UC82WW4yMWJHM3Jp?=
 =?utf-8?B?Y0lSZFdMejR5WUg1YW5SNFVtL3dQOGF6ekdCNEdkOFRKajM5MDBUNUNZdHd4?=
 =?utf-8?B?TjdKYUk0Ykc3MkMzREdTVWE5Q3N2aDErR0RsaHQySzJqckZrUUVLeTdEdkxM?=
 =?utf-8?B?VHNoUjJjbVFLVFp0alByMHRWQnBjS3YvUjhuMHE4NVpCcjNHbWR0NXdNSGdo?=
 =?utf-8?B?WEg1TFl4VTJoTnB5a1JSMjBickNUam5TSzlJajFnZ0c3KzdMd3pvQ0NWK2Fl?=
 =?utf-8?B?QnNLRkJiM2ovWURhb3d3V3h1bHdLY1ZhL09rMG4zZEVKQ3J1akx0dGRFK09B?=
 =?utf-8?B?Y1d1aFVMTkg3WjBlWGtCZmE4M0lFemJuSWViTGFZRnhnL0Nyb0g4YmJ6ZUVn?=
 =?utf-8?B?U2ROdFZQV2U2MTFBMTg4MmcvYmF1Q1VhdTdWR1dES1ppdVdVWEhiSUZmMWQ2?=
 =?utf-8?B?MXYrRU1LL3I2UWlranhJUk5sZ2dWazNuV1lQZmY2bGRaRFZUaEpvaitwdU5S?=
 =?utf-8?B?Q05VaUJSeW5RWWkrekpXV0FYQUU4cEUzSEhYNjgzUkhVd0pueWlJQ3ZJM1hX?=
 =?utf-8?B?NkMvM2Evb3N5TXR3cEN0NHRIYVRKR3Vtb1J0eGhkQ0VSOURMVDcwYllNRWJo?=
 =?utf-8?B?T1g5Sm5Ga0dHR0sydlZtRkZUSkY4Tkt6YmdVMVNmczhEdmoxbTN6UFE1SzEx?=
 =?utf-8?B?aW5FTXFIVFBWelIyU0NVK2U5Q2JXRnBHUmk1QmlyanpwSXdRUmY4WWtRdWhk?=
 =?utf-8?B?M0VvRjNIUjhIZWVSYkdidWYvZjZNVnE2M2FsUXN3VkNtQkxvYlgwOFdVT3Rv?=
 =?utf-8?B?ZEJqWldEQjArVzVvU0VMbTdXb01tTERPVVRETlN3SlU3YWpnanpzOFBNQTdZ?=
 =?utf-8?B?NnlFdUk4dDJaT2dRcUg0eEFPWndMN2p3OXExUVoxUDBTSE9zY0F6SENKNEVs?=
 =?utf-8?B?RlVGREtlVWRURzBUV0d4LytLMHJ2TS9wRUtsaGpacGEzbkZsUm1oQjBpNGxS?=
 =?utf-8?B?b3JGREtycW8waHQ5TS85bUkyYklaeE1qRURIK2dsQWtSTEwvbE5oU2RGYUls?=
 =?utf-8?B?Q2JSSERDTFlvSFdJQ3hlODBZM0xSR3l1KzY5Wm1PUFFQTGlqQS9OdEtGTnRF?=
 =?utf-8?B?VHFYRU1MTE9QSHF3T3grcEd4QkJPMGordEdaNk5pMUNLMGV5NFpkdDl1TXps?=
 =?utf-8?B?cWYzakYvTHVjU21WS1VwQWhwTTcyL0JYL3RnV1VicE9Xdk5GSkdVZ3RXM1hD?=
 =?utf-8?B?RkxkdVQrbTMvaFNPRFNOSmxEWi9RYVJVM1phRURVcXMvRzcwYzMyZkRXbmFT?=
 =?utf-8?B?ZkRCOG92SHlOUlVLV0xtaE4yVmpVVnVLNUp6ZitRYUp0eEp4QmZlWVpqdjQ0?=
 =?utf-8?Q?4H1bPYR8ClEK8PiZAfdU4FDpLYwvPI=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:54:41.2475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6456ea68-82ac-4482-11ce-08dd1daf478b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085450_007225_E1CAE15F 
X-CRM114-Status: GOOD (  14.24  )
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
cy5jb20+ClRlc3RlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4K
UmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwppbmRl
eCAwZDhmMDRjZjAzYzUuLmUyZjI1ODFlOWYwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYworKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCkBAIC04MjgsNiArODI4LDY5IEBA
IHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKIAlyZXR1
cm4gZXJyOwogfQogCitzdGF0aWMgaW50IHViaV9nZXRfZWNfaW5mbyhzdHJ1Y3QgdWJpX2Rldmlj
ZSAqdWJpLCBzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgX191c2VyICp1cmVxKQoreworCXN0cnVjdCB1
YmlfZWNpbmZvX3JlcSByZXE7CisJc3RydWN0IHViaV93bF9lbnRyeSAqd2w7CisJaW50IHJlYWRf
Y250OworCWludCBwZWI7CisJaW50IGVuZF9wZWI7CisKKwkvKiBDb3B5IHRoZSBpbnB1dCBhcmd1
bWVudHMgKi8KKwlpZiAoY29weV9mcm9tX3VzZXIoJnJlcSwgdXJlcSwgc2l6ZW9mKHN0cnVjdCB1
YmlfZWNpbmZvX3JlcSkpKQorCQlyZXR1cm4gLUVGQVVMVDsKKworCS8qIENoZWNrIGlucHV0IGFy
Z3VtZW50cyAqLworCWlmIChyZXEubGVuZ3RoIDw9IDAgfHwgcmVxLnN0YXJ0IDwgMCB8fCByZXEu
c3RhcnQgPj0gdWJpLT5wZWJfY291bnQpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKGNoZWNr
X2FkZF9vdmVyZmxvdyhyZXEuc3RhcnQsIHJlcS5sZW5ndGgsICZlbmRfcGViKSkKKwkJcmV0dXJu
IC1FSU5WQUw7CisKKwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQorCQllbmRfcGViID0g
dWJpLT5wZWJfY291bnQ7CisKKwkvKiBDaGVjayBhY2Nlc3MgcmlnaHRzIGJlZm9yZSBmaWxsaW5n
IGVyYXNlX2NvdW50ZXJzIGFycmF5ICovCisJaWYgKCFhY2Nlc3Nfb2sodXJlcS0+ZXJhc2VfY291
bnRlcnMsIChlbmRfcGViLXJlcS5zdGFydCkgKiBzaXplb2YoaW50MzJfdCkpKQorCQlyZXR1cm4g
LUVGQVVMVDsKKworCS8qIEZpbGwgZXJhc2UgY291bnRlciBhcnJheSAqLworCXJlYWRfY250ID0g
MDsKKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3BlYjsgcmVhZF9jbnQrKywgcGVi
KyspIHsKKwkJaW50IGVjOworCisJCWlmICh1YmlfaW9faXNfYmFkKHViaSwgcGViKSkgeworCQkJ
aWYgKF9fcHV0X3VzZXIoVUJJX1VOS05PV04sIHVyZXEtPmVyYXNlX2NvdW50ZXJzK3JlYWRfY250
KSkKKwkJCQlyZXR1cm4gLUVGQVVMVDsKKworCQkJY29udGludWU7CisJCX0KKworCQlzcGluX2xv
Y2soJnViaS0+d2xfbG9jayk7CisKKwkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJdOworCQlpZiAo
d2wpCisJCQllYyA9IHdsLT5lYzsKKwkJZWxzZQorCQkJZWMgPSBVQklfVU5LTk9XTjsKKworCQlz
cGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKworCQlpZiAoX19wdXRfdXNlcihlYywgdXJlcS0+
ZXJhc2VfY291bnRlcnMrcmVhZF9jbnQpKQorCQkJcmV0dXJuIC1FRkFVTFQ7CisKKwl9CisKKwkv
KiBSZXR1cm4gYWN0dWFsIHJlYWQgbGVuZ3RoICovCisJcmVxLnJlYWRfbGVuZ3RoID0gcmVhZF9j
bnQ7CisKKwkvKiBDb3B5IGV2ZXJ5dGhpbmcgZXhjZXB0IGVyYXNlIGNvdW50ZXIgYXJyYXkgKi8K
KwlpZiAoY29weV90b191c2VyKHVyZXEsICZyZXEsIHNpemVvZihzdHJ1Y3QgdWJpX2VjaW5mb19y
ZXEpKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGxvbmcg
dWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJCQkg
ICB1bnNpZ25lZCBsb25nIGFyZykKIHsKQEAgLTk5MSw2ICsxMDU0LDEyIEBAIHN0YXRpYyBsb25n
IHViaV9jZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLAogCQli
cmVhazsKIAl9CiAKKwljYXNlIFVCSV9JT0NFQ05GTzoKKwl7CisJCWVyciA9IHViaV9nZXRfZWNf
aW5mbyh1YmksIGFyZ3ApOworCQlicmVhazsKKwl9CisKIAlkZWZhdWx0OgogCQllcnIgPSAtRU5P
VFRZOwogCQlicmVhazsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
