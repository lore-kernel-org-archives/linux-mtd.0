Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14660C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 02:04:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D34610A3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 02:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2D34610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1QtW89zXVHfi8omqgbvqb+rqSCiAt1hOcP0yXtxb7Y=; b=BHquplDexHKx+x
	YQArXrYG6lhEShf/vfKbM4cE1FxQv1wGeh1TlYgQq67COO+k+psFj0k8mJJ8ec0/LUB7N63EJ4zJa
	EWyDas3cR9MU9CZlzoXHpSt5IimGaGNzg5eCkpVy/f+2w0cvTBkK+LG/9hLPk5x5B0KEKGCNY4pVw
	cvS/Up8Odfh0hqvh4EdxoD7ju2//t+FtBaF0x85RTecQZ1frXSYO0gNszFWh8kyYBwiwdNATgvkFf
	em0vhYFRo3CF1rNJ/7163P8Ms6bdFpbkcNZuPFyLhuMbyDz5x473sMaReum9TdFJxQdTNTZRwAbHz
	6XjsmpjrIJ0NtR2ICnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYIh-003XuX-M2; Wed, 27 Oct 2021 02:04:23 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYIb-003XtB-En
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 02:04:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id c9so499367qvm.5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 19:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8EX3z0PmgSLSoaGYAGZF7eObBwpILXqp8huU307IME=;
 b=Qrsyc+ohpF2siZtSmMi1YCLm6GxGzrPKiahppPPfqSASi5FB0z3pEJRxUiXcVbx6DR
 ysGGFVa0tOxD+Nclyhm6biH0NjzOlJ4y3cIWlew+slIMpm4zKw6juGvfejN2z0szd7Bo
 sotfLXixCgQ1XuUwq+O1157CMqlRW1SMQt+iCW2J6BydVqt4AbprRNo7QS4cwXfb21Di
 zsPeWR6edy+5vaYsj+zW1KPzKT5zhG9td8oh22fAH1zWQGMwPS/x/V4K/L2tuyLzHJ4h
 vFApcWvpP9dl7ZW5Zttb1yoEK9OoYmwqtT5QfEo/iDyDrH2GHnx6ROT8KlctzLII4vbo
 utaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8EX3z0PmgSLSoaGYAGZF7eObBwpILXqp8huU307IME=;
 b=l2FJRL5owyJ3nY1c6TX/XMFSmc3Jrwc08YEzANcY9QEp+2svAIhZQ4GIaQzFeaoJJn
 AgZFFT93VhtgndQg+IpsA/EZeYHjUh+lc2zDg7zVO5cFUHtwNhLwIYysfAi7fOOYeTIb
 axKf699myIPiJkykzkzi31s5U/IziROl6wfp8g7Heg2CQb8zKeqNm/OW8fgMlHH+vTfE
 ktFFobvC5zusTCnZeHaZNsSXLRvudTcUqnqw6I8ZQRKRUfrd3q2MKNY0TBUpLIIJDUtJ
 nJB8tdURFNRncFa1DDlysCzBd5kW1OxpOlhg39pm/hbqDJNxdxTpRspNn2K8xR+CQAQU
 dVRA==
X-Gm-Message-State: AOAM531cxWBL9+UDuNu1Yaoi++ZyoGnOYD3Iot0KmvFBmOtUnyvttPuL
 gxhIltkXZCiOscbt8KlJ+I4=
X-Google-Smtp-Source: ABdhPJxVlyTrQW3mxBiQDNz0Lvsofh5wR4Ka60k9U9P0iS6Me6klaMMMPkWs+YedERxETtzRS48rWQ==
X-Received: by 2002:a05:6214:1ccb:: with SMTP id
 g11mr26661052qvd.64.1635300255952; 
 Tue, 26 Oct 2021 19:04:15 -0700 (PDT)
Received: from atari.nover ([189.6.36.155])
 by smtp.gmail.com with ESMTPSA id m17sm12145838qtx.62.2021.10.26.19.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:04:15 -0700 (PDT)
From: Wagner Popov dos Santos <wpopov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: wpopov@gmail.com
Subject: [PATCH 2/2] jffs2: solving deadlock on sync function
Date: Tue, 26 Oct 2021 23:03:39 -0300
Message-Id: <20211027020339.65303-2-wpopov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027020339.65303-1-wpopov@gmail.com>
References: <20211027020339.65303-1-wpopov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_190417_518640_841DF30A 
X-CRM114-Status: GOOD (  14.62  )
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

Correcting AB-BA deadlock in jffs2_fsync() involving alloc_sem
semaphore and inodes.

The function jffs2_fsync() can't lock the inode because some
process, or even the same process, that call the CG will acquire
alloc_sem semaphore and will try to acquire the inode if it is
inside the Erase Block that is marked to be processed.

Fixes: 02c24a82187d ("fs: push i_mutex and filemap_write_and_wait down into ->fsync() handlers")

Signed-off-by: Wagner Popov dos Santos <wpopov@gmail.com>
---
 fs/jffs2/file.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 7d8654a1472e..7f139704cb8d 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -39,10 +39,14 @@ int jffs2_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 	if (ret)
 		return ret;
 
-	inode_lock(inode);
-	/* Trigger GC to flush any pending writes for this inode */
+	/* Trigger GC to flush any pending writes for this inode
+	 *
+	 * We need to leave the inode unlocked to avoid a deadlock condition
+	 * because the function jffs2_garbage_collect_pass() can try to lock
+	 * the same inode if it is inside the erase block that GC is
+	 * processing.
+	 */
 	jffs2_flush_wbuf_gc(c, inode->i_ino);
-	inode_unlock(inode);
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
