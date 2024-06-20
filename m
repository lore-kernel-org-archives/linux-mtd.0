Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6719FC27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 03:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2txBGKX5SmdyPEDmbDKQsAy22eiqR8txjB1unvZqo7Y=; b=3T4uCCzQZIi/aU
	7rfNzTAg5s/prCNaTgt1aCrkP7MRhrBW7UxdbmKl+g+QmtrF8OQ8Qr33/eXZY3M3CQsL8FhNSChHI
	Vq8v4YeR+LFENqkI3YAPvPGripLtr2BDIjR1Oa+oxRRTVXQ/rNDArI6sv3wjGDce/wHLRVaRMRwuX
	b2bwOvV/x2TgRtrQ/B1S0kotsDZ4Ez+EgOUHntIvGiFMxfEHF5F1egSrZdRz2LQ3q6fYuSTQiSH7p
	NSuRgs48fR+lmFnheo5LBo10dcPoKL1Zp0FI9N8E6AaM3MpZND7BsGeIgBzwJ3wbVAu9P4Ajr2spM
	ajuLJTESjqFS3Z/QLkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8ke-00000003Uso-2uoA;
	Thu, 20 Jun 2024 03:46:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8ka-00000003Us0-2Td7
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 03:46:19 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3mSb1pXNmrMV9EQ--.59099S2;
	Thu, 20 Jun 2024 11:45:57 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	ebiggers@google.com,
	herbert@gondor.apana.org.au
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ubifs: add check for crypto_shash_tfm_digest
Date: Thu, 20 Jun 2024 11:45:33 +0800
Message-Id: <20240620034533.569099-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAB3mSb1pXNmrMV9EQ--.59099S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurWrJw48GF17AF4kGFy8Zrb_yoWfuFb_Cr
	48ZF1fGrW8GFykAFW3Cw4fCw12grZF9FykWF40vFW09rW5GFykWrnxXrZ8GFWDZry8ZF1D
	Ca1vkry5Cr1aqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYnYwUUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_204617_047496_4CB35F50 
X-CRM114-Status: GOOD (  10.24  )
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

Fixes: f80df3851246 ("ubifs: use crypto_shash_tfm_digest()")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
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
