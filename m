Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0153C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:20:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C69B65014
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C69B65014
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1vMDKtwG54Evim7uUm5L/cCwDFQwDAAsFbRSh6SfAo=; b=MIDQvvX9ivnL/G26fpmMPs0b/8
	yMEW9/qxFE5eF9+CO3HxkbInuMS/VAeD1ig6TjnqfETXHaD+XFNlXbb0wpl718xNEXRSvXxayVRGf
	kaI8Xp6sULKzb7yh7+HzHHIwn+x26fCYbCyjiMQ5IwjpxyJqhb+lSUvBaDk+4PbdMqXDVJitrSOu3
	//JYMSkYYUHcCRK7zQQzVK+gldwfbYO2IIYYQ73cTM8m6fClFJHRgjmKyeDvnFJ7RtWdUcMizTbw3
	4W8WnDzdW2zDFvE5mwrNFXn3vAEbCkLUbGvHgsWBOnJ6WR/cXbz0zx+5xf/cy4M9PHf0Tu8k9/UqG
	tzK32aDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5gT-00Dxld-NZ; Fri, 05 Mar 2021 08:19:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5gP-00Dxkh-KR
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:19:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B37C65014;
 Fri,  5 Mar 2021 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932376;
 bh=4tcQynLBYFF8R4IvD4h1vdRVG+jt6uczJrx4L0hagCI=;
 h=Date:From:To:Cc:Subject:From;
 b=UL1XdNh8CUWSnSJzvCohlPYrnTV2wTDEEz5riKz7vCZcMZhoHhPrasqPxFyDjg3cU
 VK3X8zdKPp+d6Zk/nELeHn3TdaXZvTdkcbbsIVD+MmI3vzKv//uEq+eVtS2hdpZdNN
 xZ5xjHI8v6xqaOQZEQsouGP7wWjwNscQRO5TwulHRw0Bc0sS7HokMjDTdjYqhzl/Zz
 s0cXYpl4dk9JRtuX9zkAcJvruvjzGIDAaaweqIRuQM9PBbkElCBsFm9IDgye534BsA
 chc/GrUygzOBW79bv/OyG62NhhnpMGkcRf2zgnsdtAKGkLjM0oe7+UBr0sMDkpYkyq
 JNtCkBJU8gq0g==
Date: Fri, 5 Mar 2021 02:19:33 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] mtd: cfi: Fix fall-through warnings for Clang
Message-ID: <20210305081933.GA137147@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_081937_941371_E489F849 
X-CRM114-Status: GOOD (  10.29  )
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
