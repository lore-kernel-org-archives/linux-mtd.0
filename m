Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532F9CD3424
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvtfmH56HKJq2pPtCIIfwtB6OBVhtlo3h8CqQGF+5zk=; b=xYXWNlujyn4Ufi
	1JYpCfgRD3WYYuWl9FNnz5GL/ajC2bFh9tc+zLrKsHw6cdXS2XtZNPH5btlV6ENo9ygIPZpVkU2d2
	rupPTxUGGZ009vIp0zlnAQNwWHh1UPilc8MciR7zOX9qFygImOV8FvDMGIZD9p3dvH6+3fcnQpWXL
	w5fOOQ8jqkCIaApYMHIwIlILKyeQ3VcQgqIhtoftXtWID2u2QLornYMOWk8cIPOBCkkVLQSN0qKkx
	8iZAGS7C+PJ96+dgQewDzmoP1K++5ZZKLoExvrBUOfzI7h27bLyKVT0NN33u9WljWlPUg1s0TjVuZ
	YbMS/1fjLMJ3+O/YYP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIle1-00000006bjn-3N3h;
	Fri, 01 May 2026 11:02:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIldz-00000006biM-1qip
	for linux-mtd@lists.infradead.org;
	Fri, 01 May 2026 11:02:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so17630495e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 01 May 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777633370; x=1778238170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+0lxbCgi4fdg+cPkHoOKKRDCXmHxPZDe6bIN/WeBEA=;
        b=tOvRUUW6SnLqZnvWeMmEtOnnYJqzEtmTHhIB9JU/ISgY4Aut2sqF0creiOfl7wyOgy
         aQWmR30G6HXBUICl5tKObxU8ASs82LNli/gKiE/dWIUf2uCYMEk8BIOzhBlJ5gKfl0fX
         ld+4HDO7k2BGjkfNKpGh7652c3e215aV4cIbhsp+4EOF6tGINPvHDDhK0lHFYjxMVWAr
         R1+Ikubt5Gd+VBX1/wGVTUL8aCzV87qJJx/7AuKG7aECb6mwn2tt9fQItUPHihHGCenr
         vX/PVhid1VBMe0tQnoT6RgnW+pCcR2zf2wN2CLZh2TGEpVz9anBPmXsydyYpQgokVpjB
         omCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777633370; x=1778238170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+0lxbCgi4fdg+cPkHoOKKRDCXmHxPZDe6bIN/WeBEA=;
        b=QE0eQNvL9mYMqdtyv5Nt7hfezO7FSMZkcdLX0EgVIquw9BzHamEGfJmtZSxZHj1nB8
         FlkGm9b0V2taekOYae9QIf3s0thisQA+Bd3aSJUwHfkUs6h3d7+dZRbJ7n6rdd0HA1zA
         0S5J4CjryU9kwdHNZTdkDXiZd6KRX/GvLg0QyTzzhATXw+gzalH2zkpGxrPZNc1mXszy
         h/rdiEKgqPRgeq8+D9CXWXPWyqSiy+W5lhAcEU1SNXGMHuFsQBvJ4UIWuyuqwLnoWsPQ
         HCGiDTPX8daX8Ok9p9owEaYpr+Og+t00FNc7VS1pCm2WS4o7UTKdCVsAxvBsjjXc7jJK
         6hYA==
X-Gm-Message-State: AOJu0YwwIl3aUCxVLKWZLtxlme7fkGs5smTDI8FYAoUuzW85mnsImxOT
	tNDPayCdYncwYD1Vp/+iRzm5xugqWLAFC5hu5n+9eobgkHnizsRD6Pg=
X-Gm-Gg: AeBDieuu1aLx7h06gnOh54/blcX0yy7RCwxR27f25bCTREKUEO3dRoqwr5Gv+vPIdz+
	L79k7EHy7Wqn3d/QeB98mFDEmHwuac6/bsNMUd1XLIeDrzxleGWq0kUeok4AJYqbmT1gqx3mJuy
	HLt2Jz7HHxEnCTF0k+iE6KqufYKsh2MWH50kAPLNIUjSSJrFGP/4Bur35oNBTOvWWKcC4BAFZ8J
	CNWTJaB5crQ6Tk3HPTI38Y+wuWb5aq5LuMb4DX6FbGhECL3YBpELV/vOmno4VrVY+Wp4JqOQYfU
	tFDw92RZQhQYnhYsOu/JMBjQL1wTHV3LF5aDv1rC9nRhw2ebK01Y3t8Iurwb5md3yrNQpNbXXMf
	SkEQAgNyCxBAoYY0d9p1YMz/Bk/zJNusPWp2L7pJIO6D3sU7YHE+be+0hOu+tpmdV4Q225qgASg
	SjplpBQlnESfWzag==
X-Received: by 2002:a05:600c:8710:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a844448f9mr115645805e9.10.1777633369516;
        Fri, 01 May 2026 04:02:49 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm79491905e9.0.2026.05.01.04.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:02:49 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	syzbot+61a9d95630970eece39d@syzkaller.appspotmail.com
Subject: [PATCH 3/3] jffs2: fix GC thread BUG_ON during reconfigure via fspick
Date: Fri,  1 May 2026 11:02:46 +0000
Message-ID: <20260501110246.50647-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501110246.50647-1-tristmd@gmail.com>
References: <20260501110246.50647-1-tristmd@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_040251_494505_95A43783 
X-CRM114-Status: GOOD (  16.91  )
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

From: Tristan Madani <tristan@talencesecurity.com>

jffs2_do_remount_fs() uses fc->sb_flags to decide whether to start
the garbage collection thread.  However, when called via fspick(2)
followed by fsconfig(FSCONFIG_CMD_RECONFIGURE), fc->sb_flags does
not reflect the current mount state -- it only contains flags being
explicitly changed (as indicated by fc->sb_flags_mask).

When fspick() is called with flags=0 on a read-only mount,
fc->sb_flags has SB_RDONLY clear (since SB_RDONLY is not in
sb_flags_mask).  This causes jffs2_start_garbage_collect_thread()
to be called even though the filesystem remains read-only.  On the
second reconfigure, BUG_ON(c->gc_task) fires because the thread
from the first call is still running.

Fix this by computing the effective read-only state using both
fc->sb_flags and fc->sb_flags_mask.  Also unconditionally call
jffs2_stop_garbage_collect_thread() before potentially restarting
it, which is safe when gc_task is NULL and prevents the BUG_ON.

Reported-by: syzbot+61a9d95630970eece39d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=61a9d95630970eece39d
Tested-by: syzbot+61a9d95630970eece39d@syzkaller.appspotmail.com
Fixes: ec10a24f10c8f ("vfs: Convert jffs2 to use the new mount API")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 fs/jffs2/fs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 6ada8369a7622..33574312b7abe 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,28 +396,28 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	bool new_ro;
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
 
-	/* We stop if it was running, then restart if it needs to.
-	   This also catches the case where it was stopped and this
-	   is just a remount to restart it.
-	   Flush the writebuffer, if necessary, else we loose it */
+	new_ro = (fc->sb_flags_mask & SB_RDONLY) ?
+		 (fc->sb_flags & SB_RDONLY) : sb_rdonly(sb);
+
+	jffs2_stop_garbage_collect_thread(c);
+
 	if (!sb_rdonly(sb)) {
-		jffs2_stop_garbage_collect_thread(c);
 		mutex_lock(&c->alloc_sem);
 		jffs2_flush_wbuf_pad(c);
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	if (!new_ro)
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
 	return 0;
 }
-
 /* jffs2_new_inode: allocate a new inode and inocache, add it to the hash,
    fill in the raw_inode while you're at it. */
 struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_raw_inode *ri)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
