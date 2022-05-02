Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E96C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3IckMH2jcJz8HNf6/F2/IeKpOA1zFSXQuGGDQY8heAk=; b=wxanqeewJ+65Wp
	sp5QQrXHqlIfmMPvP8p1N0xYnqDQzQYxhM1vdt0DP9SO1HODazOTz4SQTBit6Af25cPrkDkF9LKdu
	b1AnH2roesQloZbu4TtlI4tnCvbJQ5ToNMjzr5HzF25qaViMu+tFWH1oskZorr9wQblCO7QKClA5i
	7Jbo2rAj2sYgDA+V4mmj5qSVDmSHh5PXxjpsOOTbTY/Ee5VO9W4JRBnfPKbI7c25rQRpiAlsUiEEV
	N62Ht2AiWQ99kVFyug7xJJnFHXNgjrNlh/zXPrOUDEhk/vzPPjUAxlEM1R8/7OtjuuOJyRbUqv9JD
	11ZPBUu2qJaX9D6QVkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlOox-00HaiD-2i; Mon, 02 May 2022 05:42:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlOov-00Hahq-IO
 for linux-mtd@bombadil.infradead.org; Mon, 02 May 2022 05:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=+dTUFiPSgcPyKn27SG2SzO7pIAPQqql66xRPG3Hmnd0=; b=ZS+Jl8aHtWueRkdYl6tmmnK5X2
 glIsYRJy1nHd7JNVkjdoNq4qALnvkQ2hS1bqXO+rM4QrZP7JnyVz2MFEzBHL1cLtOfWRMgDYRRFQm
 hVmmSUrVBfkM10IqkO+704tPUauNTMZcevGv6XfYRfZHuKFJVOAzsERzgVC2FZE3woLduVBWNK1iP
 Kn7lGVu2eUJ+w8PjsBl0i7POFQ7VqO0x31MNEcTMIGAnrR+cmyVz+0IDlOBdQuZhz/kgU/hEZyC7w
 YV7rA++Ch28bz7UENEAMYAQDe/1XVoij+v4JIOlDjF4yfn3MTZLjhuzGe7mBpVghK9eOpZ1KwvNia
 dKMv4FDQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nlOot-00EYzz-NC; Mon, 02 May 2022 05:42:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org
Subject: [PATCH 0/3] Unify filler_t and read_folio
Date: Mon,  2 May 2022 06:41:56 +0100
Message-Id: <20220502054159.3471078-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
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

I realised there was no good reason for any of the three filesystems which
actually use read_cache_page() to pass in something that wasn't a struct
file pointer.  Indeed, it made each of them more complex.  These aren't
filesystems I test regularly, so please scrutinise carefully.  This is
on top of the read_folio() patchset that I posted recently and can be
found at git://git.infradead.org/users/willy/pagecache.git for-next

Matthew Wilcox (Oracle) (3):
  jffs2: Pass the file pointer to jffs2_do_readpage_unlock()
  nfs: Pass the file pointer to nfs_symlink_filler()
  fs: Change the type of filler_t

 fs/gfs2/aops.c          | 29 +++++++++++------------------
 fs/jffs2/file.c         |  9 ++++-----
 fs/jffs2/gc.c           |  2 +-
 fs/jffs2/os-linux.h     |  2 +-
 fs/nfs/symlink.c        | 16 ++++++++--------
 include/linux/pagemap.h |  6 +++---
 mm/filemap.c            | 40 ++++++++++++++++++++--------------------
 7 files changed, 48 insertions(+), 56 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
