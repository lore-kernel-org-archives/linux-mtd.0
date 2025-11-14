Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79618CDE010
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 06:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgsDHfXQV0taiqyctgpPv+P8bD1hu7A/GffPrcR/d58=; b=CqHBckuNn47N2W
	nuTmQw4rgY0gUeWLjE8H4VJfAqvpEw4uEXcAaH/EwqPq/2G2JYrniUOsvvSXYGQ/foKVlUy6wQZvO
	bEqTQ3HyLp/zMHECGSjEgfz7hk3g1ojJzwQFIHvGCDFRmBZt4GrOuztBW9o4FfUZIrEUx+S6MN40a
	z2i33aHm5Kk/3IcwKX8WEXfgKYSi84VzM6YDneKFelGhPCWPJkvkb7c3hbs7I70pnZah2efqBBieN
	4hE3q4GRFB/hzUR0oBahV7HP8wnA7Vu9IYBgyVXuttNLG1NTNZywcCs+UUhLpXU8dSLqjZt+YYK+R
	Q5EaxkhlZ06wBru8pz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnH5-0000000BeWm-20QO;
	Fri, 14 Nov 2025 06:27:11 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnH3-0000000BeSq-2FF4;
	Fri, 14 Nov 2025 06:27:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>,
	Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 03/14] fs: export vfs_utimes
Date: Fri, 14 Nov 2025 07:26:06 +0100
Message-ID: <20251114062642.1524837-4-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114062642.1524837-1-hch@lst.de>
References: <20251114062642.1524837-1-hch@lst.de>
MIME-Version: 1.0
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

This will be used to replace an incorrect direct call into
generic_update_time in btrfs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/utimes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/utimes.c b/fs/utimes.c
index c7c7958e57b2..3e7156396230 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -76,6 +76,7 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
 out:
 	return error;
 }
+EXPORT_SYMBOL_GPL(vfs_utimes);
 
 static int do_utimes_path(int dfd, const char __user *filename,
 		struct timespec64 *times, int flags)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
