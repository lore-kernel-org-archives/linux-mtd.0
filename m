Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B82CC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1xl+ApTb30Inq+ebTOtgp4TzLbQJywA4lKIxT4sJBI=; b=E9hTvRk674rPXl
	f13/LUvrdGSu7ouFeuhLqdj2cpb5sYoFa3Gcq7CU+xD7fiheCadc9zxGGlQrXQHV/5mt0oEBafyyH
	YTIWuE+/bf9Hzi6NR6y1p65RLJqYUp7k2e1UlNTIsiVlhU+rcPQBxVnpRuqGAlsFhwXxfLuWZzfgP
	Vvcmneu6H/tdmqQcmrKaFiW5bxSY7NBsPTzMPRGCcOViSOIIIZ/xjLLWw12tYt6lJDkypVpehDDGc
	2h6pzEqPh0iViedZdg0ewogOKOLQgJmjRrYrl13kr02aUdxWIw+5BgBrNJlHJ5iHsSXyYFA34PAJF
	i7bSktJHEERyessf9Ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX7x-0000000CEn6-133F;
	Tue, 13 Oct 2026 07:40:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX7w-0000000CEmo-13nh;
	Tue, 13 Oct 2026 07:40:48 +0000
Date: Tue, 13 Oct 2026 00:40:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH RFC 28/28] selftests/filesystems: test xfs remounts after
 a shutdown
Message-ID: <as3ggAvyiKmCEG4v@infradead.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-28-60743a3dc326@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-28-60743a3dc326@kernel.org>
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

On Mon, Oct 12, 2026 at 12:21:13PM +0200, Christian Brauner wrote:
> Add tests for remounting xfs after FS_IOC_SHUTDOWN with the default, the
> logflush and the nologflush flags and after a shutdown that the remount
> to read-only causes itself:
> 
> - option-only remount keeps it read-write
> - remount to read-only works
> - remount to read-write fails with EIO
> 
> For the last variant the image lives on a tmpfs of its own. The test
> punches out the log and shrinks the tmpfs so the log write during the
> remount fails with ENOSPC.

Please make this a xfstests test case, which has the infrastructure
for all this.  And make it generic, as the same shutdown ioctl is
supported by half a dozen file systems, nothing really xfs-specific
here.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
