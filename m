Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32920C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AEB208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/+cTF72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6AEB208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ggO+IKTutPpeZ5Qxqi5DD5UZOqQ1R2SW7Fw2gPxfMAI=; b=W/+cTF726uCz6Ut8LDxJG23ce
	Ozrc/cpqVAw7k+cNJwAI70AR/QtUAKhHyuwndnxij5uTt8OlYq2ZFh3cGfA2iK0U6eFs53N3vU4zU
	WUWNZxo8pkz9BZ2jEEF/d4UuOB426jhqNBBNFJcklsaVyQRGr6WCwRbPST6OIm7A7vtgnMfqlHef8
	E0/Zg+zjwvlEi/oS2hpMlwXiOI+OjN0j+2p2RGQ4vugg1p1rA3N39vFeCyKOaCKnnv41ep1IdJR6E
	+MoWz2GSfbll5Sm0xMG0K425lGWSEtCfe/waOQzJ6IRXCzEezABhipTYGRhazyAVc8Qjt3g2r9V+D
	ICs6s+ytA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp1W-00036Y-BU; Mon, 14 Sep 2020 14:00:02 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp1S-00035Y-Hv
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 14:00:00 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8435B14FF54D1DCBCB5C;
 Mon, 14 Sep 2020 21:59:48 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 21:59:43 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <richard@nod.at>
Subject: [PATCH -next 1/4] ubifs: Fix 'hash' kernel-doc warning in auth.c
Date: Mon, 14 Sep 2020 21:56:51 +0800
Message-ID: <20200914135654.55120-2-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914135654.55120-1-wanghai38@huawei.com>
References: <20200914135654.55120-1-wanghai38@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_095959_340138_A62E594B 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

fs/ubifs/auth.c:66: warning: Excess function parameter 'hash' description in 'ubifs_prepare_auth_node'

Rename hash to inhash.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 fs/ubifs/auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index cc5c0abfd536..b93b3cd10bfd 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -54,7 +54,7 @@ static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
  * ubifs_prepare_auth_node - Prepare an authentication node
  * @c: UBIFS file-system description object
  * @node: the node to calculate a hash for
- * @hash: input hash of previous nodes
+ * @inhash: input hash of previous nodes
  *
  * This function prepares an authentication node for writing onto flash.
  * It creates a HMAC from the given input hash and writes it to the node.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
