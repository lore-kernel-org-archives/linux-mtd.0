Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC0C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3F1214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6sAkQ5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3F1214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsdt7Qn4U2weGbXkjTKawu3vaEuMO+doJxqmue4OTe8=; b=h6sAkQ5YD/FX1t
	BIMUWmeD3ZNAOkN5hmWKX5u4wOH0UlRi6biHyYoFngDXgJRpxuPBUfPuri2EPyHnaGw+T0eC47p4v
	sVnBPbKaYoGrLLKOockp+/4kb7CgXvThQHW9ZIXOBTQLKi+CsKMRPB3pjUf/6Js+BUzQJVa6kAYzs
	8FUh1RDhkMpKkXsRGUAtBBdg8fbhygOM4Ntqu9LyhYpiC+dOUCLKZbyQwL6K7FpXdOh0s1PVY+iUg
	M/dDd5oPs52wvaJ46xPiMtkWS0m6j1aNit1X9q7Wf3X6ANlHnna0xeyMef4fI7Z9ArmbE91t2viaE
	rq/6xYHPVMvJa0TlhPag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUfz-0002bD-R2; Tue, 28 Jan 2020 17:29:23 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeF-0000jt-Ka
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id D78DD180C83A5;
 Tue, 28 Jan 2020 18:27:31 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AevZVpZrrZNl; Tue, 28 Jan 2020 18:27:28 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fP5VDK-wRuIy; Tue, 28 Jan 2020 18:27:28 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] mtd-utils: Fix some simple cases of uninitialized value
 reads
Date: Tue, 28 Jan 2020 18:27:11 +0100
Message-Id: <20200128172715.19545-5-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
References: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092735_851053_2EC7B681 
X-CRM114-Status: GOOD (  11.43  )
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

This patch modifies the internal helpers to read and parse integers
from sysfs files by initializing them first and removes turns an
obscure "a = open(...) if (a >= 0) {...} if (a == -1) {...}" inside
recv_image into a more straight forward if/else branch.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libmtd.c            | 2 ++
 lib/libubi.c            | 1 +
 misc-utils/recv_image.c | 3 +--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 564e5c0..9d8d0e8 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -217,6 +217,7 @@ static int read_hex_ll(const char *file, long long *value)
 	}
 	buf[rd] = '\0';
 
+	*value = 0;
 	if (sscanf(buf, "%llx\n", value) != 1) {
 		errmsg("cannot read integer from \"%s\"\n", file);
 		errno = EINVAL;
@@ -269,6 +270,7 @@ static int read_pos_ll(const char *file, long long *value)
 		goto out_error;
 	}
 
+	*value = 0;
 	if (sscanf(buf, "%lld\n", value) != 1) {
 		errmsg("cannot read integer from \"%s\"\n", file);
 		errno = EINVAL;
diff --git a/lib/libubi.c b/lib/libubi.c
index 4322a19..aaeeb38 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -94,6 +94,7 @@ static int read_positive_ll(const char *file, long long *value)
 	}
 	buf[rd] = '\0';
 
+	*value = 0;
 	if (sscanf(buf, "%lld\n", value) != 1) {
 		errmsg("cannot read integer from \"%s\"\n", file);
 		errno = EINVAL;
diff --git a/misc-utils/recv_image.c b/misc-utils/recv_image.c
index 7f6662b..eeaa2e2 100644
--- a/misc-utils/recv_image.c
+++ b/misc-utils/recv_image.c
@@ -81,8 +81,7 @@ int main(int argc, char **argv)
 			printf("Receive to MTD device %s with erasesize %d\n",
 			       argv[3], meminfo.erasesize);
 		}
-	}
-	if (flfd == -1) {
+	} else {
 		/* Try again, as if it's a file */
 		flfd = open(argv[3], O_CREAT|O_TRUNC|O_RDWR, 0644);
 		if (flfd < 0) {
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
