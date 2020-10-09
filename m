Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B548C43457
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78292226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kssi6HpZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="svvQxaEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78292226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9CNArXNEKIHxP0G5HzAWCdGbAlBkwXtZAwXl8Ygp6no=; b=kssi6HpZD6kLnnYjktZS+7jli
	cSocgh1M4MA4jVAGiKgCfN0PNhsVNSB2S8/5hS0sUDo9hTXu/uFyhK7V6wt1dpyVZGYB3eXFMwLUo
	8aKE4oqIGy+1IA9+f4KpltuKuUE1x0+7V37MzCT2D+rygWmw8zfjfVQ9NNeGTwj1JxiZRLux211i5
	Y+llvNUT31q3uv1v1qDTODsdAu25CZaqUz5Yr4scVkgl7q/M3f/cLABfP9sB3d+wp46HiZfG5AIop
	5ZRWFGkOE9bUioJ8oPOhHQryiZU/0Bn86JmeH334IhYwYGISHxLTt5voJMviqW5AHRayIK1Kzs+LK
	9HhpHYBpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtSh-0004bW-2O; Fri, 09 Oct 2020 14:33:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQO-0003NY-Az; Fri, 09 Oct 2020 14:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7bp7tBDREj0/quRwoGKFhcM4IA6X+ak+6znUWRbIy7w=; b=svvQxaEqComXNsnloU5QdTOfQX
 j5Vybbl+ZoYosElrxZZapxy+9mzBke87nDeFnpmkA9kgo8W6muEHuC0cvQ8RwP/uaJ9Fhm/8HRFUi
 jfQ4mqVwo2IqElrz1oXUQFfvRpGQIxfBnC1nZeqv7lcvZahJvQbV5YetwZFRdG4xkbPRmFJUZUOpK
 kj+UhdEeQMT7jVJSnA2JrJrHa6fWP3wEQn6dRgSwxcw861oen0eG0UkTicv54ZTzTDFpNgWBZ5FNk
 022doLGYwiiKYz+Zps8BnQSTd+Qeq2POAzhXajcBg9F4YWP+f1Fq2Ev4pHlKSxD2LWhmyIQameERt
 56HCA3Xg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQN-0005wD-2K; Fri, 09 Oct 2020 14:31:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 14/16] vboxsf: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:31:02 +0100
Message-Id: <20201009143104.22673-15-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The vboxsf inline data readpage implementation was already synchronous,
so use AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/vboxsf/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/vboxsf/file.c b/fs/vboxsf/file.c
index c4ab5996d97a..c2a144e5cb5a 100644
--- a/fs/vboxsf/file.c
+++ b/fs/vboxsf/file.c
@@ -228,6 +228,8 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 	}
 
 	kunmap(page);
+	if (!err)
+		return AOP_UPDATED_PAGE;
 	unlock_page(page);
 	return err;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
