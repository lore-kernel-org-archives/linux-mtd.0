Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A110CCD184
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 01:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q2fIMnfXJtY62dCs0VHp+GnRMnRMkhYu0oGANqunTl0=; b=vtwWMmqwPJUDpF
	LawcX4tdxA2a2p/J6UdhISYB2eMh3bXeEt32y4xmiCtYjh+6kX6biulsCio1D9qQfxYn9rjzKa+Y+
	nHv7nUOSkN2kO5EQN2l5WncxK29VpYRwLklGgUE/PewYkV+Vx1NPxnXFWjnsazsHUU6j9z2Kgj5FH
	nc2L44N+N/+L+Amr7WuI5Z6K+yx+cISVBXiz6HnsOwyiD5GlDx/7KXx+QWOVnkdjoahXOeOw+yJBE
	3wqxABTE2NRql3qigVGog4ovuWZVGzE6lsMrTn+6Hb2EEPIOHGZ21DeLeRWcSK4EH+kirGSoxe4uN
	M9sLIdxPU3Mi7pEiIlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8720-0000000C1vC-1fYt;
	Mon, 13 Oct 2025 01:07:20 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v871x-0000000C1tn-2DIT
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 01:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkHpApEZEpcMUFsdE77H6QWr6OlDKcWzLOrlxKwyhDRX0g+Rxk0vHiBvZJsAFSzi9gwUBAWOjDHxJXw0KlTjzEQBrhMCFsW+ERajtVjAQ2XTBarmR2+V+76ENeZKNB45M2Td/szSweHtJ0tbIZrk1uOVrfwPNgUGq00s88rgAkUr+QAWRXGX267wOGJKru3z95qu3aGtyjwMu5wqAXZ8+BdIQellHsQ13WZ6gNjM5DbGJyCp/9uFakIm4F6juaMx+9Kgkw9X3aBtKQwXAqsMIfiMGGkRLUBJxDuG+kEHzmtqbu4L7x1QhcqX9GxZzUPqhcu0E8s9mK+J8KcSH+Xjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvjprVinY2+3T7xmnxVCYE+0v3JpB5bq65KjnlKqqa8=;
 b=zJhn3oWH1qiff5BHP0WUzsScf9/4nBQfk6RLcpCjvVFY74rfAehKtcE6Wn6r98Cim++efKCpVZ9EdAw+n/JxsDCfsJ+NtQXLPIIdwp7Yf9fcc9gRwZS0rjLR/IIx7W9TYx9aWf9woCUwAYIiLIJPVfou3jCgE0GoF8mdqIA8W5snu8qDtfDArEuFA+UMlB9s3MeNM4cgqCMjb8I3tQCVFbE+XeHU2lSIohLKGYUoNp/Y4p8g6z5D4KvUCVTg8E/ZU7ZAddQf2aEBxEVFAbxxvVx/gsnE59OGxtX9LnpWrZSvzroJGfJ0hJEGEyfPoABjfdNn1Xg1QROEZfYQJ4gEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvjprVinY2+3T7xmnxVCYE+0v3JpB5bq65KjnlKqqa8=;
 b=sLG3RGoOmXIUSIvh5Ti7tqZ7h6IPXnT1iQ88Rg9v9MLo+FaRUyfpU2eGg+8Q8pYIRjeTa4K8tMDTaxaxE03MnvwkZ3UGVHyGfQo59o41xWF0cAfIoWgypL90Ou9snG+1DLQ0aasb4SezRx5iwwzrvVkB26xBg8feqkMJ3s1arU3hBgNTVngSk/nYPZPFc+qefDu8ENFL+nS6JRXmZd4WIal6nDkYx1F2C3gjdI0f4vnHW/+fYVMAsuLmqEc/c3UWBrEVtgfK3ivJDF3hN6uQC0xEsGmU0UckN6rPAh4uWJLm0p6/VMhMHjK6HRbg6fVUFNkSuWE9Yp2PjYdbmzYuiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SA2PR03MB5946.namprd03.prod.outlook.com (2603:10b6:806:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:07:04 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:07:04 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux-mtd@lists.infradead.org (open list:CADENCE NAND DRIVER),
	Dinh Nguyen <dinguyen@kernel.org>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Subject: [PATCH 0/3] Add iommu supports
Date: Mon, 13 Oct 2025 09:06:52 +0800
Message-Id: <cover.1760316996.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SA2PR03MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: a56cf568-fe0c-493f-71eb-08de09f4d246
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zEWZdEX24XmQSxM6FlQzSdIKrbaY3QQJVHz1PS2eI2gZDzAJ26gEzeCksCX1?=
 =?us-ascii?Q?fuZIqShqBXtn8xqEWnEL0bKeZ4lbucL7z4LetEPCR7zG1CbLTSO/D6KPTkKA?=
 =?us-ascii?Q?BTZQPMltII15t7qrUQXhfFUXBOsJuoRMv2fImKg0CLBXkbs4Wc2jFxxWyCUe?=
 =?us-ascii?Q?2IHt//aj94FUqdlAbVUjeHdFC+Sht4Y3IsMxwerKVbVDeZhsinhNi5wAy+lN?=
 =?us-ascii?Q?1+9mperibeWQRF5c0yf+qaTrgWjotAWxK4ilgy38SakYDYqmvMHbsv11dJRi?=
 =?us-ascii?Q?Pp5fV0rVXBuiDuO04HXuVymsUHv5UWBwrzR6nkGv1S1GFB59uCTlCdmai3tO?=
 =?us-ascii?Q?ZSyqz9ASSL2K9UWqADCGI5h2i4WkKg7fF+M+KAsfz+Iznknj9E6Llfr9mUeE?=
 =?us-ascii?Q?7sXtEoMhoqbwDxkTakiuR2C+2m9iFqkaozV6PgOl5HyiRWzfBwinS+ecg9Bs?=
 =?us-ascii?Q?SHwHj0gO7XdX1NPI33R3qdOsAkewfHBg7ubVvtXiR++YBa/HGc7BrViZA2jd?=
 =?us-ascii?Q?EmnV7U1Oyg/PVzKX94LfwitpWNMX3KqaTMmMszMQUltEUyEldSApK7opSBnz?=
 =?us-ascii?Q?ENNazowoaJ+mhsIS1fSziRVX9LVD1pDKd2rUuIlEUCU4HHcOZ58x0zoViuIa?=
 =?us-ascii?Q?TBFpK/UPqtMdPNzXH9D0rP6/9eebKwam4FhI1UFNT9zVlQ/2zdKZZHpcBmC8?=
 =?us-ascii?Q?EJ5sU7fG9rMy7k2lurS/7xCBG/lpU8g2ey14zonvfpY2gWO3p/UJrDzfHOx4?=
 =?us-ascii?Q?1rqjK9cnonq2V7xmcVS1hJ1kzcMMiS8Hc0UElxeGfdkpmn91Und6217vv9Yg?=
 =?us-ascii?Q?XWriVeRTrRs43qd+WUSHMhDjvcRD8rJfbM+Ut3v0RzfeTOLq7p4If3qFEhX4?=
 =?us-ascii?Q?gWH/Qit6yyCmMa07xl4ZoZqKfn8/XnvDD5lEd2Vq3DwI3+4X9GWifMMtXeqf?=
 =?us-ascii?Q?x16+Tz7/jV+3mLAFCJPe+oZ2J9N6a/5RBMm2Rbq2ilyQLxrZ34Jz860acizU?=
 =?us-ascii?Q?qJ++jiEfTGpubCDe/QmjNTJz1MRnzHB/NITG+w/1r0rQmMPQvRzwQl1t5N2I?=
 =?us-ascii?Q?VQ/yBkg9dSX9iEd265idKVb70fhVtptU47dinaWHSnMi5kxURE62wSRMXyBF?=
 =?us-ascii?Q?KP0jcK6WOOPeIbiJRfxq2TMf7nE8Y13UR4Uu+cT8lys2gwMLp313fFGCek8Q?=
 =?us-ascii?Q?rG2stsqQVX8pC17llGjBzuNUbXKZZFQfUiPFQJpeV08RbF8OhJeIgA5f7+1U?=
 =?us-ascii?Q?vwvOyvOJModGTXYXd1WzdbIp2U5uKKwTlqq3udfe056rCioKzjvtRnkjSfO2?=
 =?us-ascii?Q?hPgXN+4Glt3TFJuUQXtSO10rbbJ5A9XUPgk+z3B9FkuInw38bAlahrZvZ6PT?=
 =?us-ascii?Q?j29x3lrrd5LBlf37zSTWWoDTOGs7qS94hAfx0MQq5P0Um4rR7/3jSZX5ftK6?=
 =?us-ascii?Q?BGaAKVyqkMEFlxZ19IVCiBR5Qc+hwqyDyUPMvQ4mNcHXqNHvNCobRRwbzjf9?=
 =?us-ascii?Q?pbNXGNd/AO3kv7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9glcpoUd+YobehUf3MbfNeSw2bzuwslP7HF5XGwXJgAfFpx2E9oe/Vj7si6E?=
 =?us-ascii?Q?bnHJr+bBat/vBrBoopZ1bcvxSo0TmpCwyRFUT6nIwlp0+IhoNR1kO1mpdK/j?=
 =?us-ascii?Q?KknDxTr+Vl9tVPxTMUunoPUBCtGx3ucMDAt++kZlJUWL5d+r/jk+8oX3sIQO?=
 =?us-ascii?Q?4Y6Q9BVdA6X4x3cH9S8Tss+5B0IeKmHnj0bbI/odEDX2GMGdWsMq81WCbzg7?=
 =?us-ascii?Q?u5uj2H32opzkS8GBYSJt9Gp7sTUDVutDwDYdtWtdJ/wjY0iZYHt+ghhVUCzP?=
 =?us-ascii?Q?+4b/pi5gOxKLhhplyfYiojSZOkk5aJAAsVUrxIemByen3roKLGQM1tQ74v1e?=
 =?us-ascii?Q?zu8EbRnRYeXGaD/0xZX0WHI/xDliHJktqhVwMSP/g0D6HO+QGBXXJFkU4XTC?=
 =?us-ascii?Q?1hIAURb84eRj3Gsvh6JkTujLtkumgaR59E8ss2lFhr7OWmqzGV8DDMBCnw9k?=
 =?us-ascii?Q?mTWok/a8sZiyZycIJMg/nPTxxwOI6ycyaJ5DYv09GDV5ya+5ugadFUu8H8tQ?=
 =?us-ascii?Q?NJLc7wG0+DRc4uIHY1BmpfNmF7QN8i4qPw7eOYeLJ1ySNy865o8/UqoJ+KaJ?=
 =?us-ascii?Q?WX9XOBVxVbXmIvG3iuXMKDrSAXWYWEP0k0Iimz72M4F6F0V2eHT71woYR3qZ?=
 =?us-ascii?Q?C+SAsPCi/DZQx9WXUuEra7e5n1Qg1sDJgUbK/6bVASjeMe7hOhp6B567coIs?=
 =?us-ascii?Q?YfPQBUnfzF5+SqBN/yxYRi7pnsTJPpAY5y7nKfJa/xjhqN2RuxBvqKCK99Kw?=
 =?us-ascii?Q?RRYgewlrUXf0XYn4F8IxooAiNbBJxwyBxxqwUHXoV7kIZDzu8emmBn00An90?=
 =?us-ascii?Q?NVtZh/peKk6F3sQscblLEHfZKCG9O6oxzWqOMshZrATGLx9Sc6/U8m9qNMdh?=
 =?us-ascii?Q?7PYgZwC+amWRfmnhwEYVPihPSpv0gUqsR884k4y3LUTsPQiEZon/sZCVV2cj?=
 =?us-ascii?Q?gqGqNFWfFUwWdxaIaIlmZR49TpX99vifDx2X1eDI9OvisHmePxlmqYF68hNx?=
 =?us-ascii?Q?4XivunedUdqPa5KIsWdZ0HGTd6hekyNcI2qdjz8Juucw4CxU0spw2xgOAbjv?=
 =?us-ascii?Q?QUJyRooYt17vfMT90OO6qVbUdSeQ6//LeskY4MuISOovFAoJiNu/UJEanNAu?=
 =?us-ascii?Q?66TwXSCSRdGFbVM5n3Kt1q2mR4SwiOSAw85QYGhMlkoiBQ5hlHAeR0cFfbpJ?=
 =?us-ascii?Q?/IhIIceeXI6I0HOUgeKVXhPDG3z22yFRRnbR98JRlNesBWvrOuFx8WngWhUj?=
 =?us-ascii?Q?Zq8oeJAFS+x6Aaj2qrwFTOdTK/7jg+6uhwJJ26tVakXe/zM+gus6oqIPG5gE?=
 =?us-ascii?Q?nvp9Xhcvb8wplPhMUBLPCllj0+YkmycZj0Siy5mdt36vhOY4tbg1bpzoSyvI?=
 =?us-ascii?Q?D+BJTVvE/1rLWKZPW/+gNWCRnZ1LO3Qw0HBoDrddhGqHhGVBTiIV2V0iCOYm?=
 =?us-ascii?Q?wKJMKQHIQSvHqYOP7Y9LKoc+dbTspCgOruZMZgoSM141PjOgI1chU0odbAhI?=
 =?us-ascii?Q?0tBvTveuocvJswnSxl823t0uxAqIr2DbQ61MCABH37NCH/vSMUZlCkfi5bV0?=
 =?us-ascii?Q?rTjmUiG4dF5cfNSjmxMb84Uw4PA8YFXbAzXofxtwf1NSibQXtX4Jj2ZVbguO?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56cf568-fe0c-493f-71eb-08de09f4d246
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:07:04.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jct9iEfXE2hZDKl2tXRz/RPX2dBO+/oN9DCmq0rvl6mGDTPamzAmo0yjozw/61V3VpSorEC8T/VN7x4vXrLnFbsnFENuXUdiGP8rZ9wN2js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180717_560155_525A36EE 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
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

Add iommu property bindings to cadence hp-nfc and synopsis dw-axi-dmac. 

Add smmu node in Agilex5 dts with the iommu bindings added.

Khairul Anuar Romli (3):
  dt-bindings: mtd: cdns,hp-nfc: Add iommu property
  dt-bindings: dma: snps,dw-axi-dmac: Add iommu property
  arm64: dts: socfpga: agilex5: Add SMMU nodes

 .../bindings/dma/snps,dw-axi-dmac.yaml           |  3 +++
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml     |  3 +++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
