Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE626C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 19:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FFF21734
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 19:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8ZK3xA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FFF21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rR2kqb4I5M2lGNTjkVPj/q0CxGUf19IzLHFWqz0aRNI=; b=g8Z
	K3xA0nx00bcu90TGkQAKGTpR+StfHAKqctP0yoeRbOw0JN9f/WtVJ/n2vN8fSiHKdI6DMiFfYxRWp
	d5B5Cc8bfsOXFRiAzvyioLNcwJcekFe26pAZjBNJi5aTT0LGQVZzXM8iOvd6Euly0wSn/VUwZKURa
	9+1g1YfjNO3l2jHrp2N02A84LqbAcM5PBOVycJmyp/qdGwlFb62obH4P7gT6cxckjiObiTWqoN6rM
	TZjhQrZlrph15XL7btegtonu1kU03nytYqPFLxAgyKPxYS+ShO1v+ShJmi0++LjoYoXY7J+t74SQJ
	RLvSbzGkt/Z5suO5E821Z0ckdDNnFiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQzmu-0007zw-8M; Wed, 15 May 2019 19:42:04 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQzmo-0007zD-JL
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 19:42:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id DA84818186369;
 Wed, 15 May 2019 21:41:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Correctly use tnc_next() in search_dh_cookie()
Date: Wed, 15 May 2019 21:41:40 +0200
Message-Id: <20190515194140.12265-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_124158_782947_77843363 
X-CRM114-Status: GOOD (  16.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Hyunchul Lee <hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit c877154d307f fixed an uninitialized variable and optimized
the function to not call tnc_next() in the first iteration of the
loop. While this seemed perfectly legit and wise, it turned out to
be illegal.
If the lookup function does not find an exact match it will rewind
the cursor by 1.
The rewinded cursor will not match the key we are looking for
and this results in a spurious -ENOENT.
So we need to move to the next entry in case of an non-exact match,
but not if the match was exact.

While we are here, update the documentation to avoid further confusion.

Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: c877154d307f ("ubifs: Fix uninitialized variable in search_dh_cookie()")
Fixes: 781f675e2d7e ("ubifs: Fix unlink code wrt. double hash lookups")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/tnc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index ebf8c26f5b22..8f3efc6263f0 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1170,8 +1170,8 @@ static struct ubifs_znode *dirty_cow_bottom_up(struct ubifs_info *c,
  *   o exact match, i.e. the found zero-level znode contains key @key, then %1
  *     is returned and slot number of the matched branch is stored in @n;
  *   o not exact match, which means that zero-level znode does not contain
- *     @key, then %0 is returned and slot number of the closest branch is stored
- *     in @n;
+ *     @key, then %0 is returned and slot number of the closest branch or %-1
+ *     is stored in @n; In this case calling tnc_next() is mandatory.
  *   o @key is so small that it is even less than the lowest key of the
  *     leftmost zero-level node, then %0 is returned and %0 is stored in @n.
  *
@@ -1894,13 +1894,19 @@ int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 
 static int search_dh_cookie(struct ubifs_info *c, const union ubifs_key *key,
 			    struct ubifs_dent_node *dent, uint32_t cookie,
-			    struct ubifs_znode **zn, int *n)
+			    struct ubifs_znode **zn, int *n, int exact)
 {
 	int err;
 	struct ubifs_znode *znode = *zn;
 	struct ubifs_zbranch *zbr;
 	union ubifs_key *dkey;
 
+	if (!exact) {
+		err = tnc_next(c, &znode, n);
+		if (err)
+			return err;
+	}
+
 	for (;;) {
 		zbr = &znode->zbranch[*n];
 		dkey = &zbr->key;
@@ -1942,7 +1948,7 @@ static int do_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
 	if (unlikely(err < 0))
 		goto out_unlock;
 
-	err = search_dh_cookie(c, key, dent, cookie, &znode, &n);
+	err = search_dh_cookie(c, key, dent, cookie, &znode, &n, err);
 
 out_unlock:
 	mutex_unlock(&c->tnc_mutex);
@@ -2735,7 +2741,7 @@ int ubifs_tnc_remove_dh(struct ubifs_info *c, const union ubifs_key *key,
 		if (unlikely(err < 0))
 			goto out_free;
 
-		err = search_dh_cookie(c, key, dent, cookie, &znode, &n);
+		err = search_dh_cookie(c, key, dent, cookie, &znode, &n, err);
 		if (err)
 			goto out_free;
 	}
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
