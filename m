Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD233C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1x9OiSjcIDUr9dn9XkFfeKQIWtJpW/A1CaNdYn9ST8=; b=DV6RvUuYtoQZUf
	khUXHc57z1Gg0bjoDXSFWWARyTku/4Vsw9AtwiUtKLGWlF2hxYrNguojh9m69q7rk3MeEHflW88SH
	whrbR46WFCsOmUnoxDRSEPuRlr1EVjBO3nU1A5HmnsN08MIiV9EGBOYhtY4Qg4uTutlQh/327n3SC
	TIrty1/W1NbDs55A8s+hAXCxihQJUQ4FkTI1FA09iYPWIy46cR3Hf3Uwd/t5cuIyYOaCLv/b65T3U
	RuYw+rOoszUUz+DjFGCk6k4FN6s1t3YAZVUyKuVFUJ7WpSQXzF9kXIXffdNQC8Yxsnuwk3lLmzBxm
	38zGpp+LLKaDATuowycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRf31-0000000BoPN-3Kes;
	Wed, 10 Jul 2024 21:40:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRf2z-0000000BoPD-4AEh
	for linux-mtd@bombadil.infradead.org;
	Wed, 10 Jul 2024 21:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=t4jvbJ7n8PAGp09Txkl3fReWKpqoTyQAeWAGk4qQm/o=; b=pmRu7gZQLcNyFlN272TC6n+Pfl
	0uX+C6vTTtndMxjKm5byN5vFdxVg0GwLIoEoJwWuns0WUGdROO2+1dhzZdKWoWp4/6I0qHZXSvO3V
	b0UHmFkud2zX/YFmg+nENEt+OXUQh5LT3Gs3nhF3EeiCDkKHe/K+S9GYaq7eqiSfXHn3+tBGM4ynd
	Cz0mbigeg0DtzD6U0hCaJxnixGOU0TmvkUubdRu7YLQRCTiu9O4jyMHOPEFlpG6QftsSvbxvtqzgA
	6gbAiIzwS/WK4J1HlwxETq0/JNEPhHZQ5GzpkGWBbWs+I7RVC0kZ8QkO9qyzUyXG5PUpgQPdCglft
	j8Hxw89g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRf2x-00000009uiC-3NoI;
	Wed, 10 Jul 2024 21:40:19 +0000
Date: Wed, 10 Jul 2024 22:40:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Tyler Hicks <code@tyhicks.com>, ecryptfs@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	linux-nilfs@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [6.12] Conversion of aops->write_end to use a folio
Message-ID: <Zo7_w-BjbbbrxadX@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
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

For the 6.12 merge window, I intend to submit a patch series loosely
similar to the one you can find at

http://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/write-end

(aka git://git.infradead.org/users/willy/pagecache.git write-end)

This is split into a few pieces:

 - Directory handling conversion for ufs, sysv, minix & qnx6, all posted
   recently.
 - Various prep patches in reiserfs, jffs2, block fops, nilfs2, ntfs3,
   ecryptfs, f2fs, fuse, orangefs and vboxsf
 - The big bang conversion that is now appropriately trivial in each
   affected filesystem.

It would be nice to get sign-offs from the various fs maintainers on
the prep patches.  I'll send those out in the next 24 hours.  If you
want to take them through your tree, I ask that you do that for 6.11 so
we're not juggling git trees trying to resolve conflicts in 6.12.

I don't think we need signoffs from the various fs maintainers for the
big bang patch as the individual changes are so trivial.  But if you
want to give it a look-over, the more eyes the better.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
