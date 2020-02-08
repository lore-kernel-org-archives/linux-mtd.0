Return-Path: <SRS0=oRr0=34=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C11EC35250
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB99120838
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DITlGCoA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="g8ETqpmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB99120838
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A21nmxA5VPnYT/yEJXmf031GOxtybLa+zSRqfO6Ylkk=; b=DITlGCoAF+YYeh
	hIT5J7B3HPwuxynVApQ92MyrHfCG8vCNji1mFGwEYegOLzJUDh7RGrp2Zr6n/mkKuYuzmtFRliYnx
	5DprpM+Gp8VApvaV6+s2qdKBjC7uVBYzICaR8uOhNAn24CIE83swyJiZ8VjbJUL1irpkvG8UT9pgr
	MDzVGHEGXShOZI5KhqahbtIYzommIP7jh/rkvgs6DtI/Bre5qFbBueK9xjzyCe7uxrD/AcS4B+YN0
	V6DTfh1kli/hH3ItMxIl7IgxqQZ5vgJM5klEaYdtUR/nyY5tXM0yuh1P/a+14kmwQJLS82d01EXVD
	f62ZNpKrmqFotJp05kQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0F2h-0006dd-SU; Sat, 08 Feb 2020 01:36:19 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0F2N-0006Gk-S4
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2020 01:36:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id dw15so2352615pjb.2
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 17:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=;
 b=g8ETqpmpRRWAN/I/0ihQuyhV6cZrzbIoeWPe0HONBVPSLk67hHc/HvOH5Y3E3sfXKm
 osLLtnREDZD+rb6zzkHfRBvJ4qwb6tOshn0h48zQROO/wU8i8sGw0n8zAkLu/i4laHlm
 VC5SF2YtA82PkH2qCWdQZ3RA7cLHrzjuCckH/Zo905k7Bj/TUHVv0pdQVck5swTV6UjO
 TqoElEBtPPPO4CjPtYIJ6/4J5p2FrFj5rtoF9klcjg6S6LJUJF4xprkxdTmeJM1Cviks
 gEoth9u806ySIHFmhgq9F7gJ08gTEEDvk84fAtCnN59hxoWQi08SIbLfXedYovWzn5eQ
 qBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=;
 b=Idxuwy/TINlf0qKEb+sCyWOxRBaAOqC6vWRMHwvb8CN5qlJ18kKI7xoaMHq/3ODc/f
 UBDJtKXXwAMQh14l8vfXQz4C0tR7EC+tqMrxTQRS/qq8UC5nGML7D8G6GeWR1OR6S92X
 cQJPZi9KrZn2YVoeXcVjbdInefiwUbXLP0BxEZn8WhlJWGo6iRmqk/rwzU6nas1bc7f/
 wy458YGTmz0GOuA25hr/3VWr/ooZPlWjr2IZiMS+JHHVxvpa/qfLQlKC1ioU5HSa6vih
 ZORv+gxkundxEvBfQUnmSWXkRaIAmVhCNWHzBIxvJeTab4NbHIr0mLOiy3/8AH4b39z9
 mnFw==
X-Gm-Message-State: APjAAAVE/ExuaTVJu/AWo6blXxbg6hZo2wERGoJsCbZBfrBb5j/wn4xr
 L4v7708SyDJQyY+TJZWCE05XtRN88CU=
X-Google-Smtp-Source: APXvYqw8lDISo/3URgAqCG25ywWyahbrkFc0mVlthEd962mlaZLm/wh8kHzbBfWez9CSIlqY/2EODpA3fUU=
X-Received: by 2002:a65:56c6:: with SMTP id w6mr2149182pgs.167.1581125758626; 
 Fri, 07 Feb 2020 17:35:58 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:45 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-2-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v7 1/8] unicode: Add utf8_casefold_iter
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_173559_908725_86FD6B28 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This function will allow other uses of unicode to act upon a casefolded
string without needing to allocate their own copy of one.

The actor function can return an nonzero value to exit early.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/unicode/utf8-core.c  | 25 ++++++++++++++++++++++++-
 include/linux/unicode.h | 10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 2a878b739115d..db050bf59a32b 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -122,9 +122,32 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
-
 EXPORT_SYMBOL(utf8_casefold);
 
+int utf8_casefold_iter(const struct unicode_map *um, const struct qstr *str,
+		    struct utf8_itr_context *ctx)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur;
+	int c;
+	int res = 0;
+	int pos = 0;
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	while ((c = utf8byte(&cur))) {
+		if (c < 0)
+			return c;
+		res = ctx->actor(ctx, c, pos);
+		pos++;
+		if (res)
+			return res;
+	}
+	return res;
+}
+EXPORT_SYMBOL(utf8_casefold_iter);
+
 int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 		   unsigned char *dest, size_t dlen)
 {
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 990aa97d80496..2ae12f8710ae2 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -10,6 +10,13 @@ struct unicode_map {
 	int version;
 };
 
+struct utf8_itr_context;
+typedef int (*utf8_itr_actor_t)(struct utf8_itr_context *, int byte, int pos);
+
+struct utf8_itr_context {
+	utf8_itr_actor_t actor;
+};
+
 int utf8_validate(const struct unicode_map *um, const struct qstr *str);
 
 int utf8_strncmp(const struct unicode_map *um,
@@ -27,6 +34,9 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 		  unsigned char *dest, size_t dlen);
 
+int utf8_casefold_iter(const struct unicode_map *um, const struct qstr *str,
+		    struct utf8_itr_context *ctx);
+
 struct unicode_map *utf8_load(const char *version);
 void utf8_unload(struct unicode_map *um);
 
-- 
2.25.0.341.g760bfbb309-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
