Return-Path: <SRS0=ilRB=MA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C241EC07E99
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jul 2021 13:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE336147D
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jul 2021 13:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE336147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xMZAO6Gc3/xSKy7YILSEHgbGgEt8DOSpwLrPG5EFbhU=; b=mVk1deFyoKpp/T
	lAXiyCJ7oA59NtHU9w5U0kZrdKbazu68FKqKRsW/uIF70UK96yuPCyl7qOLXDOIqddXI7xUtljxst
	XXKTCjmVqPVqerrqIr6LBRJpKRD1TW561kJR7EX7ifERoQYTVcCxJPTjnNPBLWZFuVsfLD+LIvSRE
	PN77xbMwRRxdhAgZXPXKels0sNSK8zb5qScm6DuP94wLKf9P+IsFGxgf/L+NpiZ0nTJP2ZSTq+Hc/
	1L9OAQUQ1z7fje72iean02zkegzgiEAiT3R7iuj6UIwUhZLsOh4YLWC4f4krPLhb2pVzV6znwkxHt
	fYZ/9vZh6H8oYNskggOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Tr6-00H2yQ-P7; Thu, 08 Jul 2021 13:14:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Tr3-00H2wp-17
 for linux-mtd@lists.infradead.org; Thu, 08 Jul 2021 13:14:15 +0000
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGr86xySzcb9Z;
 Thu,  8 Jul 2021 21:10:48 +0800 (CST)
Received: from huawei.com (10.175.124.27) by dggeme703-chm.china.huawei.com
 (10.1.199.99) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 21:14:01 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <David.Woodhouse@intel.com>, <Artem.Bityutskiy@nokia.com>,
 <ext-adrian.hunter@nokia.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linmiaohe@huawei.com>,
 <linfeilong@huawei.com>
Subject: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
Date: Thu, 8 Jul 2021 21:13:59 +0800
Message-ID: <20210708131359.21591-1-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_061413_970553_38DA800B 
X-CRM114-Status: GOOD (  10.43  )
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

From: Feilong Lin <linfeilong@huawei.com>

The size in struct mtd_info_user is 32-bit, which will cause errors
when obtaining the size of large-capacity MTD devices, such as TLC
NAND FLASH-2048Gb.

Fixes: 69423d99fc18 ("[MTD] update internal API to support 64-bit device size")
Signed-off-by: Feilong Lin <linfeilong@huawei.com>
---
 include/uapi/mtd/mtd-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index b869990c2db2..efe0b53b10c1 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -128,7 +128,7 @@ struct mtd_write_req {
 struct mtd_info_user {
 	__u8 type;
 	__u32 flags;
-	__u32 size;	/* Total size of the MTD */
+	__u64 size;	/* Total size of the MTD */
 	__u32 erasesize;
 	__u32 writesize;
 	__u32 oobsize;	/* Amount of OOB data per block (e.g. 16) */
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
