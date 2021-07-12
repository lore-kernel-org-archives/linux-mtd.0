Return-Path: <SRS0=7PWl=ME=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62E1C07E99
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 07:56:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FC761CF8
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 07:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FC761CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fv3GDmVKbc7+vjzssH6PFyPdhXcBSIBHEY5b2gOC1NY=; b=fXicOaDbd3gWxC
	2DdoPcRpEul8SF3a496cN4rDAotWNvXK5dJtrLOvM1YkFNz4MrGWtgVqqjxLNMQ9v3GiXcw2MRGXV
	BFkg5mns7XMfzFNSV7vERxc3Uf9DtbEG08PLiS5G3GISYQDso8ea9dg2ehLtC8uXos/1BSTW2WUiU
	OgB/FoW/7eOnlwsTXnjQMRFLtryF9hDjs1A4LRUy+kEVbCkMyehxZzpGXLyeowcDMMI+hFcDCpipD
	PKYDUpB80p6Vr5PWNszH2YMMpx4B+JgBz/DTjh0J0Nc0nRGmn84J12jpk/YR7DBerAmpLBQB6xCtB
	tIyi1sIlDelnabn1ChsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2qmR-006TjZ-BQ; Mon, 12 Jul 2021 07:55:07 +0000
Received: from mail-vi1eur05olkn2056.outbound.protection.outlook.com
 ([40.92.90.56] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2qmL-006TiZ-R7
 for linux-mtd@lists.infradead.org; Mon, 12 Jul 2021 07:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT6su6EMdd+u65uqabjIJeDc/kiJ7ChdaPumvRubZAofNepxq3diuHJg/GMTI88vt8yK59i5D9y1L3OuoY61rpMIj12tKtQcCAV49pEmH1unxkLJuex0Fn3cw9k/aPzuDqlfhH7TT3bZBpLr4XGpje+UiIBzCH0xs3PEXfgM8JUHf3nmHwPAL2XZkyYoWu0cPQNqh5WledUcuiZXAYppTonU7lawZ8K9kXLRjtHSLcLhMDXDCnCalXaLI8MZjAsuBxkJIHTDsBQWl9AbGym4GFi5tOh8eSl35jhEnnk5SRK/ZLUFK6MVaAY/xUD0BDOAA0KzE14P+YfGwMBdSnzg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pkvtf4nxI6YkRqnDlydZGKJwzmliQ3nhoPKrd7wKqY=;
 b=Rel0bgW7iCEBdNjnUReQa9N0ZkEhkSATafEgcAM9sbcx8WTVBLfZJyHhygTixxALW3ppM++BukR/MK2df1Ve+MQvYZ6VUy26qI6h49dffkDTPPzud1Lh/wRE9DPpZgRkTtWL6qHm/FEjxvul1y5wk/+yDTmIWnxY/4UrpgQP3VwZqbYgVwZOgU0fm+FmTT+oBpb7CsYeQqxqyzpk/8qUVwMysjO24ICKcuNRw7WQFqq99Cy6/xO82yfC7GzkemviQeYXwX3+9PY3jyZZcmpH2PgGsNowPpftuKfx6ZxMIFZIfHzYP+810+uhKKXNp9S7AZVDeY9eQ9LgQvRizDhvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pkvtf4nxI6YkRqnDlydZGKJwzmliQ3nhoPKrd7wKqY=;
 b=nEPu1ShULCxgjO5HSFWrUJpEZ6/VvTYeQRXn7nPdY/0nA82DGLDcDmm1eWv8QMjd61x+wT27OCHAbLFYI+4lyu770N1+qlin8xD0kHAkCXeAncBRVmNM4imKS8ITAuFE+giAcFeUjK6SZ+DjEcqjgyfTd3z+GqiejYJJUIap0UuBjmCqI3E1XUTOzpt8Ap+qjN/YUgpV9d5vtN2e8+aGX17wMIVAjJAG/kcdNMF6Dx2104I3a29Eq6vAc/YuswPCYG/wGVlMMoHTYT/bhulwdC0krzevgaf/UWpUTeU7l64z34ZYREMBwpFg1S0rnrOgJQv4ooyU2ejKP881o5J5+Q==
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::45) by
 VI1EUR05HT052.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::275)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 07:54:57 +0000
Received: from DB6P189MB0583.EURP189.PROD.OUTLOOK.COM (2a01:111:e400:fc12::50)
 by VI1EUR05FT025.mail.protection.outlook.com
 (2a01:111:e400:fc12::123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 07:54:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:EF86CBF22EF090C28A19E2A98CE08E5128998B3A24DADA1051BFEB714B3BFBCF;
 UpperCasedChecksum:CF1AB2C738E849D1B44E18E78CE5E1DC1608F9E669156DA25422A4D3526DCCB7;
 SizeAsReceived:7348; Count:45
Received: from DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 ([fe80::8599:b504:d311:23f8]) by DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 ([fe80::8599:b504:d311:23f8%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 07:54:57 +0000
From: Andreas Persson <andreasp56@outlook.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: fix crash when erasing/writing AMD
 cards
Date: Mon, 12 Jul 2021 09:54:52 +0200
Message-ID: <DB6P189MB05830B3530B8087476C5CFE4C1159@DB6P189MB0583.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
X-TMN: [DRhgF8vPD2P1a1TSFvsp+K8sfTjvi4am]
X-ClientProxiedBy: HE1P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::13)
 To DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:6:3e::18)
X-Microsoft-Original-Message-ID: <20210712075452.14728-1-andreasp56@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.bappe.org (94.255.134.172) by
 HE1P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 07:54:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4f4eb92f-b496-4506-7e9c-08d9450a579a
X-MS-TrafficTypeDiagnostic: VI1EUR05HT052:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qpLwl0DBFBbTzONuFRzwKEkid//UpAejXWmXM3ifZhbbNDuofjdMxZz/yQavWvDQIZNq/7tVxelBwd+3yBvwTWKDRQ+0XGWaQPF9waS0UsZom8nYJOXDlIdX5yAkIgRf8ETrnDcto9GT+m08YeMLnVXMYEf3ppPWyNRQvJp7S3vATE5duIQFCJ73+XAsdQQK9QdHHphm6OjaBVIZAboMFev573wMwka/uNxX65OLT9CLcGvLdas/yx3YDMk5bwCg7LfCaqZTLPC5aPnY1GOj9cIGl2YMEWkpxQ5IhBVWj8AnR3XUmEBzpUKWbLzSux+hhn5zueG41kdQqzf6lsWt3G7d+aTm5MO3uZCKZfpZ7b9v6tc7yoBZdAWNGYyG2aNAwZNSZAEEuZovLlycuYWL2/gNZxJjCR5XB7WVjHb3COrEtwhtlPhw7yx94QjjitF
X-MS-Exchange-AntiSpam-MessageData: SevERd6H+ssjRj6NTtHpJAor+8A05u2/q5LEAleQSWkBnkH4cv0+5lTXQeaF9dc9ocpQqPPzB63uJagZlFmR9j6CVu3Zu8DNjFWywrKaOvHdO5xf0U1artyDijAgbcj0blZBVTGcdBpfhPCPw/I06g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4eb92f-b496-4506-7e9c-08d9450a579a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 07:54:57.4946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_005501_970571_17CF6624 
X-CRM114-Status: GOOD (  12.81  )
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

Erasing an AMD linear flash card (AM29F016D) crashes after the first
sector has been erased. Likewise, writing to it crashes after two bytes
have been written. The reason is a missing check for a null pointer -
the cmdset_priv field is not set for this type of card.

Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
Signed-off-by: Andreas Persson <andreasp56@outlook.com>
---
I posted this patch before, but I did some rookie mistakes, such as
only sending to the list and not to any maintainers. The patch format
was also broken. I hope it's better now. The actual code change is the
same.

 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3097e93787f7..a761134fd3be 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -119,7 +119,7 @@ static int cfi_use_status_reg(struct cfi_private *cfi)
 	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
 	u8 poll_mask = CFI_POLL_STATUS_REG | CFI_POLL_DQ;
 
-	return extp->MinorVersion >= '5' &&
+	return extp && extp->MinorVersion >= '5' &&
 		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
