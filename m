Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F42C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 00:15:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB782177B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 00:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIl71Clb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB782177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00iePJRikcaabz/S0Ue7yOIXuOv9QNkWa3lbm4a4BsM=; b=NIl71ClbWOdPfeE1tCDmOllFoL
	QegZcrxXaoxHoOjCceqWSV0p1sGYGma0UkV/Dv87ygMTA4w4uj7veO/YoACGTI5psAUO28DnSMYGn
	aSMjMtnNMb2YDPR8FByFbOLGVpBB/v6ykseNMUfI/USI4vp9I6GIAG6R6nthhnPO/HbwKOxtB2+0R
	CDSD3mKD8ppz9dNS+zV+QMk/m2xstvOP9j2Trl+Z+mYf6BI1jMUNV9wzJcm2UnrlViITa1F3A320n
	aiF9VQJOjtPlAdwcNCmE1/I4swIJbyZuWVpFYgc050RK522LM91V4gsVs8LhcJgko4XF9foeSFlZq
	UoM8Evfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxJSH-00041b-US; Mon, 20 Jul 2020 00:14:53 +0000
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxJSC-000416-Al; Mon, 20 Jul 2020 00:14:48 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: misc.h: delete a duplicated word
Date: Sun, 19 Jul 2020 17:14:44 -0700
Message-Id: <20200720001444.30972-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Drop the repeated word "as" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/misc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/fs/ubifs/misc.h
+++ linux-next-20200717/fs/ubifs/misc.h
@@ -121,7 +121,7 @@ static inline const char *ubifs_compr_na
  * ubifs_wbuf_sync - synchronize write-buffer.
  * @wbuf: write-buffer to synchronize
  *
- * This is the same as as 'ubifs_wbuf_sync_nolock()' but it does not assume
+ * This is the same as 'ubifs_wbuf_sync_nolock()' but it does not assume
  * that the write-buffer is already locked.
  */
 static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
