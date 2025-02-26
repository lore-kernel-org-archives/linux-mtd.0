Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497BC021B8
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PH7nbWd400FPbIpadTyXzSQKn5AM412O0YKoM0Vhlo8=; b=JGvCK3SUFzah0D
	EtJx1Kl9idHcGbQ0W+AVCtSiuUjjBHPsLVOirMwvSwK0pl/X/xgp1xZBb5ro+pMqONHZUwPPi4hJX
	hxLQ++X23GpmdYqBEx6AFvvDlMm+plqO0m8OO25rIzlv7/zFij/nNt70B9GQscjevHmBIFlpmlFEs
	zktJuCmarHo6/D7iQFuiP4VSpETCMXF/k16L2v9dw/5BsodWROGTpm6dnL3qJ1pFlTBFAHTaXuHPc
	nkULGs/zPA0TtDTszLMEUwr8y4XbMiiF9EgFNWG7VRzVHaY5euT6sv0CpyXdIzkrSvj3WAASespk+
	9Q8HoVSEsCRTG1so6rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM4W-00000004wMJ-3ZWO;
	Wed, 26 Feb 2025 18:23:52 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM4R-00000004wLO-1zyD
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 18:23:49 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aWbNh0eqdok9Aioms4sP7SkYkVTfT+AY6xj0ygREr66TF/y3wYCdDflHQMfmPMhBCtGHpoUoYzAWCIs4xB222R/OOuqZVo4nR2rn+CR4kqPx+1edknlNhGnS5nUZWZ5qk+6wULQX8H0wHrXkltOSRW7jI/FD7a9VilpEGbbYiTVgYtrfecr85yE94TRh3ROPj6oKuNSHEUAUdm/JkWAtQyJ9L7FwRNGb5l8tY1neCG2QFIicXAi3qsswZ+aDWUTYhh/vBsKajV9lRFDLC0sS2tQwKN0VnVQCXxGsPuNIyzk/S3Y0U3laWSIWHDs15O7l13XFAy8ZFmH5YvX4DibCLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdqPl5DkjXz0VMDWUpRvQpbfFpf3inVCjynS5mf+JnM=;
 b=qo4IdMIEWQKnHlpKiApjM/2u+THo57FK8B863zKOU9uSYQlRBroZwtZTDla27p+wLALV+GDP2oTt93fhKxd9zP9AZzTHe9QZggSGXCJaybzTM/jNmxEje75LbJp5MSXM5vjxHa5loCGQ8BWPs60lBcBUFQy+iy2KSNSxpFHwEIWzN6oQqaj7OIgmGXXCuCY27lhRbyNV+z0/pQWmTHF44HoxKMfgaFAxLXCVgoBj+2HuhTbnH3AKLn7nWjH+A6YSfxJP1p+O4hU2cCpiVkTUDU9t6yHadIdYD4jR1K/HuOZ4e9HgS+4fHCdtGnzLdw1fhrguCCtWkwiW5Coi7ZQmqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdqPl5DkjXz0VMDWUpRvQpbfFpf3inVCjynS5mf+JnM=;
 b=FiH3x588brM1JkafXMEAg+Co5Pd+x9jzoN0BnMoz9EMnpMyv0JQmCjfuMZDoGdyYNfD8hU6n0hqQZry2zkZc5KgKd9ekmRPoeROvY8kszmn7hKKHqWHe0kQayHH+tN5L8VTYQ3aBsd0+plDdUtraMPa8BUuBypZeierSnzHZfdc=
Received: from AM0PR02CA0203.eurprd02.prod.outlook.com (2603:10a6:20b:28f::10)
 by DB4PR08MB8078.eurprd08.prod.outlook.com (2603:10a6:10:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 18:23:33 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::76) by AM0PR02CA0203.outlook.office365.com
 (2603:10a6:20b:28f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 18:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 18:23:32 +0000
Received: ("Tessian outbound a60532193129:v585"); Wed, 26 Feb 2025 18:23:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e9f612265edc384
X-TessianGatewayMetadata: uVsGX5VPuY1McjnlwKC27befBmTx+21XB+fIrv/l43DDyXh1Z4e5O0TVEViowj7jqg8UPVbew662f6cjmGAS2fki49PK5iKliAlW6wMYa6wS92eKuXqXcJkNsLW1uwykj/vQAjz8eKjhkYLYMhxWfyjBeCCOKZeHZmnJo7NLtk4=
X-CR-MTA-TID: 64aa7808
Received: from L093302819371.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39D4CFDC-8C19-4050-975F-9F0C56006F69.1;
	Wed, 26 Feb 2025 18:23:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L093302819371.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 26 Feb 2025 18:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgbw4SZ3hZ7eh+uFt1d6XwWnOKkGRKE17AmikjoVXnLB31MmXZd1OaVO9xtuRPKm+Q2+OmOtlR9ZNzOAWlI6dzK+P1SzGFtCRC5N+9aoRV/IJvhDzFify1Uiyid6a4GOLsL6Z1eaT6TRcHq4DfErpt3fJ2EsBZaySscPLa831HbuiFECb7+b85UARjsCh7tXj1qCDtg6B/dKJ8b5DMbHabj6DVyXPyeWTOzTE/mmPQ1ZTKwkGTYvmX5CyUWgsk2C7inwm7XduL1c1fDKNI8MupCLRCy8jw8zEHtCH/4NGwiqhSIbea8nEKrg2GoyyIjM9/u97ORzhA0+t2MA/O7Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdqPl5DkjXz0VMDWUpRvQpbfFpf3inVCjynS5mf+JnM=;
 b=wV1vMX5Ub6PmU6c7L5sQrSlxG6Jc9+6Lg7Y4Covi60gWVf9uFilKNf+RhULeVW6kW8bBmpmEkF4CltBmucmyJOv1PsqrKejTMj7RmFLMXfqceMoxcVicjbcVl/sSU6pMZ2hIkGxgm163BIvcQ5X5I2WV+6bSS5BgkjDonURiryurLoQj6ZztY8VqqX6Ifrprnji62NxqT+3DUoYhMqVnRFs2fzt+bYYZjXVmF9ZddU9jLieNQZeoqbzqFX89z42EWI/6XAX/mXjzw1wI8Igu4nR0SEaBXhLCnnFfdhN/0x9BTCVoQo+OJM7SIydW+mYbJLHwh8Wu1AxQol9E86h5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdqPl5DkjXz0VMDWUpRvQpbfFpf3inVCjynS5mf+JnM=;
 b=FiH3x588brM1JkafXMEAg+Co5Pd+x9jzoN0BnMoz9EMnpMyv0JQmCjfuMZDoGdyYNfD8hU6n0hqQZry2zkZc5KgKd9ekmRPoeROvY8kszmn7hKKHqWHe0kQayHH+tN5L8VTYQ3aBsd0+plDdUtraMPa8BUuBypZeierSnzHZfdc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10661.eurprd08.prod.outlook.com (2603:10a6:102:3ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 18:23:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 18:23:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "david.oberhollenzer@sigma-star.at" <david.oberhollenzer@sigma-star.at>,
	"chengzhihao1@huawei.com" <chengzhihao1@huawei.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
Thread-Topic: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
Thread-Index: AQHbiHuFkEccBaEQe0ew1/vovlEkcg==
Date: Wed, 26 Feb 2025 18:23:24 +0000
Message-ID: <DF926CA1-3E9E-4823-A3BB-EFC15511B46F@arm.com>
References: <20250219130244.2119582-1-festevam@gmail.com>
 <20250219130244.2119582-3-festevam@gmail.com>
In-Reply-To: <20250219130244.2119582-3-festevam@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PA6PR08MB10661:EE_|AM4PEPF00027A6A:EE_|DB4PR08MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: fafb82dd-faf4-4b71-d2bd-08dd5692ad35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eEkvZTFETS9QYmUxUElVdzEyMFA3WTBLUlJTallweFA1ZExXVVJ1RnNNQ3RJ?=
 =?utf-8?B?d3FBelB6QWh1Sk9iYXM3dHVzd3R2OGgyYlQwY2NLRXozTk5vWHFvV2tqZ1Z3?=
 =?utf-8?B?QUFLam5KQXJpYVBIVGFNZ1gyMmJtTmRZRUIvNWVBRHFqdDF5QkhCeFk4UlRv?=
 =?utf-8?B?eVpCdk9teEowR2NIMVpRRHFuOFVxek95Zi9YODU1UllaTW5GeGdNQ2o4L0xH?=
 =?utf-8?B?U0pkT3BxdnF6Z3RwREhxUGNKVVJiakZ3bUQ4M0xRaUh3Kzg5aGZMOUtXRXAv?=
 =?utf-8?B?WnJzdUx5OE1XZW95bE52UmVJd3diNEN1WVlnUmhZWHA1YkxHczNkZUdUbzk4?=
 =?utf-8?B?bHNEQVhpOW1HT1N1K3ZLOUs5OXJWRW41Z1dQRE5HcXpvSXNIL3pMYmtFakRm?=
 =?utf-8?B?Y01aWGtUWGd4eUxQd0FJSktweHR3WTJwbnVkRTlycHBBZ0gwd1lmdUd1RktP?=
 =?utf-8?B?WVFheTRrSEpJTW5aMFk4UG9TQi9GUFN3YkZJVDV4KzhaMFJvMFRoMUtUTzVO?=
 =?utf-8?B?K3FablhYb3JsMjdYUFBFWlh5QjdHaVNnSStSRHBUYjUzeHJGc1R6dlZTYVFG?=
 =?utf-8?B?VW5wRTVlNjBaaDBkRHRsTFZnNEJ5SjNjemZ1UnRNZUd0M2JGTnRrYWVWM2No?=
 =?utf-8?B?OFVLSS9KaXIzN0hHQTVyOXhQTUsrWkRKaGJQVHFpbXJOdHNtRVRJdVhTTys2?=
 =?utf-8?B?MjRUbE5TVkc5bUNkOUNNVFVpQk5obWRWWlNZekdIRlBwU2xsQ2JDZmMzek5s?=
 =?utf-8?B?M05KTnZnYnRubFdkMlVXb0tkQVNvME81dGkxZmY3d3lzRFRycWdDWk1aZkZs?=
 =?utf-8?B?bWlRTndYaHVwR3JObU0yc2tXM2xmOFlDeVhWMTZrUDI1MzZLVlNSZHF2VTdS?=
 =?utf-8?B?dXlDSlpCMzd3RzhIT0R4RmxrdGtEZ2p4QUo5bytwZG1wMEJIeVdONWorbmp1?=
 =?utf-8?B?a3BXT2NBU281L1Y2OExZVEhpV09hOGpKUUJaeGZEZDdlV1J6akZMM20zQkNh?=
 =?utf-8?B?NlgzRnFQTGVNRzVoUG5SMURldlg0YkMvNUtxS2JVN0NVaXVVR05VMXR2U2ZS?=
 =?utf-8?B?ZkR5TVJtZDhJN3hPanozYzZtbFcySUlhbTljT3l6ekEwODdrQU1DWVZRTnJj?=
 =?utf-8?B?MFBPR2dtM0ZQVjFnbjFRZUt5NGJYYzk4RUNHM1UyUUdRMStUMEJ5UnJKY1JH?=
 =?utf-8?B?TFBRVW9oQlVvOGg2b0haRDAyV2tIM08xOE01VnFMRUJORG0rTHlaV3BFbkpS?=
 =?utf-8?B?MnREWlJ4S0RQMFlzY05XVzVMTC91ZFV3eXBnZ21JTG5FOFJNK2kwZm5zTERt?=
 =?utf-8?B?T2l4ZnhHT3Axdm1rNlNOalQ2ZTdFMzFTZjcycjhXUEVmdHFhd05POFVwNzdW?=
 =?utf-8?B?M3VlcW13a1UxZlViOHcvT1lPd01vbzJGcVVGMlpEdHZyLy9JU0NiQ29pdGQ3?=
 =?utf-8?B?MDFyRDV1S0EwVkJrbzd2U0pENjZXckVKVGo0UGRmRG0zQlQ2T2x6N0tpQW05?=
 =?utf-8?B?cVEzYXNSQkwyT1M1akl6dHdaOWdyT2lwcEpzL3EwRlA1YWtOWlpmR1M0Z1VH?=
 =?utf-8?B?a0tBTWJjQXAvTklwdkZpdlYwRDdwUkZXc2Fra3dCemxKY21UZnlrZHpIMnFr?=
 =?utf-8?B?TVVEU2srbTZ1ekFadDE3YWg1OGhZS0VQT1ZVMUF5UkhBRktWamNUcWkzeTVW?=
 =?utf-8?B?TFN1NEs5K2p1ZjRZZWw3aVJuMVJnVnVzclplNnVxWFJCWlc0eUVxVVBIcDRy?=
 =?utf-8?B?NlM1OXhCdVBlYWRiekdvWVd4elZ4dnVtSW5BY2RTZzhHQ252b05EY3IvU0xz?=
 =?utf-8?B?T2x0OFltNGpmcEE4NEZGdDN2TVUvQndZL3pYVVZZc0pNU0ZkZFNERDZBNmI5?=
 =?utf-8?B?Z0k4bmtlamcyNFZrQjgxVit3N2c5WEY3MHFjV1hLNnhGY0tHbUxhQ2tYZFlZ?=
 =?utf-8?Q?8Ak0GRMHGfhLLvDH99Ptmp5epHX90GSY?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-ID: <F23235B7B68CFA4D953257A8836A73C8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10661
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5157f0eb-b865-421d-e455-08dd5692a824
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|14060799003|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzZ4STc5Zjg2QlMrQSs3ZlY3dU9EdGZyYzVtWE9SbFlWNG9WeUc3VjA2MUR6?=
 =?utf-8?B?blRtZmNOeGdEUkpFamdGVXFtWTdzQnBEb0F6bkRiS0RJbjI5ZWR4Y25qaHFy?=
 =?utf-8?B?cEI4UUZTdHhrK0dVTmRKajh3aTlPbGlXeEFUaWsrdityNHJEZGRxZGt6V3dh?=
 =?utf-8?B?SllpYUZmL2pXUVB1SWFhQ2VKZGZCaytKQmtQMGoreGtwRkE3aGlpSE9UOFBl?=
 =?utf-8?B?YnVkUWtnWjB2VXZubVV1TlZMRnFOM09qTzJldjM4WndKaEx6bDJVMkpLcmw5?=
 =?utf-8?B?RUdTWjFNejhWdGVYNUZ1NlFIeFoybFNLd0JPYjJJVG9rOCtEbjFnWWpORkd6?=
 =?utf-8?B?eHFpbGtpYVF5UDlDSzdEWmVwcEpFSGJOMDlBQXBXNHFUMis3THpEUHA4cE5i?=
 =?utf-8?B?TTFkZnFtUC9QWmJSNUVpcjZEMVVXVzVCZHVUYXlTY3NaK242L0pKeityVEsx?=
 =?utf-8?B?eFRwdDZqN1h4U3RweW01MzcybFY5ZVFMb1RPcStZUU1nNEpwZklZRDRhbTZy?=
 =?utf-8?B?SU9qNEdaY0xtWTF1ZHd6R1V5a3EwMithaGpINzJlVlJpeTQvRTdTaktZOVJh?=
 =?utf-8?B?V1Z2WURDRi9DdjlGVCtHYXpXdjhGTmk1QXZsekxZY2hPejBvS2NkRXo1NENt?=
 =?utf-8?B?Yi92bmYremdRaUtDWmZqelBka21CUk5adVJ6WHpjS3UxM0ZmTHRVT3NiN0h0?=
 =?utf-8?B?K0dKeGVFTFQyVjlwMlZ1b296LzR2NkFqMUZVV3VrK0JpMEVPUW9FemYzK2FC?=
 =?utf-8?B?Q2ozVlFzejZ6VW0yQnVJSmVyaFMyWHFtbFhaQy9MMzFHOGRsMEU2UHNxOHAv?=
 =?utf-8?B?dXBpemhYMFNSdSt1VVlRS1A2cDhYVVJEZGlDR3FHM25pbFNsYWxjWnUvTzVQ?=
 =?utf-8?B?aDB4L0NHTzNzSThsMHYzODZja2NtVkRzSDJoemVtaG5JdzQrUjhkcEhzQ1pm?=
 =?utf-8?B?QXVucnR5Zm1xWWFTbVNWWFdZZXlMMktEaG94TUwyZ1R3ZEVpVGVibE44THJh?=
 =?utf-8?B?N2VtWEIwMm9ZZktPblA5WVNQUk1ScW90dkN5OHRxZk9IektONk5nMnl2YkJt?=
 =?utf-8?B?L2VQY2Q0YlcwREVMNlJCTzEwQ3VuMytFSTVtSENzNkRWNGZSL3c4TXNsUnNE?=
 =?utf-8?B?Vi9WZzYvdWkvMFdQd09xakI2UUF4ZldaejNLOC9BWjB4Z2xlRDNtajV3QnN4?=
 =?utf-8?B?dzlZR1hWTlpoUWZEMXVhZW0wemlRbEMwMzdhY01tbFJhZzZQR3I0KzZNL0oy?=
 =?utf-8?B?OExYMWR0V01JY3ZhR3hNRlhySXl5aEJVSFJ5SzR1UGhRby9QYmkvTVlqL2k2?=
 =?utf-8?B?ZlZZTnBFekhudE80bklxaEUvbkZJNVdPWlBBTjNnV0d3MlhXRDk5R0R0SFpG?=
 =?utf-8?B?cGlIYyt1dEQvOHdaZ25vK0lBVm14Y1Irb2FzaStXeVFuVHRHSnhqSFdBcW84?=
 =?utf-8?B?UFMxSFN2RktDbHN2VmNUM3k0d0xlMTVrVzRLbEIwazlMejIxc3phZk05TE8r?=
 =?utf-8?B?Nzd6Ny9MZlhYVURKcjhnTFJaeGNoZEdOdUdUdWpzTmdSbGJYLzk1QlppVHlN?=
 =?utf-8?B?Tlg5YmVKcjl1M3k2c2ZSdFZMbFRFTTFIN2U3a3VIbDJmUTdjSnludmYyaXNs?=
 =?utf-8?B?a1NWQnlSbytZUWR3RU5xYmJabXM2NmFTSG5JUHlZQ2NoTDN2UVQrVkY0eHRP?=
 =?utf-8?B?T20vNVFBb2FuUEcrQjMzUGhqR3lmT25OeEx0QkVSbjBvaCtXTXhlWGx1Y3Rx?=
 =?utf-8?B?Q3pwZFF0OW1OL3dTTE5GMXJqM0NpNXNkTmRScC9KYy9xNWhobEFpSng2d0V4?=
 =?utf-8?B?VVhua0lBc0hSc3gxVHhoT2h2TVJrS0dRRFN4TDJoQzZ5aTdvSzhNcTV4dDNo?=
 =?utf-8?B?THUyY2Q1Nm9hdWRra1g1WTd4Y1RXY21Wb1h3c0VQeHJ5VFhGUThlR2cwY3Zx?=
 =?utf-8?B?UWNOaDNCV3doVms2YTJ2VEJIM2FVY2oxMlJiTVRlT2VJSWZ3cVhIaUY1S2tZ?=
 =?utf-8?Q?+rsJeHxeMo7m0VWCmWhC2NByqf7/Fg=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:23:32.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafb82dd-faf4-4b71-d2bd-08dd5692ad35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_102347_772260_B15954ED 
X-CRM114-Status: GOOD (  11.20  )
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

T24gMTkgRmViIDIwMjUsIGF0IDEzOjAyLCBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+IHdyb3RlOg0KPg0KPiBtdXNsIHJlbGllcyBvbiBhbiBleHRlcm5hbCBleGVjaW5mbyBsaWJy
YXJ5IHRvIHByb3ZpZGUgYmFja3RyYWNlDQo+IGZ1bmN0aW9uYWxpdHkuIElmIG11c2wgY2Fubm90
IGxpbmsgdG8gbGliZXhlY2luZm8sIHRoZSBmb2xsb3dpbmcgbGluaw0KPiBlcnJvciBoYXBwZW5z
Og0KPg0KPiBGaXggdGhlIHByb2JsZW0gYnkgY2hlY2tpbmcgZm9yIGJhY2t0cmFjZSBzdXBwb3J0
IGluIGxpYmMgZmlyc3QgYW5kIGlmIG5vdA0KPiBmb3VuZCwgdGhlbiBjaGVjayBmb3IgYmFja3Ry
YWNlIHN1cHBvcnQgaW4gdGhlIGV4dGVybmFsIGxpYmV4ZWNpbmZvLg0KDQpJZiB0aGlzIGlzIHRo
ZSByaWdodCBzb2x1dGlvbiwgaXTigJlzIG5vdCBjb21wbGV0ZS4NCg0KbXRkLXV0aWxzIGFscmVh
ZHkgY2hlY2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgZXhlY2luZm8uaCBhbmQgdXNlcyB0aGF0IHdo
ZW4gY3JlYXRpbmcgbGliL2xpYm1pc3NpbmcuYSwgd2hpY2ggaWYgZXhlY2luZm8uaCBpc27igJl0
IHByZXNlbnQgd2lsbCBjb250YWluIGEgc3R1YiBiYWNrdHJhY2UoKSBpbXBsZW1lbnRhdGlvbiB0
aGF0IHNpbXBseSByZXR1cm5zIDAuICBUaGUgdGVzdCBzdWl0ZSBhbHJlYWR5IHVzZXMgdGhpcyBz
byBpdCBjYW4gYnVpbGQgb24gc3lzdGVtcyB3aXRob3V0IG11c2wsIGJ1dCBwcmVzdW1hYmx5IG5v
Ym9keSB0ZXN0ZWQgbXRkLXV0aWxzIG9uIG11c2wgYWZ0ZXIgInViaWZzLXV0aWxzOiBBZGQgaW1w
bGVtZW50YXRpb25zIGZvciBsaW51eCBrZXJuZWwgcHJpbnRpbmcgZnVuY3Rpb25z4oCdIGxhbmRl
ZCwgd2hpY2ggYWRkZWQgbW9yZSB1c2VycyBvZiBiYWNrdHJhY2UoKS4NCg0KSSB0aGluayBlaXRo
ZXIgbXRkLXV0aWxzIHNob3VsZCBoYXJkLWRlcGVuZCBvbiBfc29tZXRoaW5nXyBwcm92aWRpbmcg
YmFja3RyYWNlKCksIGJlIGl0IHRoZSBsaWJjIG9yIGEgZHJvcC1pbiBsaWJyYXJ5LCBvciBpdCBz
aG91bGQgdXNlIGJhY2t0cmFjZSgpIGlmIHByZXNlbnQgYW5kIGdyYWNlZnVsbHkgZmFsbGJhY2sg
b3RoZXJ3aXNlIChhcyBpdOKAmXMgYSBjb252ZW5pZW5jZSBmZWF0dXJlKS4gIE5vdCBib3RoLCB3
aGljaCBpcyB3aGF0IHRoaXMgcGF0Y2ggYWNoaWV2ZXMuDQoNCknigJlsbCBzZW5kIGFuIGFsdGVy
bmF0aXZlIHBhdGNoIGluIGEgbW9tZW50IHdoaWNoIHVzZXMgbGlibWlzc2luZy5hIGluc3RlYWQg
b2YgcmVseWluZyBvbiBhbiBleHRlcm5hbCBsaWJleGVjaW5mby4NCg0KTm90ZSB0aGF0IHRoZSBy
ZXN0IG9mIHRoZSBzZXJpZXMgaXMgZ29vZCwgdGhpcyBpcyB0aGUgb25seSBjaGFuZ2UgSSBoYXZl
IGNvbW1lbnRzIG9uLg0KDQpSb3NzDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2Yg
dGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBh
bHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3Nl
IHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3Nl
LCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5
b3UuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
