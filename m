Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33ECC35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hb03sIBeDfsJo5Ufod9Brb0P00K0Btqg91SMfd2Bc8=; b=vza343HYBshATH
	cUyhx5rf/Tfh1of17Ikw/P9khb1C8EQvCE7ImVUTSeyQYC9ruPzRGN5juHw3y+Dl1cUrJmJw7dTwA
	wPBkmhBCJBWML8iFJZKbm7/da0To2Aq4TLGxxqANhzXeIMv8PMZCg8uus5wvqlUHj1BhRUHgErjvK
	w+a6ztqxHnbb+iz2sA4rTD3kQ19aUGeuF72D/YMR0AaTcGraB3yFCOa6FYaPUBadNF1J9UQ92gNEx
	2+YCpEtE6p2R59nNWhOWhdm0oeo6ECWGYbf0Hy/PR1Q7yLQ1fTned8jhXROT1LmgdaH4T7KyZWmec
	3VOC9cFX8h8snIX6bVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turPU-00000008mnj-2ykB;
	Wed, 19 Mar 2025 11:16:32 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turPR-00000008mkZ-0Jsl
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 11:16:30 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1742382982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fxGghcda7/TGIIY3lDBoKyvwQc1Uh2+ER/W7JsyZyok=;
	b=sXhWKfUySwCy73is8UVrucnMK194LvsAqaXhYFzS843cxDeTna6bqxizrj6cvOhkEL9/tf
	A3G85sN0j9/sI8W4zlugN5tQuj/onJ+y8Dzg6/eosLnVfFSGngrfquL9lHhf4dMZBVs6tv
	2ONBzx7pCr4LgZ17fXcykPnU2oBavVs=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH 6.1] ubi: Add a check for ubi_num
Date: Wed, 19 Mar 2025 14:16:20 +0300
Message-ID: <20250319111622.34057-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_041629_610857_9A940C69 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Denis Arefev <arefev@swemel.ru>

commit 97bbf9e312c3fbaf0baa56120238825d2eb23b8a upstream.  

Added a check for ubi_num for negative numbers
If the variable ubi_num takes negative values then we get:

qemu-system-arm ... -append "ubi.mtd=0,0,0,-22222345" ...
[    0.745065]  ubi_attach_mtd_dev from ubi_init+0x178/0x218
[    0.745230]  ubi_init from do_one_initcall+0x70/0x1ac
[    0.745344]  do_one_initcall from kernel_init_freeable+0x198/0x224
[    0.745474]  kernel_init_freeable from kernel_init+0x18/0x134
[    0.745600]  kernel_init from ret_from_fork+0x14/0x28
[    0.745727] Exception stack(0x90015fb0 to 0x90015ff8)

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 83ff59a06663 ("UBI: support ubi_num on mtd.ubi command line")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
[Denis: minor fix to resolve merge conflict.]                                           
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/ubi/build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6fbd77dc1d18..6a7577e57617 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1460,9 +1460,9 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	if (token) {
 		int err = kstrtoint(token, 10, &p->ubi_num);
 
-		if (err) {
-			pr_err("UBI error: bad value for ubi_num parameter: %s",
-			       token);
+		if (err || p->ubi_num < UBI_DEV_NUM_AUTO) {
+			pr_err("UBI error: bad value for ubi_num parameter: %s\n",
+					token);
 			return -EINVAL;
 		}
 	} else
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
