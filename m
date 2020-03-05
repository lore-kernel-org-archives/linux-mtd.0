Return-Path: <SRS0=05/s=4W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCC6C3F2D7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 09:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EAF62146E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 09:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8HBaR/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EAF62146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMcTlyxp9orRbHjhvN/HaCPTo2cWN8W0z7SGsf7l7GU=; b=p8HBaR/lhnQbAI
	PtzO7+t6WlgWZ5B/R79k+zfthg0TkIRM6I1HlPJ+LRdCgUFKtwzLH/U1NJUkV8ZnD13aZv9uXzWOc
	9T57P0fsVuq5xAE+s7m894thmPz1cXabB039Kw/mbt1RcZWM7C5KVu3YuaCamg+IFkp7KrWqoIgzv
	FIL+N+OZB91VmC4jZitPSR43tYtFkwunJDO0tDlIrLdf7KBEBU/8wFR/Umjj9bZ7tHQZFHxb3AYjm
	T6F5z8sZdykLKuzCDrR7E2KwtDQunehpa6/7HRuPptahDqX2ofQbh95mURGljPWEdADIjCQ2xOvQs
	rnxBgIaco2RDVRBsobWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9mb9-000358-4e; Thu, 05 Mar 2020 09:15:19 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9mb5-0002g0-9G
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2020 09:15:17 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A30619047394981C1C7F;
 Thu,  5 Mar 2020 17:15:01 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Mar 2020
 17:14:51 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
Subject: [PATCH v3 1/2] ubifs: factor out helper ubifs_check_node_buf()
Date: Thu, 5 Mar 2020 17:22:04 +0800
Message-ID: <20200305092205.127758-2-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
In-Reply-To: <20200305092205.127758-1-houtao1@huawei.com>
References: <20200305092205.127758-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_011515_895181_7206D41A 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: Carson.Li1@unisoc.com, Adrian Hunter <ext-adrian.hunter@nokia.com>,
 houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It will be used by the following patch to check
the validity of node in buf.

And in order to disable node dumping during fs probing,
an UBIFS_CHK_FORCE_DUMP_BAD_NODE flag is added to
accomplish it.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/ubifs/io.c    | 109 +++++++++++++++++++++++------------------------
 fs/ubifs/ubifs.h |   5 +++
 2 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 8ceb51478800..c174303274ae 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -946,6 +946,55 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	return ubifs_write_node_hmac(c, buf, len, lnum, offs, -1);
 }
 
+/**
+ * ubifs_check_node_buf - check node buffer
+ * @c: UBIFS file-system description object
+ * @buf: the buffer saves the node
+ * @type: the expected type of node
+ * @len: the expected length of node
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ * @flags: flags for error message control
+ *
+ * returns 0 in case of success and %-EINVAL or %-EUCLEAN in case of failure.
+ */
+int ubifs_check_node_buf(const struct ubifs_info *c, void *buf, int type,
+			 int len, int lnum, int offs, int flags)
+
+{
+	const struct ubifs_ch *ch = buf;
+	int err;
+	int l;
+
+	if (type != ch->node_type) {
+		ubifs_err(c, "bad node type (%d but expected %d)",
+			  ch->node_type, type);
+		goto out;
+	}
+
+	err = ubifs_check_node(c, buf, lnum, offs, 0, 0);
+	if (err) {
+		ubifs_err(c, "expected node type %d", type);
+		return err;
+	}
+
+	l = le32_to_cpu(ch->len);
+	if (l != len) {
+		ubifs_err(c, "bad node length %d, expected %d", l, len);
+		goto out;
+	}
+
+	return 0;
+out:
+	ubifs_errc(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
+		   offs, ubi_is_mapped(c->ubi, lnum));
+	if ((flags & UBIFS_CHK_FORCE_DUMP_BAD_NODE) || !c->probing) {
+		ubifs_dump_node(c, buf);
+		dump_stack();
+	}
+	return -EINVAL;
+}
+
 /**
  * ubifs_read_node_wbuf - read node from the media or write-buffer.
  * @wbuf: wbuf to check for un-written data
@@ -966,7 +1015,6 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 {
 	const struct ubifs_info *c = wbuf->c;
 	int err, rlen, overlap;
-	struct ubifs_ch *ch = buf;
 
 	dbg_io("LEB %d:%d, %s, length %d, jhead %s", lnum, offs,
 	       dbg_ntype(type), len, dbg_jhead(wbuf->jhead));
@@ -998,31 +1046,8 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 			return err;
 	}
 
-	if (type != ch->node_type) {
-		ubifs_err(c, "bad node type (%d but expected %d)",
-			  ch->node_type, type);
-		goto out;
-	}
-
-	err = ubifs_check_node(c, buf, lnum, offs, 0, 0);
-	if (err) {
-		ubifs_err(c, "expected node type %d", type);
-		return err;
-	}
-
-	rlen = le32_to_cpu(ch->len);
-	if (rlen != len) {
-		ubifs_err(c, "bad node length %d, expected %d", rlen, len);
-		goto out;
-	}
-
-	return 0;
-
-out:
-	ubifs_err(c, "bad node at LEB %d:%d", lnum, offs);
-	ubifs_dump_node(c, buf);
-	dump_stack();
-	return -EINVAL;
+	return ubifs_check_node_buf(c, buf, type, len, lnum, offs,
+				    UBIFS_CHK_FORCE_DUMP_BAD_NODE);
 }
 
 /**
@@ -1041,8 +1066,7 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 		    int lnum, int offs)
 {
-	int err, l;
-	struct ubifs_ch *ch = buf;
+	int err;
 
 	dbg_io("LEB %d:%d, %s, length %d", lnum, offs, dbg_ntype(type), len);
 	ubifs_assert(c, lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
@@ -1054,34 +1078,7 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 	if (err && err != -EBADMSG)
 		return err;
 
-	if (type != ch->node_type) {
-		ubifs_errc(c, "bad node type (%d but expected %d)",
-			   ch->node_type, type);
-		goto out;
-	}
-
-	err = ubifs_check_node(c, buf, lnum, offs, 0, 0);
-	if (err) {
-		ubifs_errc(c, "expected node type %d", type);
-		return err;
-	}
-
-	l = le32_to_cpu(ch->len);
-	if (l != len) {
-		ubifs_errc(c, "bad node length %d, expected %d", l, len);
-		goto out;
-	}
-
-	return 0;
-
-out:
-	ubifs_errc(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
-		   offs, ubi_is_mapped(c->ubi, lnum));
-	if (!c->probing) {
-		ubifs_dump_node(c, buf);
-		dump_stack();
-	}
-	return -EINVAL;
+	return ubifs_check_node_buf(c, buf, type, len, lnum, offs, 0);
 }
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bff682309fbe..7b412494b3b6 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -155,6 +155,9 @@
 #define UBIFS_HMAC_ARR_SZ 0
 #endif
 
+/* Dump bad node when node checking fails */
+#define UBIFS_CHK_FORCE_DUMP_BAD_NODE 1
+
 /*
  * Lockdep classes for UBIFS inode @ui_mutex.
  */
@@ -1710,6 +1713,8 @@ int ubifs_is_mapped(const struct ubifs_info *c, int lnum);
 int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len);
 int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs);
 int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf);
+int ubifs_check_node_buf(const struct ubifs_info *c, void *buf, int type,
+			 int len, int lnum, int offs, int flags);
 int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 		    int lnum, int offs);
 int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
-- 
2.25.0.4.g0ad7144999


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
