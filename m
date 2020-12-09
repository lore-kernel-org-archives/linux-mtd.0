Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E623C4361B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01223239FD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01223239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BF54Vf7anmS1UXEXcOI1XLrw/Tb/e/xoV1yB4qtONA=; b=qBWqg10eudREKcMlHSYE+hIVL
	W3arRVey16MHtMIFOe5U6nTkPL/KwWTBXLcDvHSXfs57Qq/vulyIed0k6f9nQyqTkcndYZGSwVuNJ
	AR21Go0TpqlOsHBgSvrHp33OrN2ed20Q7DAsXeY3M7vpdc3IaripRYdhiGNfANcEMUVshhJGHmQPy
	v7n6Ke8miiMrVh80clxWDfSxnhDfMiKSflMHGN3XyXQExRKqvGZ6O3WzJCrwgj3sjxN5q40cPd4dE
	gXGvafksTpYE0iTNEfM3ZeaKxS1OdBLx21XahiJ5trnZp10+0GeTiDdQ/PLfZsdQvixD50bFT6EJ7
	VntEZgAHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmqVm-0002o5-4T; Wed, 09 Dec 2020 03:51:30 +0000
Received: from mail-eopbgr150082.outbound.protection.outlook.com
 ([40.107.15.82] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmqVi-0002me-3t
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 03:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF0oLmANiYuiqIonEerxBruuDXmOEkUlnbh/7CvAqdmoM0Sl0hJvA+SFhB/tA8prlc4ps0YduFOromRYhcs645lQ06F/beeFDhjigGhdtL+N/cVIYcbvd+8j91Fjv/UbuzX+L1aiOtZFuDAwjnezDf4YmWlO4at2iAETah/kvjkn1uIaGlXGgZMxag8s40bIV4euugsDyNAtLyGboxZjgWl54gN+rZ9Dw6XXJvFKYTK+ggbiu/1UshMgbPIESwdkqr5Gl7zp4KeuypI/Rw8Yv7cWbatv/bn3YrKzw3U/tlSrGCM5XqgTT8fTiwOst1EpaSdAWjw1xrFC/OtmQu2F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E61a8LoJWocRup54jWpyK4DbKR9ZfxWcWPXgm2T39pI=;
 b=iXM/7cbsfz50jWOQ7BMa3P2y0605+Pf/uKPKh3JZQlyRkmDNLtCC+OBMqDMIaVMw8Bkp7exy4EfmZflC76NyKVD6gdIUA41rvKIIKflMK+9xoJcvawxG5qUvB01w5I6DW0JeKmKmY4C7Ul2r4gGhoJkBpH6Dq4OoeHg/pcySbMIpwDqMTKAzzkLC75M/en6NqWqpef0dXu/jTfEr2cOT9Y61eoPFOl3VCNYftvRdb/qoFQw7BmNyAbSkasrE2LJFztB4lFQpPDkab3Ff+IYQj/CcIjtFzbUOXc5TZKpLkkEpRHKBQium8E437iE6BWkRci1iGaAHf3Z6ew71Nno8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E61a8LoJWocRup54jWpyK4DbKR9ZfxWcWPXgm2T39pI=;
 b=El54uBvGnBGJwyoE7DhGiw7EdPBKv24zPkmFKJ0+AVCSklwbP20K0ZAFel8kDAwOGbEAffxOLgCZ04t6L9OBcyrzX/ULbxz2gb3EUmFX0KQ7XNxs7YZEf8gyPVn+1T7I2LxpBqRksJrhF0SnZogIGRKfA7ApuxAdExSW1+sTgTo=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR0402MB3365.eurprd04.prod.outlook.com
 (2603:10a6:209:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 03:51:21 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 03:51:21 +0000
From: Han Xu <han.xu@nxp.com>
To: miquel.raynal@bootlin.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0 R/B
 issue
Date: Tue,  8 Dec 2020 21:51:03 -0600
Message-Id: <20201209035104.22679-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209035104.22679-1-han.xu@nxp.com>
References: <20201209035104.22679-1-han.xu@nxp.com>
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: DM6PR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:5:337::29) To AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from umbrella.lan (70.112.23.252) by
 DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 03:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e421bc20-d6d9-44e8-f896-08d89bf5b0e8
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3365EEA4A1C4C217B1FB5C3B97CC0@AM6PR0402MB3365.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BpFew4dam03XHQS8IBq01YJ1aZBEkbVkjdjYGLl/d57woCRmWXqL2PmAkEcouSyipJOVOgeWSsbRoyLECHY+ALBoN/wYFaj+pRyAFAN1lHAPeM4OOYbane9nIwu6FZPQqLE9Y7se9MPoRTjl0HM3zNbnUIk4Hr+5W7BCm2QfKT1Np8OHNb0Ya5MThp5xQPV/lQtwXePXx9zVN7SUeVWWv3XrccF38ZgB3j5n5BvEyH3ly61cU8kIRfhTYkCOSCMLt7Ih6krY01qDmzYOXnc+GX+sOG1SzzCElsbV7Z8aFbQ9Iw0EzC9AElNims5PymiZcbNGV1zb3kxBFRKWvh50FDzaS0i9jQ/BVXGnmKRvPfKLSQPGzhblgYNH91AUMcp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(8936002)(44832011)(956004)(6512007)(52116002)(2616005)(26005)(2906002)(86362001)(8676002)(508600001)(8886007)(5660300002)(36756003)(66946007)(16526019)(186003)(6506007)(1076003)(4326008)(66476007)(34490700003)(66556008)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D63fg+zsCkusjypzFX0dRYfcrrtJeNqlpiw+SRePBfjs2Nwc+K5sbNRla9BR?=
 =?us-ascii?Q?74csJPHRhXMiy97Qze3ca/JFfKI2FWU1bjnRhiJWFkDkLCZ/orwGU5NSMip6?=
 =?us-ascii?Q?HFJZ8TgZZh5ZCi20CiPPyV/nEjywwUmgqesQ6j7pOwK4H3GWAZUInwlmRfdY?=
 =?us-ascii?Q?aYvEt4Sc2gLKLN8tiXn+DXYjeiuxzINvOVOLtfq9+gtJd/nK/kx6gQz/O38L?=
 =?us-ascii?Q?FHGos0KSwyhxHWenfQkHgpoRWy/o3A7mcW8uVB7hoBNKCYhhyXjQNue7nIB2?=
 =?us-ascii?Q?jJCHCddpjB8ZlmLcetr4opIFDShRA72/3Zk8dUlin5UpZFzJRTilkyku+47y?=
 =?us-ascii?Q?IdBo83Lax/Rge+YQro0YY6XPWtIYC/wBQmpHt4nY8GM2W/5sCXwJVBtwwk+I?=
 =?us-ascii?Q?0nA7eB3yS+wqxYSHgbCNaiZq1pZxSm0gGZg9mUyFiZEfWDlMvoxdHziMiHWi?=
 =?us-ascii?Q?TBnOq8AO/ppKumPrumIh5TjfffrdaffTsOiP1dBlWqm1Pgi/oe4TETXQqbY8?=
 =?us-ascii?Q?CK/7FgV99118mzlJI+7gQmjUy88T1u1OnEf+2Bn/fk/7IMTug9J6HMl0+xaT?=
 =?us-ascii?Q?F0xdThaqA0j3ZjDBuzcagrqUhEcIERc/deJ/IveoKVz9HdXgxGS8FhZnz8Yu?=
 =?us-ascii?Q?y3gTxcKq6KXL7zeCQWeMFemE0kiEdY7PRILK06jVCmS4kFLvWXO/cTwI+Lx/?=
 =?us-ascii?Q?UXSd6rFhnpTVCUJt0r+dXhlKfX5f7EvcU9AppzE1lHgt8oPZXylHGHuciVaJ?=
 =?us-ascii?Q?VtoO0lC731TJ0mtkjP91GBsIzexKwEw92PQjypQriYhrmdt81K+BmYTvVKoY?=
 =?us-ascii?Q?q+KUq2DUM/cCigTeGDb+q8r4M9Y6MwNrWEcYPVpjai+2eg/waFBEOrTC6Z6O?=
 =?us-ascii?Q?r68stQv4Yegz5CryaYCHYi80vbsGONK2azJ8m5ukPhTeZs6nIM6AHSXh7C/Q?=
 =?us-ascii?Q?u2TCG3ZUnqWzA4ZVLd3EeP2mBAnH6NBPOvSE1/0Pvsk2N5p/Naha81sRXJWo?=
 =?us-ascii?Q?DCNm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 03:51:20.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: e421bc20-d6d9-44e8-f896-08d89bf5b0e8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNMyTRyFbfUMJMtKZeXhr9W9xXuH9LziFA1UVeEikIh58z5d/iv7VAukY8+XQCgu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_225126_181134_75E40B31 
X-CRM114-Status: GOOD (  15.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
from all CS.

For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
without the patch.

[    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
[    3.770613] nand: Micron MT29F64G08AFAAAWP
[    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
[    3.786421] Bad block table found at page 524160, version 0x01
[    3.792730] Bad block table found at page 524032, version 0x01

After applying the patch

[    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
[    3.770941] nand: Micron MT29F64G08AFAAAWP
[    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
[    3.784390] nand: 2 chips detected
[    3.790900] Bad block table found at page 524160, version 0x01
[    3.796776] Bad block table found at page 1048448, version 0x01

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0d30f3fbb045..b06e202cdd0d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -181,9 +181,11 @@ static int gpmi_init(struct gpmi_nand_data *this)
 
 	/*
 	 * Decouple the chip select from dma channel. We use dma0 for all
-	 * the chips.
+	 * the chips, force all NAND RDY_BUSY inputs to be sourced from
+	 * RDY_BUSY0.
 	 */
-	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
+	writel(BM_GPMI_CTRL1_DECOUPLE_CS | BM_GPMI_CTRL1_GANGED_RDYBUSY,
+	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
index f5e4f26c34da..fc31fd084dcf 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
@@ -107,6 +107,7 @@
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_7_TO_12NS		0x2
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY		0x3
 
+#define BM_GPMI_CTRL1_GANGED_RDYBUSY			(1 << 19)
 #define BM_GPMI_CTRL1_BCH_MODE				(1 << 18)
 
 #define BP_GPMI_CTRL1_DLL_ENABLE			17
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
