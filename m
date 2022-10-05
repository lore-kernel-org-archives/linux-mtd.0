Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF72AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykqUqAJmpTW+D60kFyfV/g4/gsaPW4IM+N7nsGzpsQs=; b=YmmVBPrL8TGTId
	67cKxgL0xheDyYgfUAZOoEyTvS9Fv4epnlrfMRbeW9lhKR6LOV896aD1BnfGHzRZbLI7SidVvDk2H
	HMvFqQpPhFFtQHkgq/useDZG18cS+XBu6lxqfAOGFRPQEaN3eI4Ua2TXyXz2u5L/jJ5dyzjPWbwNF
	rlkiBTuvBgVZqfzVHSLo6Yvyby3vwxnZK3CTW6n+VtWOR8sbwAzy72S/ad4mYLApyV96Mntp4Zsi0
	sjBWLOcH3laMSjeYrSoh2RBk1H1vNMNWzt2IW7LJYjtUr24rDeDWnIEVnkuaueBJT4/2KVQ9GV2Cv
	fo1si78nfucjOGn3X1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwXw-00CTIr-MF; Wed, 05 Oct 2022 05:02:16 +0000
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com ([40.107.244.75] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwXs-00CTFY-BN
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 05:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWknscsmqkIL6xOJmyCVe4D3+VWdptwcux4NNsBMZujugtvQ4+BOIxuohWiu5KqX0M5xYjP1BEfDzaSYAv6qh2C/PJ/u+jM7L3EJDnEVBXyTsQGjmHDvsHb+mkHIgG7q05xVzXW6AK2fg8vkMY+1HI+vdWIoShODynJge+epIQND2fCdKXLSC56qDZ6rXK60ecQSe7ivfnV+8qgTIgaiDsO2e+6QZ6ciOXNSQyiMYfrunG45RTBqcUwqAuYLldU3U/o5RpHt8vlr/1EPgiHUYbn3tWdq12TGWvkspz7dZFSsB8mtb4u2vUogS+4qxwTspvZBf3DPC++RtI2Xv8LQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk9MyVy1oXy3uv5w8WYL3X2gFiy9z92JS7cFu9tqVIw=;
 b=Xa47t8qX9FH+L7bGvmL3BioyM5mzAgXQD7E93N50Paef6bsmmrxA6XPiP/dXyigoMxxtKpmNUac7CIehmya84u8JX8WbMxY6jGBDoPiQP3WUrM648waDy7/6JW7KoMe6B57BmIa70luLhUh5+TcTXBbkY2vN098De9Co87iLB0G1ypsyWMp5lJ5jXUhltEFrsJTt9xirRY9Nz1yzVkMYYkaDvFrK6vTiXFZX31yjzzXFOlNZpxLU3BxEalLJtd00/Dfb4HTVOJsjL/DFIvEml2ONsdHi/o5IKuOERZ1chzeNuOjXWkeHfkZP/sx3UX21vmmmROOH3as2EyGA/GmJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux-m68k.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk9MyVy1oXy3uv5w8WYL3X2gFiy9z92JS7cFu9tqVIw=;
 b=Bttd6s4zp3W6yRfKjrX9pMpf4YLh1OXQvQXMcHFS1miDFuwEAmGX6k3ckH9/EeMiX3THwlDz4ZxxntSSELbezLDcORt1FZuPbXYnsCsz+vv2P45i8MzM7y95+4itmjPF+pFnK/zGjTcKnqjsxo+P/fioVmAQqdpXgkKTAP1d+Y3AN6uUFBIU+9AkCEc0IKvNhzWQJ25mNIwttfR85QRrkmDQl5cVtz2fMX6ZkYDRou7ByRCu5ROkg2MGIk9OBUQHoJ6S4Sw02cM+Xsf7tq20Rt6+pKsIti2n5WInHtIKUJo692M1bFHdrlb2qBGXWx6QmZ6lDewXEiOdJgCSepR1CA==
Received: from MW4PR04CA0148.namprd04.prod.outlook.com (2603:10b6:303:84::33)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 05:02:07 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::e6) by MW4PR04CA0148.outlook.office365.com
 (2603:10b6:303:84::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Wed, 5 Oct 2022 05:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:02:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 4 Oct 2022
 22:01:59 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 22:01:58 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
CC: <axboe@kernel.dk>, <philipp.reisner@linbit.com>,
	<lars.ellenberg@linbit.com>, <christoph.boehmwalder@linbit.com>,
	<efremov@linux.com>, <josef@toxicpanda.com>, <tim@cyberelk.net>,
	<haris.iqbal@ionos.com>, <jinpu.wang@ionos.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <kch@nvidia.com>,
	<mcgrof@kernel.org>, <hare@suse.de>, <damien.lemoal@opensource.wdc.com>,
	<johannes.thumshirn@wdc.com>, <bvanassche@acm.org>, <ming.lei@redhat.com>,
	<vincent.fu@samsung.com>, <shinichiro.kawasaki@wdc.com>
Subject: [RFC PATCH 07/18] loop: use init disk helper
Date: Tue, 4 Oct 2022 22:00:16 -0700
Message-ID: <20221005050027.39591-8-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 86147461-1e5a-4a9f-5df2-08daa68ebffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r0bOj+0xd98aOFwD4Ns5R7TDWeqQ6UrlYINarhWNFKq9x7P9d/iPfx/hYslCCqQWV8LPo07JFyuGDa5ij+v71omMzGBvPsAxgm9eKEeR4YeYZYOG6kdMT25dF2hbt8TGAqCbe98IzZcz+7Ej6R1JkI1ZkBZp1+TsZov5odPxyOM0LqHXfbbSlDUTheUvmCtXE9rZwAB+LYzNNWbW0RKYUaCirclo/7ZTPoWgrggoFnSEnpO2GNfyMOqQGJXygjry9XXJn2OU7IgudfqYDsiVpv3OJpDWwuMePEHkCXHDk1eqEtwA/CZdiIIZns0H4kV646N/ugw4QqDdg07mcpUfk+YRZiTj/rxUjWyK4X4nlVwUTWjJG512b0f4LzceKcZkMIeWJuCKcTWllAFEI6+rUKnoBOqgZjlcfyrTK92HDSEcUEVMmuY7Jv7BM0BY20WcYHaudZEtgPwc1S6YgAqQnCDb6/Ufo6CJSyWONtyV3dL2GJIQThGHsui0h4WpCJHdxHe8FSZDIhYhi9/i4y6nStX/YyJJADsDMYDdee3pqLOODpxTCV8SaDdT15G/OG105cuZ2T3N0a5HQA6zV+y/sCDmIbWrPz9n2aM12ShXnQ2JcAQXGUdYZ7qyM6/q8aeyf/ll/SgjCtXeeEsrRF1wMz38fy6+4cv/66dU6dhXeHSLkrAE//zgudQsA2jiCAhtmbElvgDetL/Zi7b1pVL1O+R+Us/RBk2mjvnL34ahf4ldJ+fkL4Atj1A2LRj8Zh2IuYXRNe4XNhCdzInjhOxnWZn9nxmdJpT8n12bspmRYRQ=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(356005)(54906003)(7696005)(36860700001)(26005)(40460700003)(7636003)(82740400003)(36756003)(41300700001)(8936002)(40480700001)(6666004)(110136005)(478600001)(4326008)(70206006)(336012)(316002)(2906002)(186003)(70586007)(8676002)(7416002)(82310400005)(426003)(47076005)(5660300002)(83380400001)(16526019)(2616005)(1076003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:02:06.1832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86147461-1e5a-4a9f-5df2-08daa68ebffa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_220212_427942_51A217D4 
X-CRM114-Status: UNSURE (   9.31  )
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

Add and use the helper to initialize the common fields of struct gendisk
such as major, first_minor, minors, disk_name, private_data, and ops.
This initialization is spread all over the block drivers. This avoids
code repetation of inialization code of gendisk in current block drivers
and any future ones.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/block/loop.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index ad92192c7d61..82cdb57ecd18 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2023,15 +2023,12 @@ static int loop_add(int i)
 	spin_lock_init(&lo->lo_work_lock);
 	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
 	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
-	disk->major		= LOOP_MAJOR;
-	disk->first_minor	= i << part_shift;
-	disk->minors		= 1 << part_shift;
-	disk->fops		= &lo_fops;
-	disk->private_data	= lo;
 	disk->queue		= lo->lo_queue;
 	disk->events		= DISK_EVENT_MEDIA_CHANGE;
 	disk->event_flags	= DISK_EVENT_FLAG_UEVENT;
 	sprintf(disk->disk_name, "loop%d", i);
+	init_disk(disk, LOOP_MAJOR, i << part_shift, 1 << part_shift, 0, lo,
+			&lo_fops);
 	/* Make this loop device reachable from pathname. */
 	err = add_disk(disk);
 	if (err)
-- 
2.29.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
