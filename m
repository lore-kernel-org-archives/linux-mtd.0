Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECAA112584E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7afG4aR79As1Dvl4mRUlrl5blUszaYikhrWecmklvs=; b=pkK7MKQHCvgdca
	7HBMYTMfUTKgbeqIwPbvy7qI5zQpwQjWOYPlNLY0ofCWdhQcs3tQ81QysF2q18B1iHGO9yG3ikgg0
	Ffb/x7DgiRW4cg/xivWrpd6VcEJSqE74M+p6uo4OIZ87s8LYABOWCaZT3ltpcUdunTO+OZHp+ojGb
	+cjLv2m5olUYki5QoZi8JRy0WVNB8A2eJ2Z0oYIVOQtX0GAv/2cmO3evYktY8ImxY4yZXnSDFQUhP
	d7YT59Z3RbtQ1SY43TNbcuPIQZrXg8vGt+Xg81307+vWfsPyUIO3TrEQ+g2raMmItslkzR3N6Ferb
	054XA7ooy69yQKO8Hpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LgD-0000000BqRD-304b;
	Wed, 11 Mar 2026 15:41:01 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LgA-0000000BqQi-0EXR
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:40:59 +0000
X-CSE-ConnectionGUID: 5kV8ab6ESM2OiyRMjDIbxA==
X-CSE-MsgGUID: jdsqy1XARomS7Cl5TnofAw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Mar 2026 00:40:57 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.22])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F24CC400ADBE;
	Thu, 12 Mar 2026 00:40:50 +0900 (JST)
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
Subject: [PATCH 1/2] mtd: parsers: ofpart: call of_node_put() only in ofpart_fail path
Date: Wed, 11 Mar 2026 17:39:56 +0200
Message-ID: <20260311153957.1984446-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_084058_195516_5710B414 
X-CRM114-Status: GOOD (  11.01  )
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

ofpart_none can only be reached after the for_each_child_of_node() loop
finishes. for_each_child_of_node() correctly calls of_node_put() for all
device nodes it iterates over as long as we don't break or jump out of
the loop.

Calling of_node_put() inside the ofpart_none path will wrongly decrement
the ref count of the last node in the for_each_child_of_node() loop.

Move the call to of_node_put() under the ofpart_fail label to fix this.

Fixes: ebd5a74db74e ("mtd: ofpart: Check availability of reg property instead of name property")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mtd/parsers/ofpart_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index 0029bda165bd..181ae9616b2e 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -195,11 +195,11 @@ static int parse_fixed_partitions(struct mtd_info *master,
 ofpart_fail:
 	pr_err("%s: error parsing ofpart partition %pOF (%pOF)\n",
 	       master->name, pp, mtd_node);
+	of_node_put(pp);
 	ret = -EINVAL;
 ofpart_none:
 	if (dedicated)
 		of_node_put(ofpart_node);
-	of_node_put(pp);
 	kfree(parts);
 	return ret;
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
