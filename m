Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FBEC3567B
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB9B2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aCVnmt6V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="M9IegvAN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB9B2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OoASbeayLj/kqEkTch518fR0dqQJfjzgmLtLTee8apc=; b=aCVnmt6VjhdjxM
	cGofZiZXhUf1ASWeHCB5Qg4hMOtepbelrxc19ld+sRCBsTrkRF1IgodKFr9FKPsnI1Ir8y/2/SAV8
	qIYTWtmf0UuKh/MMpoMYNKfIhEoRlnJITBTCCNjcO6rg/0fSyQqW6JsdFqtBXw3bhO+vIMF/Z43CI
	9V5rWkfUukZhA2qqZqS4JsAdLVlqMrsLDvYmf3f1L/JZqvTqh6+PLtJtEXyUYMQa9YhDtW20CUJyk
	Tr9oT0PXy1CriRUsloz5U/x40M5Czq8ChuXzlaKj5VAEal4kQ7RibgvjLwDPRgGCh21GAlXvph7Uu
	H3QWbgVHrUYe1a05YgKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j69PM-0004DV-26; Mon, 24 Feb 2020 08:48:08 +0000
Received: from mail-eopbgr70095.outbound.protection.outlook.com ([40.107.7.95]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69PI-0004CI-PJ
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2020 08:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKL6ULlWG4R/B8uyKfWrV0/myY0vuSst4AORyvk1NY/J5QpvfILRlhvggUE77i0jJW3Lc7Zg9PFnFfGv1Qo26/kDvRPTh+gBcWOxj2VOvN2o4wPpPC3RqiHXp38udtlmYPJdgF7lkT+zfUZ8bhrkAzQPcQoE0y9CY4Qce5iG3nEVQuSaD30XQWP9mKSQe7Kvk9vvvNaArmoR5khut21GJseqUZdM8/yo5jS7+lwERoEhpwtmmUuoAqsQeovmD+hIdv0W1/vCD7r82b01zcctVrKZBwqnGhCGIwo2AfPE7mceB/bYH1po8/RW45+gj2dHIOV4nLoWPQNrSLeGEMnANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB3pLhttyWScWZ9c57OzA6yTr5fVooqUUYZsVlDGO04=;
 b=RDhkCk79mP7dE69l8FdYWv8DXaOH54h9axaeS6eUWZCPdH6c2LWvdJPCisdwooWe28ogyAnQWqSGyB8ARrvycqrzVDLoItftYMnjPFJeTegiMS9Lt8xsnvVpDMNFFc9qJb5wR0aAC5xXmdzmkumSibTgkA2CS8IajuXBFrUdQ0t3zH8me7dBdtYgGRyeicEW8Mkmm3DLgDbbO8FTkYTxzo1vPXt0dvZMTrkYnwbMhOp4/0RTZBMQINanhkmXAPVP3Mhpndpawke4Ck1iT0UoWqnLfMYNJpaASAgw8Y6aRFkMTFUsBZ7Y1i1ccJWRTE3JQrrk4Xsrpxy6cyjn0Po+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB3pLhttyWScWZ9c57OzA6yTr5fVooqUUYZsVlDGO04=;
 b=M9IegvANYxGuzzlwvCxeuPE0e3CLPVVlZ8e9pYe0G+xhFhoytIvTL7f+iVc8/9/borfuPEepepHy7QlttugI/Xq7zB6PkPbEMgL9UMFUNEcLCNUbnCA0/0E9E8ExXnQFYzgUaZl3ql8NEpA05kCLhARNAtgm5/d9p5XoJZYyiK8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB5807.eurprd07.prod.outlook.com (20.178.121.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.10; Mon, 24 Feb 2020 08:47:59 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2772.012; Mon, 24 Feb 2020
 08:47:59 +0000
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: Always use biggest erase size
Date: Mon, 24 Feb 2020 09:47:40 +0100
Message-Id: <20200224084741.107963-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.191) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Mon, 24 Feb 2020 08:47:58 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [131.228.32.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5620c5f-074e-4546-141c-08d7b9064037
X-MS-TrafficTypeDiagnostic: VI1PR07MB5807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR07MB580721E823EF6CFFFD94056D88EC0@VI1PR07MB5807.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(186003)(16526019)(6506007)(54906003)(26005)(316002)(6512007)(6486002)(1076003)(5660300002)(2616005)(956004)(478600001)(4326008)(86362001)(6916009)(2906002)(52116002)(81166006)(8936002)(8676002)(81156014)(6666004)(66946007)(36756003)(66476007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB5807;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWQC186n8OktUqvCcqLARrNa2KhNEmWUz8VBxwn/H67FniEJvtIx/0Ufakkjcn930umP92O0uttQlvJUbUCpZ8q1A7lHpf3S/L/SJz9ZfxYQFXahyiFFn3/72hn/RMk//fddQMeYCaaO01kobsk6vGq7nyw0hrk4nbjZqaZiXnG8u0mnRQklxIlU7ydmTmA5sfAjoZk0Ge6gHx9BVjA+BaT+i82JJozuoINDVzN5/RgDTWzuZtFFi8SBoS6gWWIVnYzQtGRMpSTs/InhWQ72xz/PB4d2Ko/VB1ia8tczJkuTF6VbnAa3CJ4cgJHsvjAVbNkz17OjRxQ+8Cp6AwAr4u1D0Q3iVCNELpri5+DxF2GM2LFLAah7QDwBxFo0q5VRD0IUSK5BG4qMcBkXafN7QJMqb2LjMC96XSLvitiNji35+txM/aN2lKVRNlQ776+o
X-MS-Exchange-AntiSpam-MessageData: Ueu9IWpvK9uRL6Oil786hM9JP8E2OCU6alfsn76XvF7pRKmP99DqCf7pFRW5+Z+lQkTSOyGIVPSD6QixNYQOiqpjqiz5TO72LZFblmGfUUMUXFMrBpMUD1QuRrUcb6DOobTY+9yiTLN7v0qqFEnR5Q==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5620c5f-074e-4546-141c-08d7b9064037
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 08:47:59.6517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNaVPBzv26j0S151ww/CxD+1cyREUBKsyIXlYGAZK2Qqav1UB+jrl6g89aXHerpWLra4axN9AWnNdUkGRwu45Ekx9wYsVpAe7IYVkV5oM2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_004804_893639_85B29F6D 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Optimize erase time by always using biggest erase size for given erase
request. Do it by removing "sector"-at-a-time erase code.
spi_nor_erase_multi_sectors() seems to be mature enough to handle all
the cases better.

For the above to work backwards-compatible regarding 4-bytes commands
spi_nor_set_4byte_opcodes() has to prepare them always, independent of
spi_nor_has_uniform_erase() flag.

Remainder check in spi_nor_erase() becomes superflous because
spi_nor_erase_multi_sectors() performs it anyway.

The trigger for this change was n25q128a13: enabling SECT_4K increased
erase time of 128k block from 1.763s to 11.335s.

Fixes: 4607777c71 ("mtd: spi-nor: add subsector flag to n25q128a")
Change-Id: I05a214d8f01fb70711e98edd061dcdd1e76086aa
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
Tested on the following name/ID combinations:

n25q128a13:
JEDEC ID 20 ba 18 10 00 00
JEDEC ID 20 ba 18 10 40 00
JEDEC ID 20 ba 18 10 44 00

n25q128a11:
JEDEC ID 20 bb 18 10 44 00

s25fl129p1:
JEDEC ID 01 20 18 4d 01 81

Changelog:
v2: Rebased

 drivers/mtd/spi-nor/spi-nor.c | 48 +++++++------------------------------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e0c173b..bc69f44 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1318,20 +1318,17 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
+	struct spi_nor_erase_map *map = &nor->params.erase_map;
+	struct spi_nor_erase_type *erase;
+	int i;
+
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
 
-	if (!spi_nor_has_uniform_erase(nor)) {
-		struct spi_nor_erase_map *map = &nor->params.erase_map;
-		struct spi_nor_erase_type *erase;
-		int i;
-
-		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
-			erase = &map->erase_type[i];
-			erase->opcode =
-				spi_nor_convert_3to4_erase(erase->opcode);
-		}
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		erase = &map->erase_type[i];
+		erase->opcode = spi_nor_convert_3to4_erase(erase->opcode);
 	}
 }
 
@@ -1701,18 +1698,11 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	u32 addr, len;
-	uint32_t rem;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
-	if (spi_nor_has_uniform_erase(nor)) {
-		div_u64_rem(instr->len, mtd->erasesize, &rem);
-		if (rem)
-			return -EINVAL;
-	}
-
 	addr = instr->addr;
 	len = instr->len;
 
@@ -1745,30 +1735,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (ret)
 			goto erase_err;
 
-	/* REVISIT in some cases we could speed up erasing large regions
-	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
-	 * to use "small sector erase", but that's not always optimal.
-	 */
-
-	/* "sector"-at-a-time erase */
-	} else if (spi_nor_has_uniform_erase(nor)) {
-		while (len) {
-			ret = spi_nor_write_enable(nor);
-			if (ret)
-				goto erase_err;
-
-			ret = spi_nor_erase_sector(nor, addr);
-			if (ret)
-				goto erase_err;
-
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto erase_err;
-		}
-
 	/* erase multiple sectors */
 	} else {
 		ret = spi_nor_erase_multi_sectors(nor, addr, len);
-- 
2.4.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
