Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD3CA5FED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/B1/FtKqsgWen3xdd5yAHbrZFgKRDClBY3FIrko0uPQ=; b=PyLg0J1M9E3mql
	h8s1xmmK+T60gCIsOwbtckSYMjMnS3SP3DhfatWMgzKKNzhRcVO2bSN8b0DwbDHqODo2y+16DbRB1
	FKFpFW0UHZroWL1PjMWPzRlutYOQ9o8WL1iCBshAz2db+IQ7+X8X5kICTSb1QRR0dZyA1TIQwA/9u
	96jZoUpzfbugFStUA+3athsfDViiMZ+5M0e3d4GScXoSxEXCXYKodUck56jSAti8Ae+duLjj4rR7P
	SgNw7D8KgFa/ALtfi3mTUBnVfrzG0fVOkmoI11z4RwF+3QL77zj6ijw88rDDxnOs+DGsqQ3YmrBX5
	U1cbUtopmxkSBavvY/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59O-00000005kJm-2fIF;
	Fri, 09 Oct 2026 07:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59M-00000005kJ3-3zfF
	for linux-mtd@bombadil.infradead.org;
	Fri, 09 Oct 2026 07:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=qlnK84iDSx2XDJ1tO+O2RfRtzdcg5xBiCR5CxeEFzXU=; b=jShboRotg6ncJYHvv3WIdBehsI
	X5bc8lx9QGuJYkV9Jzr+WD0+c6+H9taZeK4XW3fqY6HV7MATgPGg+qSWuAUzOXcytWlaV0KPJ/XUV
	xEwYDeWuFEthKLO5aLQlEvpTKjpN4V8oAXfnFpqUA2J8Fe39q+oh5t2j6wq+lCDrxbQ7QoVpQ9QML
	dfiEOpJ4WaVp6Q2+7BgoGieSVuc4Du+XF2vrqEM/MDek4vt4pu47xST/QrXV+eyMtz9qvQ4+wL15o
	9bUA/sagFJ9uJNGBgLKz68JpgRfL7zRLAge8rfq57NjxBbjYwRcO131OIyRVvG55nhV2Vaw9vlFf4
	JZUM7opA==;
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF59J-0000000AzLi-3e1D
	for linux-mtd@lists.infradead.org;
	Fri, 09 Oct 2026 07:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyTd0V9HcsZeODwkO9eeRhJga4dE3WvodnCw7wuQpV4u1wZhpf3o0crXHNZlceGarfJ+V4cu4Azf/AIJIU1nf1p4K9Go+71+v7yzYASGh1Q3SXjA+ekrv/xVvgNIbo4innOtBdyUTpu9TfBGYHybrb4l8nR9doVi65U5PWFksDy1pOUWmsrCAHZJtZ1jWEHSL+XL+KfEuwhERLKkYE9AwHe1ernmuvwmxtFueb02eAknLnhJUwvik4wfgbo9iAwzmsZvBjlbAdwJRNfGVpZYNvqHC3H49yUFpb9GbT8CPvhBiB2YXpc7FbYM1v3FyRZLfgKM2fT3/svk73qffLtH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlnK84iDSx2XDJ1tO+O2RfRtzdcg5xBiCR5CxeEFzXU=;
 b=ht17tkzOSQvNMMjbkWHZVDfxd2ZlTbaev6dp7ZyTn/Ir0v8d3AhoC7L8aCwpRS1XMIJq7BG5/k1uHFQPoDrOx/Fv3Ghcj0VclERYYyoDsCUV78j26hdnksKfy5ceVL15enDEZv8fCnBnXg/4M0ubLSbjXxnikiBgi9G/tQOOydLfVEQCUdRCeUZO8kCanFmoIr8A3RBXOJnwHZ714i1y6gpPbTHpGXY83bmX7EZsIrwDwOpH00ucxStNY0C+QzfZDUVpREHdJBla3wTWimsjguiJ7Ov2zd2j8EvmvIfY8pIEcslD69fKtvTeK/m2uEs75cifiF4IGEJ+tOdXvMTyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlnK84iDSx2XDJ1tO+O2RfRtzdcg5xBiCR5CxeEFzXU=;
 b=JplYo0eqlwAFE8wGfxfZjNMjaKLgwORqfGWMYPTUvnRqra7h/gM6ATbty964zA6snzQb3TvcEQdkpMCJs8WpA4HCtBHhtJ+LAhIJEz0rSF20E9wtvgYO4NoVqQl+/dCyr8S8Il4In+y4d5QJQA3Ao5b41X6Vvx5obVJR4xoMH2u0R3k/k3jVTFfVW9BxetArDe1yReruaVz8EOKH4rSutteRkyFwfIkRkXSwHawgenp/JIv8a9P90qhxqssLwgOoFi1OgLb8U1TkpqhuKjlVzYWybnaLnQWpg9NAWnsiUsY026qebtMpUkmpFLs/e5eGELp54u50+OHY/TtJ46257g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by EAYPR03MB989279.namprd03.prod.outlook.com (2603:10b6:303:2cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:36:06 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 07:36:06 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: spi-nor: fix use-after-free on unbind with open handles
Date: Fri,  9 Oct 2026 15:35:55 +0800
Message-ID: <f03556b68e5d25bca6b3f533e344d83fc611c3d5.1791512623.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1791512623.git.tze.yee.ng@altera.com>
References: <cover.1791512623.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|EAYPR03MB989279:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cc99a1-7967-4011-1573-08df25d7fa20
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|55112099003|22082099003|10067099003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: lUoYonkPcNICWRgXk2HdKjF3cZXVRy5GArR8XIj6btSat6ubfQgwF3zTzG6rZ1MUJrSlh2rzcPZ9GxuzQlD354zpMwYKOVeSe7wDFvhUTqLA/1NRSYL/JvL7YD8QkyPqrFlwd0oSYO+JK0tjj76nE8Y8BDuvtSu2X9UmJhbJ7xj/93WlGZZNISg0w/3Ph4jYsYPBicedc0Y8GRhs3FaTQls39QcpvrHZkb1VAgKcZzrIb61CSEnvD0inm8Hb1a5iTYgSOuCEUlYWJpHifvjgHoGMW0S2wIAk1wf0ufAvVgeNFJ01D2Oz+7iCsCM9kfBdkA2G4feKrd7lEttDfgXFor/p05oFNAjfrQlheI9BQZv6mEAwZw0PdnaKuQOUtE2mHmKfBacaBFlBppeJGOgPIhpCUfJPUFShEjPM8kWlNEJNqN5b1srSH6GJiQ+zbHdN4p1ye+butIdcgHBRiM0j8LTembb/dVSF3rQZnNETYuxIdl4oqO8J2SFbjWN+3YWX2yhvzV5c1R+PLqkJ5DED5UDYqkYmqy5HeRN2zkJUy61BaMprYi4EgzBMQvVDPGdF25ekwVp7ljcPz4SvTX4x6VcNaNTu5UVvcsGjEpOM2do/SSHUSlaIKgJS7aTw3I+VwTKP2b5D6LUy+tOvX6kPM/tiL5NUVGeCSMggq3xBOt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(55112099003)(22082099003)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DahQnXd2GAuPr+uZzaDWi6+ZIcivNSVK8WBYrw/mchUGLJnSPgRkhAOvaMgr?=
 =?us-ascii?Q?tKDelWJ45IcM8MVQkwbNM79q/lLAK4Hq0/80sEGenLVtxfLnmUEzKyBkCgvj?=
 =?us-ascii?Q?ir+l4klELv3qfKsfEoRMRMoghr9dJdB3VfPPZCVzdN1yu0x48ZtuCajpyCdv?=
 =?us-ascii?Q?2CNV7KHolKlV8ApGGwPUkexCYuu79AaVdKV2ycq14eYTYUTZ1YGZ18i/Vot8?=
 =?us-ascii?Q?V0jrM3W2z3ZZ8Z3UFAM1DJX8+sq8NVlDeTEpVtrwCtuBqMj1V3hQV8YyBSGq?=
 =?us-ascii?Q?U8Km0XT3BaPVwMhuE4wEKo+UML2Ccapjj7difT91kL0N/jgdR5bXH2xk5LJb?=
 =?us-ascii?Q?W+w+SYg6yFTfjPYOLC5WjTEYlI6T0Hd/IRvscubzXB51PzDa+FvCTr/grCcr?=
 =?us-ascii?Q?zKpDuiS3014EifNRI9pcXVz+T106enkqafAS1ROeUaIzoX970FiZwBYxrlCX?=
 =?us-ascii?Q?pOD0VxChp/bHrEP0KIp3jLYrZMzC1gxSGv5S1dMcVpIiHSfy4v+mjo7Ft5Nr?=
 =?us-ascii?Q?TMiirGiAcY8w2R8kd3xSvYOgZnIoDRJbJ5WbqLzRfD6bUf0LSmZlXCzArzJ+?=
 =?us-ascii?Q?ENxcBs6INnz6XC6uIKof9tr3T8mhmn3L1aNofvAauJXyIl7jNfevbTHwSGbD?=
 =?us-ascii?Q?Hu3OlVHIegIlMCJ4TjBb29n+AORVCH+aJxTgPIhDU+WMdnDc/4KZVmDAKnEo?=
 =?us-ascii?Q?+iqEvWKgMCxVrpx3oDg8eZ5FPEM+MWm2jXPIYDPlV97H2YEdfce+MhAfFu1+?=
 =?us-ascii?Q?zKE7hIvY0sApWp/KjIbgOYBvJNDuUKw5TR/pnKMoNBFlMVHX6Vigsrau3hWv?=
 =?us-ascii?Q?HiGz2dpFsd11eLrpLbL4+K3UwQZ0RSmjfup1fuim3sWF0bfGAZ4U5k+gN9XZ?=
 =?us-ascii?Q?g9fSkflQx6mhLZ2gk6hDSsPQJx/JyBA5vGSZRkEk4RQc0Vfapv0wX/8aHChj?=
 =?us-ascii?Q?SN3UK0BU2tkJnxtOIhBlr9Bt3KY3fJrjVJIpe+ImbTbPyevhOTg4plg0MTGD?=
 =?us-ascii?Q?zkKdIJj7xd3If/SAFewjtZ1eQnjf7vWg6lTFOl4fuMynOjdzKi1xYzr39nix?=
 =?us-ascii?Q?DKYppDPBpeTVUOkA3ylp9x48CpNu7cpxWzSh6g0bsdeyY2o93OwYzlaj/fdP?=
 =?us-ascii?Q?NvtfHqxoh4TmRNGNjxt4z243k4BqniLp9zwBqs+U1lcZvOIoCX+boUXDmEpk?=
 =?us-ascii?Q?qwHfhu75C7WyLULgZlILa/ftsaeBbbcrZnXdU1xSdvnBPvyqwe8xklZXeakd?=
 =?us-ascii?Q?WBN8cjKnDEjmmFUxEKHEZi/Y8ayYnZFZE8GrfF8nJR9ym/5YB7eV13ax3aqC?=
 =?us-ascii?Q?cCU1gZWOt8hvYglTqRB6nnlq6JSzfm+dKMAI71/XuPNOXmyefvHzKSybTlWn?=
 =?us-ascii?Q?UZFuxAwP1G4aoKqFreLlVBVn3cZipOFR40hsDQDtxioe+JAf3917Ci6R9pCR?=
 =?us-ascii?Q?+Y7f2gWPEYQYg95bNszihsgOeRYSfkV8ia7niRW5bDH/J9Ch9uVX502mr+9X?=
 =?us-ascii?Q?dvXgkdiI39rn9X5MgOayeOCsRoHVfqRQ4GOTZyM/L2TopTpkZWPjlkTWfIBe?=
 =?us-ascii?Q?IB37sbJtMlBW1PrNVmU8AmZqabrVxWpMUSundVTzbHDQL3aTJldoFtmykR+f?=
 =?us-ascii?Q?Er15HIQMC0FOuGPvhGAZLOyCY0Xrgx8t/W+ETZ60gJR1T2UcSo27VT/oHEQe?=
 =?us-ascii?Q?mgnb0FL1ggIpXKtSymCQvD+E+Uv4TWa6MIdamkZV4uebisjmm6MHkLkE/6jZ?=
 =?us-ascii?Q?HjRmeYTLZA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cc99a1-7967-4011-1573-08df25d7fa20
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:36:06.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx/LXtQfOSnPmaOPbVwBYAS7GRdonsF6UWElEuuG42cBSlZ1aLjUh/voYQjksyDK1DDxLaxhZNV+MI42BFQcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_083614_313604_F84E5C6F 
X-CRM114-Status: GOOD (  21.06  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

spi_nor and its params, erase-region table and bounce buffer are
devm-allocated on the SPI device, so unbind frees them while /dev/mtdX
is still open. The MTD core keeps mtd_info around until the last close,
but the backing spi_nor is already gone, so a later close/ioctl/read
hits freed memory.

On the spi-mem probe path, allocate them with plain kmalloc/kzalloc and
install mtd->_free so the core frees them when the last handle closes.
In remove(), drain in-flight ops and set mtd->removed so later ops
return -ENODEV before touching the spimem/dirmaps freed by the SPI core.

Legacy controllers keep the devres lifetime (no mtd->_free) and are
unchanged.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v2:
- Drop the spi-nor kref, nor->refcounted, and controller_module.
  Use mtd->_free / mtd->removed from patch 1.
- Drop the nor->removed checks in prep_and_lock*(). The core now
  fences hw ops, new openers, and suspend/resume.
- Keep eraseregions on the same lifetime as params/bouncebuf
  (plain kcalloc when mtd->_free is set).
- Free params/bouncebuf/eraseregions/nor on the probe error path.
  Unregister debugfs from _free instead of a devm action.
- Legacy controllers still use devm (no mtd->_free).
---
 drivers/mtd/spi-nor/core.c    | 92 +++++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.h    |  2 +
 drivers/mtd/spi-nor/debugfs.c |  9 +---
 3 files changed, 79 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..b28d896f16ed 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3145,6 +3145,11 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	}
 }
 
+static bool spi_nor_uses_free_hook(struct spi_nor *nor)
+{
+	return nor->mtd._free;
+}
+
 /**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi_nor'.
@@ -3186,7 +3191,11 @@ static int spi_nor_init_params(struct spi_nor *nor)
 {
 	int ret;
 
-	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
+	if (spi_nor_uses_free_hook(nor))
+		nor->params = kzalloc_obj(*nor->params, GFP_KERNEL);
+	else
+		nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params),
+					   GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
 
@@ -3549,8 +3558,12 @@ static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
 	struct mtd_info *mtd = &nor->mtd;
 	u32 erasesize, i;
 
-	mtd_region = devm_kcalloc(nor->dev, map->n_regions, sizeof(*mtd_region),
-				  GFP_KERNEL);
+	if (spi_nor_uses_free_hook(nor))
+		mtd_region = kcalloc(map->n_regions, sizeof(*mtd_region),
+				     GFP_KERNEL);
+	else
+		mtd_region = devm_kcalloc(nor->dev, map->n_regions,
+					  sizeof(*mtd_region), GFP_KERNEL);
 	if (!mtd_region)
 		return -ENOMEM;
 
@@ -3655,8 +3668,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
 	nor->bouncebuf_size = PAGE_SIZE;
-	nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-				      GFP_KERNEL);
+	if (spi_nor_uses_free_hook(nor))
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
+	else
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
+					      GFP_KERNEL);
 	if (!nor->bouncebuf)
 		return -ENOMEM;
 
@@ -3770,6 +3786,22 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
 }
 
+/* Free spi_nor and related buffers; safe on partial init (kfree(NULL)). */
+static void spi_nor_free(struct spi_nor *nor)
+{
+	spi_nor_debugfs_unregister(nor);
+	kfree(nor->mtd.eraseregions);
+	kfree(nor->bouncebuf);
+	kfree(nor->params);
+	kfree(nor);
+}
+
+/* MTD core ->_free callback: last reference dropped, release the backing. */
+static void spi_nor_mtd_free(struct mtd_info *mtd)
+{
+	spi_nor_free(mtd_to_spi_nor(mtd));
+}
+
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
@@ -3788,12 +3820,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
-	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
+	nor = kzalloc_obj(*nor, GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
 	nor->dev = dev;
+	nor->mtd._free = spi_nor_mtd_free;
 	spi_nor_set_flash_node(nor, dev->of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
@@ -3819,7 +3852,7 @@ static int spi_nor_probe(struct spi_mem *spimem)
 
 	ret = spi_nor_scan(nor, flash_name, &hwcaps);
 	if (ret)
-		return ret;
+		goto err_free;
 
 	spi_nor_debugfs_register(nor);
 
@@ -3830,29 +3863,56 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-					      GFP_KERNEL);
-		if (!nor->bouncebuf)
-			return -ENOMEM;
+		kfree(nor->bouncebuf);
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
+		if (!nor->bouncebuf) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
 	}
 
 	ret = spi_nor_create_read_dirmap(nor);
 	if (ret)
-		return ret;
+		goto err_free;
 
 	ret = spi_nor_create_write_dirmap(nor);
 	if (ret)
-		return ret;
+		goto err_free;
 
-	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
-				   data ? data->nr_parts : 0);
+	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
+	if (ret)
+		goto err_free;
+
+	return 0;
+
+err_free:
+	spi_nor_free(nor);
+	return ret;
 }
 
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
+	/*
+	 * Drain in-flight ops and mark removed so later ops get -ENODEV
+	 * before touching bus resources freed after this returns.
+	 */
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
+
+	nor->mtd.removed = true;
+
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_exclusive(nor);
+		wake_up(&nor->rww.wait);
+	}
+
 	spi_nor_restore(nor);
 
 	/* Clean up MTD stuff. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..e71b788b275c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -726,9 +726,11 @@ bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr
 
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
+void spi_nor_debugfs_unregister(struct spi_nor *nor);
 void spi_nor_debugfs_shutdown(void);
 #else
 static inline void spi_nor_debugfs_register(struct spi_nor *nor) {}
+static inline void spi_nor_debugfs_unregister(struct spi_nor *nor) {}
 static inline void spi_nor_debugfs_shutdown(void) {}
 #endif
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 288e2866daed..a0639e91cb2d 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -286,10 +286,8 @@ static int spi_nor_capabilities_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_capabilities);
 
-static void spi_nor_debugfs_unregister(void *data)
+void spi_nor_debugfs_unregister(struct spi_nor *nor)
 {
-	struct spi_nor *nor = data;
-
 	debugfs_remove(nor->debugfs_root);
 	nor->debugfs_root = NULL;
 }
@@ -299,15 +297,10 @@ static struct dentry *rootdir;
 void spi_nor_debugfs_register(struct spi_nor *nor)
 {
 	struct dentry *d;
-	int ret;
 
 	if (!rootdir)
 		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
 
-	ret = devm_add_action(nor->dev, spi_nor_debugfs_unregister, nor);
-	if (ret)
-		return;
-
 	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
 	nor->debugfs_root = d;
 
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
