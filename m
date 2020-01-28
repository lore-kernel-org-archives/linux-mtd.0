Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47531C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133DA214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KXA/YmrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133DA214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9xXjvKi+nWQTWYSKPHopw+CweXqBhsWIqoRd6DLUMU=; b=KXA/YmrFHQb0L2
	RXxPb62csbJXfmg66DA7jhrGkbwaBU8+ow4uTUilRlidJfDElxdia3YQtWcuPm7KUpBrWWW1zvS+T
	wNj/KOqZ6kQGwjvfjOpGfyY3fkxxGQHJ5LfuxRBJFSClLVekHPVOgn1LTvGnaC/qJbPCokNKCfB/h
	nkw8y73jyY1c0CsoXb8JXrlAKFF1yzg/84GFDq+CJ3qwIWrLKoNQdFHC3NyNAItGMurKErOMaKqa/
	C/0BB1PD1xP5puTLILJgK0IRHj/o92M2T56/0f372WlOJuys1i4u/nP1GWxZttkUSaRgkia2VBVtQ
	pgTxr1Sd+w3XA9Ln597A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUfi-0002MO-Ur; Tue, 28 Jan 2020 17:29:06 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeF-0000jk-9h
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 83B05180FD034;
 Tue, 28 Jan 2020 18:27:31 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1asrUk_j3rqJ; Tue, 28 Jan 2020 18:27:29 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8JcpTVAl4QVY; Tue, 28 Jan 2020 18:27:29 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/8] mtd-utils: Fix "are we really at EOF" test logic in
 libubi read_data
Date: Tue, 28 Jan 2020 18:27:13 +0100
Message-Id: <20200128172715.19545-7-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
References: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092735_483321_0C6CF093 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The function reads file data into a buffer and then checks if we
actually are at the end-of-file by trying to read one more byte.
For whatever reason, the code uses an int instead of a char. It's
not pretty but works. But again, this is something that every
static analysis tool barks at.

Further more, the error messages are inverted. "We aren't at EOF yet"
is printed on failure and something like "read error %m" is printed
on success.

This patch fixes all of the above.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libubi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/libubi.c b/lib/libubi.c
index aaeeb38..afe3648 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -156,7 +156,8 @@ static int read_positive_int(const char *file, int *value)
  */
 static int read_data(const char *file, void *buf, int buf_len)
 {
-	int fd, rd, tmp, tmp1;
+	int fd, rd, tmp1;
+	char tmp;
 
 	fd = open(file, O_RDONLY);
 	if (fd == -1)
@@ -178,11 +179,11 @@ static int read_data(const char *file, void *buf, int buf_len)
 
 	/* Make sure all data is read */
 	tmp1 = read(fd, &tmp, 1);
-	if (tmp1 == 1) {
+	if (tmp1 < 0) {
 		sys_errmsg("cannot read \"%s\"", file);
 		goto out_error;
 	}
-	if (tmp1) {
+	if (tmp1 > 0) {
 		errmsg("file \"%s\" contains too much data (> %d bytes)",
 		       file, buf_len);
 		errno = EINVAL;
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
