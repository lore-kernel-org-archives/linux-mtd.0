Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58214CEFC39
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 18:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9AlonZ1MrXEgXF5P9xfq9bf5Aa4AQmvPxpltaYz2ixE=; b=QTNXHVepZ3LnjZ
	ycG9KKGA8xdAKYMDbQd9OLS55qKLDkqrT6t3pTkilfmMSljp+/eieORCamIYeDsySVEawqXiklJjC
	2wFAF4Bm687GWaX0+zm5Lqh/oPfnnEaz1KR6JxqBBbO4pCQVwvlVRwpNr7yPawISYy7BPD9oW4kDO
	qjsfQG9H5rCG8J/rjLjkrIzGnGj0FnpS+yoI19nPLAD1apqqtTinMsvUn26jxYz/K1vZwOOmFv4I7
	SknGMxzMg4h2lcJ6OWlUL7yhJxqce+d6n8j+a8Z36CLTn6xknCtGs4SV2kLBHjSXgyd9JhwyHmFI4
	+ECApswdCl4bOFoFfDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syEvH-00000006mYR-1UpA;
	Tue, 08 Oct 2024 18:27:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEsf-00000006m07-3rcc
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 18:24:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b0b2528d8so67821335ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728411860; x=1729016660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrvlWnwoFV3e2edxctMJRWd6D69IO32Lv18UF7a4HnQ=;
        b=TQDvKBgj/4lJaWjbWf7h2gTrWkWnt+VyPrmVIpHBxmyEV6uHW1Qn7Tv6CTTfzwbiHN
         viHEO6RZwoveDRrGqZBxRzppf2VpEEEB1QhMIJbCaymF/en1GQ/d+7MGoGiLBkuA3GEq
         fXyhtPTm99xoUe4oTYx1HOQZWKQiPwFxCb5Z/prTpiG3BV6pSwhY3rTllCHmyBvaMnYi
         4/upeQz/5XQbIQsQ9HWkJK5C9+i8lP1VBllN+R+qDKVNTTpd3GBoMZM/PhKapxXvqfFK
         zgNbIRgg4YgD6KzT1a+yY0wXuHR/wdNRrbbwnmy47XjB23J5t0a9sq3JjfyPUz3TcMAd
         rKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728411860; x=1729016660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrvlWnwoFV3e2edxctMJRWd6D69IO32Lv18UF7a4HnQ=;
        b=ecWLzoGMTY6mvfTXwfqB+j7bQC5moksWP9utXKFHYR9ab/m/KQ4QFAKPar9zAuiUrX
         nVwD3G8O/9TxCvZMQnvcDaIJYlLY8y5Z4DuU9uQrhNCsj3qLGPisIr/HJ6DywzrZ0kK+
         5Rd+Cxdr9UjN+sdnzIi4KUGjKcx72p1MF5yNagZzgT5d3Vo7u1Bb4p5FqX9I5jgjYqjA
         p5CAyIWEwx4Pd2CssgkqiMXVTX6E4JFzYLmXzLPQzEOo2Img4vYEFEvhTOLibZuGlxBd
         kBTfSlG7okYyFA8PTgwOXlWg6cURZtP+PKbVWBt5LSNS32kyNoFOTjJlveu8sVh40z9b
         kLSQ==
X-Gm-Message-State: AOJu0YxNGtAtU9Qs6RCCpICuD6hiYG3yiFnXmaNoN5ix8TWZDxaXu0FL
	CRYVCbBM1+Ovk1wu/VrnJd5qURTsNuwIvCGVcOh+G22mgfA7QZsb
X-Google-Smtp-Source: AGHT+IFrC1BOX5fq3fT9GY+B4e+w7fOfAwRzhd364zGbc1qa8ApU9IGR03UBDYTaiaQwO53RvLNhGg==
X-Received: by 2002:a17:90a:e593:b0:2c8:6bfa:bbf1 with SMTP id 98e67ed59e1d1-2e1e626bbd4mr21589884a91.23.1728411860513;
        Tue, 08 Oct 2024 11:24:20 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:11a4:8d8a:9e8f:54c2:bf8d:2f83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85c8fd1sm9712450a91.18.2024.10.08.11.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 11:24:20 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	surajsonawane0215@gmail.com
Subject: [PATCH] fs: jffs2: Fix inconsistent indentation in jffs2_mark_node_obsolete
Date: Tue,  8 Oct 2024 23:54:11 +0530
Message-Id: <20241008182411.30387-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_112421_984296_7D4451EC 
X-CRM114-Status: GOOD (  10.02  )
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

From: Suraj Sonawane <surajsonawane0215@gmail.com>

Fix the indentation to ensure consistent code style and improve
readability, and to fix this warnings:
fs/jffs2/nodemgmt.c:635 jffs2_mark_node_obsolete() warn: inconsistent
indenting
fs/jffs2/nodemgmt.c:646 jffs2_mark_node_obsolete() warn: inconsistent
indenting

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 fs/jffs2/nodemgmt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index bbab2bdc7..cc51c85ef 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -630,8 +630,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
+				ref_offset(ref), freed_len);
 		jeb->unchecked_size -= freed_len;
 		c->unchecked_size -= freed_len;
 	} else {
@@ -641,8 +641,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
+				ref_offset(ref), freed_len);
 		jeb->used_size -= freed_len;
 		c->used_size -= freed_len;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
