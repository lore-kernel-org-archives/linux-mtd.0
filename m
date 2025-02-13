Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1450C021A7
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 05:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AxBjZSV6Kt30JxhAsROCumzGvaIrpry3Do4hd0CY+nQ=; b=bGqguX3iSuGTvv
	8iQptUdMn3NpNxWcXldOiD41g4IjvwlrQ1CjfabUO3VBKsnNOuExmKU27Ivkq2m8JVCLwTwGmfNmw
	p7PJ4DNGS5OsnwIuv9cezNqBen72CCMDiNW0Q+QUBo92ohmdOU1Es53Dusy8uVIyGAck0deJBUSe7
	Ep65cWvAQKRtOKcJEu8N7On0GM8i1g22Bi8bzSuf/ukKZhrc9HS4L5h2D7unqmI/CjCMG4llltLdx
	87xbVz5bYfZ8+vAfU4CCfukVCjVZf+YxQ6i7qzl3wT1lwBHDwJb8rxktHVk8BQ0w5uA0ehcDqXu9g
	cMc0bSTQWJhE/We25XTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiS3A-00000009ppE-44z2;
	Thu, 13 Feb 2025 05:46:13 +0000
Received: from mail-dm6nam12on20608.outbound.protection.outlook.com ([2a01:111:f403:2417::608] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiS38-00000009pop-1WBv
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 05:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmskMQ43PHgUUoqCeInOToForHZ8xG7wJ/zx9vekUexpxs7aqrDb64yE6YB8pjX2T6rrjjATyPRoRbQYbtXrCAArqyAzhOLbxol67/inq+5sEnjimYl8nGqCqgcxc3I92sjMzuOH3pFOUYvTbkpIlQBUltCX8NXR/hHNt2yYG5zVLrJlgXmh0akFxocjtDvRJaNK2llbr5Krbb5Ho45rqWtMTSMjlV5LeB3dU9MqL0lRQqKB2oLP6E0aV7fIE52UMhdbVg+1+22zRiUgtC5+24J+2+mF/EVtHPqVC0WSsjXBZFQh/2fC120umRCDSmZu9Pl5ISK86qvaAH5bIqbPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr7BESMF38uCXzSX8qcxI7D2ZXp7aU0Y29n9WRtPlRs=;
 b=t4TPa3mz/wom7lVmMM5lejmja+sOQ+mZ7J8ugEby6UYQ86vRDr4qH4yzUAYg/Sr9p1GJ0DgBV6rRtiatKOGhd8DEbgOW/fzeELFMtX5w4NG8/Ty4W6609sPV6ZlYoYrJgwAU0zR4fjnsFVxh4vCHlf/C2LPNuNwIx0+WrTNt++TFG0j4CpxLsqc562rYr/mlHRn9/zYSnKyNepVRngmQOgfzGSQ/+t6BI6aj8Ju/vIXYkWgK63JX0Bg4GabM5xrfNEgxrSWypeYj33f8wi0AJJI8fWUrOL/LRAKE3yDOgm09CxpBcIM5yoWyq3MiYffuRS1T0viiUEpyoMKo58Avqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr7BESMF38uCXzSX8qcxI7D2ZXp7aU0Y29n9WRtPlRs=;
 b=Znn+wNGHLbK40TXFJU08goL+ZDcHv9V2aIH0+oxiTAgDi4zwwMrW4qni8fD0RBsglh6KrNmaWJUUTzqRGV1xpqRzc13q96kinS4/X4ElNK/Cdnfp7rhDPn+3B/hv7dDke9BWlHV6+4XA+FSNFKtOveqeFsl5wyMRThm03Yufzy0=
Received: from MW4PR02CA0017.namprd02.prod.outlook.com (2603:10b6:303:16d::24)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Thu, 13 Feb
 2025 05:45:58 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::ea) by MW4PR02CA0017.outlook.office365.com
 (2603:10b6:303:16d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Thu,
 13 Feb 2025 05:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 05:45:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 23:45:51 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Feb 2025 23:45:48 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <csokas.bence@prolan.hu>, <linux-mtd@lists.infradead.org>, <git@amd.com>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH] mtd: spi-nor: sst: Fix SST write failure
Date: Thu, 13 Feb 2025 11:15:46 +0530
Message-ID: <20250213054546.2078121-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: f98fb5bc-352e-43a1-5518-08dd4bf1b05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OL89bvqFZLGf86Wauj04ZiQ/7wG5CK7q7KK/ncs9GTPS23DbqnSrnt51v4Gh?=
 =?us-ascii?Q?NMWmSGJDa/KOSt4oh2xyjPlVEw7oMj+MIPE+A5b6ggKqJibQXKkpYppUxzh5?=
 =?us-ascii?Q?Pe1KFuTab4ciE4Vx07f6qnlgtCR0/cscolBnnzrdT27U3AyeljdFESzhy8bj?=
 =?us-ascii?Q?HX9clFiocG5gmzpvkDYGUhxoq/GEcSvuxRr1rr9hHFxtubzlhV4R677rU7qf?=
 =?us-ascii?Q?Ibu1bsYsi3cg/LiEfTm/gwazcfA5hSU6oDOpUTYEJF88iN4KUzpuVSPrelDl?=
 =?us-ascii?Q?md1C55J5r0IaD3d4HS46mNdkER9igSrVRtGah/AyfDZ8whSUPny2f404jHER?=
 =?us-ascii?Q?/T21fcT7MKBVWynnnVyNbVEUJPNquDV54dwp3IRTf69yOZ4jJ6EzsWilxnxl?=
 =?us-ascii?Q?KQCKQNLDx7crSsYMu/x9O5yD6/cYoFECSR7Omsg0m96+0gr3L/a/4jZrhFhQ?=
 =?us-ascii?Q?q9wWYlIukhOqy/9OjdbA3541VHJXA0UUKAg454UBMWDatRd8SliBKQoMY+pP?=
 =?us-ascii?Q?hed/+cX8Kb6mPM+79454SVQJI3K8S1L4l1ywP7pYxfJE+b51+X4yfpOFVEkd?=
 =?us-ascii?Q?owqeNHMZGczY+ZvmbQojxeBf1qz2oD2SSHrXLSKfDygklk6UdZx1LWNqfArU?=
 =?us-ascii?Q?p9dncjfCHviqtWz2KlFpTzOnlKdBxEYqajpyoPv+IqmimXHu+1rab2MBKbX9?=
 =?us-ascii?Q?S5Krmo8huVAZtP6BnUjPcR3jkF66NE4IO7PEaLqFsoQMrPHKIb5IgUqZq5iz?=
 =?us-ascii?Q?Ec8pgZSlejoiUmj0Q3Y90Z7UfwEFTAeu+ex3IKRh6Opes9GTdZhAjGUsOB1/?=
 =?us-ascii?Q?8jnPphmoV2fV/28gLqhzuNNyZTmRJzajiVPIL8VeMj0FhSwhL7uxVaFKW+Bp?=
 =?us-ascii?Q?RW153oZ6xEkyZwryPNfEafxr7ON7Ws1gJbVDhs3d01EPoPJdQPc/0yomVFtm?=
 =?us-ascii?Q?c63ICXSXqf2VYkhb30CQJDflp04sg+vJ4aKbveUyl1RbGbd3DdxEMZ4BDjBa?=
 =?us-ascii?Q?xb8JWWSjOJtA2taXnK+SwTew+efaFCmtJrQn4Q9YIhXhR40EouiZwVSUPxIU?=
 =?us-ascii?Q?5Acxea8pQfOE+j3L4RUAw8WmRH3IpzjJdHeW6LSMfLqD5A1yUUlnL2bSbOmK?=
 =?us-ascii?Q?efztWHlyHq4oQUMXuSec3NWRhJkUTznlDPe56KEZ3fsgsycbjETxMFjX2toH?=
 =?us-ascii?Q?2HcHqFr4ObMCGoiEG4B+WW4o9rsAPUp4yznE0/OmG36/8i4ir8kCtoW078iH?=
 =?us-ascii?Q?HYniqHYhKd/f7S890JLmP0+fKXShxyu6ZecXHv71xUSrVtekbw3J5rxqbx7R?=
 =?us-ascii?Q?2sdf+FugFfwPXlEpJ2ihLO/DCyJUnSuSwwx7sWt4SVzMaWEFkM+BDN8UWLLp?=
 =?us-ascii?Q?3avDbW0dCOmbXqdVTd0rYEZYPTq5vbPIbljttJZcKo6A9ttiO2kFIVEF6S90?=
 =?us-ascii?Q?6cTHA2J+Bvs2yn8LOkfclYxsmEyjd1hUBrTYBxyEp8JMwa+6YzJDF3mm7jZs?=
 =?us-ascii?Q?w+KRzz5redJgKoM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:45:57.3780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98fb5bc-352e-43a1-5518-08dd4bf1b05f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_214610_433264_170DA9E9 
X-CRM114-Status: GOOD (  13.39  )
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

'commit 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation
to `sst_nor_write_data()`")' introduced a bug where only one byte of data
is written, regardless of the number of bytes passed to
sst_nor_write_data(), causing a kernel crash during the write operation.
Ensure the correct number of bytes are written as passed to
sst_nor_write_data().

Call trace:
[   57.400180] ------------[ cut here ]------------
[   57.404842] While writing 2 byte written 1 bytes
[   57.409493] WARNING: CPU: 0 PID: 737 at drivers/mtd/spi-nor/sst.c:187 sst_nor_write_data+0x6c/0x74
[   57.418464] Modules linked in:
[   57.421517] CPU: 0 UID: 0 PID: 737 Comm: mtd_debug Not tainted 6.12.0-g5ad04afd91f9 #30
[   57.429517] Hardware name: Xilinx Versal A2197 Processor board revA - x-prc-02 revA (DT)
[   57.437600] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   57.444557] pc : sst_nor_write_data+0x6c/0x74
[   57.448911] lr : sst_nor_write_data+0x6c/0x74
[   57.453264] sp : ffff80008232bb40
[   57.456570] x29: ffff80008232bb40 x28: 0000000000010000 x27: 0000000000000001
[   57.463708] x26: 000000000000ffff x25: 0000000000000000 x24: 0000000000000000
[   57.470843] x23: 0000000000010000 x22: ffff80008232bbf0 x21: ffff000816230000
[   57.477978] x20: ffff0008056c0080 x19: 0000000000000002 x18: 0000000000000006
[   57.485112] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008232b580
[   57.492246] x14: 0000000000000000 x13: ffff8000816d1530 x12: 00000000000004a4
[   57.499380] x11: 000000000000018c x10: ffff8000816fd530 x9 : ffff8000816d1530
[   57.506515] x8 : 00000000fffff7ff x7 : ffff8000816fd530 x6 : 0000000000000001
[   57.513649] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[   57.520782] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008049b0000
[   57.527916] Call trace:
[   57.530354]  sst_nor_write_data+0x6c/0x74
[   57.534361]  sst_nor_write+0xb4/0x18c
[   57.538019]  mtd_write_oob_std+0x7c/0x88
[   57.541941]  mtd_write_oob+0x70/0xbc
[   57.545511]  mtd_write+0x68/0xa8
[   57.548733]  mtdchar_write+0x10c/0x290
[   57.552477]  vfs_write+0xb4/0x3a8
[   57.555791]  ksys_write+0x74/0x10c
[   57.559189]  __arm64_sys_write+0x1c/0x28
[   57.563109]  invoke_syscall+0x54/0x11c
[   57.566856]  el0_svc_common.constprop.0+0xc0/0xe0
[   57.571557]  do_el0_svc+0x1c/0x28
[   57.574868]  el0_svc+0x30/0xcc
[   57.577921]  el0t_64_sync_handler+0x120/0x12c
[   57.582276]  el0t_64_sync+0x190/0x194
[   57.585933] ---[ end trace 0000000000000000 ]---

Fixes: 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`")
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
BRANCH: mtd/next
---
 drivers/mtd/spi-nor/sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index b5ad7118c49a..175211fe6a5e 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -174,7 +174,7 @@ static int sst_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 	int ret;
 
 	nor->program_opcode = op;
-	ret = spi_nor_write_data(nor, to, 1, buf);
+	ret = spi_nor_write_data(nor, to, len, buf);
 	if (ret < 0)
 		return ret;
 	WARN(ret != len, "While writing %zu byte written %i bytes\n", len, ret);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
