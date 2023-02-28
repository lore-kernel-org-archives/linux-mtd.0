Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A294C7EE2E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Feb 2023 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRrK0gMAPh6tW5FltYZCM238p0LrcpyXYk4S8pstG9w=; b=xJRicjfO46+zww
	mfMjreH2lrYBX1W60/Y70IBIF2xmqYKWGynKCGkJ6zSntgbm9gwTP7wjJSW7XvGyiNic0UPriQs9M
	2yea8MZtnv6tBQMeeypGwaHANVacX0CEBpm4kpdo+XXqVaqxjdODTgPbwBbSVYxLgg862KZ86C8F3
	eH/sNcme7fwnevG+wS9Q+yPwmpeXve8+85YJLoIHqEEPMw6hZ3OnFZfGVOUJQ/5KT4IhnZpd+MMKG
	F+nJge6kj25wb1fiD5uaSlpCpuxxFTOzKT1fAvb3WRTzUzbLcp3TYyAWpKv5040crJ9sPWOCWLjpf
	ONhtl0Ph4w3O9vmCFMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoNW-00BhZS-G4; Tue, 28 Feb 2023 01:02:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoNS-00BhWi-N7
	for linux-mtd@lists.infradead.org; Tue, 28 Feb 2023 01:02:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CCC27B80DD8;
	Tue, 28 Feb 2023 01:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3309EC433A0;
	Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677546115;
	bh=84Xvp168sokHCBrmD6E23XwAok9TjE5uZlT8zL1cCUU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cNsRvhiueD336eCgeTzlzL7CN3QR418HrwVSOd7U/zCliL7nqvIsJnUeAOsp8UOw5
	 hiLt68AbPwaZc/2mRXOgQPTPuYtLP7vjKKuBDGH1Ob9Eo3AcQ2R2Pur5VBT5XHYZWf
	 5QUOasmUUwZ3yRAGneBG3sRZck43cSAXv8d7yKFkuKWmdWJkd7AQ10aIUAa2yg76OE
	 wVC2TNmlRYuLYhYb+1V8IasY//WsjgMIE8bRIoLn5UuT3F7ZCYsr91bgX5k5aZhWD/
	 JgNbITP619mqy6l+mslm9DtMj8lrl+R5TK0UWsbgnO2FtoZOilvek311LPP2Kw7y9d
	 2vNeTy3RQPm3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AC4CE50D60;
	Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: update fscrypt git repo
From: patchwork-bot+f2fs@kernel.org
Message-Id:  <167754611503.27916.4447364691434133144.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:55 +0000
References: <20230116233424.65657-1-ebiggers@kernel.org>
In-Reply-To: <20230116233424.65657-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_170158_910773_CE8954DC 
X-CRM114-Status: GOOD (  10.27  )
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
by Eric Biggers <ebiggers@google.com>:

On Mon, 16 Jan 2023 15:34:24 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> fscrypt.git is being renamed to linux.git, so update MAINTAINERS
> accordingly.  (The reasons for the rename are to match what I'm doing
> for the new fsverity repo, which also involves the branch names changing
> to be clearer; and to avoid ambiguity with userspace tools.)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] MAINTAINERS: update fscrypt git repo
    https://git.kernel.org/jaegeuk/f2fs/c/31e1be62abde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
