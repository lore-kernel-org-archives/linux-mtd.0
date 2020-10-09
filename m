Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAACC433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089552226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RiS306aK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UkGU12VI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089552226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLbfEWzSCS+m4Ad+8QqhqvtIaiRwFZCl1NBZNWu6p30=; b=RiS306aKbgDRVm3KrJACIc9OF
	o+AOegaSZ14YISOMAWechDXzy507IlypL2XQrAXLIhFrb7olYQvIlPbVVzKBQ+PcpMZpvfhLsG8BY
	vnyMUzbcVgKaQGY5OsGiBjMxPZWe6r5/fJcwiEwqNyh0b7i0AfpfdsQtGXyEOC3SXN+u+frBEnEGv
	LLrwBPNcikuJfl1Fmt0NcRPfjPYtLhd2mAyC5kCa6tk04Dj7u8qILTrAo7zoN/9jRk16XYYpKKOxa
	bpoQnOMs9RufSCRXD+JE8YnXEwWYnGPofmYvg2ET37o/TiM/G6kB9Z1iJ5+BtAiSA1QrpNxc9XYG4
	UMMHhREDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtRi-000453-DS; Fri, 09 Oct 2020 14:32:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQM-0003MS-V1; Fri, 09 Oct 2020 14:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GW1YniPzUpda1PIsi2+AeQMOnKxd544xKFcJ+bcv5fM=; b=UkGU12VIIK99MHzzfEryJUWbjO
 A0nKktmS8L+pBXk27jD0P9xgYbyljS6tsG8fMjJJpMDG2kRA2N8MVd7r4ckabTScnK0YgmTTfTxJs
 FWD0S5kScgojp6mVIa5rSQ7tkL6wO/nzblA4AN5aaXMhmOo+V/mRvQ3bc3iTPjQQLC5rkw3ueoU9n
 T2v4r1/bCFm0FHkTqpfc7gLV+TXyWxNrhpFXAnWXyVvuzv8EY5bzSr1+wA8/3w0M2H2fL7oL7chak
 g7Z8Ez1HNYatDB1fkRf1mxdg6JbokrEYb5spx6bU41Om7N/n7D5GJbHbOJ1lTZ9qxmEpBDlnJ130m
 t/QP01eQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQL-0005va-Lv; Fri, 09 Oct 2020 14:31:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 10/16] hostfs: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:30:58 +0100
Message-Id: <20201009143104.22673-11-willy@infradead.org>
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

The hostfs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Richard Weinberger <richard@nod.at>
---
 fs/hostfs/hostfs_kern.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index c070c0d8e3e9..c49221c09c4b 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -455,6 +455,8 @@ static int hostfs_readpage(struct file *file, struct page *page)
  out:
 	flush_dcache_page(page);
 	kunmap(page);
+	if (!ret)
+		return AOP_UPDATED_PAGE;
 	unlock_page(page);
 	return ret;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
