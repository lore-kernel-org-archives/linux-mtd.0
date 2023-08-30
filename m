Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9493C83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f099KXbsuizIFa1chL3m1+ZLMKcssSO9uoYpnKBvQm0=; b=Cu2qa5gEbka4sT
	OCH1tUt7pXJxikt52zZeS7qBScl8opPFgbO9v4IYmUxULRJMnrazlqTne8I9h8lVwzJNcWBsFL9Tj
	uIkx9QszrOW1oZHzbsRt3r6AMdrQFYOwbgEFsDTFLL8bXMKgRWUXGDDkXei5ZZOfXkpEd787WNUka
	Zu2wLnXIrAG7xra7L/GKn1oryJUwD7tqIfS1f22KRAiaqAI+U978yRZtcZQ3VMRZHtHev383kZjgC
	4gpULPI73y4n5XcRbZvQIpiztGrl7mjbr2v+n92MyokEfW2js+CWlQK4/xbroSqEmd4Le0Z8L8f4S
	D6w86JBGT3oi9kw1vNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGDI-00D3jg-0e;
	Wed, 30 Aug 2023 08:06:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGDC-00D3i4-2t
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 08:06:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EA3760C26;
	Wed, 30 Aug 2023 08:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F63C433C7;
	Wed, 30 Aug 2023 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693382761;
	bh=3PR3pUSzxk2EyvwEKLnU5xp0oTSy2O6BEYeVQBem1E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaumzDgvBmpGf6mrv89IbzIMZ+jf4G2La8qgWDc9D/vV7h91ivE3fKzG8GeFGHW+Y
	 mtJ/ZLg5QdGV0UbkQzKRSNEQ4rBWsSDuVxlai2/+aDcTRMVPE4WShHopVGe5HU7Wqt
	 bUeLJP5tn6y4jBGDU/kxCGxbEOFH9Kc4VwwSpD6rbZdbg3pF7Xx7KJeOqrfq/JX3um
	 kudxWcwZKWXf5fO16gnYbX4ElWnKDif+h9Xh3jsOZQ4Fa+ugPTykmRo1jJDfT98ei6
	 o8Hsq6iYSRGWNw+YIoX3JvEMrfTkZkF7hnHcMLCrTiP1+Vbq1/PAD3vg8vHxc6vHmH
	 PqyfEziWSFBPg==
Date: Wed, 30 Aug 2023 10:05:57 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830-befanden-geahndet-2f084125d861@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230830061409.GB17785@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830061409.GB17785@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_010602_981610_BB41F64F 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, Aug 30, 2023 at 08:14:09AM +0200, Christoph Hellwig wrote:
> > +struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
> 
> A kerneldoc comment would probably be useful here.

Added the following in-treep:

diff --git a/fs/super.c b/fs/super.c
index 158e093f23c9..19fa906b118a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1388,6 +1388,26 @@ static int super_s_dev_test(struct super_block *s, struct fs_context *fc)
                s->s_dev == *(dev_t *)fc->sget_key;
 }

+/**
+ * sget_dev - Find or create a superblock by device number
+ * @fc:        Filesystem context.
+ * @dev: device number
+ *
+ * Find or create a superblock using the provided device number that
+ * will be stored in fc->sget_key.
+ *
+ * If an extant superblock is matched, then that will be returned with
+ * an elevated reference count that the caller must transfer or discard.
+ *
+ * If no match is made, a new superblock will be allocated and basic
+ * initialisation will be performed (s_type, s_fs_info and s_id will be
+ * set and the set() callback will be invoked), the superblock will be
+ * published and it will be returned in a partially constructed state
+ * with SB_BORN and SB_ACTIVE as yet unset.
+ *
+ * Return: an existing or newly created superblock on success, an an
+ *         error pointer on failure.
+ */
 struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
 {
        fc->sget_key = &dev;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
