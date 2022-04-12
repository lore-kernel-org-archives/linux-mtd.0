Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0812C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcaemG7Wb6p70txwAyxvb4AxNgT4lBxTkxXV1IB9Thg=; b=WNTBGTIftFK/dr
	A4Wn1opiRXsyQLOF0fKefektGndBn0rm8LKwVQPqLLXrYqxpywuFLf/LSvV7qNCkJ9w5tGk/u5Qk7
	9fDjEeotVAbqQ+e7EKORuidlIBofJ+IR3ZVymPkayEZ50bRP9cT+rmxn04EzHGXdtakH9IkFw5etj
	BKzCzYv++PkW411v55o63QHMl0hLW3G8e/FW04kEkMuvlH9IXCIwQr13ciY35xz13jzFU31377HJX
	TOgaD9Bst/dQC546xJaTEsfKwcO9S9kNQTwuJaBSOJniRSZp+DEmQxpyBCtomQ7GHuGlKnMCXwFzv
	Wv4GYzwDgxPMnqFmkaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGxN-00Ei2y-0S; Tue, 12 Apr 2022 13:53:21 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGxI-00Ehx7-3J
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 13:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649771596;
 x=1681307596; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cRqrzsYNIRfiAOotHa409y/Hl5ia/NeruEwkXktTvU=;
 b=Cv5CSngEDuk7jzuCEEx8D3w1OY6RqkU6z+xOw5lUYL3OQg22PboL6OfL
 GpcrKXAXpg6IUrIati0bOMlPgTweUibybUpWctospU+0VFuB4Q0LSfM8T
 Q03r1Ud+jRzfannGpxzkoeIxtERU9Tn3/vJLAklUIXwMRj7BlQjRkfgKT
 ldad+wQ5v2z8hDE9pmsH0kv4kN7Xj0BtqjXTmRtHjmRlhzsX2qfT4+0P9
 6H1kJQD9eKISOHiyv/CArum4NsYTV6MToocEoJgPzIVvOjXKQyhAbPjhV
 mJtyvxBap3e6GwPxmMrI5yuJd3W6hshjSmfG9dGReN+GeGwmKT/LsWGvq Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/4] mtd: core: Check devicetree alias for index
Date: Tue, 12 Apr 2022 15:52:59 +0200
Message-ID: <20220412135302.1682890-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
References: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_065316_482726_1A6FEB4A 
X-CRM114-Status: GOOD (  12.17  )
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

Allow the MTD index to be specified via a devicetree alias, so that the
number does not just depend on probe order.  This is useful to allow
pseudo-devices like phram to be optionally used on systems, without
having this affect the numbering of the real hardware MTD devices.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/mtdcore.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7731796024e0..9eb0680db312 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -557,9 +557,10 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
-	int i, error;
+	int i, error, ofidx;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -598,7 +599,13 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+	ofidx = -1;
+	if (np)
+		ofidx = of_alias_get_id(np, "mtd");
+	if (ofidx >= 0)
+		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+	else
+		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
