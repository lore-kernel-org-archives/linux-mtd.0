Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077A2C87FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WN6gASW3ee55+5f19jYg54vt//Z8pn9ANFqwfTLcuNU=; b=XwgsHj0VxYFWco
	ZyxeJt68ocahoYQOiKriTN4p4LokkPw2SaxR3yQw0odJb8FXblWkUmeabD9tP7kHKbkgAKOp5wQVh
	vkvGr7JvVGbV4fJgdqZtnhwLfm2bICGJCskOdWZVjmgeSTts9TscYFnajuXAH+YS5WhR19B76/ge0
	VDDZ6d8okTTR4XlgQwMI8gMcoq4uTxolqbWIFcBLwmQsTSvSAq2DZ+KBvFlGvYE4lNV8VFKkZ7b7N
	e4yw1Q3843GGrGZIQwCEvToQIN8YbWOPLBfP87fnp7Exj+vV/mdiVBzFRZXzdyHeNLcOFpmwRJy5M
	QNP17av0gkke0h1pom/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1hU-00000000vsY-04n9;
	Wed, 30 Jul 2025 07:58:12 +0000
Received: from mail-co1nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2416::626] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Vz-00000000ug9-3iDb
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 07:46:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrPosiHqrXq8CFpZbKsld25IounkdB+0Ob1rae/i4xLI2QXj9Bz07tS+t4lKvPo/ocZcJZSf0Zq9CGEI4WCbej8jPe1UDTgScN1OwW4DAk9QANK6TNy6pRwcSlz8RA7l2njR6dXyxArvoeAnbVPrFDujtysSokXPUk0WO5WMdxANDPTzBtd1kmR2MlQL4yc2ggGRGVQ5jea5FK7fOd7btOAuS1MmrwZ2oUcuQ+2rhG1ACC5yBmctde0hmAPLmj532l0yu0jBoEtFzneM+USh9EGEaXDHsct33o0AgW+xNtaq2MAXkwYjK4udU13FA0U/rerJpDtigt0HDbORbLUoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY+oFBN1WGjgD+E0UghNqg3oVMr2saLeWUpdwchdEoI=;
 b=NOoyefGlbICv8VmxRyipucC94sRq+DnF3qSsqdbYKf+Va+aGeFMrV28wtJ7kFeSGXtpy9X0x5sxjTx1bumePMDQEKdQW10JfXEirsTtWZRtMBlEnLzX6zYh307iR0FyjcN8IjV8loW4GCIZOkxJ689Vmho/I5MDWzKs0Gu0rDcmm4yxMvxfYmwlxqBe3RL2j3XYKZFwMnrjbZzekW3t5uII9hPqRjstQYLw92coxV+q5MGq6CMtzJKfavoVNH5Ggm9NdB6ZGD60MR+YJII7yPCLd6XEKWNLJ8rXk4iK1PbNKKHE9cveWP+KmxIiKwtkvd7FP1NHOCXg73502DTs3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY+oFBN1WGjgD+E0UghNqg3oVMr2saLeWUpdwchdEoI=;
 b=IPdJkFb/ejAh7n5jPrULtpo79rD3DzdDOYzfyrAhs8rOMZ0qZ4FJ+qn1Phk60I5rxLpUcWhd3diZSgfAWA03BTCD0vo2FT7ljb42gmtqSe27D0SgG89zHegJBq1udT7WrvuX7jR/A4aNKHLTrezDwQPxSY82RwOnEs3hq9DYKMX1esId6huneHh8Z+h7i2xhJoKE/LNVoUtgAxZZL//xrc1OmeKEni/CQvavdAw9tWTd3AxSVciVh4eGM39QLh/Mcb0WSqeH9LSvONYGmRDAr46I7tV2yMW/8aKHw7pNoxWLdKe5YDoFs3bnxK5APunzlR7yEnS9tKwGu3SW8dGf6g==
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by DS0PR03MB7278.namprd03.prod.outlook.com (2603:10b6:8:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 07:46:15 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 07:46:14 +0000
From: "Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>
To: Michael Walle <mwalle@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
	<linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
	"Gerlach, Matthew" <matthew.gerlach@altera.com>
Subject: RE: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Thread-Topic: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Thread-Index: AQHcAPLLJpnSjUK3G0+J/n9y4LRWFbRKRaUAgAAAp3A=
Date: Wed, 30 Jul 2025 07:46:14 +0000
Message-ID: <MN2PR03MB49271E2D022D305BC149BA4FC624A@MN2PR03MB4927.namprd03.prod.outlook.com>
References: <cover.1753839339.git.khairul.anuar.romli@altera.com>
 <566fc1168db723672ab0bc6482ec7b72b4b8fe2b.1753839339.git.khairul.anuar.romli@altera.com>
 <DBP7P3RWX17B.14Q27IBS3T3FL@kernel.org>
In-Reply-To: <DBP7P3RWX17B.14Q27IBS3T3FL@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR03MB4927:EE_|DS0PR03MB7278:EE_
x-ms-office365-filtering-correlation-id: aad2c316-7f36-460b-dc21-08ddcf3d2939
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?d1pnUkdneHhoSlpXbGo0dlkzYTJZZjh6ZWdWalRzY1YyOFFQcXdTMys0MlEw?=
 =?utf-8?B?NDlNbjNvSjBDMzcwdUlteE0xQUJRS091WHhqRC9CWmw1UVVtejBEY2c4dnZx?=
 =?utf-8?B?SFZ1NXM3VHo5WGJHMjdPVU1IaUkrRmxVUXU4dGoxcmhrMkh0WkEvbVVPWDkx?=
 =?utf-8?B?VitvNklZUG43KzE3RUI5ejdKcDJRbDVXK2FhVklONlh5SUtYYUo2cXZvU054?=
 =?utf-8?B?Z2N4aUdIaWxNNXZTd0dxQzEzTjhOSlBtRkQyeFVBUk91SEk2eG5HZ2ZOSElQ?=
 =?utf-8?B?Zjk0UndYbWU1QnNkOVBFRzVSdGNTdytJK3ZQMFFBUHNSQTUyWWo5aEQyYnU0?=
 =?utf-8?B?SmV5QTRhc3dEUzFDcTdYM2xGNUxHR1VEVFBtWW01cWtZcDhtOHpzL1hQd1ZH?=
 =?utf-8?B?WFNQZTVQWVAxbHRCR2ZwNWZSQjQ2QllRRnZSb2RDR0YvVXBTdjM4MjlBUTlk?=
 =?utf-8?B?a280TURDbXlrelFUS1RyazJ3aXRWbnpEOUpReEd5Zy9lMVVUbUtLaFhCUzdm?=
 =?utf-8?B?RWdNeldUeUptT1FjclJKMmlwRGl4cXNFZUpMb2FuQktMY01FR2tiSzBnWERj?=
 =?utf-8?B?cVB3Zy95Q2pmbVFYOFpGTDNYQUJ2UVQvQXdmd0l6UmYxMEowR0l1YXFRUHd3?=
 =?utf-8?B?YUdsZmlCQWE0bjlPRGJMUFZrazdUcWEvWk9Qc3I1RUQ0aHU0aFpscUttWXFQ?=
 =?utf-8?B?Tlg4RzhVS3IxUzZELzNRYzkzL1ErWHV4SnNvb2dLMjBDMTJickZXR0dEeEpN?=
 =?utf-8?B?TnJnTmtVQ3ZJcUJZQTZMUlRoMStUWXFsVUM4WVFSNVRCZDJkRmYyRnNqVkcr?=
 =?utf-8?B?bjF4b0ExcG5xaHBTeCtDWjY3M01UY3FkZE9EVkt5MmFlV2VtVWk3dnJuRytD?=
 =?utf-8?B?cGtpeFptb2lCbHdzc3pWK0kzR0VPRmJzV3lRMjFVamlzdnF5QXViSXJYa1RH?=
 =?utf-8?B?ZEdnL3VnZHB0YzZXaG50cjJWWGE4endrcTZOY3NmN1ZGKzlhcjZkWnZSbWl1?=
 =?utf-8?B?NERBUnhWVHpzNzRMWXg5SFNpc3BUTGw2ZUIyeHlhSmtybUZpblJDaVdLcVVD?=
 =?utf-8?B?b05EUVlkYjA2azcrWEVuYmlTQktkRzY2TGpkMDFvVVF6aFZhbTNYVCt5WCsy?=
 =?utf-8?B?azdueXNaZW4yWnloaWtiTU1xc1l5RzJrMmJtTFQ3N0t4N2xDdVdLMVBNa2E3?=
 =?utf-8?B?aStKMllVT2UrWWdjdUlMTGxmamQ5a1pybmREcnBBRnFQSDRwVjZ4ZXNpVkdp?=
 =?utf-8?B?cWd4ZjZMUFZvaTZ6T2VremhML3dBSXhUakE4RnpQRWZ6WE1IUnRJdGZvNkx1?=
 =?utf-8?B?Y0tVN2NhVk9Da2JtVjBFK3ZMWXNxRUM4eXc5bENLT1doZjdGblU3YzJFZmdW?=
 =?utf-8?B?VTN4QkN0bTZ3cHhybjRDWVlhZ09OeE15NEpuVlF5Z2JRUlk5U2xxaEs4bTlj?=
 =?utf-8?B?YlZDanhLaW8yR3pSalFQVUU0dHIreDdaUWFySVJ2OHpBaTVEZmQ4c2F3TWI2?=
 =?utf-8?B?NUg1dXM3ZEZHSmg4N3VhdkwvZ0JEZTNTV091Q2tBWUt1RkI2OW5RZUVvQ25L?=
 =?utf-8?B?WW9VUzFSd2oxd1o3dUJsRVhWZjdtWEdkcmRlOUhCUlVlQjMyU2hvak9WMnlo?=
 =?utf-8?B?S1VXa1ROMWR4c1BDbTRhU242UXlCQk9oaStiTFhYK1JkaVhKTWRONzJIeEk3?=
 =?utf-8?B?Ym5oVXRaaFBQZWIxUTBSS05lMzNSMmpMRWRrS2NtQ0R1VUhCTUNxbXZ3c1M4?=
 =?utf-8?B?TGRKQzA4SE1WeWtXTkhVOFRiYXhYZ2VmbEdSK1FCMXV3VXdoS2ZYaHI5eWR3?=
 =?utf-8?B?SlBRS2FEU3NKOE5JNm5ZZ0dmWGp6VWF4N2dzOTlGaFdLN1BicFBzb2ZSa3RX?=
 =?utf-8?B?R2wxQXNPTUNUMGVseXA2eWlDdGJ1aSs4bmVUd09kcGJhM0JHN3Z4cUsyRVRO?=
 =?utf-8?B?UnBCNHNCWjJjWVlIQUNNbCtIelVGUWpjTHUzNGNNV2pkRFRZUnhYbkdKM25l?=
 =?utf-8?Q?1QpO3WajCZ1QVs1XJiAXbrBSKaeNsw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2pKWTF6eG93WThXbjZUWnlWRWRnY2NQZmsrRkkxV2JGc1Y0SDJQZldpbnlS?=
 =?utf-8?B?THhVL1RrVm5yUEJ5ZGxQczBhM3RqVjl3ZjQrN2FmalBVNHkzTUg5WGVUaElv?=
 =?utf-8?B?MG1XalFHcDdreG1CT1U3aSs1djRzS3hrVlJvUU8rUmlEOTNEc3F1djZ4WXNv?=
 =?utf-8?B?YWFOT1pjU05GNElFbUF2a0pad2pUaU1tbjFQckE2akZWaXlRMXlFUUxGRGVR?=
 =?utf-8?B?SjFDMWFKcTFiMmVmMkovZGczVUVHRlBGSmx2UDdKQ0pMSEJGT1hiNW1hcXJX?=
 =?utf-8?B?bmkxaE91RWM5KzhDaXBoL1NwUm1DQzIxU3RRdHBDQzhPc0xlUDcvZ3U4VUdR?=
 =?utf-8?B?cVpDNnAzLzZxMUpvSGd3YVFQRTBKK1NtU2JPcWV1eVhMY2ZMQTVzRElDdGFp?=
 =?utf-8?B?VytFN1RmeTYzYkZIbUIwZlBVR2I1NzBMZEtEcVE2dWV2QjZaTXR1WWJQdGxO?=
 =?utf-8?B?WFZKSklUSmkzSFVWclZHNE5ma0hTYUFtMDFFTnJKTjZUbVkyVXRBTEFCVFhw?=
 =?utf-8?B?ZC9VbjdXak83YkVteXJIVHVTQTBKUWp0S0NtTEpuMHlvdWlRSVFUTGVyQ2tU?=
 =?utf-8?B?RE9IUGpRWXVuSDVXU1BPWWVRMW54NlhpbFovQ2s4MXczaUY3Z0ltNUlGajhj?=
 =?utf-8?B?NGkwb2RyVUpiVUVMNEhGUFFaRUZ5bGkwbUFOTHl0KzQ4WHoyb3NNM241WU9D?=
 =?utf-8?B?UTFLUlhadEd3blFNeWI0TDA1MXRES3crOVdQTW10KzlvQ1BuQ21FMFp3WEdS?=
 =?utf-8?B?Z0FZcU1nYUd1WGVqM29ORXdJRGxaVlcwSVVFa2Z0S1FhUkplVTJQSncvVFEx?=
 =?utf-8?B?Tk9IQ1lUQVpjcmVPQjJ5c0RJNm1ianJ2Z2pvU3RZSUlMa2hOaGRuQk9zZHBR?=
 =?utf-8?B?czZBSnlXZHp2aDFRRU00S3JCTG1oNmpxc0hvandyU0RONzNVTUM2Y25jb2Nt?=
 =?utf-8?B?c0FMcTlwQk12VWgzcmVDKzZEQXRmbVo2Rm5EZHBOMlpmTElRQkgybVFIdUhL?=
 =?utf-8?B?KzFGbkpya2NZS2ZYNTJ0QVowbXRNWEJ5Z0ozV3BQY1FLTXNOUnRtaVYzMU1C?=
 =?utf-8?B?VkJXR0pjL21jbHZiSk9ESVMvZWpiNkF5czNZVFNsQ25ROElkUE9QdExReUZz?=
 =?utf-8?B?cnhhT3BRS056b3ZoNHAzT05xWksrK1YvVHgrTzRyTXJnRnNYUE9OdFlJZ3dD?=
 =?utf-8?B?YUNIYUl5ckZQV2FXQ2ZCcDRaL0kzeUlkZ3dabWhoU3dtZE1RNU1xMHVzdWlG?=
 =?utf-8?B?aVRSV2oyUStzOUdyemJ6Nm56OHRNWFRWVEdGMUlKa0ZTWFp0RFFjc2NsOHp4?=
 =?utf-8?B?YzNjZHQ1VHJsTER5dEtxYklwT0lYdGN2ZS91MEFoYTk1Nit2bUdPYzFZbjdh?=
 =?utf-8?B?eW1HcmxBb3FwTkFJcFB6VDdkNmhXT1BFN2FKelI0clg5amZUVktJeDYyejBC?=
 =?utf-8?B?Rm5uMW54akg0S2ZGTUxBY2dXcHZETFhIVTZCOXdEK1p4M29ITjdTbzIzWTd5?=
 =?utf-8?B?VkxPNHBlNTEwZHVtM1pOK21pOW4wM3hCQ0xydlg2VXl1aURwYS94bE1sMms4?=
 =?utf-8?B?Uk84aXhqalNkeGltQ3pYakxhM1dTbStrei9UVXI5dkVYUlFOUlNYbWs3VDd6?=
 =?utf-8?B?bm9DVUtPcEs2SlgyME1YNTlUTzlpRWszaUcvRkdBTzB5c1FsNUxhMGJqVGg4?=
 =?utf-8?B?UittRi9nWDNZQ0RKL1RFNUllbXBxNFFEVDI4bnp0T3JwZ3RpSks2VEM4bTlF?=
 =?utf-8?B?VXh4VUdzYTJVNTczSkV2NUN6cDBRWXZzMC9nTURyeE12S1lKdTVNLzNBVTZh?=
 =?utf-8?B?SUMzV3hINHMrQzVMSFc2aW5RcXd0bENFc2dZRXozdDhaQlh6ckZwQlpCL3Mz?=
 =?utf-8?B?WE80OEp4a1JLb1RkdGQrelpwOGZqTlJYYkwvVXludkZyVzY5V1lFaTZ0Y1d4?=
 =?utf-8?B?aHJEN0xjWDFtNUh4VURER3FYQkYwd3Q5T0QySmx1M0VpSFVFZUxpRzArWG5E?=
 =?utf-8?B?cUI3KzRFWG92SmNwdG4rdXJnNUlaRGY5QUEyQkRqSzFvaXJqZXlSUUxyeEJh?=
 =?utf-8?B?SnlGUkJnRzVqTEdVb0dzRVhRMkw5alpPVXpTdGd0N084elRJZnNQVzRNb292?=
 =?utf-8?Q?q1Uraki+Y7tAl5d/norsL0X8a?=
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad2c316-7f36-460b-dc21-08ddcf3d2939
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 07:46:14.8062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HwC7TNEiB4eMal61hSKSN6lIIeGc1YsSW5bAUf76FXkI7HCI7sUOKftlpcNEV83SDh+a2XoUzt6AxpWrck86ZtFYmrYKItGQlJ6nWPPAB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004619_979497_567FFD30 
X-CRM114-Status: GOOD (  18.12  )
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



> -----Original Message-----
> From: Michael Walle <mwalle@kernel.org>
> Sent: Wednesday, 30 July, 2025 3:30 PM
> To: Romli, Khairul Anuar <khairul.anuar.romli@altera.com>; Tudor Ambarus
> <tudor.ambarus@linaro.org>; Pratyush Yadav <pratyush@kernel.org>; Miquel
> Raynal <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>;
> Vignesh Raghavendra <vigneshr@ti.com>; open list:SPI NOR SUBSYSTEM
> <linux-mtd@lists.infradead.org>; open list <linux-kernel@vger.kernel.org>;
> Gerlach, Matthew <matthew.gerlach@altera.com>
> Subject: Re: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
> removal with active read or write operations
> 
> Hi,
> 
> On Wed Jul 30, 2025 at 3:39 AM CEST, Khairul Anuar Romli wrote:
> > From: kromli <khairul.anuar.romli@altera.com>
> >
> > Ensure that the pointer passed to module_put() in spi_nor_put_device()
> > is not NULL before use. This change adds a guard clause to return
> > early, preventing the kernel crash below when the cadence-qspi driver
> > is removed during a dd operation:
> 
> As already asked in v2. This needs a (more detailed) description what is going
> on and what is going wrong.
> 
> -michael

Hi,

We just run the following test we observe the crash. 

time dd if=/dev/mtd1 of=out.img bs=1MB count=1000 &
echo spi0.0 > /sys/bus/spi/drivers/spi-nor/unbind
echo spi0.0 > /sys/bus/spi/drivers/spi-nor/bind

From the observation, the dd is not entirely terminated when the unbind took place.
Maybe there is other changes require to ensure the dd operation gets terminated 
when driver unbind/remove.

> > [  200.448732] Unable to handle kernel NULL pointer deref erence at
> > virtual address 0000000000000010 [  200.457576] Mem abort info:
> > [  200.460370]   ESR = 0x0000000096000004
> > [  200.464136]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [  200.469527]   SET = 0, FnV = 0
> > [  200.472609]   EA = 0, S1PTW = 0
> > [  200.475904]   FSC = 0x04: level 0 translation fault
> > [  200.480786] Data abort info:
> > [  200.483659]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > [  200.489141]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [  200.494189]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [  200.499500] user pgtable: 4k pages, 48-bit VAs,
> > pgdp=0000000185df8000 [  200.505932] [0000000000000010]
> > pgd=0000000000000000, p4d=0000000000000000 [  200.512720]
> Internal
> > error: Oops: 0000000096000004 [#1] PREEMPT SMP [  200.518968]
> Modules
> > linked in: 8021q garp mrp stp llc bluetooth ecdh_generic ecc rfkill
> > crct10dif_ce rtc_ds1307 at24 stratix10_soc soc64_hwmon gpio_altera of
> > _fpga_region fpga_region fpga_bridge uio_pdrv_genirq uio fuse drm
> > backlight ipv6 [  200.540016] CPU: 0 UID: 0 PID: 372 Comm: dd Not
> > tainted 6.12.19-altera-gb6b26
> > c4179a6 #1
> > [  200.547996] Hardware name: SoCFPGA Stratix 10 SoCDK (DT) [
> > 200.553292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--) [  200.560234] pc : spi_nor_put_device+0x30/0x60 [
> > 200.564594] lr : __put_mtd_device+0x8c/0x120 [  200.568856] sp :
> > ffff80008411bc20 [  200.572161] x29: ffff80008411bc20 x28:
> > ffff000185e2c500 x27: 0000000000000000 [  200.579282] x26:
> > 0000000000000000 x25: ffff000185e2cb00 x24: ffff000185e2cc88 [
> > 200.586404] x23: ffff00018034c620 x22: 0000000000000001 x21:
> > ffff00018873e080 [  200.593524] x20: 0000000000000000 x19:
> > ffff00018873e080 x18: ffffffffffffffff [  200.600645] x17:
> > 0030393d524f4a41 x16: 4d0064746d3d4d45 x15: ffff000185757700 [
> > 200.607767] x14: 0000000000000000 x13: ffff000180045010 x12:
> > ffff0001857576c0 [  200.614888] x11: 000000000000003a x10:
> > ffff000180045018 x9 : ffff000180045010 [  200.622009] x8 :
> > ffff80008411bb70 x7 : 0000000000000000 x6 : ffff000181325048 [
> > 200.629129] x5 : 00000000820001cf x4 : fffffdffc60095e0 x3 :
> 0000000000000000 [  200.636250] x2 : 0000000000000000 x1 :
> ffff00018873e080 x0 : 0000000000000000 [  200.643371] Call trace:
> > [  200.645811]  spi_nor_put_device+0x30/0x60 [  200.649816]
> > __put_mtd_device+0x8c/0x120 [  200.653731]
> put_mtd_device+0x30/0x48 [
> > 200.657387]  mtdchar_close+0x30/0x78 [  200.660958]
> __fput+0xc8/0x2d0
> > [  200.664011]  ____fput+0x14/0x20 [  200.667146]
> > task_work_run+0x70/0xdc [  200.670718]  do_exit+0x2b4/0x8e4 [
> > 200.673944]  do_group_exit+0x34/0x90 [  200.677512]
> > pid_child_should_wake+0x0/0x60 [  200.681686]
> > invoke_syscall+0x48/0x104 [  200.685432]
> > el0_svc_common.constprop.0+0xc0/0xe0
> > [  200.690128]  do_el0_svc+0x1c/0x28
> > [  200.693439]  el0_svc+0x30/0xcc
> > [  200.696454] dw_mmc ff808000.mmc: Unexpected interrupt latency [
> > 200.696485]  el0t_64_sync_handler+0x120/0x12c [  200.706552]
> > el0t_64_sync+0x190/0x194 [  200.710213] Code: f9400000 f9417c00
> > f9402000 f9403400 (f9400800) [  200.716290] ---[ end trace
> > 0000000000000000 ]--- [  200.720948] Fixing recursive fault but reboot
> > is needed!
> >
> > Fixes: be94215be1ab ("mtd: spi-nor: core: Fix an issue of releasing
> > resources during read/write")
> > CC: stable@vger.kernel.org # 6.12+
> > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> > Changes in v3:
> >     - exclude !dev && !dev->driver check in spi_nor_get_device to
> >       resolve kernel test robot smatchwarnings.
> > Changes in v2:
> >     - Move the null check prior to try_module_get().
> > ---
> >  drivers/mtd/spi-nor/core.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index ac4b960101cc..eb21d660036b 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3210,6 +3210,9 @@ static int spi_nor_get_device(struct mtd_info
> *mtd)
> >  	else
> >  		dev = nor->dev;
> >
> > +	if (!dev->driver->owner)
> > +		return -EINVAL;
> > +
> >  	if (!try_module_get(dev->driver->owner))
> >  		return -ENODEV;
> >
> > @@ -3227,7 +3230,8 @@ static void spi_nor_put_device(struct mtd_info
> *mtd)
> >  	else
> >  		dev = nor->dev;
> >
> > -	module_put(dev->driver->owner);
> > +	if (dev && dev->driver && dev->driver->owner)
> > +		module_put(dev->driver->owner);
> >  }
> >
> >  static void spi_nor_restore(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
