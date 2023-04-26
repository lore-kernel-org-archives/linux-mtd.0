Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE828C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 23:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8x/9cU1CwxWxvPaxcMv/XE1daBYA3hGK7OsZBAoeSw=; b=KaVzeL5LC1VWGx
	ljGZBlAXdOpcjaZzfjZSVJOfZ1HdspBPWHZPt6X44GJf1Js1dcGVgpuM/JW91f+E8rABr85cKsiyG
	2gZIyKydeZCv36SVMkYqH2oa5D+IZLJ+pF/csXiL6RXMKpHwYNnrSsijyMDL3604g+qF+iFAbpEr1
	YssMxyesi3nTgtNYoT2BXr6F8NsOYW806nxjsYk963Btwp5GmvYWwU+FVmnlgyFHv8hogLGZc5B0u
	Y5AZryYY+740jOeoDwzYqbozpj2iecsI2Xc537YNUdqAYMJyBUc73/FB2laL1+xQtGRC9Nrv1Rtct
	ChMoV6xT+k+MbMZSvx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proEP-0050Ok-0Z;
	Wed, 26 Apr 2023 23:07:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proEM-0050O2-2Z
	for linux-mtd@lists.infradead.org;
	Wed, 26 Apr 2023 23:07:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 852E463993;
	Wed, 26 Apr 2023 23:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2946C4339B;
	Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682550440;
	bh=EzrAzHGqX33HLlqpfsl59P+BWciRL4LLNL4FJ5YxYiw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=huemn0yp2XzRUtzI1j/YWNYRt1QKV1SVDVfajDMru9/LkNbnuOgXFP3lMOAewzkEw
	 SFF3oLTNxd72taeJdoC8laOtlFG8z9pxPaFk08isrDw/5LQ+gUxIpqOwd2IOZSFHNw
	 4HYKoKLprsc12RNLmO3wSw8omR8cHmCcDPa7+6xfQmB55f1oTV8EE1H27j6Pls93PV
	 Vp8gC4W2lzsIGyOAAPyzt57VCNGwzu0LHwHQBJ7Pg0/TaE/8XeLwZP00zH/DE2R/VR
	 NQgC/FuN1OP8CVZJl+9K/8e1+I0LNNqhbulyDD+LaQvunkEVwhC25NS9T0BTLO3FNI
	 B6MP2MQraMVWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB86DE5FFC8;
	Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [f2fs-dev] [PATCH v2 0/8] acl: remove generic posix acl handlers
 from all xattr handlers
From: patchwork-bot+f2fs@kernel.org
Message-Id:  <168255044069.16014.2458183090274454828.git-patchwork-notify@kernel.org>
Date: Wed, 26 Apr 2023 23:07:20 +0000
References: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, hch@lst.de, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, sforshee@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_160722_892976_194CC423 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, 30 Jan 2023 17:41:56 +0100 you wrote:
> Hey everyone,
> 
> after we finished the introduction of the new posix acl api last cycle
> we still left the generic POSIX ACL xattr handlers around in the
> filesystems xattr handler registered at sb->s_xattr for two reasons.
> First, because a few filesystems rely on the ->list() method of the
> generic POSIX ACL xattr handlers in their ->listxattr() inode operation.
> Second, during inode initalization in inode_init_always() the registered
> xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> inode->i_opflags.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,6/8] fs: simplify ->listxattr() implementation
    https://git.kernel.org/jaegeuk/f2fs/c/a5488f29835c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
