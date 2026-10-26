Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232C606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2026 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9L8vc72;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=0cebf4mD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qExUeRNYQlyuZKZda+9q3N8TJeiEDq6AXAus6Bh/AQA=; b=c9L8vc72eYoR/7nDqurHJ8KL7m
	paiT2WAGx45eYNJXjwu1sZiiv7XTruJiJBR6rYJNS+UTWHalv31wxvkxBVmzSsZkRQ9j+db30r1+N
	TrrO+ebUMnPkkfqI+RtpTNYiajB+Qwtmzsc4wMhlUwG2sAD+fMsGNDVZ7bz8YC1hcv8x93C+PJYoA
	gJIaS2Z1ieaupjAbLUePs1fJcfk4JGxzgr+AJL9lHMK72SZGRn1gP8w1A0Kc6fqRfZG683jZ2TCnL
	ChD6J5b0Xg7wI4y4SPYOktfrFkupvQKNZKhRoC4sRkYbrQVC7O5YxVL0OPn+GVhaV+dSvPytdo3ct
	QApp2Ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQmW-00000003Bsl-3uQ9;
	Mon, 26 Oct 2026 19:54:56 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQmR-00000003Bs7-2IH9
	for linux-mtd@lists.infradead.org;
	Mon, 26 Oct 2026 19:54:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD48n4lr0z1XM30h;
	Mon, 26 Oct 2026 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044487; x=1795636488; bh=hnz1gGcBW/BLbaqLHI+DXFHAqG4Qf4qDgMr
	LAo2QDNQ=; b=0cebf4mDiIHij4m4u0EwL02baRi2Ei0EDMf1g9Gp76qfAQIs2+6
	88qC8Q1u7+G6Eu7HfgzRuWzdYczD0ivVHq91tuWI3f5yy52o9LlTaBKq8JlcaZtv
	uRSo6eJps3t0r2BthuvpDViUUQqr7XpZiR+wDR3nfdrrjrJrAkZjCmCV6ggvLuL4
	Lq5+weJnpxe91QRjiX7e07fQzVt9ucXoJhxaPZeBISg3I0OdPyOP/rU51ksWXZcV
	KNc/eamjBaW1jwnX344d8UNIIuL+pMdYjmycbKQVfh7xmNQrBBRYlw1jEJx5DmOy
	3mh0e1gQ+SoukrpnEfwVEViYp8uXyRJ+/3Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PO44ncs_s4iu; Mon, 26 Oct 2026 19:54:47 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD48k592zz1XM4Tl;
	Mon, 26 Oct 2026 19:54:46 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] jffs2: Fix a lock leak in jffs2_flash_writev()
Date: Mon, 26 Oct 2026 12:54:38 -0700
Message-ID: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_125451_595971_03B0C359 
X-CRM114-Status: GOOD (  11.52  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_flash_writev() write-locks c->wbuf_sem near the start of the
function. If jffs2_sum_add_kvec() fails, the function returns without
unlocking c->wbuf_sem. Fix this by unlocking c->wbuf_sem before
returning. This bug has been detected by the Clang thread-safety
analyzer.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/jffs2/wbuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75d58..c8fb58513783 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -904,8 +904,10 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
 
 	if (jffs2_sum_active()) {
 		int res = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
-		if (res)
+		if (res) {
+			up_write(&c->wbuf_sem);
 			return res;
+		}
 	}
 
 	if (c->wbuf_len && ino)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
