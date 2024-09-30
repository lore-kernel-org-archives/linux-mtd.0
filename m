Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3254BCF6499
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuJGcttqeiwW/Q2IMVHB+PKQLyVcCI08N1hrY4qmW0w=; b=B2YHS3L5wwuGEj
	3WCBZDOgAMk83jSomhZ0xy0p3dR6+yBvER8c2oStHGPiUgp1N3xSG+wviQSzy/XXvhL+DOtDV/BK5
	i1Z81EegkPdX9KhmlLDSr6+fp/vmPGi26bWiZXtcOmZuQyv5RQ2AnX5hTLs8pghM05KxnFpo+Dc5D
	8ihsHx2lTSQ9R5JEKTklaweJNLNtlBfilTsbI6G3XviHWZB21g05wRyFb6ebokNNE8sIImDix7mB1
	FTR12XWWeLxOjrZGjubL2rGo8T7pdU+HnZI0tH2rFEQOYmkmNs+zfg6D9ibmgUxYfYIBczY6dxmOH
	BsXhvG9mtiDK8F0RD4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svEWp-0000000Gqjp-1qVq;
	Mon, 30 Sep 2024 11:25:23 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svETD-0000000Gpdg-3Wfr
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 11:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u3pl9BpxHhH1BKJ7NLax2viqoTtgY3yczEwlj2/GIFI=;
  b=P5wlDW5vOrd0xdik/YegYucRtAqG+zqLtWfu0YlUeXGptVCDZ9pJJgKx
   IoB+9Nkrs7MUkWmRMNt7krJu3boRmrLFF4agfyctT/hjApw/sT0zuqN5M
   21CfIZyj2FtT25R2IZyDaIl79Qxpp3IptTYAY5SKNgeZBT3gfuzL9AvYP
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956908"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Richard Weinberger <richard@nod.at>
Cc: kernel-janitors@vger.kernel.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 28/35] UBI: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:14 +0200
Message-Id: <20240930112121.95324-29-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_042140_164271_3CA11034 
X-CRM114-Status: GOOD (  11.32  )
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

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/mtd/ubi/eba.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index c7ba7a15c9f7..efce5bf41ef6 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -731,8 +731,8 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
  * ubi_eba_read_leb_sg - read data into a scatter gather list.
  * @ubi: UBI device description object
  * @vol: volume description object
- * @lnum: logical eraseblock number
  * @sgl: UBI scatter gather list to store the read data
+ * @lnum: logical eraseblock number
  * @offset: offset from where to read
  * @len: how many bytes to read
  * @check: data CRC check flag


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
