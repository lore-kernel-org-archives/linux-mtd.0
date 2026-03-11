Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473BD1125842
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaKY+VSF5cR4JnPCRI50wSdb3SDPZUtYOhuMZ+091t8=; b=r94HLUSQMKtjGz
	GKRVTqWxFcDxbIv4KLs7Mqg6tlf81WBSHKYw43809MknOAFV9s1v6yNLHF7JkFabQS100bizC60Lg
	bzBIg+9C2IYS1j7Eku01R4g8g9ZNw1/iOO/SkBdeh1Mn8iM6qq/b6Ur57SYbDo0yKqJBAf4b03k7O
	du+1WMHpV8cZUWxxxS5wLtur2ZhMGSoBMQ+e8QVl1MRRH4HaABYgk6efGShO8xjhJK3aeCxXOMWcH
	LmsSWXGOymTMtgFlu95j6eoCPgxRvxciIAzD5m3KPFmX5VYqd2g5m8E390FJi81FhtQ6IbB9dyUIE
	Xl5cHr7qbOg5vdiNIrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LgH-0000000BqSb-1YMZ;
	Wed, 11 Mar 2026 15:41:05 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LgD-0000000BqRB-3pXy
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:41:03 +0000
X-CSE-ConnectionGUID: u/B08nQjRbmhAA6i5QQrEw==
X-CSE-MsgGUID: LNCRiv/SRhiWB2JHTIsMJw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Mar 2026 00:41:00 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.22])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D7DA2400ADB5;
	Thu, 12 Mar 2026 00:40:55 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Kees Cook <kees@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Benjamin Krill <ben@codiert.org>,
	David Woodhouse <David.Woodhouse@intel.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: parsers: ofpart: call of_node_get() for dedicated subpartitions
Date: Wed, 11 Mar 2026 17:39:57 +0200
Message-ID: <20260311153957.1984446-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_084102_114310_EE0AC0FC 
X-CRM114-Status: GOOD (  12.71  )
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

In order to parse sub-partitions, add_mtd_partitions() calls
parse_mtd_partitions() for all previously found partitions.

Each partition will end up being passed to parse_fixed_partitions(), and
its of_node will be treated as the ofpart_node.

Commit 7cce81df7d26 ("mtd: parsers: ofpart: fix OF node refcount leak in
parse_fixed_partitions()") added of_node_put() calls for ofpart_node on
all exit paths.

In the case where the partition passed to parse_fixed_partitions() has a
parent, it is treated as a dedicated partitions node, and of_node_put()
is wrongly called for it, even if of_node_get() was not called
explicitly.

On repeated bind / unbinds of the MTD, the extra of_node_put() ends up
decrementing the refcount down to 0, which should never happen,
resulting in the following error:

OF: ERROR: of_node_release() detected bad of_node_put() on
/soc/spi@80007000/flash@0/partitions/partition@0

Call of_node_get() to balance the call to of_node_put() done for
dedicated partitions nodes.

Fixes: 7cce81df7d26 ("mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mtd/parsers/ofpart_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index 181ae9616b2e..262c4221d23f 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -75,7 +75,7 @@ static int parse_fixed_partitions(struct mtd_info *master,
 			dedicated = false;
 		}
 	} else { /* Partition */
-		ofpart_node = mtd_node;
+		ofpart_node = of_node_get(mtd_node);
 	}
 
 	of_id = of_match_node(parse_ofpart_match_table, ofpart_node);
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
