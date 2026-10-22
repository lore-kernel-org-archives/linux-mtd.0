Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D49F606A339
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWZb5eOF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=RFroB+1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vfg5Ckn0wXsVKLGxOVLZByZ9wEZ+tk+CIc5eiC8Japo=; b=qWZb5eOFoiWdx/
	36Xda7Of9vTv7wlN2EN6Y78WNuk2JO3oeCID684K34Y0DIrSSFAr4ZPfTNZEKpO4hy0bM/ccK2xpq
	NWZOzCxIeW/mkjfCIDTVWT3yeJj09Mp3rHZ06UHPsuU3iHF/rhpucqby5lPTJDVxWWXYZQLJWkNIQ
	BHUKmzhTKPr15WrHH0nzZUjbuU+GWUHzOWf1okoZe57m03Bx0T/DnB5R/k9cuQLk9kvxZMndNgx/V
	RGD0GpYLQ8IZhTFFidcKIdUbd3VXpPhBCLYeFX9dPfFdOpCWTeG4auI+zS8wlOYTBR5nLExa3KtqH
	C0H4gZTKshqmf2nJ6mOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjsW-0000000DIlj-3bBV;
	Thu, 22 Oct 2026 03:54:08 +0000
Received: from mail-westcentralusazon11010002.outbound.protection.outlook.com ([40.93.198.2] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjsU-0000000DIlK-1LWC
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 03:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGgfb8Zxz9OI0WopzNRyflixW8x3istwIxXhQDnfb/OezWcHL8cn/czrbPlj12GC0i6fzoCTYALb560U59Qmy8PSexDbo19bxVmoVrVZooaPn2iyqZibF4xYYGx2SKq5gp8cPDR8CplesF4ah55184a8740rrHSqujwx2R09RvjudAOZKIj7QwEqmNk+gNXCfuuvhOPtNKbD9RYRrfo567clrxb93hxFuRLDMUDtCC7Tuc3evZCmLNQTx9YHGKudwoZ0yd7ifkI+nGb9tlZUMFCGfWA2yCN1Iu2wXwRmxLIKfRzF+K0niPON2JDX5liPejnwMs5+WKccs0p8dtPaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKJSjNBqMiy43Ufbjeud5oMM+jkhCRjfKm2/rwU8iz8=;
 b=ZroeZo5g4CaKjOiGZSxGUTxKPWlQR/n32ZfuEpkRZpuPfLEdlqx2wue5hTWZXy3y5PQ4AvQdYqQi8/pqObxF43Gm4WmuKvcPVlufrJ01o2/WTT15zEvXRK0YJc7tQGZcvAcfBLIA+c+6TKSbF/xWpdINHEqcQgX/m/OYQCTqoKMV1m0jfn907884qdaPHR4JfABYZ5I5zGaAeAIpzI7dO2PTiLdmH4EdyIFc1evgADPtL0Uf0IYIptHJKpWV1SbkFDHam05r2TIhvujGhGgNxDe5mAObPjPaR1OPr7gfLa2sy6dTEvT8/R9ftQ86DMMMGpK3o6ZTEBvuP7ByyeqGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKJSjNBqMiy43Ufbjeud5oMM+jkhCRjfKm2/rwU8iz8=;
 b=RFroB+1cEvKXDv1Gwt9nvmP+dqclJBpsya4eFFpX3SZEqFBzxtUmYlebHELukwh2ANfTn/OUcXZ035Xhs/oVQqq/CK02ZvFGahevBjfzTTic7Bz9sSCrByDWPp03hm24nr9WJ75dU4tpuDTs+MAoFP6ALWP6uZOAu2d0tvbJa2n5eBQHVBsyWBgqwZkQYr54gUD+KjXEtfmgQCb9/SkW+iFLG0C2DHMBnWjCbstF3vhKLDRjFHFMdXuoEWh1q2af4yRSp3ejkCOHg45H60J6FMqXZ+oAdk5O2cuIyr4rdZe5XcWrC5/Z5Xo16xBg7BtIMO5QtGR1CGWExb0LrDIuUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SJ0PR03MB989363.namprd03.prod.outlook.com (2603:10b6:a03:40f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 03:54:01 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 03:53:59 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with open handles
Date: Thu, 22 Oct 2026 11:53:50 +0800
Message-ID: <20261022035352.52129-1-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SJ0PR03MB989363:EE_
X-MS-Office365-Filtering-Correlation-Id: c52dd256-184a-49ab-f705-08df2ff01a4f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261009223027099003|261021123027099003|260925022911599003|56012099006|260925021311599003|260925021911599003|11063799006|10067099003|18002099003|55112099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: /SV9b0lBf+Lu4Q17gKXyo+Qq4oJtJFI2EAaPs6qPIBIBjYGx3GNuSmYo25jrrn5J0Z+a3RM0WrbUvyOvo1YNnLMa/PCxolAxfeF/xpy8wvsEUtT9bXiifQ5BQW52zI+0fm7LY//XoOYWYp4LicR8bn7TBbunypPtbMxoQYoUZN3zLz/M2R3/CHFJMtBVH/WAWBVX5pqsBdAp4N1JmQ4YwmeFEjq/nqle/xMw6iBiDcb11uOrK80rc7yaPOiKbnmDCDtribykwFivD44XeKILRRIjTH/BLXElR8eJIBm67h9nUwQd2Czfc+5sAiEQG/+IKQM50kg/5fSnTDauSsOd61nr5CF7zpxVgNayKSkcxz+NRSIMDAykAtYLKk8lY2HsEIkAZqKbeu67hYX+N7RdaTHvjbpwbBWovZp2/WfvWlDPrMz76q8xIGe3/e8ykZ5U3TDePVDDlflPkb1YF6ELt/ROXUY5xKsmyA3r99kD3QiuaZgEtn38Mt1qfTWkAFfcB84j2W9IWUQfUe56qPQUjfPWAa/SIN2hrmb5UHAF0XeYkFBEJMpXzISTeDC/FYkvT+5K4LwhIYkiL7LM/0vjl6cyTFFKxOH+WaBvzZiew5kf7PtOG1/B1uR9HM1mvAfp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261009223027099003)(261021123027099003)(260925022911599003)(56012099006)(260925021311599003)(260925021911599003)(11063799006)(10067099003)(18002099003)(55112099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZqRfGS4ehkisrcCNMIRmwDNAYeXUvXDtccyZiP717cvEwY2IxeKFL7nnCza?=
 =?us-ascii?Q?2YnjGuBkF9S5Ud6o4m46/isPBcRV7XTuh2XB+AKXcxxtGy+57xS9/TVLQSBf?=
 =?us-ascii?Q?ZAnPWnXGtFzRnm01rn23waS8JRJzsza4rDZQZRMuFFHuCgbKuk+UGUMrTQtR?=
 =?us-ascii?Q?qbl0WXcrmLCeOrbzw5I8QmqFkQt3RWxYT3F7uBVSW1W8ZXFTa4BUizukLreI?=
 =?us-ascii?Q?BaXuMtXP+etfcY8GLeeTptGZI9A8Qpb+ojyHC+DZH84FJYMTssmdoZ7YHmeC?=
 =?us-ascii?Q?NX5nHIFdwiXY2p+IYdd4HV/ePXB/ik2ypMOFH3+2pgSbawWVg8vWsaS9eUlq?=
 =?us-ascii?Q?HhZzopPMGkEdiegY0SpekfirGSsp32Rdv00tD+v+XMahd62YRS71H6ElXqt/?=
 =?us-ascii?Q?p1/cSwVuKB8QE4pGcx7cGryPYo9zjS/XLPNfezhseaI19Y3P7hxbBDMFrlmM?=
 =?us-ascii?Q?qcNUytwDRB8D/RABO/zBiXDM67WK7zJjn+HmShxXawF2OAp1Y00RlXZs7bkN?=
 =?us-ascii?Q?goX579cTsrwQQrF11xSzbO7fVhvsPz3+wvjZW3gUSbr3e9HKh8ZkowCCDLPD?=
 =?us-ascii?Q?aYstD9ct8xHS56opqUPI6dXCIhwLQDSbOmi+3p7sAfeWSFVcPoHsfESuNN2a?=
 =?us-ascii?Q?wHUMsrr8DghuiBslhN2JUGraS/g7kCo73fpXtKt3WDvl6YYOMgMCNUQFzgUD?=
 =?us-ascii?Q?P//+797Da3jQgwygMk2YXAwaj40jzwvBFEJZ6ep8Q6uw/KY8vczuWFNozofa?=
 =?us-ascii?Q?YIb0mYOI6rJomIC1oxqB62MLy5Tuea4Khu8pByD0lNv5/rNlNOgEC6TX0vLs?=
 =?us-ascii?Q?hxZ7+yUug+a1u1OqWzfoRxNUdlPVUC6J+OJRNxxtJBj9SgkP7NmRcd4TvwQM?=
 =?us-ascii?Q?dRX73wEIlB+CvTBgz/UD0SbIe092TlVLs3EHPF+fVA0945ORjIbCKuHxYd49?=
 =?us-ascii?Q?l7knWjlYFa35Lmjxed9Ops8vwqq9Ff6b69r67+M1IE7vIsKi1eAJvqjMr+Jw?=
 =?us-ascii?Q?K+TP2bkU7bA/Lxaq/5BLIZsFMxJewNYTFQJ54tQ1HzVby8H0Q05lWOoOsYQk?=
 =?us-ascii?Q?rNPIro3tWrR9GXysvWBFkfnTZWHWKI1zsqgUyafk3NGGv39mtTmGLjjmTAMW?=
 =?us-ascii?Q?uzaZPTujzgJVAtPPzIK+ncgZPY0/RJOkmdvL5rn3cUsZoHEY8/Tf9TW9G9vO?=
 =?us-ascii?Q?atsO90D3Tol4TvcbvPNUXpeShtLTU9Vgh6D1htCunFQLiAR/zcOLJvJvfr+P?=
 =?us-ascii?Q?H51WjSqNm99NDYyk2nqqxApUHAPUjpjR5CmwQKWbPXTQEzpeluZBWurtlwL8?=
 =?us-ascii?Q?JEsuq1swuaU9bCgP/54JRr/zhVH8FpCOkRoa+4VE/K37WBkojCC7v+rtfMPN?=
 =?us-ascii?Q?cm2oASS9ASzcw0N9A/VOERqIuJvQUVQidll6fzs8s5N5Qapg7zEEI6CScgDr?=
 =?us-ascii?Q?d+ysULNwSTVRkmB7+OlzNKJSz+heQPXCcMadg9EoKXUlKRJx5F07LcvE7nPm?=
 =?us-ascii?Q?iglVwYMgIbTOMl+8xEDwJF2jhqz9IwLUxHWhwrhDsj/bPMgvjicwARlu3ht7?=
 =?us-ascii?Q?a05zZyCLxutggv0ALyR9A5p9mTzoINnRH//wkzesE8AxMHpyZS7Qxj0gfdfZ?=
 =?us-ascii?Q?+avsdEihIOo2iYZUqmC7go8Pm+k9EPT4peFY9GXvOxWovwcZoiTQVVLTqfA3?=
 =?us-ascii?Q?UPkrwn/FiDckU47hXZXW9gCh5XtEvBzDSp3qO+rmBuZN+uEWLGENg+qAe+cJ?=
 =?us-ascii?Q?vrQV7yctWg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52dd256-184a-49ab-f705-08df2ff01a4f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 03:53:59.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8qBADV2JeroBhrwnPzPPL7clTPeBjhVX/fvDS4gfT9TxWi/kvrdVh7XFCIGeFcKvemPWaP9JYYS7u0SV/tONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_205406_371614_E09AE26C 
X-CRM114-Status: GOOD (  13.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tze Yee Ng <tze.yee.ng@altera.com>

An open /dev/mtdX can outlive driver unbind. The MTD core keeps mtd_info
registered until the last close, but a spi_nor allocated with devm_*() on
the SPI device is already freed, so a later close, ioctl, read or
mtdblock flush uses freed memory.

v2 moved the lifetime into the MTD core (mtd->_free and mtd->removed).
Review pointed out that this creates new problems in the core: the master
can be freed inside __put_mtd_device() while it is still used, the driver
object leaks when CONFIG_MTD_PARTITIONED_MASTER is off, and a lockless
removed check races with remove(). Only spi-nor needs the fix, so v3
goes back to a spi-nor-local kref and reduces the core change to one
reorder:
  - Patch 1: in __put_mtd_device(), call ->_put_device() first and drop the
    module reference last, so the owner module stays pinned while
    ->_put_device() frees the driver object.
  - Patch 2: on the spi-mem path, allocate spi_nor, params, erase regions
    and the bounce buffer with kmalloc and refcount spi_nor (one
    reference for registration plus one per open handle). remove()
    unregisters debugfs and the MTD device, then sets nor->removed under
    the nor lock; prep_and_lock*() re-check it under the lock and return
    -ENODEV. Legacy controllers keep the devres lifetime.

Not covered:
  - A sysfs file held open across unbind is a core lifetime question for
    all MTD drivers and is left out of this series.

---
Changes in v3:
  - Drop the core _free/removed hooks. Patch 1 is only the module_put()
    reorder.
  - Patch 2: spi-nor kref again, removed re-checked under the lock,
    controller module cached at probe, debugfs and MTD unregistered at the
    start of remove() so mtdblock can flush, eraseregions leak and probe
    error paths fixed.

Changes in v2:
  - Drop the unrelated RWW self-deadlock fix.
  - New patch 1: MTD-core _free / removed hooks.
  - Patch 2: drop the spi-nor kref / refcounted / controller_module
    and the prep_and_lock*() removed checks; use the core hooks.
    Also keep eraseregions on that lifetime, free on the probe
    error path, and unregister debugfs from _free.

v2: https://lore.kernel.org/all/cover.1791512623.git.tze.yee.ng@altera.com/

Tze Yee Ng (2):
  mtd: core: drop the module reference after ->_put_device()
  mtd: spi-nor: fix use-after-free on unbind with open handles

 drivers/mtd/mtdcore.c         |   9 +-
 drivers/mtd/spi-nor/core.c    | 173 +++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h    |   2 +
 drivers/mtd/spi-nor/debugfs.c |   9 +-
 include/linux/mtd/spi-nor.h   |   9 ++
 5 files changed, 159 insertions(+), 43 deletions(-)

-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
