Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF196C5DF97
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FWks/gvmmKrrTxUAbr2feiewZU6po7vjflVqm5egkek=; b=ciIMTe7/KZumC1
	G9Y0/ymf2FBLJKNHog35EiB2D6WToYRhEEfVstmh+yO9VbBZGnxX7RBOI0s+AjgjjVNR3lACRK2XW
	rjb2Ky1n+VrnU0mEHWHlXhEkDZWXqF5HLAowafv7KHhmWatXugib8ttmC5B8RYNAweb5/BGBK8QiY
	bVlgDkzypI+IdYaWsOtelwnsz7rsf5vEtbdwTlROKRjGc+xmza4wPhZ31h4+4EcUmgBrrJ9ZjAfA+
	3rYjQpkaz/eGbqYkwVyPvrsjaFF1SA+FCymWal4CUFaedpcltAhzcElRmqlCkGqCylug92pdlZ3TE
	YkiSHC6eP/4F6w6KRTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyA6J-0000000FRyX-1zCA;
	Sun, 23 Aug 2026 15:27:11 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyA6G-0000000FRyC-2eul
	for linux-mtd@lists.infradead.org;
	Sun, 23 Aug 2026 15:27:09 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84874b52eabso3509130b3a.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Aug 2026 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787498827; x=1788103627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIY7WaBiWDuMk4Ug3Sec8WCYFhCRZwFV1Nj4gg2AmMY=;
        b=LtxfDtEFR4WJzrvSTUwSyhHX5QFkVk437XPyn6d1mQdt0vZDndoghD77XWJTLQDVCg
         4iaFDNsL4T6UHC6FkQ2tCxjs5WjDOrABY8stNrud6T7VtMPCVztJVhbgB1gB/nNJxTgS
         9v6Ai+oG0Zw3BYBP2pECqRgNa5NS66cFQaTWVleRBou8ihINMDmwmxfXgkybxdMMJmEI
         wJxQZ2XoIgRUzTZDQSubnlPaYun9/Or02iKTJ9OSRd4DDhUEVFKyW6ALx55Jl1An2UOb
         WtoE8PDgdrG6pPPYgWvCx6Tn82XwPTLg00dwyW2k1Kga28ktlquHWDX/WroG3ex6WbLB
         UJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498827; x=1788103627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIY7WaBiWDuMk4Ug3Sec8WCYFhCRZwFV1Nj4gg2AmMY=;
        b=qrZlR5JY38tuuDUKonqgHXvjR+SwK/MmXGO3sLgtXji/Vjh1ckWL5jfL52/2pX0XHC
         FTB+qt9xXw13yr1U1+icasIvCbhNOP/kaC+bAOsVct2CL/zMgBDzc0tMVxkMDqn8rhHN
         /49N4PW7UpKi3OhGFNVrZZsKan1gp/Nt/eATluZNmnsimcD5T4Vv19le3OF+zkDrL6Ow
         Aw3NUqhbo3TJ+FZooxz1Lh4A5Hw2fgAVlKew5f/0pxMar9lChEdnhGf4+ol7AHpfHmqo
         16kJMlHaj1un6g34qEoZfxwOj0Ajl3NbyVjIjzj+NNakyX652QQlHzKI/7bhQgvRQo3h
         susQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6jaDqkCs+SMhFFOuoFXucGK/OrPzKYOkWJXgO78GGG/fKu5+GrbX99L1XrkqId4YNuTg2PeG2KHU=@lists.infradead.org
X-Gm-Message-State: AFuF++nuntV85vZKbt/Ud7bfcvdJF9YeQGZAxvk/aHn35J8k6PuGwr7w
	OLncMjecE+8xq3Gr6DtdhTh7/dSrnVoDLp01VjB7qQaeipIQPupjKXn4
X-Gm-Gg: AR+sD13iREqevTZLADXtg01geTUIWAbxo4xFiB21898CdTHl9LHrLOFfqMgvj9VwO8U
	gwrUEYdo5Ng0RJwXJ2nlSG4cvOEEIu6ZE9e/lzvxuKMjZPh4vsvfP7S4AHBYtE1Qns5YbesrHlT
	u0s88UKbWJihK1kVqf1AjhMYa66oR7TLJxv2XuNAt9da5iPM1TyNIakHxz2INWWjC2Z2+x1TNq4
	g+aWGS42dkZswfi+1X6YQE3eZVYIkS0cwwwDiarZ9l8MLhDrsrM1OMkbpkgOiYN9XTeuAfxBZpn
	QfPjwmMMv4e+6os8NXN8nfBOe8hhAEiQVmucFbEmWh32W2h71fw1X2Hbm7C1+jn6Pru3xP0on5o
	ffpa4uaTTJtAHYeUva6wTzfO9KUiSUuAVgmZeoiZgFhJMEsF5QQCzVgjcHeEa7eBQ5KS9Jz/hte
	aabFLZtVqEO3UaFPKOpaaeA9/hjBaviJuvX2YPV7eQ401A0RJqVI+8UyTzObba8G/WWZrEQNnun
	ndrBnbiaW0fKsCW8admfFzJ
X-Received: by 2002:a05:6a20:1605:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cd3003dc4fmr41784577637.13.1787498827000;
        Sun, 23 Aug 2026 08:27:07 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:4c70:ff68:1915:e456])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90e22f8sm15320206eec.13.2026.08.23.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:27:05 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: kees@kernel.org,
	viro@zeniv.linux.org.uk,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Subject: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
Date: Sun, 23 Aug 2026 20:56:48 +0530
Message-Id: <20260823152648.23136-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_082708_673783_6540DDB8 
X-CRM114-Status: GOOD (  10.62  )
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

jffs2_alloc_inode() does not initialize f->target before returning
the new inode. It is normally cleared later by
jffs2_init_inode_info(), called from jffs2_iget(), but that runs
only after alloc_inode() has already returned successfully.

If inode_init_always() fails in between, alloc_inode() calls
->free_inode() directly on the half-initialized inode.
jffs2_free_inode() then does kfree(f->target) on whatever stale
value was left in the reused slab object, which can be a pointer
that was already freed, causing a double-free.

Initialize f->target to NULL in jffs2_alloc_inode() to close this
window, and clear it in jffs2_free_inode() after freeing it so a
reused or re-freed object can never carry a dangling pointer.

Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/jffs2/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba8..30d753d4c263 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -42,6 +42,7 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
 	if (!f)
 		return NULL;
+	f->target = NULL;
 	return &f->vfs_inode;
 }
 
@@ -50,6 +51,7 @@ static void jffs2_free_inode(struct inode *inode)
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 
 	kfree(f->target);
+	f->target = NULL;
 	kmem_cache_free(jffs2_inode_cachep, f);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
