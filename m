Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24989D10BE8
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Oct 2024 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z92b4GSBrHAnUfGOP9B0ibAxpZ4scdoc52UbkC8Qies=; b=oyNd+4xBlLU3AJ
	tgDldB/8X4ZBj9s6J02ruGIoS/UEJe2vSKNw/VWpGNia+drrFtJIIp1q4xWY87AuxCnv7ZzZIMeC6
	XrIzcmfqGGJtiN8fwvxTRSl7KvNn0BxJMggKTzsttakPmLrgqT8PKU9G9ylmnDV76PweMUqLYNsWC
	QSUhrhULoNubfWhmapqRdY86JBZACSrdWKr5RKtVHIdqchZP5Fm+LdcqwpMa63UVK2/fsgHCfhWO1
	SbVh9QpwHw/DP5f/atiHiMHHAvvK3vIgHRYDxIeX/syQPrNXEqCTQ+YhNk+GKBgfaYqEwBMBwrw8f
	V1WARXbgkLM7NJ2t3Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bfy-00000006B5N-0jw6;
	Sat, 26 Oct 2024 07:57:34 +0000
Received: from mail-mw2nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:200a::600] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bco-00000006AkW-3qLf;
	Sat, 26 Oct 2024 07:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHotzg0n1+ezvf408CQ+tF82XOKThWuVPyEClIXEBroMGbitdiQphZyqHX/3TrbeR3/xbuDj+Q0C+om7TdHYQ44j9LKA3qGTqE38hAx1E6CBlnaoT/zwvlOMsGRKvslgTOshqCYmwDfPToshSwM4RR/jrfqKhaYBaqcXP8aNU5aq8lmQXMSNWrnlE9UgABhrqo5qzo8kdRDVqdHnGcJVtXVaiwy+p4AK++HURNekYNBJc+tVW357TrlJDhxSfkVp6JPC4ndyooFNyqZdiy3Abilq0ABgGxYZ3MpYvoEm78Opjcx/0GU+rkg11I1kPts83+VeMn5H+E28qkWuFOwdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCkx8x6mHsRXwVvB+TNKNXjz58tewrfQLQaerKE0Bnk=;
 b=ebyMPDZPATJyG+Z/Qg5MDZAVlgV7hSgoW4OqEk7XaBOk9D47pYDoUPCB2vUgcdx5oooxQB+oCqM/7clG8DEA448cVKkPK4fkiEmTipRTZ0RtWVTIjJ7IoszR8CrgaomdElA4Y92AwObl/NPz7AojtQQQV3SHvSxW2GU7xUTFo9yjpDwK614RDsw7WD6QKTlxKJWwvnaz6WEUMYVSvvhfPszEPeSGthH83s/wm83eisNYu1UwMLsX/wTsqH4pL3dGu8PpRFEt72GxdyPr2XULaBKT0+68o8co9IqaDe+nSe6+bZC7KqBz1lLGLx8oNVMMX8Or6USUkSjQNsNBwkv2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCkx8x6mHsRXwVvB+TNKNXjz58tewrfQLQaerKE0Bnk=;
 b=VzzSAhIka1EsnzhwTLxJzCQ//WOc3WC6pwFIrbzgSxM9Fn8kgyVlCh1d8I0Z389HL2nSeX09BhZN6OsXpgY9IFnymW/b1QRAE4ep1JY1sxtIOjZD5e6obA04avMtyy5GMavvW9M28Vyr8ZxjsbHP5TkmLqtuAIKxKHEr6QFgfhE=
Received: from BN9PR03CA0429.namprd03.prod.outlook.com (2603:10b6:408:113::14)
 by DS0PR12MB7828.namprd12.prod.outlook.com (2603:10b6:8:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Sat, 26 Oct
 2024 07:54:02 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::f4) by BN9PR03CA0429.outlook.office365.com
 (2603:10b6:408:113::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Sat, 26 Oct 2024 07:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Sat, 26 Oct 2024 07:54:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 26 Oct
 2024 02:54:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 26 Oct
 2024 02:54:00 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 26 Oct 2024 02:53:54 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <michael@walle.cc>, <broonie@kernel.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<miquel.raynal@bootlin.com>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <venkatesh.abbarapu@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	<beanhuo@micron.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [RFC PATCH 0/2] Add support for stacked and parallel memories
Date: Sat, 26 Oct 2024 13:23:45 +0530
Message-ID: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS0PR12MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 39930f44-7c50-4111-2fbc-08dcf5935b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1pwTHRHc1ZDVit1RDAweTRHVkZoeUtFMjFhVFNTekYxYkdpOS9MSHE5S05a?=
 =?utf-8?B?aStURXV6eTJjREFROCtrbG0rVkE3ZEE3eHZ1NWtLa0VTejk5Y2ZadEJ5MVM5?=
 =?utf-8?B?RWxHQ1lYa3RNcVlkdm0wSThvanVsRk93ZjlUazVyd2l2QUNZejBRSExWSUNB?=
 =?utf-8?B?R1dUcnZ3MFg0SU1TNEY3YmlvTGxqaGtuMmQ0R2dpMGhvR1RoWDVuSGVkRURv?=
 =?utf-8?B?SnF3cStlL3oxNzJDa0JhWGFXSVhOUTMrTGRxTkxmSVRReE1Cb0R2RytmdGxv?=
 =?utf-8?B?WWVyeEJvOHByckVpS201M1h2VEZuekJzWmJ3OW56dWVBdWk5NWcrS3RoWTY2?=
 =?utf-8?B?UDlrbGVEY2RBcnU0VUpXLy8yMFVRaGtncmlzZU04aHR5cUxaemMvUHl5Y1JF?=
 =?utf-8?B?bndRVm9DSXRVUVdLTDhwK3lZVVpZMXZZTFNTc0Zkd1JRRVRDbEJzT1JneVZK?=
 =?utf-8?B?cjNTNEROdWNPYlkwVCs5eWV3T0RXY3Q4bG04OW9EeWg4R3J4MUZMTTY1TXR1?=
 =?utf-8?B?WEdkbDk0N1R4UUVwOUtzSUFRcDRERHBoMnI0T2MvempiWGNyTU9tQXVZM0tk?=
 =?utf-8?B?SWN4QWgrWVZ3RWlVdW5vSmhZSEFnc3FsS25DZDdHMlBCZ1NuYXBqMENsOXBF?=
 =?utf-8?B?bnVBWFNGQWp1anVyZVZhbWF6MjhRKzg3Sm1iSzJkYzJyN1p6cHFKM0FYaGJv?=
 =?utf-8?B?RzdVNUk2U3dmMytBaVYwM3AwMGZOV1pmcTRuc2ErUm5INHNLSzZpdEszMWtT?=
 =?utf-8?B?NEVSNHhsa0FSdG1kWXRqbWQ3TXNWSlBmRlpaRlM2ajE5SWtZTlUvdmlXcnpX?=
 =?utf-8?B?T3VQQ094eHVGL0kxYU0vVnh0L3E5dGNkdDU0aDE5QzNSbHdSWXpZQm1MN0pq?=
 =?utf-8?B?S1ZqVThSbUtnSlRCNmwzaTkyMEtGcHV4cU9GMVhpUWgxenkvWDZnRjlqM0ln?=
 =?utf-8?B?eVJJdkI0NUJVLzFDcDgxWEFTTUErQUZvTXlEcFpyZy9QQlFab0ZLSWQvTlVU?=
 =?utf-8?B?a2FTWXBhakJoTU03VWlUSHBUQmwyQ1FzTS9penhCVFJPbGEwaHE3MGo3Vngw?=
 =?utf-8?B?MjdmY3pLWFdSQWRyQjhGK0FEbnFraEREV3BWVjlyTTZHeWtNdmNnb1U2UUtJ?=
 =?utf-8?B?bGpOS1pCOHduT00zd09BQ3E0ZHpUZ05aZHczclJYY3FZaTJ1MEIwTUVZZXJU?=
 =?utf-8?B?aUhEaXRxcXhyWkNRK3hZMzUrYTBYK1VJQzhvVXYvNlUyVVVsdFFzOTRtekNo?=
 =?utf-8?B?aktGMXhzdEc0KzcwYzR1aHp3ZXcxMGNQdnBoa0tXZ1dNYjBHYW5zQWp5WGQv?=
 =?utf-8?B?cFk4dFdYTzQxbTFwM0o3UUJ5aGhhbzl5NFNzRCtsU1lwSHVpTVEwVlYxc1ox?=
 =?utf-8?B?WndzNXpPbFNSRVlSa0tmNWVZVW9PNFYwUHJMbEgzM09RYmU2QXU3K2hybUhH?=
 =?utf-8?B?TW9mVGRLZ01tblJsd2xkaTFKbjV1ZkdlRGlIOFJ0cXRBMi8rZGQ0c2NKOFBn?=
 =?utf-8?B?ZzdKc0c5RjR0NUtMVnV3M1NVNWxDVkw1UEsyczV5WFd0K29DRFFrL3hsYWlv?=
 =?utf-8?B?SjArci96ZHc2Vnc0V1ZEeU9NZEVFb2ZHTVpvWEN6U2pYU2RBNzByc2hzNXZJ?=
 =?utf-8?B?ZnZoM2dCNjhMekVTRDBrcUtpMnRrcFpOUS8wRlpTTktiQXRMZU5kTkVVdk92?=
 =?utf-8?B?ZXBvaWE1U1BsVVBydHkvQmFRRVVjL0Q0MUxrVzNva2lVRFNMU0pLM2NpSDlu?=
 =?utf-8?B?em1EUWg0bnRCTmJXNTFKakhkaStKcGYyTGp2b0IvOVdBV3ZHN1pxUEttUm94?=
 =?utf-8?B?SXdxTUpCdkdlbXhhdDFNZ2ltUkpOZGVsalJLRXh0UFlCN0g0QkcxckZmNDdr?=
 =?utf-8?Q?/srWuIqbdshKP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 07:54:02.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39930f44-7c50-4111-2fbc-08dcf5935b8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_005418_972633_C5F395A7 
X-CRM114-Status: GOOD (  21.37  )
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

SGVsbG8gRXZlcnlvbmUsCgpGb2xsb3dpbmcgYW4gZW1haWwgZGlzY3Vzc2lvbiB3aXRoIE1pcXVl
bCByZWdhcmRpbmcgdGhlIGJpbmRpbmcgY2hhbmdlcwphbmQgb3ZlcmFsbCBhcmNoaXRlY3R1cmUg
Zm9yIGltcGxlbWVudGluZyBzdXBwb3J0IGZvciBzdGFja2VkIGFuZCBwYXJhbGxlbAptZW1vcmll
cywgSeKAmW0gc2hhcmluZyB0aGlzIFJGQyB0byBpbml0aWF0ZSBhIGRpc2N1c3Npb24gb24gdGhl
IHByb3Bvc2VkCnVwZGF0ZXMgdG8gY3VycmVudCBiaW5kaW5ncyBhbmQgdG8gZmluYWxpemUgdGhl
IGltcGxlbWVudGF0aW9uCmFyY2hpdGVjdHVyZS4KCkJlZm9yZSBkaXZpbmcgaW50byB0aGUgbWFp
biB0b3BpYywgaGVyZSBpcyBzb21lIGJhY2tncm91bmQgb24gc3RhY2tlZCBhbmQKcGFyYWxsZWwg
bWVtb3JpZXMuCgpUaGUgQU1EIFFTUEkgY29udHJvbGxlciBzdXBwb3J0cyB0d28gYWR2YW5jZWQg
Y29ubmVjdGlvbiBtb2RlcyhTdGFja2VkIGFuZApQYXJhbGxlbCkgd2hpY2ggYWxsb3cgdGhlIGNv
bnRyb2xsZXIgdG8gdHJlYXQgdHdvIGRpZmZlcmVudCBmbGFzaGVzIGFzIG9uZQpzdG9yYWdlLgoK
U3RhY2tlZDoKRmxhc2hlcyBzaGFyZSB0aGUgc2FtZSBTUEkgYnVzLCBidXQgZGlmZmVyZW50IENT
IGxpbmUsIGNvbnRyb2xsZXIgZHJpdmVyCmFzc2VydHMgdGhlIENTIG9mIHRoZSBmbGFzaCB0byB3
aGljaCBpdCBuZWVkcyB0byBjb21tdW5pY2F0ZS4gU3RhY2tlZCBtb2RlCmlzIGEgc29mdHdhcmUg
YWJzdHJhY3Rpb24gcmF0aGVyIHRoYW4gYSBjb250cm9sbGVyIGZlYXR1cmUgb3IgY2FwYWJpbGl0
eS4KQXQgYW55IGdpdmVuIHRpbWUsIHRoZSBjb250cm9sbGVyIGNvbW11bmljYXRlcyB3aXRoIG9u
ZSBvZiB0aGUgdHdvCmNvbm5lY3RlZCBmbGFzaCBkZXZpY2VzLCBhcyBkZXRlcm1pbmVkIGJ5IHRo
ZSByZXF1ZXN0ZWQgYWRkcmVzcyBhbmQgZGF0YQpsZW5ndGguIElmIGFuIG9wZXJhdGlvbiBzdGFy
dHMgb24gb25lIGZsYXNoIGFuZCBlbmRzIG9uIHRoZSBvdGhlciwgdGhlCmNvcmUgbmVlZHMgdG8g
c3BsaXQgaXQgaW50byB0d28gc2VwYXJhdGUgb3BlcmF0aW9ucyBhbmQgYWRqdXN0IHRoZSBkYXRh
Cmxlbmd0aCBhY2NvcmRpbmdseS4KClBhcmFsbGVsKE11bHRpLUNTKToKQm90aCB0aGUgZmxhc2hl
cyBoYXZlIHRoZWlyIHNlcGFyYXRlIFNQSSBidXMsIENTIG9mIGJvdGggdGhlIGZsYXNoZXMgd2ls
bApiZSBhc3NlcnRlZC9kZS1hc3NlcnRlZCBhdCB0aGUgc2FtZSB0aW1lLiBJbiB0aGlzIG1vZGUg
ZGF0YSB3aWxsIGJlIHNwbGl0CmFjcm9zcyBib3RoIHRoZSBmbGFzaGVzIGJ5IGVuYWJsaW5nIHRo
ZSBTVFJJUEUgc2V0dGluZyBpbiB0aGUgY29udHJvbGxlci4KUGFyYWxsZWwgbW9kZSBpcyBhIGNv
bnRyb2xsZXIgZmVhdHVyZSB3aGVyZSBpZiB0aGUgU1RSSVBFIGJpdCBpcyBzZXQgdGhlbgp0aGUg
Y29udHJvbGxlciBpbnRlcm5hbGx5IGhhbmRsZXMgdGhlIGRhdGEgc3BsaXQgZHVyaW5nIGRhdGEg
d3JpdGUgdG8gdGhlCmZsYXNoZXMgYW5kIHdoaWxlIHJlYWRpbmcgZGF0YSBmcm9tIHRoZSBmbGFz
aCB0aGUgY29udHJvbGxlciBpbnRlcm5hbGx5Cm1lcmdlcyBkYXRhIGZyb20gYm90aCB0aGUgZmxh
c2hlcyBiZWZvcmUgd3JpdGluZyB0byB0aGUgY29udHJvbGxlciBGSUZPLgpJZiBTVFJJUEUgaXMg
bm90IGVuYWJsZWQsIHRoZW4gc2FtZSBkYXRhIHdpbGwgYmUgc2VudCB0byBib3RoIHRoZSBkZXZp
Y2VzLgpJbiBwYXJhbGxlbCBtb2RlIGJvdGggdGhlIGZsYXNoZXMgc2hvdWxkIGJlIGlkZW50aWNh
bC4KCkZvciBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSBtb2RlcyBwbGVhc2UgZmVlbCBmcmVlIHRv
IGdvIHRocm91Z2ggdGhlCmNvbnRyb2xsZXIgZmxhc2ggaW50ZXJmYWNlIGJlbG93IFsxXS4KCk1p
cm9jaGlwIFFTUEkgY29udHJvbGxlclsyXSBhbHNvIHN1cHBvcnRzICJEdWFsIFBhcmFsbGVsIDgt
Yml0IElPIG1vZGUiLApidXQgdGhleSBjYWxsIGl0ICJUd2luIFF1YWQgTW9kZSIuCgpJbml0aWFs
bHkgaW4gWzNdIFs0XSBbNV0gTWlxdWVsIGhhZCB0cmllZCB0byBleHRlbmQgTVRELUNPTkNBVCBk
cml2ZXIgdG8Kc3VwcG9ydCBTdGFja2VkIG1vZGUsIGJ1dCB0aGUgYmluZGluZ3Mgd2VyZSBub3Qg
YWNjZXB0ZWQuIFNvLCB0aGUKTVRELUNPTkNBVCBhcHByb2FjaCB3YXMgZHJvcHBlZCBhbmQgdGhl
IERUIGJpbmRpbmdzIHRoYXQgZ290IGFjY2VwdGVkCls2XSBbN10gWzhdIHRoYXQgZGVzY3JpYmVz
IHRoZSB0d28gZmxhc2ggZGV2aWNlcyBhcyBiZWluZyBvbmUuIFNQSSBjb3JlCmNoYW5nZXMgdG8g
c3VwcG9ydCB0aGUgYWJvdmUgYmluZGluZ3Mgd2VyZSBhZGRlZCBbOV0uIFdoaWxlIGFkZGluZyB0
aGUKc3VwcG9ydCBpbiBTUEktTk9SICBUdWRvciBwcm92aWRlZCBhZGRpdGlvbmFsIGZlZWRiYWNr
LCBsZWFkaW5nIHRvIGEKZGlzY3Vzc2lvbiBvbiB1cGRhdGluZyB0aGUgY3VycmVudCBzdGFja2Vk
IGFuZCBwYXJhbGxlbCBEVCBiaW5kaW5ncy4KClByb3Bvc2VkIFNvbHV0aW9uOgpUaGUgc29sdXRp
b24gaGFzIHR3byBwYXJ0czoKCjEuIFVwZGF0ZSBNVEQtQ09OQ0FUCiAgIFVwZGF0ZSBNVEQtQ09O
Q0FUIHRvIGNyZWF0ZSB2aXJ0dWFsIGNvbmNhdGluYXRlZCBtdGQgZGV2aWNlcyBhcyBkZWZpbmVk
CiAgIGluIHRoZSBkZXZpY2UgdHJlZS4KCjIuIEFkZCBhIE5ldyBMYXllcgogICBBZGQgYSBuZXcg
bGF5ZXIgYmV0d2VlbiB0aGUgU1BJLU5PUiBhbmQgTVREIGxheWVycyB0byBzdXBwb3J0IHN0YWNr
ZWQKICAgYW5kIHBhcmFsbGVsIGNvbmZpZ3VyYXRpb25zLiBUaGlzIG5ldyBsYXllciB3aWxsIGJl
IHBhcnQgb2Ygc3BpLW5vciwKICAgbG9jYXRlZCBpbiBtdGQvc3BpLW5vci8sIGNhbiBiZSBpbmNs
dWRlZC9leGNsdWRlZCB2aWEgS2NvbmZpZywgd2lsbCBiZQogICBtYWludGFpbmVkIGJ5IEFNRCBh
bmQgd2lsbDoKCiAgIC0gRHVyaW5nIHByb2JpbmcsIHN0b3JlIGluZm9ybWF0aW9uIGZyb20gYWxs
IGNvbm5lY3RlZCBmbGFzaGVzIGluCiAgICAgc3RhY2tlZCBvciBwYXJhbGxlbCBtb2RlIGFuZCBw
cmVzZW50IHRoZW0gYXMgYSBzaW5nbGUgZGV2aWNlIHRvIHRoZQoJIE1URCBsYXllci4KICAgLSBS
ZWdpc3RlciBjYWxsYmFja3MgYW5kIG1hbmFnZSBNVEQgZGV2aWNlIHJlZ2lzdHJhdGlvbiB3aXRo
aW4gdGhlIG5ldwogICAgIGxheWVyIGluc3RlYWQgb2Ygc3BpLW5vci9jb3JlLmMuCiAgIC0gTWFr
ZSBtaW5pbWFsIGNoYW5nZXMgaW4gc3BpLW5vci9jb3JlLmMsIGFzIHN0YWNrZWQgYW5kIHBhcmFs
bGVsCiAgICAgaGFuZGxpbmcgd2lsbCBiZSBtYW5hZ2VkIGJ5IHRoZSBuZXcgbGF5ZXIgb24gdG9w
IG9mIFNQSS1OT1IuCiAgIC0gSGFuZGxlIG9kZCBieXRlIGNvdW50IHJlcXVlc3RzIGZyb20gdGhl
IE1URCBsYXllciBkdXJpbmcgZmxhc2gKICAgICBvcGVyYXRpb25zIGluIHBhcmFsbGVsIG1vZGUu
CgpbMV0gaHR0cHM6Ly9kb2NzLmFtZC5jb20vci9lbi1VUy9hbTAxMS12ZXJzYWwtYWNhcC10cm0v
UVNQSS1GbGFzaC1EZXZpY2UtSW50ZXJmYWNlClsyXSBodHRwczovL3d3MS5taWNyb2NoaXAuY29t
L2Rvd25sb2Fkcy9hZW1Eb2N1bWVudHMvZG9jdW1lbnRzL01QVTMyL1Byb2R1Y3REb2N1bWVudHMv
RGF0YVNoZWV0cy9TQU1BN0c1LVNlcmllcy1EYXRhLVNoZWV0LURTNjAwMDE3NjUucGRmClszXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAxOTExMTMxNzE1MDUuMjYxMjgtNC1taXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tLwpbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMTkx
MTI3MTA1NTIyLjMxNDQ1LTUtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS8KWzVdaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMTEyMTUyNDExLjgxODMyMS0xLW1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20vCls2XSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0
L2Y4OTUwNDMwMGU5NDUyNGQ1ZDU4NDZmZjhiNzI4NTkyYWM3MmNlYzQKWzddIGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvZWJhNTM2ODUwM2I0MjkxZGI3ODE5NTEyNjAw
ZmEwMTRlYTE3YzVhOApbOF0gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1p
dC9lMmVkZDFiNjRmMWM3OWU4YWJkYTM2NTE0OWVkNjJhMmE5YTQ5NGI0Cls5XWh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvNGQ4ZmY2YjA5OTFkNWU4NmIxN2IyMzVmYzQ2
ZWM2MmU5MTk1Y2I5YgoKVGhhbmtzLApBbWl0CgpBbWl0IEt1bWFyIE1haGFwYXRyYSAoMik6CiAg
ZHQtYmluZGluZ3M6IG10ZDogQWRkIGJpbmRpbmdzIGZvciBkZXNjcmliaW5nIGNvbmNhdGluYXRl
ZCBNVEQgZGV2aWNlcwogIGR0LWJpbmRpbmdzOiBzcGk6IFVwZGF0ZSBzdGFja2VkIGFuZCBwYXJh
bGxlbCBiaW5kaW5ncwoKIC4uLi9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwg
ICAgICB8IDE4ICsrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Bh
cnRpdGlvbnMueWFtbCAgIHwgIDYgKysrKysKIC4uLi9iaW5kaW5ncy9zcGkvc3BpLWNvbnRyb2xs
ZXIueWFtbCAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KIC4uLi9iaW5kaW5ncy9z
cGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCAgICB8ICA5ICsrKy0tLS0tCiA0IGZpbGVzIGNo
YW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
