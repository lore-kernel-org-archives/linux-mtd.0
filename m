Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DE4C56201
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C409024178
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n6hylo9o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBHzvXnE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C409024178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1vMDKtwG54Evim7uUm5L/cCwDFQwDAAsFbRSh6SfAo=; b=n6hylo9oa6SBWQbOcHEbQi6k0
	UYAMkR60DZx0e0hePprQxpYwv8FW0vTu26hbIPbhd7QsJgN08LrMgpgpxaFf0/MFiAtZ0zUvpzf7B
	0w0qI+GSJ1YKc37HlUkc40kyszyc6F6pac3M5+RPTr6A3qDD7vtWrAYttFQa+Duj/vnE+vQ5L+hwt
	4w/N24+CSDiKTpRFUQfFdX0Dg/kI1iBF/XPTURqDDjl7hAgSFQ721GUz6N2plzMQXptmOpQP+3aJQ
	cWCHHtH2pKTyDSBxwfqI9b6yxmuBHpvSt2k4qdT+xj24SWp92qj59koDpq5s4N2tYX4jXCdjViGky
	EF6HFc/+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBHd-0002rP-U2; Fri, 20 Nov 2020 18:37:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBHa-0002qT-Mg
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 18:37:20 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15E2924124;
 Fri, 20 Nov 2020 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897437;
 bh=4tcQynLBYFF8R4IvD4h1vdRVG+jt6uczJrx4L0hagCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBHzvXnEsolriOEVZm+ZBZhfDdnNg5ZkjvjWMsENYLULfj5NkfZFWEDJBvqnHnYrb
 /0oW/MHBDqMUoQSVBjPwtbB7DCdQV3BFeSEohvzHj+NOet82XwE/UCFCHfkXAMIFYN
 Y1BMeP40udfBZij9lL/BoaUCVfOkqtYVPvRFPtnY=
Date: Fri, 20 Nov 2020 12:37:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 100/141] mtd: cfi: Fix fall-through warnings for Clang
Message-ID: <72b76d0aaa1bf1c5d55914c2ab330ac2c95fc629.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_133718_913979_F3C9C0EB 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple break statements and a return
instead of letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 1 +
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 ++
 drivers/mtd/chips/cfi_cmdset_0020.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 42001c49833b..b7f5e7977dcd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2549,6 +2549,7 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 			   anyway? The latter for now. */
 			printk(KERN_NOTICE "Flash device refused suspend due to active operation (state %d)\n", chip->state);
 			ret = -EAGAIN;
+			break;
 		case FL_PM_SUSPENDED:
 			break;
 		}
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a1f3e1031c3d..6f6b0265c22d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -902,6 +902,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 			/* Someone else might have been playing with it. */
 			goto retry;
 		}
+		return 0;
 
 	case FL_READY:
 	case FL_CFI_QUERY:
@@ -2994,6 +2995,7 @@ static int cfi_amdstd_suspend(struct mtd_info *mtd)
 			 * as the whole point is that nobody can do anything
 			 * with the chip now anyway.
 			 */
+			break;
 		case FL_PM_SUSPENDED:
 			break;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 270322bca221..d35df526e0a6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -1332,6 +1332,8 @@ static int cfi_staa_suspend(struct mtd_info *mtd)
 			 * as the whole point is that nobody can do anything
 			 * with the chip now anyway.
 			 */
+			break;
+
 		case FL_PM_SUSPENDED:
 			break;
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
