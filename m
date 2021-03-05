Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121AC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:17:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D1B65011
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D1B65011
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdNYKkG1X49gJ53tVsVQ9tq/S8ngyNXBgJyZmVDEqa4=; b=EefH/tVqnTTgZQQ4rjU7nMtpg4
	qjfpqBmfuMa0ymw0mNldQVZ00M8F5QGXrDQuZyCV/dhfY3UAnml/QtVfjZHSM+OfqC0prGNgOdsPC
	MCdwkMdLmVwlrZI7Zu1lSq6et7Z5/Ej1KAWEJGc2lzIgIRn2rB7fwEqOioneXH1kZsUiIS0Qfb/5J
	Kz1PPHGyLlWGisQfGSynWi8qsj0qSxkyu76bAG2ErImQUj/lTTEEI+zGtFjbFh7o3CP1caXdbf+1a
	WRP8/ZsRF8dN3qFGDHXHNHc0tswO0mgJSmBwEAYntydstXnu64H3+mMpL/zTP1iq+NW14243hupQn
	h0k99bow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5dL-00Dx3u-VP; Fri, 05 Mar 2021 08:16:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5dF-00Dx27-2Y
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:16:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4FA965014;
 Fri,  5 Mar 2021 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932179;
 bh=t1cng2jl4iyc5DF35ZB4YuDSPYVo2bYVbHiZ7KKk+OQ=;
 h=Date:From:To:Cc:Subject:From;
 b=F/YKqPHxRMQ+1zHcBYGg0itcKDEpyLqAjcTMxv8MqjvZuBSCnAskyHmDWupKB1vqT
 sERqXEvfZHRq5lAjySHIVDYrIOkmRWxHUoinujM/FF+KsZi6P9O38STrSTFT0veGkF
 ThZPMVmDrfcdH4GT2ElxdTY/ARC3fe2cY9Zf2wBFBNH7Tew0ENZnqTkME9YqQMyUVx
 S/Ev2A4OJG8XFiJ1WniSjOJejeXfVK0QlTf2Vj8Mte8kvJPA80ST2akU9imbXzjiPf
 1GEMQvqmy67cjDBpU9I6csLRwUCuFVuInFDlY72lmSR27DU6K4rPx/BQU9T2J5e3/K
 uoEsYnp57vgRQ==
Date: Fri, 5 Mar 2021 02:16:16 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] ubi: Fix fall-through warnings for Clang
Message-ID: <20210305081616.GA136956@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_081621_654051_5E97BE89 
X-CRM114-Status: UNSURE (   7.50  )
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a fallthrough pseudo-keyword instead of letting the
code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 Make use of a break statement instead of fallthrough, for consistency.
 Link: https://lore.kernel.org/lkml/20201123093347.719a77cf@xps13/

 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f399edc82191..a7e3eb9befb6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1350,6 +1350,7 @@ static int bytes_str_to_int(const char *str)
 		fallthrough;
 	case 'K':
 		result *= 1024;
+		break;
 	case '\0':
 		break;
 	default:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
