Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7409CCFA04
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyRPxDGoVRZxjVbD2VXYlYzdiGIJ8ar9d13eMRJiX68=; b=QX88w3RxZcecfQ
	/hi6TfX57BioyJY6iNcxNoyPyI8krbe7mtGKqh2thDjWHdbut9HsVKe+qoiXLS8COeCTST7Qmdwxk
	0UeYJKEVkJCKqjpX3goruOZVvmfMhcsvUmciqA3MVkPg9rj6yBz4ZSzLVGZ6ipjisxIVr+H3XKL+7
	9/5y0NkkaRBGEyjSA10sdvAAoH+KpnMJgtbP4QOZEiH3UOcPG45J9YDIw6GAbnieeJv53ePKQjtE4
	rkK+EB5hxOa/7zrTdYZz97XQQF50JfbrUPG/VM61kIY+3cjHUJwNuGJ5AEFp7UjGVhQI8Zh0f9CCs
	DTuVGA/f4TvVKICZm9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZJh-0000000DKdo-02fd;
	Wed, 05 Nov 2025 08:56:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZJe-0000000DKdC-00pM
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Nov 2025 08:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NDqm4rcvWvlCpx1cGgQ42uwyBw/hMeyG3HE5RqKlfp4=; b=NnLLhhWuNjemP6zJ5kvvXnROYk
	wXZkZgtwHypVm/FcYThqEdGXjiE4AsNVrUF0NoJRevb7zdJI/vELCWiCIO57caDfMfJun2jJj2jbV
	vkNNzCcA+s8AxVkoa7WFUaZaVQHePz1niztqKxQTod5DxD8iZ2YxCL2HjFIyJIqvz7iy1myDl0O72
	qBuKY1YI2WdaFUduAfhZuU/TUrdxzEjcpIDORcu+J53+wmRAbNF8x4Fo4CGwVsExWgLtsRbobt8Ya
	p1oQDdW6KosM9xhU34fcAWl18HbgTWAtKhWZt3x4Y/oPiDQkzvZMEZoN35wHZZdsAsCqQo0T5P6P7
	B41Fo84Q==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYRi-00000001ftS-42XE
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 08:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlspQ5sfDh91g4LkpAF+a7njuIM/Az/1hOqgute5OcXQRKHGpYEaY4clsGFHNxj5t6CzMfOR/TMd9DPJJVKbmLnwkzzZJwUBd5xwwNZb6+t3gKxSzKCXmFue3DV3O3sY1SlSZgfgW+RjP9oPW7FL7oz5MeBQouu9gx5vM1u57i2bALq/WOBJJhbeSHCActxPD6SiOpa0khsUGGthyoJ+RrLfKkoCaOw09WmdMccUt1cFekaGg6TEcI8EkFyf7ByZk2tNPpIikBQ++rK7ngl81yTpks69vy8DhhWu1qiGqK2zwM+YjEWJKE+fbS96b3OMhAjjxwtfOZLuZEePzU6zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDqm4rcvWvlCpx1cGgQ42uwyBw/hMeyG3HE5RqKlfp4=;
 b=AA2m6//o6BTSH3sVRwaypAHbY/dd/P2ArduPnb0pjuRalelZLPrua3pok2RGI9LLW17RQsYg/6k+c04QkySo7b0hsVMzl426g8C7v8HCuswj/yw7pQiHyat55/CMVCPpKx6cRwcYVRPIgJVsxnRL/1HSmzZV2a5yAID3rtr+zBuNmYeDdabY+ZBtoeE4g+7TfJs9LCBor7s0j8ks/P4r4PwPRI7qSK4MQly+zB/P9BFy2CYJwlcH6U/Qn+4AuyRp5510LmJ3Lr/G9oeCG7blKu9JAXVaTFktNlCMMpcz8tLEHnFqHh/l6fNb77MTZPVRZVcrEpXg6QDiWN8G7yaX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDqm4rcvWvlCpx1cGgQ42uwyBw/hMeyG3HE5RqKlfp4=;
 b=OtSmZnMUzUigqZN/imCUQKkuWOEh67rDCyrwRfFEqaa+TyCHuOcErkSx+LXUkq7DQZ5E6q40ut7nBGz7KRnH/2WtIU5d8yIEfk51PKbM5sY7EUsymt2TbgeFnOuIBPIGb5l70sKXdfJeQMYTSNGkGhFmchVVaX/dkuBoRsR3ujI=
Received: from BL0PR02CA0043.namprd02.prod.outlook.com (2603:10b6:207:3d::20)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 08:56:06 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::cf) by BL0PR02CA0043.outlook.office365.com
 (2603:10b6:207:3d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 08:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 08:56:06 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:56:03 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:56:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 02:56:03 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A58txfk3397118;
	Wed, 5 Nov 2025 02:55:59 -0600
Message-ID: <ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com>
Date: Wed, 5 Nov 2025 14:25:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<p-mantena@ti.com>, <linux-spi@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<a-dutta@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <87qzunt4n4.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87qzunt4n4.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|SA2PR10MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf82e82-1f7e-4e39-38e1-08de1c4927fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEtreTZEMXR3U0dJTjJvUDlHcUFDbytvYXhmK2Z2MXNMZ0hndnVIVEFiRWl3?=
 =?utf-8?B?MGJ5Zzc4cnJwcVRybFdHMHRmUjZuZ3MxWU43bDJyTWhkT0l5VUg3TWxhS3Rq?=
 =?utf-8?B?dG5EV0FyUGRqY3pDLzFWYUJsYzN4dmVXcmtDSElJQ3h6dGtJSXFYOHNBOHpX?=
 =?utf-8?B?QVFlV3VnekpsanZmT0IxdEhURkVGNlh4b3dGRmVaUXhsVjYxR1MwQ3ZRMGw0?=
 =?utf-8?B?a1hYd3ZNcW12eGlRT09pbnRGMWk5Q3VqY2dqUWtiZnRPWTBlVWV6a3h3R2l6?=
 =?utf-8?B?ZElqc0ZaU21pTHNRbFAxSUNnajFCSEhhWjIzRURFQ3ZtZFRueXpMN3Vqd0tx?=
 =?utf-8?B?YW5JaHpEdmgrOGV5Rm1EbEJWelJ0TnFmUGhmVFF1RHA2bjZiNklqbXhHelpS?=
 =?utf-8?B?MTR6N2ZSaVBDb1hJVE9pU1BEdjFqMFF5b3kxdWNrcHFYbHNIdERXSGpkck1m?=
 =?utf-8?B?MWh5VkhTa2dqai82aEN3cHRXZHBmWnJpMnFPaGlEbzFrSlpUZ1Z0cS9uYWV1?=
 =?utf-8?B?UldMYUw0NDdNdnhUMW1xdldiOXJwSUZXSlRKNXFvblFRbzF4Q2p5aDBaSFFw?=
 =?utf-8?B?V2hjTWx6cWV1N1Izc0l2WDdhMEFrakxoenhZOC9JWmd4ckFWYi9RUkhIbGF4?=
 =?utf-8?B?NlIwaTVmbFdGYTZGRGxTd3drbFMyNUVMbTZWQ3UxMVdPZDVkL1ppaGNDK1RP?=
 =?utf-8?B?RVpENS9LeHlwOGlwMGlrVGI2UFAyYmUyOEhaYVJzYmEzN3pYSEJmSGRjd2tQ?=
 =?utf-8?B?cVVqamc3bjgxa0NOZ0Z3Y3RDNkVyYzZOS1U0V0I1ZnVURHo4Q2QxU00yV3Ax?=
 =?utf-8?B?eUl6aFB2L1hnZG1zZ21tU1Bjb3g1dnZTbEwxeGh5UGI5bEtlL0s5MndFdnd4?=
 =?utf-8?B?SXNqbTRkN1FEc0RSalBUeE1ZNElYOWlVZXBldXUwTFZrbzNQMmNPWXM4M0tF?=
 =?utf-8?B?bXBvWW4vU1Z4YTRJUVU5Y2cxRjk0TVY0bFJRVFora0RuTjBDWGxSMEdSd3Fx?=
 =?utf-8?B?Y0dYTmZyN05Obkx6Sm9xZnVyYzlpU2lIZmY1SU1rcUNZUEpaRDMwbnU1eXp6?=
 =?utf-8?B?eE8zTGYxekhMR0FUSmRBbitjdWNWNGt4SW5wR1V3QURKZFpkOFBtcUdTWVFm?=
 =?utf-8?B?d29INm4wSlN3UVUxeEZMVGNHTkhMVXI3RnZZQnFCeHVFLyswd2NjUnNyTzJt?=
 =?utf-8?B?aW5uUTZPRDRySHZBT3JOU05YeFhCMkVpNDhXL3FSbThYZXF5MHh2bFlwMEdv?=
 =?utf-8?B?dCthK3grblNWWDBOS2pod3oweGx1Y3MwNytqNy9LTThRdjg2QStPMEx1MWJt?=
 =?utf-8?B?OTZTSXI3bFhEQU5yNjZTRXFTd2RKTlNkZG1uSGVGNm9rMGJ2VW9YUlZvU1Rm?=
 =?utf-8?B?SzdyRXp6eDNWaFoxNElaUTJWcVZ0ZHM4QW1VNXFld01LNnB5cXd3eXJMeWlk?=
 =?utf-8?B?SUZqb1A4bXBaUXlzVVVUQjl4WkIvNlFobEYwU1ZEMEpmdHgzY0tnTkF5d3hU?=
 =?utf-8?B?NjdsQkZxZmdBWGlRVUEvOVMwTHViQTNSeVFMWlhVUko1UkpkNTJRUTltbkM1?=
 =?utf-8?B?WE90VXBzWXR1YTdnOGhsSW05T3lPVTJwcWE5OUVRSFViQW5jVTJVT1ZJbXZy?=
 =?utf-8?B?ejBEZUs1M1I5LzlIbVpoUXo4emlPa2N5aHhMUXVUYVlkUm9IWFArR1ZYaGNN?=
 =?utf-8?B?M1N4MzFSZytldlI4Sit2MWtRYXhrWk45dXpRR3J6bWVLSUkxRkJpZ2VNdFRx?=
 =?utf-8?B?N1NweVJKUjUrNStKZlRZVldiZktrODJjVkJKMFBhZFVRYi9keVlDT3BWS2lV?=
 =?utf-8?B?dWF5aFltTFRYdFh1QlpRNlNKc0VFZU5Eek9xdk5ucUxJUk9WaVhuU0Ezd2xp?=
 =?utf-8?B?QVB3T1FraFBTUlIvdVV4WXdZeXl1RncvMTNhd1R4eGdnaXZtU09lVFNYTUlQ?=
 =?utf-8?B?RktmM2pzVXJUOGxiM3RtanZWVk14UE5Mb3pZMVFzM1dpV2NVTmxCME42RGRL?=
 =?utf-8?B?elEwMlJlVktrbFVVMEIvWnUxUWVNajBqUkR0Qk5ZSVRuNlUwZXlrRWhzVDdC?=
 =?utf-8?B?M2syU2lZdU9Ba3l6WU1GYkhYbmM4NjNIZ0ZuTFA3VTBtVllJMEowVEdLdU8x?=
 =?utf-8?Q?fioM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:56:06.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf82e82-1f7e-4e39-38e1-08de1c4927fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080049_080654_69F1FCF1 
X-CRM114-Status: GOOD (  42.47  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjgvMTAvMjUgMjE6MTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGVsbG8gU2FudGhvc2gsCj4gCj4gT24gMjAvMDkvMjAyNSBhdCAyMzoyNTozMSArMDUzMCwgU2Fu
dGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+IHdyb3RlOgo+IAo+PiBIZWxsbywKPj4KPj4gT24g
MTAvMDkvMjUgMTM6NTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBPbiAxMi8wOC8yMDI1IGF0
IDAxOjAyOjEwICswNTMwLCBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4+IEZyb206IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgo+Pj4+Cj4+
Pj4gU29tZSBjb250cm9sbGVycyBsaWtlIHRoZSBDYWRlbmNlIE9TUEkgY29udHJvbGxlciBuZWVk
IHRvIHBlcmZvcm0gYQo+Pj4+IHR1bmluZyBzZXF1ZW5jZSB0byBvcGVyYXRlIGF0IGhpZ2ggZGF0
YSByYXRlcy4gVHVuaW5nIGlzIG5lZWRzIHRvIGhhcHBlbgo+Pj4+IG9uY2UgdGhlIGRldmljZSBp
cyBzd2l0Y2hlZCB0byBhcHByb3ByaWF0ZSBtb2RlIChzYXkgOFMtOFMtOFMgb3IKPj4+PiA4RC04
RC04RCkuCj4+Cj4+IEFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbnNlIC0gSSBzdGFy
dGVkIHByb3RvdHlwaW5nIG5ldyBzb2x1dGlvbgo+PiBiYXNlZCBvbiBvdXIgZGlzY3Vzc2lvbnMg
ZWFybGllciwgd2hpY2ggdG9vayBzb21lIGFkZGl0aW9uYWwgdGltZS4KPiAKPiBNeSB0dXJuIHRv
IGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5LCBlc3BlY2lhbGx5IHNpbmNlIHlvdXIgZmVlZGJhY2sg
aXMKPiB2ZXJ5IGNvbXBsZXRlLgo+IAo+Pj4gVGhpcyBpcyBhY3R1YWxseSB3cm9uZy4gVHVuaW5n
IGlzIHdheSBtb3JlIGdlbmVyaWMgdGhhbiB0aGF0IDopCj4+PiBJZiBzb21lb25lIHdhbnRzIHRv
IHVzZSBhIGNoaXAgYXQgYSBoaWdoIGZyZXF1ZW5jeSAoNTBNSHogaW4geW91cgo+Pj4gY2FzZSwK
Pj4+IGJ1dCB3aGF0ZXZlciwgdGhlcmUgaXMgYSB0aHJlc2hvbGQgYWJvdmUgd2hpY2ggYWRkaXRp
b25hbCBjYXJlIG11c3QgYmUKPj4+IHRha2VuKSwgaXQgbXVzdCBnbyB0aHJvdWdoIHRoZSBjYWxp
YnJhdGlvbiBzdGVwLiBJdCBkb2VzIG5vdCBtYXR0ZXIgaW4KPj4+IHdoaWNoIG1vZGUgeW91IGFy
ZS4gQ2FsaWJyYXRpb24gd291bGQgc3RpbGwgYmUgcmVsZXZhbnQgaW4gc2luZ2xlIFNEUgo+Pj4g
bW9kZS4KPj4+IFRoaXMgNTBNSHogYm90aGVyZWQgTWFyayBiZWNhdXNlIGl0IGlzIHRvbyBDYWRl
bmNlIHNwZWNpZmljLiBNYXliZQo+Pj4gdGhpcwo+Pj4gc2hvdWxkIGJlIGEgY29udHJvbGxlciBw
YXJhbWV0ZXI/IElmIHRoZSBzcGktbWVtIGNvcmUgKG9yIGV2ZW4gdGhlIHNwaQo+Pj4gY29yZSwg
YnkgZXh0ZW5zaW5vKSBzZWVzIHRoYXQgdGhlIGRlc2lnbiBhbGxvd3MgcnVubmluZyBhdCBYTUh6
IChkdWUgdG8KPj4+IHRoZSBTUEkgcGVyaXBoZXJhbCBwcm9wZXJ0aWVzIG9yIHNpbXBseSB0aGUg
YWJzZW5jZSBvZiBhbnkgbGltaXRhdGlvbiksCj4+PiBhbmQgaWYgdGhlIGNvbnRyb2xsZXIgc3Rh
dGVzIHRoYXQgaXQgcmVxdWlyZXMgYW4gZXh0cmEgdHVuaW5nIHN0ZXAgYWJvdmUKPj4+IFlNSHog
KGFuZCBYID4gWSksIHRoZW4gaXQgbGF1bmNoZXMgdGhlIGNhbGlicmF0aW9uLgo+Pj4gICBGcm9t
IGEgY29yZSBwZXJzcGVjdGl2ZSwgSSB3b3VsZCBsaWtlIHRoZSBjYWxpYnJhdGlvbiBob29rIHRv
IGJlIGFzCj4+PiBzaW1wbGUgYXMgcG9zc2libGUsIGJlY2F1c2Ugd2hhdCAiY2FsaWJyYXRpb24i
IG1lYW5zIGlzIGhpZ2hseQo+Pj4gY29udHJvbGxlciBhbmQgY2hpcCBzcGVjaWZpYy4KPj4KPj4g
SSB1bmRlcnN0YW5kIHRoZSBjb25jZXJuIGhlcmUuCj4+Cj4+IExldCBtZSBwb2ludCBvdXQgdGhl
IG9wdGlvbnMgZm9yIGxhdW5jaGluZyB0aGUgdHVuaW5nIHByb2NlZHVyZSwgYWxvbmcKPj4gd2l0
aCB0aGUgaXNzdWVzIGluIGVhY2ggYXBwcm9hY2guCj4gCj4gVmVyeSBnb29kIHN1bW1hcnkuCgpU
aGFua3MgeW91IGZvciB0aGUgcmV2aWV3IQoKPiAKPj4gT3B0aW9uIDE6IExhdW5jaCB0dW5pbmcg
YXMgcGFydCBvZiBzcGlfbWVtX2V4ZWNfb3AoKQo+PiAgICAgLSBBZnRlciBzcGlfbWVtX2FjY2Vz
c19zdGFydCgpLCBpbnRyb2R1Y2UgYSBzcGlfbWVtX25lZWRzX3R1bmluZygpCj4+IGNoZWNrIChh
IG5ldyBjYWxsYmFjayB0byBTUEkgTUVNIGNvbnRyb2xsZXIpIHRvIGNoZWNrIHdoZXRoZXIgdGhl
Cj4+IGN1cnJlbnQgb3AgcmVxdWlyZXMgdHVuaW5nCj4+ICAgICAtIElmIHllcywgd2UgY2FsbCBz
cGlfbWVtX2V4ZWN1dGVfdHVuaW5nKCkKPj4gICAgICAgICAgLSBvbiBzdWNjZXNzLCBtYXJrIHR1
bmluZyBjb21wbGV0ZSBpbiBhIGZsYWcgd2l0aGluIFNQSSBNRU0KPj4gQ29udHJvbGxlciBwcml2
YXRlIGRhdGEKPj4gICAgICAgICAgLSBvbiBmYWlsdXJlLCB3ZSBhdHRlbXB0IGEgZmFsbGJhY2sg
YnkgY2FsbGluZwo+PiBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKCkgYW5kIGRyb3AgdG8gYSBsb3dl
ciBzdXBwb3J0ZWQgZnJlcXVlbmN5Cj4+Cj4+IE9wdGlvbiAyOiBMYXVuY2ggdHVuaW5nIHdpdGhp
biBzcGlfY29udHJvbGxlci0+ZXhlY19vcCgpIGltcGxlbWVudGF0aW9uCj4+ICAgICAtIFZlcnkg
c2ltaWxhciB0byBvcHRpb24gMSwgZXhjZXB0IHRoYXQgdGhlIHNwaV9tZW1fZXhlY3V0ZV90dW5p
bmcoKQo+PiBpcyB0cmlnZ2VyZWQgZnJvbSB3aXRoaW4gdGhlIGNvbnRyb2xsZXIncyBleGVjX29w
KCkgaW1wbGVtZW50YXRpb24KPj4gKG5vIG5lZWQgZm9yIHNwaV9tZW1fbmVlZHNfdHVuaW5nKCkp
Cj4+Cj4+IERyYXdiYWNrcyBpbiBvcHRpb24gMSBhbmQgMjoKPj4gICAgIC0gVHVuaW5nIHJlcXVp
cmVzIG11bHRpcGxlIHJlYWRzIG9mIGEga25vd24gcGF0dGVybiwgYnV0IHRoZSBmbGFzaAo+PiBt
YXkgbm90IGFsd2F5cyBiZSBpbiBhIHN0YXRlIHRvIGFsbG93IHJlYWQgY29tbWFuZHMKPj4gICAg
IC0gTm8gZmFsbGJhY2sgb24gZmFpbHVyZXMsIGNhbid0IG1ha2UgZmxhc2gtc3BlY2lmaWMgYWRq
dXN0bWVudHMgaW4KPj4gY2FzZSBvZiBhIHR1bmluZyBmYWlsdXJlCj4+ICAgICAtIE5vIGFjY2Vz
cyB0byB3cml0ZV9vcCgpIHRvIHdyaXRlIGtub3duIHBhdHRlcm4gdGVtcG9yYXJpbHkgdG8gYW4K
Pj4gb24tZGllIGNhY2hlLiBQYXR0ZXJuIG5lZWRzIHRvIGJlIGFsd2F5cyBidXJudCBpbnRvIHRo
ZSBmbGFzaAo+Pgo+PiAgICAgLSBQbHVzLCBpbiBvcHRpb24gMiAtIHdlIGNhbid0IGNhbGwgc3Bp
X21lbV9hZGp1c3Rfb3BfZnJlcSgpCj4gCj4gVHdvIG1vcmUgc2lnbmlmaWNhbnQgZHJhd2JhY2tz
Ogo+IC0gaXQgYWRkcyBhbiBleHRyYSBzdGVwIGluIHRoZSAiZmFzdCBwYXRoIiAtbWF5YmUgbmVn
bGlnaWJsZT8tCj4gLSBzcGlfbWVtX2V4ZWNfb3AoKS8tPmV4ZWNfb3AoKSBhcmUgY2FsbGVkIHdh
eSBiZWZvcmUgYmVpbmcgcmVhZHkgZm9yCj4gICAgY2FsaWJyYXRpb24uCgpZZWFoLCBpdCdzIG5l
Z2xpZ2libGUgLSB0aGUgdHVuaW5nIHJ1bnMgb25seSB0aGUgZmlyc3QgdGltZSB0aGF0IG9wIGlz
CmNhbGxlZCwgYW5kIHdlIGp1c3Qgc3RvcmUgYW5kIHJldXNlIHRoZSBwYXJhbWV0ZXJzIGFmdGVy
IHRoYXQuCgo+IAo+PiBXaGlsZSB0aGUgbmVlZCBmb3IgdHVuaW5nIGlzIGRpY3RhdGVkIGJ5IENv
bnRyb2xsZXIgc3BlY2lmaWMKPj4gY2hhcmFjdGVyaXN0aWNzIHRoZSBvcHMgKGFuZCBzdGF0ZSBv
ZiB0aGUgY2hpcCkgcmVxdWlyZWQgdG8gY29tcGxldGUKPj4gdHVuaW5nIGlzIHVuZGVyIHRoZSBj
b250cm9sIG9mIHNwaS1tZW0gdXNlcnMgKHNwaS1uYW5kL3NwaS1ub3IpLgo+PiBTbywgaXQncyBp
bXBvc3NpYmxlIHRvIGFjaGlldmUgdHVuaW5nIHdpdGhvdXQgdGhlIGhlbHAgb2Ygc3BpLW1lbSB1
c2Vycy4KPiAKPiBTb3VuZHMgbGlrZSBhIGNvbnN0cmFpbnQgd2UgY2FuIGFmZm9yZCBpbmRlZWQs
IGVzcGVjaWFsbHkgc2luY2UgdGhlIG9wcwo+IHRoYXQgY2FuIGJlIG9wdGltaXplZCwgYXJlIGZs
YXNoIHNwZWNpZmljIChyZWxhdGl2ZWx5IGZldyBjb250ZW50IHRvCj4gc2hhcmUgYmV0d2VlbiBz
cGkgbm9yIGFuZCBzcGkgbmFuZCkuCgpUcnVlIQoKPiAKPj4gU28sIE9wdGlvbiAzOiBMYXVuY2gg
ZnJvbSBTUEkgTUVNIGNsaWVudHMKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKG10ZC9u
YW5kL3NwaSBvciBtdGQvc3BpLW5vciwgZXRjLiwpCj4+ICAgICAtIE9uY2UgdGhlIHNwaS1tZW0g
Y2hpcCBpcyBjb21wbGV0ZWx5IGVudW1lcmF0ZWQgYW5kIGJlc3QgcmVhZCBhbmQKPj4gd3JpdGUg
b3BzIGFyZSBjaG9zZW4gY2FsbCBzcGlfbWVtX25lZWRzX3R1bmluZyhyZWFkX29wLCB3cml0ZV9v
cCkgYXMKPj4gYSBwYXJ0IG9mIC5wcm9iZSgpCj4gCj4gVGhpcyBsb29rcyBsaWtlIGEgZGVjZW50
IHBsYWNlLCBidXQgdGhlcmUgaXMgb25lIGxpbWl0YXRpb24gdG8KPiB3b3JrYXJvdW5kOiBwaWNr
aW5nIGJlc3QgcmVhZCBhbmQgd3JpdGUgb3BzIHJlcXVpcmUga25vd2luZyB3aGF0IHRoZQo+IGNv
bnRyb2xsZXIgaXMgY2FwYWJsZSBvZiBpbiB0ZXJtcyBvZiBmcmVxdWVuY3ksIHdoaWNoIG1lYW5z
IHdlIG11c3QgaW4KPiBhZHZhbmNlIGV4cGVjdCB0byBzZXQgdXAgY2FsaWJyYXRpb24gb3Igbm90
LiBJIGRvbid0IHRoaW5rIGl0J3MgYQo+IHByb2JsZW0sIHRoaXMgaXMgc29tZXRoaW5nIHdlIGtu
b3cgaW4gYWR2YW5jZSB0aGFua3MgdG8KPiBlZy4gc3BpLW1heC1mcmVxdWVuY3kgaW4gdGhlIERU
LCBidXQgSSBzdGlsbCB0aGluayBhIGNvbnRyb2xsZXIgc3BlY2lmaWMKPiAibWF4aW11bSBmcmVx
dWVuY3kgd2l0aG91dCBjYWxpYnJhdGlvbiIgY2FwYWJpbGl0eSBtdXN0IGJlIGNhcnJpZWQgZm9y
Cj4gdGhlIGNvbnRyb2xsZXIgdG8gZGVjaWRlIHdoZXRoZXIgdGhpcyBzdGVwIGlzIG5lZWRlZCBv
ciBub3Qgd2hlbiBhc2tlZAo+IGJ5IHRoZSBzcGkgbWVtIGNsaWVudC4KCk1ha2VzIHNlbnNlISBX
ZSBjYW4gbWFpbnRhaW4gc3VjaCBhIHByb3BlcnR5IHRvIGRpcmVjdGx5IGNoZWNrIHdoZXRoZXIK
dHVuaW5nIGlzIG5lZWRlZCBvciBub3QuIEknbGwgYWRkIHRoYXQgaW4uCgo+IAo+PiAgICAgLSBJ
ZiB0dW5pbmcgaXMgcmVxdWlyZWQsIGNhbGwKPiAKPiBJIGd1ZXNzICJ0dW5pbmcgYmVpbmcgcmVx
dWlyZWQiIGlzIGEgY29udHJvbGxlciBjaG9pY2UsIGJhc2VkIG9uIHRoZQo+IHRhcmdldCBmcmVx
dWVuY3kgZm9yIGJvdGggcmVhZC93cml0ZSBvcHMgYW5kIHRoZSBjb250cm9sbGVyIGNhcGFiaWxp
dHkKPiB0byBhY2hpZXZlIHRoaXMuCj4gCj4+IHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcocmVhZF9v
cCwgd3JpdGVfb3ApCj4+ICAgICAgICAgIC0gSWYgb25seSByZWFkX29wIGlzIHByb3ZpZGVkLCBp
dCBpbXBsaWVzIHRoZSB0dW5pbmcgcGF0dGVybiBpcwo+PiBwcmUtZmxhc2hlZCB0byB0aGUgcGFy
dGl0aW9uCj4gCj4gSW50ZXJlc3RpbmcuIEkgZ3Vlc3MgdGhhdCBsaXZlcyBzb21lIHJvb20gZm9y
IHR1bmluZyBQSFlzIGR1cmluZyB3cml0ZXMgYXMKPiB3ZWxsIHdpdGhvdXQgbW9yZSBjb3JlIG1v
ZGlmaWNhdGlvbnMgbGF0ZXIsIGlzbid0IGl0PwoKWWVhaCwgeW91J3JlIHJpZ2h0LiBTZWUgUGF0
Y2ggMDgvMTAgLSB3ZSBlbmFibGUgUEhZIGZvciBkYXRhIHdyaXRlcy4KCj4gCj4+ICAgICAtIE9u
IHR1bmluZyBmYWlsdXJlLCByZXRyeSBieSByZS1ydW5uaW5nIHNwaV9tZW1fbmVlZHNfdHVuaW5n
KCkgd2l0aAo+PiB0aGUgc2Vjb25kIGJlc3Qgc2V0IG9mIG9wcyAobWF4IHRocm91Z2hwdXQgLSAx
KQo+IAo+IEkgd291bGQgbGlrZSB0byBjaGFsbGVuZ2UgdGhpcyBuZWVkLiBDYW4gdGhlIHNhbWUg
Y2FsaWJyYXRpb24gZmFpbCBpZgo+IGF0dGVtcHRlZCBtdWx0aXBsZSB0aW1lcyAoZWcuIGJlY2F1
c2Ugb2YgdGhlIGhlYXQ/KSBJZiB5ZXMsIHRoZW4gd2UgbmVlZAo+IGEgZmFsbGJhY2sgaW5kZWVk
LiBPdGhlcndpc2UsIEknZCBiZSBpbiBmYXZvciBvZiBqdXN0IGZhaWxpbmcgdGhlCj4gcHJvYmUu
IENhbGlicmF0aW9uIGlzIGFuIG9wdC1pbiAtPiB1c2VycyBtdXN0IGFsbG93IGEgaGlnaGVyIGZy
ZXF1ZW5jeQo+IHRoYW4gdGhleSB1c2UgdG8gaW4gb3JkZXIgdG8gZW5hYmxlIHRoZSBmZWF0dXJl
PwoKSXQncyBwb3NzaWJsZSB0aGUgc2FtZSBjYWxpYnJhdGlvbiB3aWxsIGZhaWwgaW50ZXJtaXR0
ZW50bHkgZm9yCmRpZmZlcmVudCByZWFzb25zICh0ZW1wZXJhdHVyZSBjaGFuZ2VzLCBhcyB5b3Ug
bWVudGlvbmVkKS4gSWYgdHVuaW5nCmZhaWxzLCB0aGUgZHJpdmVyIHNob3VsZCBmYWxsYmFjayB0
byB0aGUgbm9uLVBIWSBmcmVxdWVuY3kgc28gdGhlIGZsYXNoCmNvbnRpbnVlcyBvcGVyYXRpbmcg
d2l0aCBzbG93ZXIgcmVhZHMvd3JpdGVzIHJhdGhlciB0aGFuIGZhaWxpbmcgdGhlCnByb2JlIChh
dmFpbGFiaWxpdHkgc2hvdWxkIGJlIHByaW9yaXRpemVkLCByaWdodD8pLgoKPiAKPj4gV2l0aCBv
cHRpb24gMywgc3BpX21lbSB1c2VycyBhcmUgbGltaXRlZCB0byBjYWxsaW5nCj4+IHNwaV9tZW1f
bmVlZHNfdHVuaW5nKCkgYW5kIHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcoKS4KPiAKPiBJIHdvdWxk
IGV2ZW4gZ28gZm9yIGEgc2luZ2xlIHNwaV9tZW1fdHVuZV9waHkoKT8gT3IgaXMgdGhlcmUgYSBw
b2ludCBpbgo+IGhhdmluZyB0d28gaGVscGVycz8KCk1heSBiZSBub3QgbmVlZGVkLCB3ZSBjYW4g
ZG8gdGhlIGNoZWNrIGFuZCB0dW5pbmcgd2l0aGluIGEgc2luZ2xlCmZ1bmN0aW9uLgoKPiAKPj4g
UmVzdCBpcyBoaWRkZW4KPj4gd2l0aGluIHRoZSBjb250cm9sbGVyIGRyaXZlcnMuIElmIHNwaS1t
ZW0gdXNlcnMgY2hhbmdlIHJlYWQvd3JpdGUgb3BzLAo+PiB0aGUgYWJvdmUgc2VxdWVuY2UgY2Fu
IGJlIHJlLWlzc3VlZC4KPiAKPiBJIGRvbid0IGhhdmUgdXNlIGNhc2VzIGZvciB0aGF0IGluIG1p
bmQsIGJ1dCB3aHkgbm90Lgo+IAo+PiBUaGUgY29udHJvbGxlciBjYW4gc3RvcmUgdGhlIHJlYWRf
b3AgYW5kIHdyaXRlX29wIGluIGNhc2Ugb2YgYSB0dW5pbmcKPj4gc3VjY2VzcyBhbmQgcGVyaW9k
aWNhbGx5IHJlLXJ1biB0dW5pbmcsIGVuc3VyaW5nIHdlIGFsd2F5cyBoYXZlIHZhbGlkCj4+IHR1
bmluZyBwYXJhbWV0ZXJzLgo+IAo+IFlvdSdsbCBoYXZlIHRvIG1ha2Ugc3VyZSB5b3Ugb25seSB1
c2UgUEhZIGNhbGlicmF0aW9uIGZvciB0aGUgb3BzIHRoYXQKPiBoYXZlIGJlZW4gdXNlZCBmb3Ig
dGhlIHR1bmluZyB0aG91Z2gsIGJlY2F1c2UgZm9yIGV4YW1wbGUgYXMgSSBhbQo+IHdvcmtpbmcg
b24gb2N0YWwgRERSIHN1cHBvcnQ6IGR1cmluZyBTMlJBTSB0aGVyZSBtYXkgYmUgdGhlIG5lZWQg
Zm9yCj4gcmV0dXJuaW5nIHRvIFNEUiBtb2RlLCB3aGljaCBpbiB0dXJucyB3aWxsIGhhdmUgdG8g
d29yayB3aXRob3V0IHRoZQo+IHR1bmluZyAodHVuaW5nIHBhcmFtZXRlcnMgd2lsbCBiZSBpbmNv
cnJlY3QgZm9yIHRoaXMgbW9kZSBmb3IgdGhlIHRpbWUKPiB3ZSBydW4gc2xvd2x5KS4gU28gZWl0
aGVyIHRoZSBjb250cm9sbGVyIGtub3dzIHdoaWNoIG9wZXJhdGlvbiBzaG91bGQKPiBlbmFibGUg
UEhZIG9wdGltaXphdGlvbnMsIG9yIHdlIG11c3QgcGVyZm9ybSB0aGUgd2hvbGUgY2FsaWJyYXRp
b24gYWdhaW4KPiBldmVyeSB0aW1lIHdlIHN1c3BlbmQgKG1laCkuCgpUaGUgY29udHJvbGxlcidz
IGNhbGlicmF0aW9uIGxvZ2ljIGlzIHN0cmFpZ2h0Zm9yd2FyZCAtIHR1bmluZyBpcwpyZXF1aXJl
ZCBmb3IgaGlnaGVyIGZyZXF1ZW5jaWVzIGFuZCBub3QgZm9yIGxvd2VyIG9uZXMuIFNvIHdlIG5l
ZWQgdG8KcGVyZm9ybSBjYWxpYnJhdGlvbiBlYWNoIHRpbWUgd2Ugc3dpdGNoIG1vZGVzLgoKSW4g
dGhlIGZ1dHVyZSwgd2UgY291bGQgZW5oYW5jZSB0aGlzIGJ5IHN0b3JpbmcgdGhlIG9wZXJhdGlv
bnMgdGhhdApyZXF1aXJlIHR1bmluZyBhbG9uZyB3aXRoIHRoZWlyIHJlc3BlY3RpdmUgY2FsaWJy
YXRlZCBwYXJhbWV0ZXJzIHdpdGhpbgp0aGUgY29udHJvbGxlci4KCj4gCj4+IE9uZSBjb25jZXJu
IHdpdGggb3B0aW9uIDMgaXMgdGhhdCB3ZSBtYXkgbm90IGJlIGFibGUgdG8gbWFrZSB1c2Ugb2YK
Pj4gc3RhdGljIGRhdGEgb24gY2VydGFpbiBmbGFzaCBhcyB0dW5pbmcgcGF0dGVybnMgKGxpa2Ug
cmVhZGluZyBwYXJhbWV0ZXIKPj4gcGFnZSBvciBTRkRQIHRhYmxlIGZvciB0dW5pbmcgaW5zdGVh
ZCBvZiBjb250cm9sbGVyIHNwZWNpZmljIGF0dGFjawo+PiBwYXR0ZXJucykuCj4gCj4gVGhpcyBp
cyB0cnVlLCBJIGtub3cgc29tZSBkZXZpY2VzIGNhbiBzZW5kIHBhdHRlcm5zIGR1cmluZyBkdW1t
eSBjeWNsZXMKPiBieSBJIGhhdmUgbm8gaWRlYSBob3cgcG93ZXJmdWwgdGhhdCBpcywgbm9yIGlm
IGl0IGNhbiBhY3R1YWxseSBiZSB1c2VkCj4gaW4gTGludXguIE9uZSBuZWVkIGEgY29udHJvbGxl
ciB0aGF0IGlzIGF3YXJlIG9mIHRoZXNlIGJpdHMgYW5kIGNhbgo+IGl0c2VsZiBhZGp1c3QvZmlu
ZSB0dW5lIGl0cyBvd24gY29uZmlndXJhdGlvbi4gRm9yIG5vdywgSSBwcm9wb3NlIHRvIGxldAo+
IHRoaXMgYXNpZGUgdW50aWwgd2UgZ2V0IHJlYWwgaGFyZHdhcmUgdGhhdCBjYW4gYmUgdGVzdGVk
Lgo+IAo+PiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cyBvbiB3aGljaCBvZiB0aGVz
ZSBkaXJlY3Rpb25zIG1ha2VzIHRoZQo+PiBtb3N0IHNlbnNlLgo+IAo+IExldCdzIGdvdCBmb3Ig
b3B0aW9uIDMuIEknbSBlYWdlciB0byBzZWUgdGhpcyBtb3ZpbmcgZm9yd2FyZCEKClllYWgsIEkn
bSBlYWdlciB0b28hIEknbGwgc2VuZCBvdXQgdjIgYXNhcC4KClRoYW5rcywKU2FudGhvc2guCgo+
IAo+IFRoYW5rcywgTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
