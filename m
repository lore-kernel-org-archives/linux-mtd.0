Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804CED68B26
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xAagq1Lk51DMJYpGBAfNgLrLGMEGF8o886kyZm9O5iQ=; b=N6IOnmoAv1QFQN
	0Qw9E7Q0sCOMdltZoDZB8hT2I/06wAEHo1+dzgoLZn4lt8Uz0aPiNJuxa1fOSGnkuqj3ve1OS+I2l
	T9AZnbAbQyjBGX3JPIV09hTm12kK7qob/+wA4H12AvGqba7VGdrb80AXP4gDa4zKhUYLJ6zS0cBfz
	mqA3Y7XYWDlxiUbUYvqDCiO6GFUsqzGnKYL4aiW+6qrmmNPrmeoTQpLxkuBdZ5p7n5Rh98gLNgUhP
	UxsLulBcR35NdyZ3eq2llj9HGTjcIkBMgGZKKvwkUix1AFQpxjttahvIjbe1+4tthd+mNYw9qtQCQ
	D0ovfiKH3KgzbLA+tKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBapt-0000000ACmO-2Kdu;
	Thu, 14 Nov 2024 14:28:41 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBapp-0000000ACk3-3NNd
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 14:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8HBwrSA4j0ZC/wcuYMLNf0/RXltPkUm4aETCR6v9jPJE5/ovacouNd7uJSabnBo1TEq31tVVy7leKBVn/GgIxtoLmeWBiXBumKtjSUdE0HVDr5meIjwL8SU5BNDMozVtQ6COez9xXuBnS55cTCx/wxTB2/Ak9TIonGZ2o4ucD41YLGSsTCZTBsVSczLhN8ecSy19ebkm4CJ7DkbN+PAUd7JEw3vx/er8mxjUyUOjc0GX37ORCg948e939xQa96OvOMafsVy32k5JVNUxcvs2fkEx7l6xlf02Ruqf/r8tyvVmwVXA5PV3A+xWKPmv3PJmlGDYWG6aloREnFQr5U8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc8467uymsOUh6WFrCq5E9ZX//4sxOAjKxEFiQvDbuA=;
 b=ixZnT67lfpz1ZiPnuUxbJCByMpElLXsOYFlxYLBWA3jZhatImdfTzZZjs16tGnS0CbxU48DhUJ77ftPP/JbKaOFfDZW0+vjTslRUjNsiZSipF9rB3FI0qMP/qPhCl+uU93EIu1niyBxIQcLAP2Tqe1V3RzcBmK1HxvyN8yGcshHYBSCojsFkbo2nbmZ4JvRQntPAULfThl2qXho/xn531tbZtmCHmE9QuA1YEUA11/KHn8CRoL/6S8bzEO9yctCWuw+5X8BRFYaHpR7jxfEWhbha3t4lmU1+6bWCGiOgrywhEWF+PwLAJi2ZBeKAhLF7iSTKbLRDUMIZjCACRgDRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc8467uymsOUh6WFrCq5E9ZX//4sxOAjKxEFiQvDbuA=;
 b=XMBWr5uouVfvwv6MNrqVuAdMGfLh1z28WXP8f8WGbFHf0v6dfw9bBUM/ygUXjYRNBbVX0kX6ZL+7oXcAgFu2FVEoDFQRXv2bip+URWv9cwRRj5HqJdUzSt6+Itfog1QJehdWCMoYiQGvZyUFX9y+GdM4TCjqdyjHG2svnKJxKce/uRU0vki/1pNbj2cuge9vea0l8ig7vEFbLNleXNivgIv+hyUTVdlfBQgcCVsaNz8QW+w81W6wU459fmrmU4qgq69sAD9yx7Ndy3ZlgCYHlFry5qQDNcSrIi2FKrWLb6VAd4gcWEQi0L3tKOx986y3VUTq4dl9YqVBgqfZNLophg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEYPR06MB6131.apcprd06.prod.outlook.com
 (2603:1096:101:dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 14 Nov
 2024 14:28:14 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8137.018; Thu, 14 Nov 2024
 14:28:14 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: colin.i.king@gmail.com,
	rex.nie@jaguarmicro.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com
Subject: [PATCH] mtd: chips: Remove for loop which never execute more than once
Date: Thu, 14 Nov 2024 22:27:28 +0800
Message-Id: <20241114142728.2270-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
X-ClientProxiedBy: SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30)
 To KL1PR0601MB5773.apcprd06.prod.outlook.com (2603:1096:820:b1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|SEYPR06MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: c153c85e-1d4f-413b-3231-08dd04b892c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncLU3CfnDnQJprnFjPry/skc1qVZEdQItLaY9n+PQyI6JhX9hNmOILgINd0U?=
 =?us-ascii?Q?TKQ0xFpE5DCbPuJxl4yjNlHrA5GlUHxNmf1dz2Ee+WgnUtEXZ8c9NHTu7kr+?=
 =?us-ascii?Q?ffQljeYxQnYX+L4K5sLhJZi1jCVEbURJvM2Cf15eNTsygPN47YvWtLXzNyDi?=
 =?us-ascii?Q?/4L+eWnGPAeIqVJRZSLOTys0Ias9tYdHai5GRZfbfWMHkVu08l+wm7aJkCdc?=
 =?us-ascii?Q?btYtDzH/+UqQJQzfZLZLYWdarh6yXO+ZZYhj0phGiDhW8FBYbrOolkX7RVkh?=
 =?us-ascii?Q?K7hZOt5NHKJ/TwWrDPn5/45XkCswXv8ByGXQHmu4PT90JYKyh+yRIxSpd9/P?=
 =?us-ascii?Q?sH9CbhSwuDGdG3ToHxFgnM1W5ii/PBWHaclvNBi237aP7p/ElotXM8b7tvKO?=
 =?us-ascii?Q?8QE1oCpkfuMOu/OL5+x3yCNwe2GO3lijJwQeFryQcxs4QXyYwu9eP8fahm/c?=
 =?us-ascii?Q?0QzZ9Vbb8lEHyLsBScBZJx/PTJblcuw2qjWQVmtf4ObR6UThXbVYrdrzmgwy?=
 =?us-ascii?Q?r49MWZ3FlVPtQtv/67XEKhGIE/Rka/At/xzLvYz8fXlu3NdaLkwFbeRrE3Wg?=
 =?us-ascii?Q?JaTZ9uziHm10nck3wppDPILxyi9HF+5kNvperXTxCYbSYF5Jmb1wC7obLsJ1?=
 =?us-ascii?Q?tbJV+fSt49lGJv2eVE3Q7Xd0BQIzwCxX6IXtZ34s+uyyquvET6s4L7Zjnotk?=
 =?us-ascii?Q?Gei2SKpHAdTcyTqHO4aPDnMMEc6AOz86HVV1ME1dhQN/solziTtWokdQrxQf?=
 =?us-ascii?Q?3IoZImAW2T+YbXBWYv2Oq7UQZqegwpcxYS4HmXqghAerP7zRSQxfdn6hSwtG?=
 =?us-ascii?Q?VPPno9Yt2ozhGhCxytB8Od7PkdLa0wau5GdoyogAiCVuizixhYFW/vXu2Ad4?=
 =?us-ascii?Q?tSUwe2GvAxiD0OAxg9CUh6qMWobsrNOUBombQK3j8eIcQpaU6qPxC9tDAR2l?=
 =?us-ascii?Q?YDNJJGf3g7UoZhlxuPrmnf0ZaI20JTEPk11hUxFdyrdXte0U1nJcJ2FoTBTt?=
 =?us-ascii?Q?nLddxPQphhZ0vCqFO2h1rPnpnDyYTvyFxTTeiukNfeUCHDPP3iLpqONfZ1jZ?=
 =?us-ascii?Q?ISVK0XIiw8om+3QNsXwfDouCGmCx/PnuqWPP++gMisTGSwVO24I0ribbr6rQ?=
 =?us-ascii?Q?0aJcLEOVkjTWMHO4r21WTw9GKDKnbBSbdnDJypa8OxXM2ny5GwOY6l93ia4n?=
 =?us-ascii?Q?z2VsNrdEqRrGdUp1QFODt/Vf25TdfGiCKHJ8Q/3vjGrM43vfyncL0u0MMNJv?=
 =?us-ascii?Q?fBss7v9mzNySJcdPsIZlO+j8ejNzYAyhR46aQb4JRAlElAJKQTxoQYtlS7rI?=
 =?us-ascii?Q?+Sh1Oy0DXgoVHWg82YJfUyqwXJLejWfyCogAHqjOhuntf1ExsrWzAQjoUqJy?=
 =?us-ascii?Q?553cVoc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zruTUbohdRR1JWjtb10e4y3nvltLDGRfDSfBcnv4uPKhg7mw1hS/ASoVxSno?=
 =?us-ascii?Q?1OnS+Fa8UIUr6EOf6VsVEUx5/2lsIqBjb9Eh94agnCfqnoOnvS0WN4RJhxlo?=
 =?us-ascii?Q?htEgvaMQseH+gW3aZFOY2EtvpqRRVLcdNttt8T+X+DY1IhH5AKVa0LFU8zhk?=
 =?us-ascii?Q?vDUKTXJ2ykNgPufIjhjr7G74qKVZHiYZxxvtd+ol+Xw9E0rGXmRwzdYO5Rom?=
 =?us-ascii?Q?iptlTPaVRABl3nUZReQRArDPDNVn9FvRwD7IwcryrI2zbVp/gkPOiEz1drE7?=
 =?us-ascii?Q?6rcQTx1RZVSEO3KgIhnVYQn/o3JvcIlZbmuoaym7GdF2QD4pF5LKD1wmPjHr?=
 =?us-ascii?Q?p/5fJhIyQywgdNR0+S0GrqDK6RsTRDGvqrkKZHxSJnwSZfN17q6Z3pTOgFCp?=
 =?us-ascii?Q?2ZnP14hgLcZ8twUxfaswnc652+inZNLHdAW7GICSwCHQiOMKdLB4impup/2n?=
 =?us-ascii?Q?1yW6TN+uj9FZ1e0W9hJ8d6ZqRZhFRX1OCyOnRERfmdGcJLSjN2UbM9C3xMEA?=
 =?us-ascii?Q?lRcIv8lwBXacAhSx/nZj5MXbNkm+J89aJ5rYmKPFjIo8gtSQl+SWBZd2V0sx?=
 =?us-ascii?Q?YfbmDfY3Hgt41L8r3D6S0QKAtvRgek1HR70VkDoGgodD8VOoKWYKgtEJc17F?=
 =?us-ascii?Q?Xk72hagBBFEGyy3VmYOkWgxhktZN0PDch48ls/b5UUBfa2u2g2nin7RFAXze?=
 =?us-ascii?Q?9gews4S3bwFwWtDJVJjKW/oKb4tS42izBdgH98ihIz/Y9dgl4TireouRu2Jo?=
 =?us-ascii?Q?u1QfzbPaCrEtUi2ZjH9qPaCpI0GyLTcTy0F+wQLrRehFDKbtstQb3JJOey1q?=
 =?us-ascii?Q?FA6CBct1bLzeEeXsz7KLjEH+bBBwPjhM18ppp6sWjBpNl6HUxPg1uHE5774k?=
 =?us-ascii?Q?A03fvsCwUPWqyEtPV+mvQIeJVWv3JFjq+vJ/dR1huCqVSn1QDGG7TlhVmJOd?=
 =?us-ascii?Q?CFhcZVEzBV0cb/zaWE3kTr57H1ONEHlDTzI46FZ71hk9GTGrdtO445L10zf1?=
 =?us-ascii?Q?+PJoNyVDrJNTx4GbPzfC0Ublcny7AzMsTRn7+qDnMsbgEM2M+B9Yj7SK+SKF?=
 =?us-ascii?Q?y/smJwx2aDY1lgU9ew6OZ71F5Heaof9aH7AlR6qIN1LI5BX09NkpaCi0wFtU?=
 =?us-ascii?Q?Ia2gPxT93lDYKDIJfR/Fj+1hVzf1eOsvU8l/ITsaepocgp+VHdHGCwvyQO3L?=
 =?us-ascii?Q?4IjbjBTEZtoGNuhbK0oQLIlHcfJaRgyNfuI3VHGWPZF3dQTbmkA9UAMvjSFU?=
 =?us-ascii?Q?6NZTr4ZrB31SexyguL7oA32Ia+qM77EupjgJ2sHJCMwqd5mO2sBfvRnE5qn+?=
 =?us-ascii?Q?TaJby8SP8VLN1nIzkEkjpVhOtzG/X8evlwrXmSr0+vg0Hq6GtPivkD5e6TU8?=
 =?us-ascii?Q?qj0v0m3cL3IyX0oeN/r0j6dP1rVllrkol91rs+gKu8evaXlJmPNFmkizJFrr?=
 =?us-ascii?Q?cT02egqGoHLL2cSmubx1rDiofJR5Uv5Syfea5aV6SQkaJNa0mRTlJBp+No72?=
 =?us-ascii?Q?4+6FNMr1B66CcbhurqlEDCzmdfehKobDEFj7M+xiDSAqkLXzO3Ujpw89o+8Q?=
 =?us-ascii?Q?EbQn0+9XuMU7HNTZN6ADItHsKSdkI99OGuitrWDR?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c153c85e-1d4f-413b-3231-08dd04b892c6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:28:14.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVK2qEmRSWnQQf5qNxynEIVqwua6cZWIQZLTxCadHzm6OnlUJEilttDUWvQJwQ4tRTGgcHd/SuMYJsZmH+2Txg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_062838_391842_4A47A782 
X-CRM114-Status: GOOD (  10.52  )
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

Since the loop increment is unreachable, the loop body will never
execute more than once. Remove it to simplify the code. Note that
this does not change the semantics of get_chip().

Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9f2223d3e8e1..da221253d688 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -884,21 +884,18 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 	switch (chip->state) {
 
 	case FL_STATUS:
-		for (;;) {
-			if (chip_ready(map, chip, adr, NULL))
-				break;
+		if (chip_ready(map, chip, adr, NULL))
+			return 0;
 
-			if (time_after(jiffies, timeo)) {
-				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
-				return -EIO;
-			}
-			mutex_unlock(&chip->mutex);
-			cfi_udelay(1);
-			mutex_lock(&chip->mutex);
-			/* Someone else might have been playing with it. */
-			goto retry;
+		if (time_after(jiffies, timeo)) {
+			printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
+			return -EIO;
 		}
-		return 0;
+		mutex_unlock(&chip->mutex);
+		cfi_udelay(1);
+		mutex_lock(&chip->mutex);
+		/* Someone else might have been playing with it. */
+		goto retry;
 
 	case FL_READY:
 	case FL_CFI_QUERY:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
