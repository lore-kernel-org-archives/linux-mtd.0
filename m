Return-Path: <SRS0=olNe=KR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FF9C2B9F2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 20:53:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29BEB610A8
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 20:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29BEB610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Edcnt5j0mKTBhY9n5U+l3YiegRcU8c/5A8201G9tau4=; b=ZM+G9MRNYXqNMjhxhkpaAweX4i
	euRLs/zbuAGUtjjwN9NZcnzZNZXEdW6Dsv/+C51/3LCexidLGn4rfJw+PNBt0x7btZyEbKC3n/soi
	Ql4nIpYP/L2qMbnFFx/kEes4yEIHiXl2sEcDS13Z7PiovUXBQhtx5Fu4n47Pby54STD7SFaRpjgOy
	FU+p1YyzqwWiYkifBK44tNNLXsOokU7TTIDknXJQ6cQ6AtgDG95FSAN55s2FWZYOyuW/rdDmUlnd0
	TTCS2jm1FTUbTIpbMb44CEbAt9hrHGqmNBQahf0rOlgoUDI3vmbeifxNiMy+lfmb0100LGDL6L5hY
	+1qNIoLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkYbQ-0035Uz-9p; Sat, 22 May 2021 20:52:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkYbK-0035Ul-VR
 for linux-mtd@desiato.infradead.org; Sat, 22 May 2021 20:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=32QaBIHVXyBLjq69N3IOUPX7pQ8TTOSw1RHYD/G8gOk=; b=a157DVPIKkMffEg+YhTRlojXYz
 UZUyOR8tKpklEQxWZzmMDt+mMVyvPvl68UgFbMlR8rKluWCAoNdIGHc8wDie7yH/sLk+Bia4NKdR6
 hkQpVnCJ7XG4M1RZTb2f1o/kqSMfXXARku9+DjTKFK/sQbKP5vqaPHBPn9FfwuHttcCEptBONuODR
 gAl+lKLs8dmZ0SkQctc6q4VRaosBSNMAel4QhhpS3+FvEa3jJijpwr5ZwQ33T+uA33ffmGdWjcf8I
 cgaLC0DOV7c9DDLo3HIubAGv727htWcVGLV+o8Yl/SwZ0Twb2G6uwjIOdDk0VISSkQdCTYwSTS8ZF
 Pj4vwr7w==;
Received: from mail-eopbgr130083.outbound.protection.outlook.com
 ([40.107.13.83] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkYbG-000CcD-Hv
 for linux-mtd@lists.infradead.org; Sat, 22 May 2021 20:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToYFMRmASdsfvwFpoGXMFwvfDZaYabOnNpwMua7oquCXSqPFWDKM5GVX9Pio3ZRHtpGLL7gw8FKsBL9fRtGf81s8c0hcHr4NJ/kX+nWrCnwyijoiubI6cM4P93IGHAnRVS5QoLkTPuuWI2Ctrs6ihP0oRQ//L7RYYdRQFk04FNhlpyztBxCrAikZzlSmFRr60bSaKckcGDaGNwLHwbPpk0JSfyMnEwKCXEjwTv8ZHyptSPLSD0GTRCIBPdzfwTcarb9080ruvG8spGMheLx2p6+dwKEgLDKfaiUcIB7X+KzUWUmx8vvFWnB7vuOhpgWxKNK4k5e3J3NFi8eMeL2gsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32QaBIHVXyBLjq69N3IOUPX7pQ8TTOSw1RHYD/G8gOk=;
 b=i9iMl4Nmw15Dxuidws7xodH0PMP2AGMkaEwfqq1zI8O0h4t142xD8WeOUZR/UC413/VqYqlEgnS6AbHMhLjTsza7sdL9p/jYZOuLnqnnz+IOfFKdEir1soZEiwUFTjzOaheZZPutcbqGeiFEMyld1JZQlo7CD/wAldnlu9/vDBJDNyo+X+uxTiVzvpMLUADmO4GkkoNKW1OnNdKScT60cvQIyEfOxMSNcS+ZI9lyXonfQaAGhJo54cdyDEu29I/6y5A9swg1s43NYAjM/0I/DVtfnTAFsgEQgMVU1IOqNQ2SEelcdxDV2YGCqbWhChs2PA4+AvEfb2lZBITO2/+3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32QaBIHVXyBLjq69N3IOUPX7pQ8TTOSw1RHYD/G8gOk=;
 b=W5DuH/LKuPL8hWTrbaNI381sUmAUrN4UVTrD1LmhXNI/W79OtGklsFE05e9wJUgnsmyez+3g6kbIwHWxo01Yq2RGIwYECbQIFUkquUZQrRP4/WV6ix2wLvzWgQ9vV4TsKEFParDNGOx6TH+e0gVAHwgy14IJebEopLk7F9iPvLw=
Authentication-Results: geanix.com; dkim=none (message not signed)
 header.d=none;geanix.com; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Sat, 22 May
 2021 20:51:51 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78%5]) with mapi id 15.20.4150.027; Sat, 22 May 2021
 20:51:51 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com, han.xu@nxp.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
Date: Sat, 22 May 2021 15:51:35 -0500
Message-Id: <20210522205136.19465-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: SA9PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:806:28::9) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from umbrella.lan (70.112.23.252) by
 SA9PR13CA0154.namprd13.prod.outlook.com (2603:10b6:806:28::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Sat, 22 May 2021 20:51:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6195452f-e8f2-4a97-b0c6-08d91d636c9a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8582BCEBDA1816B9547A226A97289@DU2PR04MB8582.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VICzWPwCceKMd/7Ywkot7hGByalsw0DES/NgqjbVUTnlLjuY3yBEy+mi6n63KGP4FHZU/WTWCYL/EYUihG1bsSQeY72A/o0SN6YAJa/TJZflfbiNw/lhoz61lj8jz6lMHyi6In3rZ//tj4kYbWBwi8GRFi9NFhR51YjudZ0cL8z5O1zPR5gHGhIx9BHFItZZR2UsQ6EexLguZQBmPKPotbFE/+V80BhqXhzPDPu09PJDbqWKUvgDv1QdSDnvSMGxU287FQQ+rAF29LaI5iXtop14MCaqIJookNvBKybhDEklqFhlBbPgmZ7SWLVvcxW3FBbwIJzmAWFodPG6ddg08Y8blZg71oDgVuAFkTBt9qqvcNIJA8DHv6RC+4nOzueKZnf2SVC2fnG18qwzp1sBQguovurgS3D9mqiqgqAyfE84juCue2tRBYBRwECdzcpryAulD0kQ49bc3gkniTUn+ellHCXEXL8h8vrilHCD3/uWsBY6/3UFqRlZUOnDkiSRHHCXNr7hJqDQ7eS64w+xwIYQvRS8I3KeRkdtXC2dEl7trI3IEDPY/POwRSb9TDHyhj2Y/PhaA72arkyZu4Mi1jchlrGyE6nsWUAqfw43Emj4muuDr8WDd8muH/62j8QO+2YVHAr8ZC8dOI2q7oW9WKUeTSO5Fg3mkf179gDd7/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(4326008)(83380400001)(8676002)(6666004)(5660300002)(86362001)(186003)(36756003)(30864003)(6486002)(6512007)(8886007)(8936002)(66556008)(66476007)(2616005)(44832011)(16526019)(26005)(52116002)(1076003)(956004)(38350700002)(66946007)(478600001)(2906002)(316002)(6506007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r+24RkYaOQOdDJoGJGGvHJNI5HOgpljrfWrfAupHEWBfSE6IxUHGypdI3Tq1?=
 =?us-ascii?Q?W6kabR7XB7m8pbbwbKom+2ZXLn7CzHPH0QDnWUeCZMCFQazBHUAO7JVKnDQV?=
 =?us-ascii?Q?XumXcKKQusU69X1h9loQ2zwrbD4pIs4fc73Lt+DtCk1ay2MmAR+ESF2X17HX?=
 =?us-ascii?Q?joR/anFmUq0vFu0NebZ3uxJ6yXh7A4TJ4hDRtc5T/kV+P8yDw0OWWgcfRo2L?=
 =?us-ascii?Q?cvpBkhpYiCQSQ/xEuRd5abOcXhseWQ8Nat1nlQ7QyPH33ataOPBQVXQ4LZbm?=
 =?us-ascii?Q?Ci2F6gGyR5w2CT0RnKRpGKMFUDw6m3jWrDaVOuKfxrbNavsMYW3p3/aUyKSh?=
 =?us-ascii?Q?J4YzWlo+GJM6OCsDZVoiz576GQPv9wShr0YgJZunw75tQuL4rxoCg3WLB6xV?=
 =?us-ascii?Q?lbGZySGkjd0VfOiM44tdNqzlP+XFtFfD8yrVAq2xWMC6wMzons5mTq/7N+s/?=
 =?us-ascii?Q?aRy4IWOrulYLOb/rH1K2fUlkTsod4I1je+AdRPPCjrhNKJ/idbSBzl05En5O?=
 =?us-ascii?Q?v5lDVgzcOxcSoMBdFNQ9Bh/IV6WXV0+fcatNpRpBkIw1CvTG23pygsaLmGx7?=
 =?us-ascii?Q?Uc3YxZJRnofYhw54nqjudirvc1N3qfYlmIrWtGIJk6Tjb19r1U67WwgLY68q?=
 =?us-ascii?Q?hUxUJg35KIxZxs6qjRDEs0ozmQvBm9Knf7O9hTRtE/T2W4ZUJjX26DgBteO1?=
 =?us-ascii?Q?yFVXRIv+MkN0rz2dCLT1eb7i+jseupFopM57Ykb2l71mna0Umx2BGgCs3xyA?=
 =?us-ascii?Q?R3lqiCrJcPXNNYizW6TyOeJsmF/vQ9pcYqcffzP7fxGvayO/VVIJAlkGoGvF?=
 =?us-ascii?Q?jtPHQ+nk1J2/ezypP03WZihkGGDh909Pe+3o8YhfQ0sZxVJihGzgFbxOY/Ya?=
 =?us-ascii?Q?3UEzzCny0MyogxjLJ9LMrakUx6V7N2fbgNFXalPi2rFCotTcYiZbDlpt++15?=
 =?us-ascii?Q?Aueu376nBsy3VYvbpKFgFJatuHk/ai8vCuCMmHERPWql6yvd6dWhCwwmPAlx?=
 =?us-ascii?Q?EeZuyQ1+nTcfYOJlnUcFQkYwudLYyf47GGfPEJjsiZWiV5rFuJ7OgR8Oz2T+?=
 =?us-ascii?Q?j3UECO74kikj3O41g+jwRvmcwYPnycoZibLz3vJJjZw4HFpCaAUv6RhwVLm1?=
 =?us-ascii?Q?s5hESXy1gwqy89ojYYGHVzFAh4vOPMuBT0jPJe2yEWS6kTeW8O7mWuj8rmtN?=
 =?us-ascii?Q?P812Mc4747t/c9m6FMSJWi4ceCXR5CgjRj8TwIpJg6whaOyTEkjFAYowtw4S?=
 =?us-ascii?Q?eO0n40BZf+sQpMVkyTdG60W4QGi4m+c9L4IFkHWM16xDduWuDye/LN/0Tq4E?=
 =?us-ascii?Q?JqV7dccKnpnuZTI3Tb6IXeC9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6195452f-e8f2-4a97-b0c6-08d91d636c9a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 20:51:51.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrmeEt2Q55cncolNR0h59houn26WiyvqlFLlShJNy6VLuV+dHEj0rxu3Q5Htg8Qj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_135158_796200_061D9A25 
X-CRM114-Status: GOOD (  27.81  )
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

The code change updates the gpmi driver bch geometry settings, the NAND
chips required minimum ecc strength and step size will be the default
value. It also proposes a new way to set bch geometry for large oob NAND
and provides an option to keep the legacy bch geometry setting for
backward compatibility.

- For the legacy bch geometry settings
The driver uses legacy bch geometry settings if explicitly enabled it in
DT with fsl, legacy-bch-geometry flag, or the NAND chips are too old
that do NOT provide any required ecc info.

The legacy_set_geometry() sets the data chunk size(step_size) larger
than oob size to make sure BBM locates in data chunk, then set the
maximum ecc stength oob can hold. It always use unbalanced ECC layout,
which ecc0 will cover both meta and data0 chunk.

This algorithm can NOT provide strong enough ecc for some NAND chips,
such as some 8K+744 MLC NAND. We still leave it here just for backward
compatibility and als for some quite old version NAND chips support. It
should be en/disabled in both u-boot and kernel at the same time.

- For the large oob bch geometry settings
This type of setting will be used for NAND chips, which oob size is
larger than 1024B OR NAND required step size is small than oob size,
the general idea is,

    1.Try all ECC strength from the minimum value required by NAND chip
      to the maximum one that works, any ECC makes the BBM locate in
      data chunk can be eligible.

    2.If none of them works, using separate ECC for meta, which will add
      one extra ecc with the same ECC strength as other data chunks.
      This extra ECC can guarantee BBM located in data chunk, also we
      need to check if oob can afford it.

- For all other common cases
set the bch geometry by chip required strength and step size, which uses
the minimum ecc strength chip required.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 262 ++++++++++++++++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  12 +-
 2 files changed, 231 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..bb061205679d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -218,7 +218,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		"ECC Strength           : %u\n"
 		"Page Size in Bytes     : %u\n"
 		"Metadata Size in Bytes : %u\n"
-		"ECC Chunk Size in Bytes: %u\n"
+		"ECC Chunk0 Size in Bytes: %u\n"
+		"ECC Chunkn Size in Bytes: %u\n"
 		"ECC Chunk Count        : %u\n"
 		"Payload Size in Bytes  : %u\n"
 		"Auxiliary Size in Bytes: %u\n"
@@ -229,7 +230,8 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->ecc_strength,
 		geo->page_size,
 		geo->metadata_size,
-		geo->ecc_chunk_size,
+		geo->ecc_chunk0_size,
+		geo->ecc_chunkn_size,
 		geo->ecc_chunk_count,
 		geo->payload_size,
 		geo->auxiliary_size,
@@ -251,6 +253,37 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	return geo->ecc_strength <= this->devdata->bch_max_ecc_strength;
 }
 
+static inline bool bbm_in_data_chunk(struct gpmi_nand_data *this,
+			unsigned int *chunk_num)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int i, j;
+
+	if (geo->ecc_chunk0_size != geo->ecc_chunkn_size) {
+		dev_err(this->dev, "The size of chunk0 must equal to chunkn\n");
+		return false;
+	}
+
+	i = (mtd->writesize * 8 - geo->metadata_size * 8) /
+		(geo->gf_len * geo->ecc_strength +
+			geo->ecc_chunkn_size * 8);
+
+	j = (mtd->writesize * 8 - geo->metadata_size * 8) -
+		(geo->gf_len * geo->ecc_strength +
+			geo->ecc_chunkn_size * 8) * i;
+
+	if (j < geo->ecc_chunkn_size * 8) {
+		*chunk_num = i+1;
+		dev_dbg(this->dev, "Set ecc to %d and bbm in chunk %d\n",
+				geo->ecc_strength, *chunk_num);
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * If we can get the ECC information from the nand chip, we do not
  * need to calculate them ourselves.
@@ -280,13 +313,14 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 			nanddev_get_ecc_requirements(&chip->base)->step_size);
 		return -EINVAL;
 	}
-	geo->ecc_chunk_size = ecc_step;
+	geo->ecc_chunk0_size = ecc_step;
+	geo->ecc_chunkn_size = ecc_step;
 	geo->ecc_strength = round_up(ecc_strength, 2);
 	if (!gpmi_check_ecc(this))
 		return -EINVAL;
 
 	/* Keep the C >= O */
-	if (geo->ecc_chunk_size < mtd->oobsize) {
+	if (geo->ecc_chunkn_size < mtd->oobsize) {
 		dev_err(this->dev,
 			"unsupported nand chip. ecc size: %d, oob size : %d\n",
 			ecc_step, mtd->oobsize);
@@ -296,7 +330,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	/* The default value, see comment in the legacy_set_geometry(). */
 	geo->metadata_size = 10;
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
 
 	/*
 	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
@@ -399,6 +433,132 @@ static inline int get_ecc_strength(struct gpmi_nand_data *this)
 	return round_down(ecc_strength, 2);
 }
 
+static int set_geometry_for_large_oob(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
+	unsigned int block_mark_bit_offset;
+	unsigned int max_ecc;
+	unsigned int bbm_chunk;
+	unsigned int i;
+
+	/* sanity check for the minimum ecc nand required */
+	if (!(requirements->strength > 0 &&
+	      requirements->step_size > 0))
+		return -EINVAL;
+	geo->ecc_strength = requirements->strength;
+
+	/* check if platform can support this nand */
+	if (!gpmi_check_ecc(this)) {
+		dev_err(this->dev,
+			"unsupported NAND chip, minimum ecc required %d\n",
+			geo->ecc_strength);
+		return -EINVAL;
+	}
+
+	/* calculate the maximum ecc platform can support*/
+	geo->metadata_size = 10;
+	geo->gf_len = 14;
+	geo->ecc_chunk0_size = 1024;
+	geo->ecc_chunkn_size = 1024;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
+	max_ecc = min(get_ecc_strength(this),
+		      this->devdata->bch_max_ecc_strength);
+
+	/* search a supported ecc strength that makes bbm */
+	/* located in data chunk  */
+	geo->ecc_strength = requirements->strength;
+	while (!(geo->ecc_strength > max_ecc)) {
+		if (bbm_in_data_chunk(this, &bbm_chunk))
+			goto geo_setting;
+		geo->ecc_strength += 2;
+	}
+
+	/* if none of them works, keep using the minimum ecc */
+	/* nand required but changing ecc page layout  */
+	geo->ecc_strength = requirements->strength;
+	/* add extra ecc for meta data */
+	geo->ecc_chunk0_size = 0;
+	geo->ecc_chunk_count = (mtd->writesize / geo->ecc_chunkn_size) + 1;
+	geo->ecc_for_meta = 1;
+	/* check if oob can afford this extra ecc chunk */
+	if (mtd->oobsize * 8 < geo->metadata_size * 8 +
+	    geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) {
+		dev_err(this->dev, "unsupported NAND chip with new layout\n");
+		return -EINVAL;
+	}
+
+	/* calculate in which chunk bbm located */
+	bbm_chunk = (mtd->writesize * 8 - geo->metadata_size * 8 -
+		     geo->gf_len * geo->ecc_strength) /
+		     (geo->gf_len * geo->ecc_strength +
+		     geo->ecc_chunkn_size * 8) + 1;
+
+geo_setting:
+
+	geo->page_size = mtd->writesize + geo->metadata_size +
+		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
+	geo->payload_size = mtd->writesize;
+
+	/*
+	 * The auxiliary buffer contains the metadata and the ECC status. The
+	 * metadata is padded to the nearest 32-bit boundary. The ECC status
+	 * contains one byte for every ECC chunk, and is also padded to the
+	 * nearest 32-bit boundary.
+	 */
+	geo->auxiliary_status_offset = ALIGN(geo->metadata_size, 4);
+	geo->auxiliary_size = ALIGN(geo->metadata_size, 4)
+				    + ALIGN(geo->ecc_chunk_count, 4);
+
+	if (!this->swap_block_mark)
+		return 0;
+
+	/* calculate the number of ecc chunk behind the bbm */
+	i = (mtd->writesize / geo->ecc_chunkn_size) - bbm_chunk + 1;
+
+	block_mark_bit_offset = mtd->writesize * 8 -
+		(geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - i)
+		+ geo->metadata_size * 8);
+
+	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
+	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
+
+	dev_dbg(this->dev, "BCH Geometry :\n"
+		"GF length              : %u\n"
+		"ECC Strength           : %u\n"
+		"Page Size in Bytes     : %u\n"
+		"Metadata Size in Bytes : %u\n"
+		"ECC Chunk0 Size in Bytes: %u\n"
+		"ECC Chunkn Size in Bytes: %u\n"
+		"ECC Chunk Count        : %u\n"
+		"Payload Size in Bytes  : %u\n"
+		"Auxiliary Size in Bytes: %u\n"
+		"Auxiliary Status Offset: %u\n"
+		"Block Mark Byte Offset : %u\n"
+		"Block Mark Bit Offset  : %u\n"
+		"Block Mark in chunk	: %u\n"
+		"Ecc for Meta data	: %u\n",
+		geo->gf_len,
+		geo->ecc_strength,
+		geo->page_size,
+		geo->metadata_size,
+		geo->ecc_chunk0_size,
+		geo->ecc_chunkn_size,
+		geo->ecc_chunk_count,
+		geo->payload_size,
+		geo->auxiliary_size,
+		geo->auxiliary_status_offset,
+		geo->block_mark_byte_offset,
+		geo->block_mark_bit_offset,
+		bbm_chunk,
+		geo->ecc_for_meta);
+
+	return 0;
+}
+
 static int legacy_set_geometry(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
@@ -407,6 +567,7 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	unsigned int status_size;
 	unsigned int block_mark_bit_offset;
 
+	dev_warn(this->dev, "use legacy bch geometry\n");
 	/*
 	 * The size of the metadata can be changed, though we set it to 10
 	 * bytes now. But it can't be too large, because we have to save
@@ -418,13 +579,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	geo->gf_len = 13;
 
 	/* The default for chunk size. */
-	geo->ecc_chunk_size = 512;
-	while (geo->ecc_chunk_size < mtd->oobsize) {
-		geo->ecc_chunk_size *= 2; /* keep C >= O */
+	geo->ecc_chunk0_size = 512;
+	geo->ecc_chunkn_size = 512;
+	while (geo->ecc_chunkn_size < mtd->oobsize) {
+		geo->ecc_chunk0_size *= 2; /* keep C >= O */
+		geo->ecc_chunkn_size *= 2; /* keep C >= O */
 		geo->gf_len = 14;
 	}
 
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunkn_size;
 
 	/* We use the same ECC strength for all chunks. */
 	geo->ecc_strength = get_ecc_strength(this);
@@ -514,24 +677,23 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(&this->nand);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&chip->base);
 
-	if (chip->ecc.strength > 0 && chip->ecc.size > 0)
-		return set_geometry_by_ecc_info(this, chip->ecc.strength,
-						chip->ecc.size);
-
-	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
-				|| legacy_set_geometry(this)) {
-		if (!(requirements->strength > 0 && requirements->step_size > 0))
-			return -EINVAL;
+	/* first check if need to use legacy bch geometry settings */
+	if ((!(requirements->strength > 0 && requirements->step_size > 0) &&
+	    mtd->oobsize < 1024) ||
+	    of_property_read_bool(this->dev->of_node, "fsl,legacy-bch-geometry"))
+		return legacy_set_geometry(this);
 
-		return set_geometry_by_ecc_info(this,
-						requirements->strength,
-						requirements->step_size);
-	}
+	/* then check if need to set bch geometry for large oob nand */
+	if (mtd->oobsize > 1024 || requirements->step_size < mtd->oobsize)
+		return set_geometry_for_large_oob(this);
 
-	return 0;
+	/* set bch geometry by nand chip minimum required strength & step size*/
+	return set_geometry_by_ecc_info(this, requirements->strength,
+					requirements->step_size);
 }
 
 /* Configures the geometry for BCH.  */
@@ -806,7 +968,7 @@ static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 	 * we are passed in exec_op. Calculate the data length from it.
 	 */
 	if (this->bch)
-		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunkn_size);
 	else
 		return raw_len;
 }
@@ -1212,7 +1374,7 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 
 			/* Read ECC bytes into our internal raw_buffer */
 			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
+			offset += ((8 * nfc_geo->ecc_chunkn_size) + eccbits) * (i + 1);
 			offset -= eccbits;
 			bitoffset = offset % 8;
 			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
@@ -1249,16 +1411,16 @@ static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
 			if (i == 0) {
 				/* The first block includes metadata */
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->ecc_chunkn_size,
+						nfc_geo->ecc_chunkn_size,
 						eccbuf, eccbytes,
 						this->auxiliary_virt,
 						nfc_geo->metadata_size,
 						nfc_geo->ecc_strength);
 			} else {
 				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
+						buf + i * nfc_geo->ecc_chunkn_size,
+						nfc_geo->ecc_chunkn_size,
 						eccbuf, eccbytes,
 						NULL, 0,
 						nfc_geo->ecc_strength);
@@ -1287,20 +1449,21 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
 	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int ecc_strength = geo->ecc_strength >> 1;
 	unsigned int gf_len = geo->gf_len;
-	unsigned int block_size = geo->ecc_chunk_size;
+	unsigned int block0_size = geo->ecc_chunk0_size;
+	unsigned int blockn_size = geo->ecc_chunkn_size;
 
 	this->bch_flashlayout0 =
 		BF_BCH_FLASH0LAYOUT0_NBLOCKS(geo->ecc_chunk_count - 1) |
 		BF_BCH_FLASH0LAYOUT0_META_SIZE(geo->metadata_size) |
 		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT0_GF(gf_len, this) |
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block0_size, this);
 
 	this->bch_flashlayout1 =
 		BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(geo->page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT1_GF(gf_len, this) |
-		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this);
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(blockn_size, this);
 }
 
 static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
@@ -1383,9 +1546,22 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 		}
 	}
 
+	/*
+	 * if there is an ECC dedicate for meta:
+	 * - need to add an extra ECC size when calculating col and page_size,
+	 *   if the meta size is NOT zero.
+	 * - chunk0 size need to set to the same size as other chunks,
+	 *   if the meta size is zero.
+	 */
+
 	meta = geo->metadata_size;
 	if (first) {
-		col = meta + (size + ecc_parity_size) * first;
+		if (geo->ecc_for_meta)
+			col = meta + ecc_parity_size
+				+ (size + ecc_parity_size) * first;
+		else
+			col = meta + (size + ecc_parity_size) * first;
+
 		meta = 0;
 		buf = buf + first * size;
 	}
@@ -1393,19 +1569,27 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
 
 	n = last - first + 1;
-	page_size = meta + (size + ecc_parity_size) * n;
+
+	if (geo->ecc_for_meta && meta)
+		page_size = meta + ecc_parity_size
+			+ (size + ecc_parity_size) * n;
+	else
+		page_size = meta + (size + ecc_parity_size) * n;
+
 	ecc_strength = geo->ecc_strength >> 1;
 
-	this->bch_flashlayout0 = BF_BCH_FLASH0LAYOUT0_NBLOCKS(n - 1) |
+	this->bch_flashlayout0 = BF_BCH_FLASH0LAYOUT0_NBLOCKS(
+		(geo->ecc_for_meta ? n : n - 1)) |
 		BF_BCH_FLASH0LAYOUT0_META_SIZE(meta) |
 		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT0_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE((geo->ecc_for_meta ?
+		0 : geo->ecc_chunk0_size), this);
 
 	this->bch_flashlayout1 = BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size) |
 		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
 		BF_BCH_FLASH0LAYOUT1_GF(geo->gf_len, this) |
-		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunk_size, this);
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunkn_size, this);
 
 	this->bch = true;
 
@@ -1577,7 +1761,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	size_t src_bit_off;
@@ -1662,7 +1846,7 @@ static int gpmi_ecc_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int eccsize = nfc_geo->ecc_chunk_size;
+	int eccsize = nfc_geo->ecc_chunkn_size;
 	int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
 	u8 *tmp_buf = this->raw_buffer;
 	uint8_t *oob = chip->oob_poi;
@@ -2036,7 +2220,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	ecc->read_oob_raw = gpmi_ecc_read_oob_raw;
 	ecc->write_oob_raw = gpmi_ecc_write_oob_raw;
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	ecc->size	= bch_geo->ecc_chunk_size;
+	ecc->size	= bch_geo->ecc_chunkn_size;
 	ecc->strength	= bch_geo->ecc_strength;
 	mtd_set_ooblayout(mtd, &gpmi_ooblayout_ops);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index fdc5ed7de083..e612f5c22293 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -30,9 +30,9 @@ struct resources {
  * @page_size:                The size, in bytes, of a physical page, including
  *                            both data and OOB.
  * @metadata_size:            The size, in bytes, of the metadata.
- * @ecc_chunk_size:           The size, in bytes, of a single ECC chunk. Note
- *                            the first chunk in the page includes both data and
- *                            metadata, so it's a bit larger than this value.
+ * @ecc_chunk0_size:          The size, in bytes, of a first ECC chunk.
+ * @ecc_chunkn_size:          The size, in bytes, of a single ECC chunk after
+ *                            the first chunk in the page.
  * @ecc_chunk_count:          The number of ECC chunks in the page,
  * @payload_size:             The size, in bytes, of the payload buffer.
  * @auxiliary_size:           The size, in bytes, of the auxiliary buffer.
@@ -42,19 +42,23 @@ struct resources {
  *                            which the underlying physical block mark appears.
  * @block_mark_bit_offset:    The bit offset into the ECC-based page view at
  *                            which the underlying physical block mark appears.
+ * @ecc_for_meta:             The flag to indicate if there is a dedicate ecc
+ *                            for meta.
  */
 struct bch_geometry {
 	unsigned int  gf_len;
 	unsigned int  ecc_strength;
 	unsigned int  page_size;
 	unsigned int  metadata_size;
-	unsigned int  ecc_chunk_size;
+	unsigned int  ecc_chunk0_size;
+	unsigned int  ecc_chunkn_size;
 	unsigned int  ecc_chunk_count;
 	unsigned int  payload_size;
 	unsigned int  auxiliary_size;
 	unsigned int  auxiliary_status_offset;
 	unsigned int  block_mark_byte_offset;
 	unsigned int  block_mark_bit_offset;
+	unsigned int  ecc_for_meta; /* ECC for meta data */
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
