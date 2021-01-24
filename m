Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5720C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799F3229C6
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799F3229C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a8vM5wzpi7d2uQHD2AlHQ2yPLock9t73ynwGZZN5/zA=; b=RR9IEpxgbV2NJmjrp8762LZpF
	wVH/pJE4/WvKcyp/vjmAyesWfWwxgwpPCORfAOKhVnfOSIBwgZHXrzYoLOhwu4iIv6H53H8JxWA+E
	bU3I/N7wkabiBNITJbar2Efe1vq54lhMRGvrlDQaqTtKRhgn2F9wGJPVOBf9LzBtvQaVvHPpq7r0o
	7bI40hXfUFYjSmu3TsjuJNOMbd+aW2+E9Eb0AaVDzPOY7Ewf30/Q+rAcksPfQPkdKuWV/mX9516g8
	Hllr91HqYERv2CIJmKedU4wOnIr2hOp+hCvAQz71K/PONkMyYYJgDuLEkuMQuSCKM7YBO6Twe+90o
	M/cOQjoDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3oh9-00077d-4H; Sun, 24 Jan 2021 23:21:23 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ogt-00074N-8x
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 23:21:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A3BDF180C83BB;
 Mon, 25 Jan 2021 00:21:03 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6D2F1lcsI7Qi; Mon, 25 Jan 2021 00:21:03 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IYOF_6MQpxn8; Mon, 25 Jan 2021 00:21:03 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 8/8] MAINTAINERS: Add entry for MUSE
Date: Mon, 25 Jan 2021 00:20:07 +0100
Message-Id: <20210124232007.21639-9-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_182107_442155_5FD1686A 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, fuse-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, rminnich@google.com, sven@narfation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since MUSE lives in fs/fuse/, make sure that linux-mtd@ is CC'ed
on patches such that MTD related aspects of changes can be reviewed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f79ec98bbb29..dabd9fd2e5e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12151,6 +12151,13 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	drivers/usb/musb/
 
+MUSE: MTD IN USERSPACE DRIVER
+M:	Richard Weinberger <richard@nod.at>
+L:	linux-mtd@lists.infradead.org
+L:	linux-fsdevel@vger.kernel.org
+S:	Maintained
+F:	fs/fuse/muse.c
+
 MXL301RF MEDIA DRIVER
 M:	Akihiro Tsukada <tskd08@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
