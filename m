Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F48C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 11:35:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8406198B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 11:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8406198B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9qH87YVwkqrTKF045BGjBPt36YWTb1hUoA4NlryVWs=; b=BHVAZm9VU4nMTsDVHqasLqvto9
	NJh5QgqmBNGv4PalYfkMSvfg+745QpqmOx6AycuK/CbrLIdfz2knfV/8IDhncWEQFZvpc2gIP8iFz
	17OmLNbMYkGyDAlBExlTD5F2K26R0M4ucuEH3PRmI0tp8B8ga6u/eltQh1lOU9vacqiL7P/ua0KKT
	si4Wi7aNR0ocuvYxZyhrFQMBDMkJ5nHTV/4vIjef8p+UWSbPND+viv35ew5J1bADwtZAlPd9/PDDR
	r25AVs5S7mwhZWZLZTafvflWZof3qUwQrthiVFdTqWWWLbGcUOMIEVi6J0jmQoyKoqWyYRirQzXbc
	FOUs0MMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIpY-00BTUK-Fo; Mon, 22 Mar 2021 11:34:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIpT-00BTT4-Ax
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 11:34:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA9D06198B;
 Mon, 22 Mar 2021 11:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616412878;
 bh=WOJn3MilWpAvLS3chkKdd2cGjmreOdFbGDpQTcekL6k=;
 h=From:To:Cc:Subject:Date:From;
 b=lJSs0aAy+xIkv/NifyM67kYKGfafnVHmdY8oNXXd7mVd7LfBpylUFh7IgFFjgW9AR
 A5MsiQ23qPVM7v7LAMjLCoajVmAd0bPfM7dC9JJSMVnW2uS+xPPCpt9a06Sq+2R041
 xG5ATl8kLn/oMQ/AkDnh9wuN2zE8NoxmIcRMVvykSy9L+BVmDqG2k9XT0xPNcQED1/
 E51Egkp+kICTwFPqZgv13fFb8ckPffG2GxKJCSJXdWDmkd/7fRKcMPqArKBA8lbRoA
 MJI6DdsZ0G9C3/uh7mFTZv+JD7dWANRjZgq5ER1YMdf9ROhEDTaYGx1L9GI1KVGTv5
 Frmnf0XZm0DpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: avoid Wempty-body warnings
Date: Mon, 22 Mar 2021 12:34:29 +0100
Message-Id: <20210322113434.3068844-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_113439_954033_E742F97D 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows a few warnings for empty macros:

fs/jffs2/scan.c: In function 'jffs2_scan_xattr_node':
fs/jffs2/scan.c:378:66: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  378 |                 jffs2_sum_add_xattr_mem(s, rx, ofs - jeb->offset);
      |                                                                  ^
fs/jffs2/scan.c: In function 'jffs2_scan_xref_node':
fs/jffs2/scan.c:434:65: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  434 |                 jffs2_sum_add_xref_mem(s, rr, ofs - jeb->offset);
      |                                                                 ^
fs/jffs2/scan.c: In function 'jffs2_scan_eraseblock':
fs/jffs2/scan.c:893:88: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  893 |                                 jffs2_sum_add_padding_mem(s, je32_to_cpu(node->totlen));
      |                                                                                        ^

Change all these macros to 'do { } while (0)' statements to avoid the
warnings and make the code a little more robust.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jffs2/summary.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/summary.h b/fs/jffs2/summary.h
index e4131cb1f1d4..36d9a1280770 100644
--- a/fs/jffs2/summary.h
+++ b/fs/jffs2/summary.h
@@ -194,18 +194,18 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 
 #define jffs2_sum_active() (0)
 #define jffs2_sum_init(a) (0)
-#define jffs2_sum_exit(a)
+#define jffs2_sum_exit(a) do { } while (0)
 #define jffs2_sum_disable_collecting(a)
 #define jffs2_sum_is_disabled(a) (0)
-#define jffs2_sum_reset_collected(a)
+#define jffs2_sum_reset_collected(a) do { } while (0)
 #define jffs2_sum_add_kvec(a,b,c,d) (0)
-#define jffs2_sum_move_collected(a,b)
+#define jffs2_sum_move_collected(a,b) do { } while (0)
 #define jffs2_sum_write_sumnode(a) (0)
-#define jffs2_sum_add_padding_mem(a,b)
-#define jffs2_sum_add_inode_mem(a,b,c)
-#define jffs2_sum_add_dirent_mem(a,b,c)
-#define jffs2_sum_add_xattr_mem(a,b,c)
-#define jffs2_sum_add_xref_mem(a,b,c)
+#define jffs2_sum_add_padding_mem(a,b) do { } while (0)
+#define jffs2_sum_add_inode_mem(a,b,c) do { } while (0)
+#define jffs2_sum_add_dirent_mem(a,b,c) do { } while (0)
+#define jffs2_sum_add_xattr_mem(a,b,c) do { } while (0)
+#define jffs2_sum_add_xref_mem(a,b,c) do { } while (0)
 #define jffs2_sum_scan_sumnode(a,b,c,d,e) (0)
 
 #endif /* CONFIG_JFFS2_SUMMARY */
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
