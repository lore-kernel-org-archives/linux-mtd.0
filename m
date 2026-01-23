Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB2D6CFCB
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jan 2026 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOahC4j9tBuqmNWW0NKj1Mxgx9/RSqqz4uGw24WaZp0=; b=yIxMBBu/beERlo
	9cou/6OYxs8fyXSvnKIYgSTyo5FirJPk8TZlmXTM/wmB7sUobGQ2F8L+/eoNESH+IdMFC3wjuyz7m
	dCYLg765uy7h7q3/+30ctqZYSJhRQ4NDLoq0bNQpVAHnpOw9dICMLtSNYV8SHaif9DSg2errasNIr
	ibMc0TuFjWG0jTk4q89hXVqEjod06lhPnVuFIwWr94KwRr6UP7QTFnCPgJs9P0ITq1rDitBpkrfqu
	b0b7IDq5MJZ5TuZcWEVJ6vuO1VGnt0PGOwnGK5V7b6/c/W4iLfrK/ASXLiKIU4yYth8vg2uX7bRRr
	MoaenYAVndvR7m0dAHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj9ga-00000008EbV-10Ep;
	Fri, 23 Jan 2026 05:26:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj9gW-00000008EbA-0cFQ
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jan 2026 05:26:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82318b640beso303596b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2026 21:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769145975; x=1769750775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQcopxq+sUmUTjLsEEd/iJJhsWiwz/UrdyF1kPVCowM=;
        b=VlhnRAK/xSOuvaiyoprWjsPg5eyg8Du/aAdKog03sGWLla0KD7y6n0vFutGeSoLkay
         KuKk5QNXsaJX6hCcg5kxinMUgf1WHBUzUCYiORYf+ibEW4XYK36F28XrGpEhmC6alONo
         O8YjtUSMqADJQD34m9L5/abqh3MEqF0psWHollRYtztlGCS6R1ncby5sv1ymTG2Sl4Uh
         2OY4aCvUbnrId5kVRglxL7V3jtCoCVK0ygsaNAH+uRENYDvia2kHf3NB0JRU4T8Tq8EC
         fIpXe1Huc9N/0bSC2LPy1MTRUbtSez/oDAV6autoAY/l8MSw11T5OJjseIhleC0AnHX6
         teQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769145975; x=1769750775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQcopxq+sUmUTjLsEEd/iJJhsWiwz/UrdyF1kPVCowM=;
        b=biZaD+l03gz5qjKiT28L6ydSH4dj6h7ZPNkkDmPD4Llf+72usXqdUOeBV2w88qEzCs
         WQKrRtMLdAdOrH1TPnX5+CrpI0TBegwCy3pPms4xBlG3KKZm+KF+IFkkia80q4I5AWbE
         Sm9bpUvLBBVFGpeT6bKM9lX9uE/OIP02cqCthahRvjhIV6j9rMcet7nxFOBQj8HzW8fn
         jLI3sJemek9cc9nQwxajmPL0ZbFxkgQpQzZ7KtF26WgF/oIw5KDgyCoIkK6N6xVK0l8R
         moFMR3k4oHuxS/OwwancLzJluc0219PTpzsEj9crZahUZk+IR7j2C9rCA19DinQlAJFz
         kTqA==
X-Gm-Message-State: AOJu0YwZ0XkA8Xd8nWg3UzFBHBnB2XrC+uJW/exhlVtbdFwCaHDfKCQc
	Tu3FLv2hF4dlq5IFleV0zbaCLPiBR8vIjQdrXgUZJZOpOsnm6uO6ikWNmFB7+g==
X-Gm-Gg: AZuq6aJ3nqxeFW0HGmXsQeXDTnc5THH7QS2NzXNwdtCz1j8SbqVM2gA5uRPRAbPBQ8c
	OL6pRroOppvGh2mbrfF5stH+PmWKqevEBvqrg/K5t2sZs7cV8ntVqE0NwJABNvFgNxERhclwCev
	V9kUzdKMF7bly5gUU8IFlHH3CL3Kh9qcWHNmcHlzOr2gaFdBBp7XSvDcsC4ETHZ7faJHPiyIUjM
	sbnmuPE3dxZng7ynWXP89j81RZSxqFOmIJFs99odbNr0By5OdlFtBtCuBqgCDTd/7045A6SD9XA
	ruMdN8zaSh9TIffZKBp+PQKkalK4n7H6KB+jIZFRE04Kst/Qz2I6zoMqPqdqVkSZF9d3AeWZzzW
	yYae8otegm2O7RzhsetBPdQCAH85qBnKl+mMN99HBHl8USjkz5rf+gEpkBP63kS1Gn5DcZygOmR
	UeH7QB+ZpL3JdRfKfoj/vjERFXhZa9J9MZGwKuqkYuSNulvBtV3DthaKXZoD2W3ds3GbZOu7dpA
	TPIIci+G9aFWnPMASvJ4J0Dd5qc1pCIMW2hIWWZwJDGq7ZIwAOP9uF/yQ==
X-Received: by 2002:a05:6a00:9086:b0:81b:13c5:b6b2 with SMTP id d2e1a72fcca58-82317e00cf9mr1457817b3a.33.1769145974766;
        Thu, 22 Jan 2026 21:26:14 -0800 (PST)
Received: from cc3c93d3b6b2.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644989sm948391b3a.13.2026.01.22.21.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:26:14 -0800 (PST)
From: Weigang He <geoffreyhe2@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()
Date: Fri, 23 Jan 2026 05:26:08 +0000
Message-Id: <20260123052608.668207-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_212616_211007_A8651572 
X-CRM114-Status: GOOD (  13.45  )
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

of_get_child_by_name() returns a node pointer with refcount incremented,
which must be released with of_node_put() when done. However, in
parse_fixed_partitions(), when dedicated is true (i.e., a "partitions"
subnode was found), the ofpart_node obtained from of_get_child_by_name()
is never released on any code path.

Add of_node_put(ofpart_node) calls on all exit paths when dedicated is
true to fix the reference count leak.

This bug was detected by our static analysis tool.

Fixes: 562b4e91d3b2 ("mtd: parsers: ofpart: fix parsing subpartitions")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/mtd/parsers/ofpart_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index abfa687989182..09961c6f39496 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -77,6 +77,7 @@ static int parse_fixed_partitions(struct mtd_info *master,
 	of_id = of_match_node(parse_ofpart_match_table, ofpart_node);
 	if (dedicated && !of_id) {
 		/* The 'partitions' subnode might be used by another parser */
+		of_node_put(ofpart_node);
 		return 0;
 	}
 
@@ -91,12 +92,18 @@ static int parse_fixed_partitions(struct mtd_info *master,
 		nr_parts++;
 	}
 
-	if (nr_parts == 0)
+	if (nr_parts == 0) {
+		if (dedicated)
+			of_node_put(ofpart_node);
 		return 0;
+	}
 
 	parts = kcalloc(nr_parts, sizeof(*parts), GFP_KERNEL);
-	if (!parts)
+	if (!parts) {
+		if (dedicated)
+			of_node_put(ofpart_node);
 		return -ENOMEM;
+	}
 
 	i = 0;
 	for_each_child_of_node(ofpart_node,  pp) {
@@ -175,6 +182,9 @@ static int parse_fixed_partitions(struct mtd_info *master,
 	if (quirks && quirks->post_parse)
 		quirks->post_parse(master, parts, nr_parts);
 
+	if (dedicated)
+		of_node_put(ofpart_node);
+
 	*pparts = parts;
 	return nr_parts;
 
@@ -183,6 +193,8 @@ static int parse_fixed_partitions(struct mtd_info *master,
 	       master->name, pp, mtd_node);
 	ret = -EINVAL;
 ofpart_none:
+	if (dedicated)
+		of_node_put(ofpart_node);
 	of_node_put(pp);
 	kfree(parts);
 	return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
