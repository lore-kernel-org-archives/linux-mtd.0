Return-Path: <SRS0=2SY/=L4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_MUA_MOZILLA,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08B9C07E95
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 19:32:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C4E613E5
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 19:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C4E613E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RVO1FvZ1E5+tHbkBNwJcoq8/A3aVDiEl2R7CKnh9WDA=; b=gHKoZJFBAeRTH2
	C8qTh+XOpRhNXbrvdM03+iwUi0YDqXx6EKQWYmiQxaGFjpp1KtbXav/OUIbCfM7Fm5PNw/+MldzKZ
	hbPq+IWjjYmIDsXu6s6rL9G8nz/YmnLullKEaF9EQ54B7kxRgLSr/dpvt9xPbYvgOTf5OKsGfKKMq
	lynt518xh61dUKN20Z0Oay2eFoC61BSmPR9sSxezn9K8dSBzUdhYm87sYEuqgZVlgcWFMwGW4zElr
	u1PgcMnQDmOYzx2x5oKUXlWEs05YlPqL/Jvb3DsUMOfK45Z9ZVcfPU2T2p1V3go0dP9vAcBsdzPIc
	q30UGYrvJsYTMyqlnRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m07pp-006g5l-6J; Sun, 04 Jul 2021 19:31:21 +0000
Received: from mail-am6eur05olkn2015.outbound.protection.outlook.com
 ([40.92.91.15] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m07pm-006g51-SX
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 19:31:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcTEpuIf/iLPv946CqGMS4dwhQzgfkLshlqEzk0GA7JZZt6kfnjmMnmb2k2aRoQtxCuiVgh/v1iDz3fhl5zs7gBPxB90KKgZt9GdddczlQ7PycczTuQ7vTQtMos/FfUe89VQTMrX5845vhk5rEmPk85EjWX31yJY7nnZjiXcXzTOKIKnt4uhrBSDMkaAgz+7eDi6JnChN9AeHIu+6dehEsR2RTivPJraKrpIXOL2gDXZhjD1Q/7uLSaSA829sc3XRQiM7QefhP1dD59FnZCjlcQcGadGWZaI02oeOT9IZUUJ2Dn7OyGLXvI+ufaNaHdedyGFpRHXDByX8vuOeBVXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJrnlPbIs0qbJMWgZ9SyhJFfZYnC5IP1WB8EQxeJy+U=;
 b=nJAUx70lK8giIjz06i9bEcgmmdmgUrkygqcuXTnuTaWTaDI/hoD7Pz6NRP1vkVfM6HRJ/DYJsW6JIfpp5Fj+HFLvd7tRkC+1RLPM+qlpYTqILYlvE5t2P+05FtWfZyiTos1Tmx050A/VhF8JbpGBiA8kbNfXPWSBeJQIjVKC0aaLrK5uLCGBKTlX/yD0MJD++3CIv9g/TtHku6DWNs7QlLUReQa9J9FAlTRIf2Tx+adSw8K1WjtDsqqhgWbTwUY+ARjwPo2B1G2O554rdBFikPs3+QKwyIG/0qel/8BL3tNvjLvPnKT/MdBx6dM5Z4MvCYLaAPUVNcMR8enIOd82VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJrnlPbIs0qbJMWgZ9SyhJFfZYnC5IP1WB8EQxeJy+U=;
 b=DEVVB+c9RymtC27cj6gzXtNtIp5BhY9sUJk5u8tUozRrKfH6cGPTc7wJqHXIt9tcchlvAXhUxZO7LFIcBxhJIueYRpxA52x/ffMqPiWFE0CwhdSOfstmtpIGq9at8/yufMFjj6ASi7Jiq7fqiysAL31huJmQq9nQgd/i8KuIWsE2AWOwT3kU/j1e0F5IHftGljysV4bf/DlPYkVCERkNEd9iaLSKTGdplS9zPaEaunBrbS+FDHOuKLA85J2dlH1keA/ozsNnt5/lq0fFqM1jhm2/cp2kP4A5mwuSHWFLUdCZdXxk9E0Zn6OJ/UngoVypdMdNMxXDQ+cpJcDNMcHNVw==
Received: from DB8EUR05FT042.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::48) by
 DB8EUR05HT202.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::351)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Sun, 4 Jul
 2021 19:31:14 +0000
Received: from DB6P189MB0583.EURP189.PROD.OUTLOOK.COM (2a01:111:e400:fc0f::46)
 by DB8EUR05FT042.mail.protection.outlook.com
 (2a01:111:e400:fc0f::328) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Sun, 4 Jul 2021 19:31:14 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DA1BE27F21EE9C7D630EC98286368AEFB61048DABAB01EA6B8655F14AD4658F2;
 UpperCasedChecksum:6BCCBA2A74B491964E5D2F4377DED95555CB615A4E77464CE0EC99F0B3D0709A;
 SizeAsReceived:7637; Count:45
Received: from DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 ([fe80::8599:b504:d311:23f8]) by DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 ([fe80::8599:b504:d311:23f8%6]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 19:31:14 +0000
To: linux-mtd@lists.infradead.org
From: Andreas Persson <andreasp56@outlook.com>
Subject: [PATCH] mtd: cfi_cmdset_0002.c: fix crash when erasing/writing AMD
 cards
Message-ID: <DB6P189MB0583AB48641688D2C5086D1CC11D9@DB6P189MB0583.EURP189.PROD.OUTLOOK.COM>
Date: Sun, 4 Jul 2021 21:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Language: sv
X-TMN: [R5N08KrQ+Q1la3kcghrEG/GC6H0smLZQ]
X-ClientProxiedBy: HE1PR0402CA0039.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::28) To DB6P189MB0583.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:6:3e::18)
X-Microsoft-Original-Message-ID: <0c2a7dc2-6ba7-1801-47d7-621f85af3a89@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.195] (94.255.134.80) by
 HE1PR0402CA0039.eurprd04.prod.outlook.com (2603:10a6:7:7c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Sun, 4 Jul 2021 19:31:14 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 02f29744-aac6-4db2-e0f1-08d93f22497b
X-MS-TrafficTypeDiagnostic: DB8EUR05HT202:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMSRTinaCJ+LWAEtgOaxJJd+ZjYsOUKrAcy2PL3JmPtuVkd0p2J/9SrKGSvJG7z89S7QeFMjjD+z0s6Yuo4JdNL334xbZAQ4hWKHX9ULBtBtWyCcJTHSKK1Luq6E5wytfi6+dZmglUS+VBJ6l06+M/lFIj/I3dMcYQZSq9pJYJyZ3t1dhThQebrriw0f0cDlevUfyuQaGkCEV8XAt5g/ALrb1HBFcEfrLk2Lkf33XPKORgVwt9ykTm4MU85l1gNH3baB5ADdwBsUr0vwJkqHiUS6Z9l+hPJqyKtSt37fGSGrrojQNhWXpaslxGTN82f3t3sV+B0W0f5txBn7qN3NDo53VPZDApIHlCPiJnZUweEGFfWtWZPR8HWpE+1syU+adfUzdbRcoSFgLy4ETu7X8o7s1UZsw/Jl0mVU5ns0JngUs4ASZ8PJGdHrAXjRFHI+
X-MS-Exchange-AntiSpam-MessageData: hGzf/dCBed3/VO/HIAYSreRIz+Y2vRzfR9B4gvSrAjdarhYqddASZvjWlULNmZbF7wVwwSrGjw9GCLjjY/JkxZ1er9JeMmJIXi3YlgP7+G+n1a3KMTr9kq/i9UdKWi3hGAxnFAG023TC4HAdScbXLA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f29744-aac6-4db2-e0f1-08d93f22497b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2021 19:31:14.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT042.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_123119_109569_2641A408 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Erasing an AMD linear flash card (AM29F016D) crashes after the first
sector has been erased. Likewise, writing to it crashes after two bytes
have been written. The reason is a missing check for a null pointer, the
cmdset_priv field is not set for this type of card.


diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3097e93787f7..a761134fd3be 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -119,7 +119,7 @@ static int cfi_use_status_reg(struct cfi_private *cfi)
         struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
         u8 poll_mask = CFI_POLL_STATUS_REG | CFI_POLL_DQ;

-       return extp->MinorVersion >= '5' &&
+       return extp && extp->MinorVersion >= '5' &&
                 (extp->SoftwareFeatures & poll_mask) == 
CFI_POLL_STATUS_REG;
  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
