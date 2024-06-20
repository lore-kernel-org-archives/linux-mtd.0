Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC3C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kmuIRYkWSwRKZRJO+lW/2lHl2mYlcCLmw/ophPFFGL0=; b=BENZsT4j5wP8bj
	PEjrcUGIc2hucb0KDsp2PqGnFuX2+7yaMATCj5/Jq5eknKW/aCUPkqVny6tEy1RJjz/22qGLvC/OF
	3Xod20j+QpKnPsQI6Zv4Bwd1sgETkZD4L5TyaI8dNl9sd9tHR8Ytd+DCqHtbPYJgOPkRe9HvvLKCk
	DhjG8Z9KIwDhEyJUl2mExobtraeBduMR54uOZa3lGwurUF++cWq2GoxkZKnN1o8sQkp9osHJLMgwC
	zTLbRhDT3aPfrAPmyxgCFRcodI44Xxa1EeyDlC+zRz59G3b9WlvuNmJERJWtpbNI5G1eyV+IGEIJb
	v4yanoVdYLH/aIVOvdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD1l-000000047ZK-1Ma1;
	Thu, 20 Jun 2024 08:20:17 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD1g-000000047Xt-0uVG
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 08:20:15 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAD3_uYt5nNmhTHMEQ--.23651S2;
	Thu, 20 Jun 2024 16:19:58 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	s.hauer@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] ubifs: add check for crypto_shash_tfm_digest
Date: Thu, 20 Jun 2024 16:19:26 +0800
Message-Id: <20240620081926.1135571-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3_uYt5nNmhTHMEQ--.23651S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry5CryxCF4fGr18tF4ktFb_yoWDJFX_Cr
	48Ar1fGrW8GF1kAF13Gw48Cw12g3yq9FWkWFW0vFZY9rW5CFykWwn3XrZ5GFWUuryxZFnr
	CayvkryUGry3XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2AFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUY_MsUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_012012_735557_9E67C1BA 
X-CRM114-Status: GOOD (  10.65  )
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

Add check for the return value of crypto_shash_tfm_digest() and return
the error if it fails in order to catch the error.

Fixes: 817aa094842d ("ubifs: support offline signed images")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Update fix tag.
---
 fs/ubifs/master.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 7adc37c10b6a..a148760fa49e 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -67,10 +67,13 @@ static int mst_node_check_hash(const struct ubifs_info *c,
 {
 	u8 calc[UBIFS_MAX_HASH_LEN];
 	const void *node = mst;
+	int ret;
 
-	crypto_shash_tfm_digest(c->hash_tfm, node + sizeof(struct ubifs_ch),
+	ret = crypto_shash_tfm_digest(c->hash_tfm, node + sizeof(struct ubifs_ch),
 				UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch),
 				calc);
+	if (ret)
+		return ret;
 
 	if (ubifs_check_hash(c, expected, calc))
 		return -EPERM;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
