Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EC4C43466
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:38:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4172423730
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="perCInWm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="URljmrE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4172423730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Pi4e8c6PjSkscE0ixU3rFMK4J93TPKCqhPx94TrMWE=; b=perCInWmxIkVKY7sdFLk/gmTk
	N7JigBkoRqHnpPOB4At4xgYhw1t3DkvXpQZYbM0M74PNHYBVRHEXoUv46z28Fk0slUVgIbogjzjsI
	qPlqQJ42w4w5CQWxkUYBwXZ/OyE1CSU0QKSbQZM1VyCj4vIEXEe+zPXmArtQgqLCBgW9Y26pdrXDf
	EAzCq/Qvlpv1SAVbyrPso2D5L2PYcJFOZWOrvuKwsMMyoqe7jR794c5lJCD/jiQNzjUwxiQnEN2/B
	syKLmWE731a20TAEztmL8pGiIqQ47qyYu3GOSppXyaFF2WRvv4D9ym9+ZN8Ybm/t5csN0FbFvfYIr
	1Z7JZWsKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6HU-0003mH-D0; Fri, 18 Sep 2020 02:37:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5x1-00019Q-AQ
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:16:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBFB72396E;
 Fri, 18 Sep 2020 02:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395396;
 bh=upv3xnt3bWXiu6wKVob/j1pxoJ/5ELQvhiiDiyrMmdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=URljmrE1udEeYtvyGGWKUM8f+IWnLNW4BOnSNVFZTGUqj7kXrgYplPr9D68LV6vaI
 tlsFXBrml1xjwv6uNcHGRYWnGrYMjyTtnscEheXZAEDephMih5hLo8VfEjn+EGlLdr
 8D6xw+/JkBq6zb+p7ELMOkckdLDsCvJaDungr5gI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 85/90] mtd: parser: cmdline: Support MTD names
 containing one or more colons
Date: Thu, 17 Sep 2020 22:14:50 -0400
Message-Id: <20200918021455.2067301-85-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021455.2067301-1-sashal@kernel.org>
References: <20200918021455.2067301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_221639_716958_888EB7F2 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Ron Minnich <rminnich@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

[ Upstream commit eb13fa0227417e84aecc3bd9c029d376e33474d3 ]

Looks like some drivers define MTD names with a colon in it, thus
making mtdpart= parsing impossible. Let's fix the parser to gracefully
handle that case: the last ':' in a partition definition sequence is
considered instead of the first one.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ron Minnich <rminnich@google.com>
Tested-by: Ron Minnich <rminnich@google.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/cmdlinepart.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index fbd5affc0acfe..04fd845de05fb 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -228,12 +228,29 @@ static int mtdpart_setup_real(char *s)
 		struct cmdline_mtd_partition *this_mtd;
 		struct mtd_partition *parts;
 		int mtd_id_len, num_parts;
-		char *p, *mtd_id;
+		char *p, *mtd_id, *semicol;
+
+		/*
+		 * Replace the first ';' by a NULL char so strrchr can work
+		 * properly.
+		 */
+		semicol = strchr(s, ';');
+		if (semicol)
+			*semicol = '\0';
 
 		mtd_id = s;
 
-		/* fetch <mtd-id> */
-		p = strchr(s, ':');
+		/*
+		 * fetch <mtd-id>. We use strrchr to ignore all ':' that could
+		 * be present in the MTD name, only the last one is interpreted
+		 * as an <mtd-id>/<part-definition> separator.
+		 */
+		p = strrchr(s, ':');
+
+		/* Restore the ';' now. */
+		if (semicol)
+			*semicol = ';';
+
 		if (!p) {
 			pr_err("no mtd-id\n");
 			return -EINVAL;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
