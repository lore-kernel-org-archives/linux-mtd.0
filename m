Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24964C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 05:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPY69YmpUlzjjMmYQqoi0D30VSaXg5KMHcoLBRivrTo=; b=xM45Xf3Pv0J8tC
	ccwkfHLKiZh1WSG/BfVgHD2DyQ/qUiTDlHc7leWhKJqdHsTbS6+tVNJQ5XvUyvYvuRdAN+4WgQreV
	27Zdk/BGqlX6t7RoT2YFORldpErpf+Lc6sB4snDPc3zdVhDofDdxptSWrBigKW9oDHTvjxkvCnLNx
	of8wZlZqbonDeMf05JmFDrpBaOip1sryAyNim0whPF/+lwBIp3XKSJ1VWFaOuk1qzJ+7PW5AoPYpv
	EPF9R4oNR2gC+upashry0asjkdtWv+WrqkrI38zzOM5DI7n1twPcPoUZ1rqnrl3JooCwPVMwj2QLn
	kDOx82B9+/A6S+eTI2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwXR-00CSzN-6x; Wed, 05 Oct 2022 05:01:45 +0000
Received: from mail-dm3nam02on2066.outbound.protection.outlook.com ([40.107.95.66] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofwXN-00CSwZ-Kk
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 05:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgxMm0raoX9bFrZmNITnpS/0ZHZJzUfPa1um5LJOhFcAbrPaG7dhFz4rSL7+ruqGwFOkoBS3r1UAXlQFUyl0PWmv/XOB+HO6qlcnPBf7N2who2Bmad/RFz1UVMOWhY5RBbWjrFWkufvurFBne1XAqZ82or8MMH85NkIA5hNPksDK429dy0W7xbEYfe44/qRYS9b0iMMKIxoEhStQv73PsQafqd9BQpSA+JQFd1rO+IOcpkHOEluMOM0hGnhJ1rHJV5x370owGqTxu4MUPRsI+jV6ZK711L8gjIhN1ZObmp0KgT5tiYP4/E76+fbRTX8JtnI0uL7HWLfpkN+w0jLX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDQoyOcWJRzgzApnOsj06MNo4yMyxG1Q+K+A+NPH2CM=;
 b=I8f0U3boiinhl8g1+ml/PveRkt7by3fVDz728E4d/UsBVBtGrd3ROV2WRptIHmlu+I31360XDOHK3aDf1n1FRYObWzjpf7IUcEQD6rbSnTUwFk9uqadl+Rtr+DqKkFwYVniVazKPk1kWZxUsz7jjhTSeEmSynIvdPPukgKReFnWxEa9SiR46Oy3Zb5QImLmvL8uop4n2lzw4QIucQaaedMJimlx+pistMDnwDwhKQBtuUYABLRBdLEnlWhgM3WiVnexOiBSnxZudeMWXBRsQHQ6XFJCZ95C5w9vQ6K5dbmoCPy/X02yJcGINW52XwliAPRVAm2OrY7vmakLTuQzAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux-m68k.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDQoyOcWJRzgzApnOsj06MNo4yMyxG1Q+K+A+NPH2CM=;
 b=g14bBWOrCLD39ttLJwfhcIXcrUJwrklgea3v6ilkSBKuesdP/+ye6x7++UeQL1guPXltmPY7ikU8mipFNgwQdapOpWlKsegWctoidrm3ILXT/0AaBV7jU1SlqXJTe2CU72XGDxTKUXFN93+idMkbxAdV5ml6Fzhb9zAzzL6t+irmtBEI7zAhZoIVNSn+ceOgUziZRH4quV7mDAYpNIAH02XObxIzoLf0kylfJEBejOeAUhkMk7uMCVqg2/PMJmynKA2jdX56HQBUa9NKO6t6THcDMQhFyjAUdgtckooQrPEccto8UfYpce0x4TzUwI5vUiDuvGsCEYDCut3qJpzVKA==
Received: from DM6PR21CA0019.namprd21.prod.outlook.com (2603:10b6:5:174::29)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 05:01:37 +0000
Received: from DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::ef) by DM6PR21CA0019.outlook.office365.com
 (2603:10b6:5:174::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.9 via Frontend
 Transport; Wed, 5 Oct 2022 05:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT112.mail.protection.outlook.com (10.13.173.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:01:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 4 Oct 2022
 22:01:24 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 22:01:23 -0700
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
Subject: [RFC PATCH 04/18] brd: use init disk helper
Date: Tue, 4 Oct 2022 22:00:13 -0700
Message-ID: <20221005050027.39591-5-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT112:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b42157-e7b5-4bf3-e4fe-08daa68eaeba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jThZbbniUmpMyhmqACf8FDoNh6MpBOSNnmtzYmvgumvibMnyLLi8tr3zndO9EKuZSLiu2wi6ygd4OVUwKM3CIyAImu07q79N7pyBlNN6JQXs8ybMyI+KKqyYXRjRCxi8mjuU/8xUvVWUbVff3uyniW4ia4CyK5qwN673Fw85+skh1lRf56qzEjCVD57xiQ2f129lg6UsACmZmVGVB4k+bHhOrkR95vKkkDvXrOOFveJwarZZiMG5VuH2CSmN3VUS/MwIg/KMc4pXDjJp3kZtQ+GZwaKrQWy84ibAebXC5zMEaAJzM8dMl5Wc2wDyXnIuuokCg6CA+jhROi8SIapgQdDmvTxdPvD1gj+RV2JPzYArZo3HuD5kjLiMRooIXIqidxoRW/86cbA2qNUYgWsHMyTX0XyRPdoYFhScA+EG8a6ErEsLgfmYGnMeaFnrpwk8wydAPyJVx0B+z09PG6XFdc6aIzhzmywTvt7KB865W/I4ut0daEwCaVxPWazzPOo0YsQL73wzrCZArjycNaMMkoImgeCpkD7XmTjKVie7BDDhKN5iIZNNWXxwuUe/ynXU1Aua1ktrjdlgcoZQXaldv9oXiERmRjVUBXb5vfwmb0mA3wswuLksb6NPi7VzXTa3PITomVHzEAJEcuGo6IGlTKYt9Q/6IEtvUvWJ0vkkDXzBUxKa4iLj3AZEhHHtoG6s7ffi7+B7XXpp9jtdh7/8rigEbDPvtNIize293iFCxlftBWxm6C3Ft4+wM4r5VAgarH4C6/kO/CTX1vS52uWt2Htt0RrPTTNYHR7oc4Gz3rQ=
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(478600001)(6666004)(336012)(426003)(83380400001)(26005)(8936002)(2616005)(1076003)(47076005)(40460700003)(2906002)(16526019)(7696005)(186003)(82310400005)(7416002)(54906003)(316002)(4326008)(70586007)(110136005)(5660300002)(41300700001)(70206006)(8676002)(7636003)(356005)(82740400003)(36860700001)(36756003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:01:37.1522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b42157-e7b5-4bf3-e4fe-08daa68eaeba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_220141_732338_00796919 
X-CRM114-Status: GOOD (  10.63  )
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
 drivers/block/ataflop.c | 8 ++------
 drivers/block/brd.c     | 9 ++-------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 9deb4df6bdb8..cd70f7b329c4 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1997,15 +1997,11 @@ static int ataflop_alloc_disk(unsigned int drive, unsigned int type)
 	if (IS_ERR(disk))
 		return PTR_ERR(disk);
 
-	disk->major = FLOPPY_MAJOR;
-	disk->first_minor = drive + (type << 2);
-	disk->minors = 1;
 	sprintf(disk->disk_name, "fd%d", drive);
-	disk->fops = &floppy_fops;
 	disk->flags |= GENHD_FL_NO_PART;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
-	disk->private_data = &unit[drive];
-	set_capacity(disk, MAX_DISK_SIZE * 2);
+	init_disk(disk, FLOPPY_MAJOR, drive + (type << 2), 1,
+			MAX_DISK_SIZE * 2, &unit[drive], &floppy_fops);
 
 	unit[drive].disk[type] = disk;
 	return 0;
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 20acc4a1fd6d..f60fda36a813 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -392,14 +392,9 @@ static int brd_alloc(int i)
 	if (!disk)
 		goto out_free_dev;
 
-	disk->major		= RAMDISK_MAJOR;
-	disk->first_minor	= i * max_part;
-	disk->minors		= max_part;
-	disk->fops		= &brd_fops;
-	disk->private_data	= brd;
 	strscpy(disk->disk_name, buf, DISK_NAME_LEN);
-	set_capacity(disk, rd_size * 2);
-	
+	init_disk(disk, RAMDISK_MAJOR, i * max_part, max_part, rd_size * 2,
+			brd, &brd_fops);
 	/*
 	 * This is so fdisk will align partitions on 4k, because of
 	 * direct_access API needing 4k alignment, returning a PFN
-- 
2.29.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
