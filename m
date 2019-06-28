Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFC7C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 02:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D55A3208CB
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 02:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JP4JlUhl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPILDhSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D55A3208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=POnyGsFjx+Ge5yo433Ke2083GYPq5WH8wXv7GNv34YA=; b=JP4
	JlUhlsfWRVze3nY6ZhJVrtqwu0xTFRixazUkBsFbtsHNvVZTC+TePU+7YAe7+j9+yP4nJxnnKLTnZ
	5QS5vQZfiqcwZVjE3gLcd1aWHptZF7hQLfYFZIe0zOO32TptfguMPymv/qa6WAP1NFrf364Vw7IJs
	xcOi7le7yTSa6+CS1wtQp5X63B8DkbjPvwC1dgbsqv8uacL8V8+4yjcX8w9Pf4yA7PDLk+JUxYYir
	7GAqpffvCWxTThCYanvezL5r9g7COk+fZjzJqaQkC1YnD1udjy33kzrbyvMid16Z1A1cgi/jGGxyf
	6KwJUSpk4tJZBiPIBH8d0EmRHPeSAaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hggyE-0002pe-Pc; Fri, 28 Jun 2019 02:50:38 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hggyB-0002p0-6H
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 02:50:36 +0000
Received: by mail-pg1-x544.google.com with SMTP id z75so1902750pgz.5
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 19:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5su9mFiVrtJtzhcekIAr3MXy4s+ZIx1z8ofhG+tteO4=;
 b=JPILDhSP5ATPbONpMDSBwpTg82BI4UcuX1NoYgJUbjQxN6tlwxmHHjHR6G2sI0Tc8s
 2cc4Tt0tZt9axEHI2/hrc2cyl8fq+5a3eXigZAfml1IbT0nbLcgfQvkIbarQWTMz2IU7
 oNQeEBzBNnGSj0ZEfmkScyeZ3i/ak2NI1BJHVy1Za1o1gQDTIKv/s4LmDpVwgRDZGomj
 uMGH3Zh+UgWD6KdNHcy4y+5/pOGyjMDEW4AvVpw399XmYlJp2cTsJvcYbjzEHf883nU6
 LjwBzhoQCFx2Zhq1RyOoWUjiPoJPPI5c1Xh+AK3ZTi0gyHkAET++zqWP4olGFL4ci6+j
 78qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5su9mFiVrtJtzhcekIAr3MXy4s+ZIx1z8ofhG+tteO4=;
 b=a/zYYp3h7vrq9lF13Zdwk5xWs6TsQ6pHUsUIajC4hbpqveU+MacDdY9xTpGO9Dxe3t
 pG6rtJvu3jAkbdAvsM/Lqk2CEouTObvs0cutwQvH8oCLHZxnxRcR8LOQIlYjpDt7O/ym
 EqgzneRAeKplcqgHaPLqi0U75BbqvHB0aocdm3ZNWaNucKHr77+WbN5p2/dP3MjcL6dS
 Pa3L/fWUbgtYcD/tuNk6qe2cSM9pOvYOI9pKwUsfAPxa9qOCSR3KNgxcvT8qZUrUKfs3
 TSrv5+C0Z6qvC/h8AneASrdlg6Q5cddDZlo7JfexgahopxfxBaaj9XBHDroIJjRT86Yb
 K3qg==
X-Gm-Message-State: APjAAAV8AtBY8tI2yCWGjMTBrcyadQYtu26zEGDXsQgW9TDU8XNvgQWv
 UWEY4XGW2iWSRMuUPmMpxi8=
X-Google-Smtp-Source: APXvYqxOkI+crx9UfEyNpvwC2KKY2yZ+Uu/fkdYowQKZoSujz9PfcJVdMSjJI8C3Q+qGHJXp9PQY+Q==
X-Received: by 2002:a17:90a:b903:: with SMTP id
 p3mr9942929pjr.79.1561690234777; 
 Thu, 27 Jun 2019 19:50:34 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id k6sm465209pfi.12.2019.06.27.19.50.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:50:34 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 24/27] fs: jffs2: use kzalloc rather than kmalloc followed
 with memset
Date: Fri, 28 Jun 2019 10:50:28 +0800
Message-Id: <20190628025029.16081-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_195035_231303_F6B23DB9 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Fuqian Huang <huangfq.daxian@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use zero allocator rather than kmalloc followed with memset with 0.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 fs/jffs2/erase.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 83b8f06b4a64..30c4385c6545 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -43,7 +43,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	jffs2_dbg(1, "%s(): erase block %#08x (range %#08x-%#08x)\n",
 		  __func__,
 		  jeb->offset, jeb->offset, jeb->offset + c->sector_size);
-	instr = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
+	instr = kzalloc(sizeof(struct erase_info), GFP_KERNEL);
 	if (!instr) {
 		pr_warn("kmalloc for struct erase_info in jffs2_erase_block failed. Refiling block for later\n");
 		mutex_lock(&c->erase_free_sem);
@@ -57,8 +57,6 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 		return;
 	}
 
-	memset(instr, 0, sizeof(*instr));
-
 	instr->addr = jeb->offset;
 	instr->len = c->sector_size;
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
