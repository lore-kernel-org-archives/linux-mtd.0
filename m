Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1A606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y916Bnve;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=N2IfWaRR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e2Zkq/kQrTV4w8gEuWNstW7E7vGKDMila/8LbS5ETzA=; b=y916BnveUDR9cV+wKDEBAjJd6g
	f5LE3Hr/3qHOjxjQt+gQRhC17o6fq0r8576ZZ06EpJ477ac2LUisiI9euPKsHWfw3duQBBJ+vuDrk
	i7I3z787iXqg6qdYOti+YT/5pEBEBjvhYmFWo6wvSJ0e8ctE4pVIZ81OVX3W/uxqhH7AmiL2a7QIq
	xl1YH3plTx7bVhvgnevJeZ/O2XsfVwUnPdWvwS+7/si9IMcOxewpO3HuHmntrXa1Pn7ZbyuzDonCn
	EhonY/5NwlUwgiNjZN+fdTUce8RXvygZKTOQaCGQ/JMrgtG7/K517thvpxf/WHwiAPdIuIykf+1Lf
	bvNRTIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqwf-0000000E0dB-3gCC;
	Thu, 22 Oct 2026 11:26:53 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqwc-0000000E0co-1816
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 11:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4E50WilOxFb8qDQvr3/oMZLrfE8a1b0B9JLvVN7EQv4=; b=N2IfWaRRFCP71nXTaBs8S22HaM
	tdYmyWemDBu5SHWNJAdZX9mVgBAMF6SpOlfnXayVGXnPF8dOrbh2d9df1CqzqGlgTrxjyabvTyEBn
	G6pR4bhYZdWA8ULRUcOsAxUUcSjLRnYB4EkbmYNfsHAkzoZ33E/aqXAmZC0d6zZI5AJaKEo9dYBI0
	f0ludMn0TsjmlHcmkoG4os71sHZL/FQkaV8lgt6y1GywbtW08jiIfBy82wAdMQGFcip5LZHfVaMDB
	7vOsoMXWlVJGuoGztWmYKbuebxm+lA+5bY1+llBdcPQSfESeF2a+9dDKla5pmmpQwbgrJXhyFd1Rk
	apd5EKfA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJqwU-0004EC-1d;
	Thu, 22 Oct 2026 13:26:42 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJqwU-0008wb-2k;
	Thu, 22 Oct 2026 13:26:42 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ubifs: fix typo in comment
Date: Thu, 22 Oct 2026 13:26:39 +0200
Message-ID: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28161/Thu Oct 22 08:24:11 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_042650_440636_F070F730 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Small typo which stayed hidden so far. Fix it.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 fs/ubifs/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index cbff2d800e27a..50740e9dabf73 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -245,7 +245,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
  *
  * This function scans LEB number @lnum and returns complete information about
  * its contents. Returns the scanned information in case of success and,
- * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
+ * %-EUCLEAN if the LEB needs recovery, and other negative error codes in case
  * of failure.
  *
  * If @quiet is non-zero, this function does not print large and scary
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
