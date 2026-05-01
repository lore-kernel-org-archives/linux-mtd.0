Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57764CD3427
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dnFgJ+osoMR/ifqGthhQPZDxCo/Idn5u+5J/iE04Uak=; b=VdDqhq2pK69GjV
	3cNKmDrH1/N7CgF4I0e5uO8MN3/Q98vsa1yPmddqVpPnv5lv9qFftbzrtdMe9szaD8q2BAREXayPZ
	btCOMs3Cfs/bA2v2PNKhuHgK19Lkrs473uHNpoYebAAHI/XbZCmA0UL+OWYICrUDG/tVFi+8XI/QG
	NdPu6jcYJePF2bAN0D4v4TAr1wDkamN9EZKmbjn9he/W67GRa6p7xIw5Fva4JqqDm0yDyb4JKPcF3
	KZwU97vw/37e69Kb/Xqi7Jvwnh3PEt4kCZn1F7fVnIYkBICirI4AyHMrhrUeI+2BthF+yR5xUn+sf
	mwJMZybblcL32eOEq7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIle0-00000006bjM-3Cnp;
	Fri, 01 May 2026 11:02:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIldy-00000006biJ-2NO2
	for linux-mtd@lists.infradead.org;
	Fri, 01 May 2026 11:02:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so15065505e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 01 May 2026 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777633368; x=1778238168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+8L5WJt5aFDWaIjaWK7lYM1zW6O2ZzLXWTAE6+TQR0=;
        b=TgpOb5bczm+NwUb519thKWz+xSsFs5btjYLep1Crnh+nNxpi8FUvOT54/ru3yNhL7l
         td2+ZoBeuTKsj5YNj+wSlGt93hFVGN8/oULscY1P0lwOIgwFN+dbyZKJVEoXmRT/hFtb
         10u37Z0Jkj4E1UqDJyvAaXPH6C4JUeKVLh8paPqdSmzrA1upPH8AFWYZTw07yJl4dZZx
         Y9JqKOzLbHRCRiQupy68Rk1XR3o4awsW0xu2fqycFyG3/AuetEyzbqBRHez6GfsrjAtp
         M5bfmoRvcxzfqpsthG5pcgVBnJmPE3omGk0UbXwoH5yInf52UYzUKsQCKn6BrQfgSpP6
         CcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777633368; x=1778238168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+8L5WJt5aFDWaIjaWK7lYM1zW6O2ZzLXWTAE6+TQR0=;
        b=F5wwDFL9rIkiqd7qe+0Qa6XEmXsbQBoawq3mdCNrzbvknrVgRg2hySC21BgFDmCkWr
         KS3XVJoN2DMJWbyjYcsaXkvWEDgEePR1scCv5B3vX+kMRcrDvyp9+J/aSsemcytKiscD
         wNI2qJXMBL8Q+dt9ZFPGEK/7LqhMCVGOJfDXLCXFM7ELF/4GTL+ITxzcBb2XM6FIldAn
         Y0wKOeDJyX8ZEDrwCqASE7K3QjZ+24jHMm82VQCM5cgUTgn22HDJo1KkKKuyphkNC9gZ
         TxlQygWvZA10PtHsfCOjN0l2QbkV1Va5ANkZhFLjVxqtyNDXy7+E4bw0/2gLpVlJXzmt
         ekwg==
X-Gm-Message-State: AOJu0Yyy95JAY81kIhZC9A4V9r5cW4/N4Gq9Q3eeCBtlU+kzb5TNDFLw
	cJ6cFdDmDZwGFOzN3snWppFrtqCvTMl7gbwlzerMfuEtZa7Y6Mn85TU=
X-Gm-Gg: AeBDiesqS+NQNmGWcT8pinn+rNqMVwGO/Q8cKUsfb71W8qHq/taaOzhbV+c7DdH9x7S
	EQu3gVR3/0fvihcCmf2NfMUJY/e7bt4zSJTibNQaJHF03K85/Kb21+JkLxkSA3vAS9V4KvIVPBr
	Z9uKwXrO17wO9tRrCsVypU9VHdMUxYsIUDpq9bXgfm3Cz+V+/zV2pTrz/e2TCItTZ74RNs2cttY
	Z2NJHFZ9lrNd4XKFyTmdMTXHlJflGpweEOMKnHOTbVhcC7AOuWmjY7w6ZL4cL7cTYxqaUe1mQkm
	Zxr0SAgDVPzaJcEH9HE0pq93awds/7Gk+Rn1LE1a2j+VjcbvJ8ms9Yv0LU3XHOG9kFoy+ZPl2i0
	nEmI9TX7jGtvelfdqzcHGFCH1U5ScFfs+KpsKSvgVBGTiPpYTdV87Ovu5B3r2otG08jIXzh7f1K
	RMPGt2DkJSm19OSQ==
X-Received: by 2002:a05:600c:8901:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48a83d6e15fmr81071565e9.3.1777633367941;
        Fri, 01 May 2026 04:02:47 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm79491905e9.0.2026.05.01.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:02:47 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	syzbot+e84662c5f30b8c401437@syzkaller.appspotmail.com
Subject: [PATCH 1/3] jffs2: always stop garbage collection thread on unmount
Date: Fri,  1 May 2026 11:02:44 +0000
Message-ID: <20260501110246.50647-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_040250_612862_53B49D6B 
X-CRM114-Status: GOOD (  13.75  )
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

jffs2_kill_sb() skips stopping the GC thread when the filesystem
is mounted read-only.  However, a filesystem can be remounted
read-only while the GC thread is still running.  In that case,
jffs2_stop_garbage_collect_thread() is never called, and the GC
thread continues to run after kfree(c), accessing freed memory.

The GC thread accesses c->gc_task, c->gc_mtd, and the full
jffs2_sb_info structure during jffs2_garbage_collect_pass().
After kfree(c), any of these accesses is a use-after-free.

Remove the sb_rdonly() check so the GC thread is always stopped
before freeing the superblock info.  jffs2_stop_garbage_collect_thread()
already handles the case where gc_task is NULL (no thread running),
so this is safe for the common case of a clean read-only mount.

Reported-by: syzbot+e84662c5f30b8c401437@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e84662c5f30b8c401437
Tested-by: syzbot+e84662c5f30b8c401437@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 fs/jffs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba88..c846b435a38b6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -345,7 +345,7 @@ static void jffs2_put_super (struct super_block *sb)
 static void jffs2_kill_sb(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
-	if (c && !sb_rdonly(sb))
+	if (c)
 		jffs2_stop_garbage_collect_thread(c);
 	kill_mtd_super(sb);
 	kfree(c);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
