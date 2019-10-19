Return-Path: <SRS0=GZUv=YM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C97FCA9EAC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 15:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D0B21744
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 15:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IB/ySekY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t/Xpv5/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D0B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iqnfx4H/67w9Dtkw8p9rfXe1RFRjv1iRub+VFwirZl8=; b=IB/ySekY5wI+mW
	UgDwevi9ELovWf5ck3+jAullrjINgcpw4haYzbqVtG8h5uwjo0rUQJ80/MygnUKHZUmh7AwHCm9ua
	y/FLf3bvkvUSHWMZm1Hwixq0GORiSpnCFzs4Nk+wyCdePOFSAn8g71M42RXyrqUMcWsn29ER+Ns6L
	WAPyFvYNkfQ7PMvyrAccDWPTe3BiCoEPfmorX6xYZ0ZcU/b3jtbi1IiMz52hr57fJnze0ccbybWhq
	gRaJRXGnnFRpC5gMj7GNGLQMWNNNSaQUUDzuzN6jrFUgh8gvzwIrMF+D59gH12UKfomVEwpChafMU
	ubxzy0hJZO3ph4lYwWdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLr66-0007zV-W3; Sat, 19 Oct 2019 15:56:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLr64-0007yz-E0
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2019 15:56:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id t16so4132332wrr.1
 for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2019 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzaTmwLYG285iL8jff+IHR0hZuGYDIXHple9jUn7NPs=;
 b=t/Xpv5/X6dJrPKe/nFgtx8LTQs1qcVC+l1ZUbjWPyyBMr8j4AQtOdqWDdtZMVlEs8V
 1L1VCMxFF/W32q5/s9+bjp3pGFh7Z4n3GOZjnYa/HL55LU+OssiVnsFdtZBVR+mWdwsh
 Gt3VhkbVhNhYQEzl+kIJ3KMODP7oUOQ6NjCWblhTDfguf+5e3BQGCUzEnbjg2pKz3UOG
 7muy5+XuMCZxkXb+D9TDH0okd8QctHY3qpc4fmRP4d8PjZH8NAIZauhHi+pWAEx5oBwa
 iedC4v0rIUs6ZvUcSuEhTnNtGDmtCyHaxq2hiyomvfdOhm6/l5yTj7cLEqFjZ+2Cgs0W
 Zttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzaTmwLYG285iL8jff+IHR0hZuGYDIXHple9jUn7NPs=;
 b=ChwezMcrh+Oh2KQjNZdRP0Xrfu6Gz/3Pnx4aP2SKil04GMxNI8h+xXiXUAjdsVj6AP
 SGRJliGU3JaFwFZIBGUgHLi2P4k+XQjIsrbIQhBTqOJtJ/IJtABaIDVAluU7Vtslt56q
 q1c0A6rFx+ecIKT7X2fWACCa0xoZxI0Iy9PG7Y2YvtzLzeIFE5ByDeIwTbe3lHnx4q/w
 vBuh/6ZtOWp2QfqvTnv46iedgF45OPL6rT9uhvSrUP3tkCzGLUjuGcpu0qSSEE6mI9XH
 GSDQDEplWF2qfCyr7eLT7hUIvt5HVUcVULJU5Y6rWPSfNnDZbTcqPuykJoCfrUEQrsp9
 ShSw==
X-Gm-Message-State: APjAAAVwpLA7BwLJN7DgKcwqjv3dUEVhnR8Bb5lo5FHvX7ACAUXDo9OM
 +zuXf58vpsCYFpy3U4RAssW4osBTj4Q=
X-Google-Smtp-Source: APXvYqxldbQB9An9qqihNgE+boizMfQmt/btNA/7sSAxfrbyQnD62Ob9Me4L5YYcHtMb+86/muzFxg==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr7691705wrx.303.1571500609998; 
 Sat, 19 Oct 2019 08:56:49 -0700 (PDT)
Received: from giga-mm.localdomain ([62.68.26.146])
 by smtp.gmail.com with ESMTPSA id y5sm9392176wma.14.2019.10.19.08.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 08:56:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Revert "jffs2: Fix possible null-pointer dereferences in
 jffs2_add_frag_to_fragtree()"
Date: Sat, 19 Oct 2019 17:55:56 +0200
Message-Id: <20191019155556.3174231-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191019_085652_499659_290ED9A1 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: David Woodhouse <dwmw2@infradead.org>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This reverts commit f2538f999345405f7d2e1194c0c8efa4e11f7b3a.

Looks like NULL this is never dereferenced in reality because the function
returns earlier with "return no_overlapping_node(...)".

That's how mounting of a fully normal JFFS2 as rootfs looks like after the
patch:

Run /sbin/init as init process
jffs2: error: (1) jffs2_build_inode_fragtree: Add node to tree failed -22
jffs2: error: (1) jffs2_do_read_inode_internal: Failed to build final fragtree for inode #14: error -22
jffs2: iget() failed for ino #14
jffs2: error: (36) jffs2_build_inode_fragtree: Add node to tree failed -22
Starting init: /sbin/init exists but couldn't execute it (error -22)
Run /etc/init as init process
Run /bin/init as init process
jffs2: error: (1) jffs2_build_inode_fragtree: Add node to tree failed -22
jffs2: error: (1) jffs2_do_read_inode_internal: Failed to build final fragtree for inode #2: error -22
jffs2: iget() failed for ino #2
Starting init: /bin/init exists but couldn't execute it (error -22)
Run /bin/sh as init process
jffs2: error: (1) jffs2_build_inode_fragtree: Add node to tree failed -22
jffs2: error: (1) jffs2_do_read_inode_internal: Failed to build final fragtree for inode #2: error -22
jffs2: iget() failed for ino #2
Starting init: /bin/sh exists but couldn't execute it (error -22)
jffs2: error: (36) jffs2_do_read_inode_internal: Failed to build final fragtree for inode #128: error -22
Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.

Fixes: f2538f99934 ("jffs2: Fix possible null-pointer dereferences in jffs2_add_frag_to_fragtree()")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 fs/jffs2/nodelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 021a4a2190ee..b86c78d178c6 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -226,7 +226,7 @@ static int jffs2_add_frag_to_fragtree(struct jffs2_sb_info *c, struct rb_root *r
 		lastend = this->ofs + this->size;
 	} else {
 		dbg_fragtree2("lookup gave no frag\n");
-		return -EINVAL;
+		lastend = 0;
 	}
 
 	/* See if we ran off the end of the fragtree */
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
