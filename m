Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0B3CE7B1B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1d0+hv/u5EDSOxYKkkm8S16HP43HxOir1rKHX4MxvM=; b=kAT3Z7cN8d3rRh
	K4+l6//C6X1+uezV9TVb5xTk+CJfqzZTEsAOvmgosEyi76UeLWgKeY2NEcPAzTTTMR7CSj77TsZm/
	EEE6S1MXdJJ5Inqo45V27HQDxG++/MaNo6nd5MIW5O/ao5yqKSbheCuV92KhQM4YErRGwlr5ionx1
	qcVD3CbsyiwqMxVrBqZ1tJywHHqj0inxEtAzFSyb2wFeRtnH7zg/oJCEpxDKWkW/P8Oyd5G4PGiVw
	e2/oA8Yo8atBzGIDwTnYqziwZgZvDiTq1ZnsSHLsmRpQYvY8qCp+vqAoEdoz0PYPivx7Df3H2cl0V
	TzZYKttvxe7VQ+9LHGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvl6-0000000CZeM-3fOh;
	Fri, 14 Nov 2025 15:30:44 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvl4-0000000CZdE-1eCB
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 15:30:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 34600227AA8; Fri, 14 Nov 2025 16:30:37 +0100 (CET)
Date: Fri, 14 Nov 2025 16:30:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	io-uring@vger.kernel.org, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 14/14] xfs: enable non-blocking timestamp updates
Message-ID: <20251114153036.GA30882@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-15-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_073042_574749_5B7BC0B2 
X-CRM114-Status: GOOD (  15.93  )
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

On Fri, Nov 14, 2025 at 07:26:17AM +0100, Christoph Hellwig wrote:
> The lazytime path using generic_update_time can never block in XFS
> because there is no ->dirty_inode method that could block.  Allow
> non-blocking timestamp updates for this case.

As the report noted, it turns out my rebase lost the most important
thing here, which is to not reject S_NOWAIT for the lazytime path.
The incremental patch is below.  I'll resend on Monday, and officially
declare that Friday the 14th is the new Friday the 13th.

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 3d7b89ffacde..35dbabf1e111 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1196,9 +1196,13 @@ xfs_vn_update_time(
 	trace_xfs_update_time(ip);
 
 	if (inode->i_sb->s_flags & SB_LAZYTIME) {
-		if (!((flags & S_VERSION) &&
-		      inode_maybe_inc_iversion(inode, false)))
-			return generic_update_time(inode, flags);
+		int updated = inode_update_timestamps(inode, flags);
+
+		if (!(updated & S_VERSION)) {
+			if (updated)
+				mark_inode_dirty_time(inode, updated);
+			return 0;
+		}
 
 		/* Capture the iversion update that just occurred */
 		log_flags |= XFS_ILOG_CORE;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
