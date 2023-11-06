Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 06:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dP3VGZ/S0fHFlD4/2WV2hU6O/RSIo3tVC7VLFmO34oY=; b=TZXThilt8E8Bj+
	iMSGi/+ZG/+ukiGUyXLN8tqvyq+KJpw0Q+WYRi83i28kM77XZPY8qRlnGGb5JelTx1IT6z/uVPeed
	LQelP5//8p/7f8jH89wP+ncS9rmUOkTryB1bg5SjlRXbGBVDPvs8vAqa/DDbSfaJgzqazQdml4cGt
	0JBb/Z3tT2Bvygj7bcn4/82qKP+7IToNR4YHrHIryyNZl2S4SRwzPmpc+6R53dGUVmWYc/EMo1f21
	0DWjeT2JtwuCs9QPf3rnQBg5ArkF5rqGrBtiV8uY8DC/j/iVCV6f0VAfrn9mdWL5Q32qCemtl8M1r
	AYa7HpayxFKprkUBW3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsm4-00FvR6-0X;
	Mon, 06 Nov 2023 06:07:48 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsm1-00FvQq-1O;
	Mon, 06 Nov 2023 06:07:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: auth.c: fix kernel-doc function prototype warning
Date: Sun,  5 Nov 2023 22:07:44 -0800
Message-ID: <20231106060744.10847-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
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

Use the correct function name in the kernel-doc comment to prevent
a kernel-doc warning:

auth.c:30: warning: expecting prototype for ubifs_node_calc_hash(). Prototype was for __ubifs_node_calc_hash() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: lore.kernel.org/r/202311052125.gE1Rylox-lkp@intel.com
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/auth.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/fs/ubifs/auth.c b/fs/ubifs/auth.c
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -18,7 +18,7 @@
 #include "ubifs.h"
 
 /**
- * ubifs_node_calc_hash - calculate the hash of a UBIFS node
+ * __ubifs_node_calc_hash - calculate the hash of a UBIFS node
  * @c: UBIFS file-system description object
  * @node: the node to calculate a hash for
  * @hash: the returned hash

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
