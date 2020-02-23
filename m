Return-Path: <SRS0=rEYP=4L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA31C35670
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 05:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE542208C3
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 05:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U19UWUsC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XamsGeEB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE542208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EVO5KCQzHjQgf72ckHuakbelbKj415u/4d0w+ed7b2Y=; b=U19
	UWUsCCw85LT0qU+B0aVcBZ0/SOD5cN50ydplCnTGGxjJegXEwPZVj65XxsZmY4zcgGt7SzGTWlVFj
	shI9Rr6cjQI2UvYQU4CT+0tSX3VMOL7Z1AvRMj/SeFe5+ZKXVrdBVJhcgd4l+kYHxJA8N+uSyyDco
	9LWluF4IFjqYxE1QIDtv74X5blZAu5RvLoLGfGH0IcdJoefnJMDUrQn5uYaR1VUXct1AIkIVPlIpi
	iDOD9GZ0nVLXd4QLxy+nDBOfrf/ksvZCGVBQtN5il/urubf8keA54Kp1AV086C1tKJMElgG2NG0mr
	7/C1eL96osGL9aMQmnMU/M9YcHN2DzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5k5v-0001xK-DH; Sun, 23 Feb 2020 05:46:23 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5k5s-0001wV-C6
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2020 05:46:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id n7so3568579pfn.0
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2020 21:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q5drJhu0dSe3yU3emIQf8boY6kqQ/RTuUh9H+/FpqJE=;
 b=XamsGeEBsfkEa1xRUsCdmHOzmrTBolDiFk9S+/QsQ5jbcTpube8r2qTijmWzQvV2a5
 0CAue4j8SGP6QhuGFtm2ZhYuXHH/amDXmU/oGvULjRAEmVd6f7OzXT4AvoWPBz507PCY
 h2USh5KG9o4PaUJJOlSI4yhPkxX3NClgfwhyuQ3I89ub/h6XP50AoCp+vfNRwPFZntH+
 UYDi+VysO+LviNe1F2V02xB0ViKFzYZ7iQot6mNaawMAUtsVRzSVUpUosFgh+R4LoxpU
 dbaD41jsU2xkFJNXIFPcJl84UMNjkd79xJ2l2VyyQkqt70rCuln+M/8LOIw4VJu2aBh0
 3Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q5drJhu0dSe3yU3emIQf8boY6kqQ/RTuUh9H+/FpqJE=;
 b=i1T88jeNA9886dRkohSWwX1AmPCXkFZByvFaldjKQ6yKrsKQc9V0yaugXXCW2Hbv9r
 mreiRPsRIFoNx57oajy5udnME5lhgUMnVeSkQzwlIGdI1NZaOZlltOxcDIaZzV1J+MkS
 DDQO5vnV18i2J2a3o+k1/+N7EPzvztFFQqHEnVwGROou3//7L393CiB/RkYvb487iTr/
 8PKsmPI+R//agN9IO30aLV5FSIeYe2FUxd3x/7wR0YVsaa5mJSuRqu8Otcqz7Vs0tEvR
 CIuR2EJ0T40Li7KHTRSQKw0ZAAyv4yZq04UMJ49CxL3ZL1izWP3mGVNpzwcaDhCn/E53
 1SBw==
X-Gm-Message-State: APjAAAWQfo4yLJUAopUU0W/ARzpRgYdHpF8yR9RKZYVEcgUl+vAJC+40
 00rAK1EDWCKmbg6f4sKGpAo=
X-Google-Smtp-Source: APXvYqwe40XU8pLkdwH3NDyEQ4xw8tZov/JvBAzE8dV0fDHmFfYwV9IB9/V4AfL9tXsjhAqwSItM0w==
X-Received: by 2002:aa7:914b:: with SMTP id 11mr47192505pfi.69.1582436779350; 
 Sat, 22 Feb 2020 21:46:19 -0800 (PST)
Received: from localhost ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id v4sm7758034pff.174.2020.02.22.21.46.18
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sat, 22 Feb 2020 21:46:18 -0800 (PST)
From: qiwuchen55@gmail.com
To: dwmw2@infradead.org,
	richard@nod.at
Subject: [PATCH] jffs2: deubg: list_for_each() -> list_for_each_entry()
Date: Sun, 23 Feb 2020 13:46:15 +0800
Message-Id: <1582436775-14367-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_214620_415756_8EAA1C79 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Cc: chenqiwu <chenqiwu@xiaomi.com>, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use list_for_each_entry() instead of list_for_each() to
simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 fs/jffs2/debug.c | 65 +++++++++++++++++++-------------------------------------
 1 file changed, 22 insertions(+), 43 deletions(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9..6bef692 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -498,12 +498,11 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->clean_list)) {
 		printk(JFFS2_DBG "clean_list: empty\n");
 	} else {
-		struct list_head *this;
 		int numblocks = 0;
 		uint32_t dirty = 0;
+		struct jffs2_eraseblock *jeb;
 
-		list_for_each(this, &c->clean_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		list_for_each_entry(jeb, &c->clean_list, list) {
 			numblocks ++;
 			dirty += jeb->wasted_size;
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
@@ -520,13 +519,11 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->very_dirty_list)) {
 		printk(JFFS2_DBG "very_dirty_list: empty\n");
 	} else {
-		struct list_head *this;
 		int numblocks = 0;
 		uint32_t dirty = 0;
+		struct jffs2_eraseblock *jeb;
 
-		list_for_each(this, &c->very_dirty_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
-
+		list_for_each_entry(jeb, &c->very_dirty_list, list) {
 			numblocks ++;
 			dirty += jeb->dirty_size;
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
@@ -543,13 +540,11 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->dirty_list)) {
 		printk(JFFS2_DBG "dirty_list: empty\n");
 	} else {
-		struct list_head *this;
 		int numblocks = 0;
 		uint32_t dirty = 0;
+		struct jffs2_eraseblock *jeb;
 
-		list_for_each(this, &c->dirty_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
-
+		list_for_each_entry(jeb, &c->dirty_list, list) {
 			numblocks ++;
 			dirty += jeb->dirty_size;
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
@@ -566,11 +561,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->erasable_list)) {
 		printk(JFFS2_DBG "erasable_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->erasable_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->erasable_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "erasable_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -582,11 +575,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->erasing_list)) {
 		printk(JFFS2_DBG "erasing_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->erasing_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->erasing_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "erasing_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -597,11 +588,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->erase_checking_list)) {
 		printk(JFFS2_DBG "erase_checking_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->erase_checking_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->erase_checking_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "erase_checking_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -613,11 +602,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->erase_pending_list)) {
 		printk(JFFS2_DBG "erase_pending_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->erase_pending_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->erase_pending_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "erase_pending_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -629,11 +616,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->erasable_pending_wbuf_list)) {
 		printk(JFFS2_DBG "erasable_pending_wbuf_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->erasable_pending_wbuf_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->erasable_pending_wbuf_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "erasable_pending_wbuf_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -645,11 +630,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->free_list)) {
 		printk(JFFS2_DBG "free_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->free_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->free_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "free_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -661,11 +644,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->bad_list)) {
 		printk(JFFS2_DBG "bad_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->bad_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->bad_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "bad_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
@@ -677,11 +658,9 @@ void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 	if (list_empty(&c->bad_used_list)) {
 		printk(JFFS2_DBG "bad_used_list: empty\n");
 	} else {
-		struct list_head *this;
-
-		list_for_each(this, &c->bad_used_list) {
-			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+		struct jffs2_eraseblock *jeb;
 
+		list_for_each_entry(jeb, &c->bad_used_list, list) {
 			if (!(jeb->used_size == 0 && jeb->dirty_size == 0 && jeb->wasted_size == 0)) {
 				printk(JFFS2_DBG "bad_used_list: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
 					jeb->offset, jeb->used_size, jeb->dirty_size, jeb->wasted_size,
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
