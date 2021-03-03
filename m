Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05237C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:08:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D3164E89
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73D3164E89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aehScaExQD8cyqqpgPvcc5uKyZ4TpJ60rUafCp+ndTk=; b=TkzF1x7RDw3RmTeSCIhIL+bp3L
	Le6HSL8Rng9kA5S382GZbm8F/6J++QFiSJ3CDbTF0Hh9fbLPC1lW7Q3sEL2MAbBSXul2FTGHzoIk6
	4Mu5yXNvAWxP+v72znw1o9xgOB8oeoMP3iUbPnIPy2KIR0pFKdPKlkTvuAZYGfZNAnQ4mFv7z4Yii
	uzPZWz8L+2QD2eihNftKRbiK0dJBLS+hsiAH3RflY7DRY6J4ES6Ms7LUEQTBvAR8p89U6t72+mZGt
	sXUobjIh8TM9+8DdxNEENz2uvLRgEhCUpW6GdiqZLOIjDhbyevWE6SAb61I90nJyjZ9BnO6jKOeIp
	79hTM+AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSAk-005453-1j; Wed, 03 Mar 2021 14:08:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS56-00527W-Kb
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=XhkLc2KMm6AJf07rTM/BfswLvd+OYEaih8i94wK2qZk=; b=Fa7+Da/mV10P7G40JPlVdq9D4X
 Lkq9+/BAZl5RLVCIk6I4DekJpyo6FqPDrwrzuQv+NCzj9+I16weiwcyveESF+WVF06WtflOiSQNxc
 9bZk+QU5IxEhAggOj9VteYmJKsC8p2ffWf42kWGozIs51ruuooIh6B8EAejQeAT7Jzlb+YG0JLWeV
 WT1FLeqPkZ//NaOe4bgccPbpMxBJCzizL7ckKwZNBfgyoIZ3rvr872HL4/2RiG8GCIKc8rTt7KIqP
 2PYcuZ3m44xmqU6uViX97IqIVahjdrNGY57KScAz+ym4j4b5v1ILixkCpyEQVuz+ztSpxZ0tCfeWN
 S87Ixoog==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHN9o-001tHq-NL
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 08:47:01 +0000
X-Originating-IP: 86.206.8.148
Received: from localhost.localdomain
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A2BDE40008;
 Wed,  3 Mar 2021 08:46:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] mtd: parsers: qcom: Fix error condition
Date: Wed,  3 Mar 2021 09:46:34 +0100
Message-Id: <20210303084634.12796-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_084701_497930_36A89296 
X-CRM114-Status: GOOD (  11.44  )
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

qcom_smem_get() does not return NULL, and even if it did, the NULL
condition is usually not an error but a success condition and should
not trigger an error trace.

Let's replace IS_ERR_OR_NULL() by IS_ERR().

This fixes the following smatch warning:
drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part() warn: passing zero to 'PTR_ERR'

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 808cb33d71f8..1c8a44d0d6e4 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -104,7 +104,7 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	 * complete partition table
 	 */
 	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
-	if (IS_ERR_OR_NULL(ptable)) {
+	if (IS_ERR(ptable)) {
 		pr_err("Error reading partition table\n");
 		return PTR_ERR(ptable);
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
