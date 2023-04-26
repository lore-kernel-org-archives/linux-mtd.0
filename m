Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FE5C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 23:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6w2wVR4/wBoLOzmNAkYpXnh01d8xvLZLz0ps3ZNAd8=; b=B+pdn+P6oinlg6
	WpyaeEdghxj3HYQ7E7wT3Iv8TuTnz+MKqprffCDQVwupk9yjIbKJtsUeIIiL893kwp0ZO/llQN9r8
	8WcZztOTElJm8t4PdnHZAYKx89CXkKTVYFohL3F1j2pc6CWm0nO/jg+W2JAPWsXjbHXnDkJBbMszb
	mcW04wK+iaUisrcS2TmLJfa2SJmzuwSMPo9aphz09/+xXkUSTS3xQ267BLuHMwBpjrwvPOElGmaBI
	vA0rTT31PAbW9fF+zKoXDi3laPLKsd1KjW3fIwyi4uZsH6Z6USFHapiiMKWQSNT3HQIDG0jibfjFX
	RBCqhdz530OPRxtnfaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proEP-0050Op-2P;
	Wed, 26 Apr 2023 23:07:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proEM-0050O3-2m
	for linux-mtd@lists.infradead.org;
	Wed, 26 Apr 2023 23:07:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E11696399A;
	Wed, 26 Apr 2023 23:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA025C4339C;
	Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682550440;
	bh=71/XsA8gAmo1yutYZ1cS0twFrW61Rssu2AmOx0Z5eqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LCsCJGnd35MidYfxnMlF2ceb389n1B9U+KnzrgVKwgz5bAx1JzOufQeZ/SGRGVkkX
	 AkwL7o7IUXB84i3Vrp+2dYvTEB2raGyt1bPfIePkPzimyVl0QF0nykjXoFPdK/iGyF
	 xmS+0hcVEEqQ/mzOQIEuWBo+aNi0OdLZoD2sU5j7TMMHl0xiWsv3YDVAgdm/lv4bBl
	 2hkD0FnZL1h9SA7ETWRkHuT5vigtQxRgpaiySgxZcycuzc9OCObp4SvRjW6CqNYxGL
	 A85Yr6YutIEXIGmgBh1OeDzgtzNYHzp8kT1wAHqE0jDNsJNShVauqRfHNLAzt5GYDW
	 hhMvyD5bq6lZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B47F5E270D8;
	Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [f2fs-dev] [PATCH v3 00/10] acl: drop posix acl handlers from xattr
 handlers
From: patchwork-bot+f2fs@kernel.org
Message-Id:  <168255044073.16014.8337870090900748986.git-patchwork-notify@kernel.org>
Date: Wed, 26 Apr 2023 23:07:20 +0000
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, hch@lst.de, linux-unionfs@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, sforshee@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_160722_955107_4E345CE5 
X-CRM114-Status: GOOD (  13.76  )
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

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner (Microsoft) <brauner@kernel.org>:

On Wed, 01 Feb 2023 14:14:51 +0100 you wrote:
> Hey everyone,
> 
> After we finished the introduction of the new posix acl api last cycle
> we still left the generic POSIX ACL xattr handlers around in the
> filesystems xattr handlers for two reasons:
> 
> (1) Because a few filesystems rely on the ->list() method of the generic
>     POSIX ACL xattr handlers in their ->listxattr() inode operation.
> (2) POSIX ACLs are only available if IOP_XATTR is raised. The IOP_XATTR
>     flag is raised in inode_init_always() based on whether the
>     sb->s_xattr pointer is non-NULL. IOW, the registered xattr handlers
>     of the filesystem are used to raise IOP_XATTR.
>     If we were to remove the generic POSIX ACL xattr handlers from all
>     filesystems we would risk regressing filesystems that only implement
>     POSIX ACL support and no other xattrs (nfs3 comes to mind).
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,05/10] fs: simplify ->listxattr() implementation
    https://git.kernel.org/jaegeuk/f2fs/c/a5488f29835c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
