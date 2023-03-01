Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9378AC64ED6
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrIyiRJHbic/7fAkmcR4kuASerF64ih87nLN+b9W6qI=; b=1GgGtWflhhDmdz
	39darhShuPgYfUzeDufy83wyea2exYV8t4ebFG8Yy6heEo9u1983G6qx968BVcUG3fuOn305kaX7b
	Asi7qgfBjIasNCSptphN96bU88AWFmAfcHcsxdQmsCN7yr4YFqo45s+SwyHuBDfV6Bbi0s5pE3K4a
	wTj0eWho3wx6IH1hLElB1xDYnIH64R7iyE6Zrmcn46Ynp53TfbMq9jhkVhvFB45F3JK9derPBH261
	xNxW9bjU3aX8VRBgIvPf7uiwFUo3uG1XbCCn2dFvwJi72POBkZYZpNHBPuVVaNx0lWLyCld2oGivN
	yZ377wPqJ0xXQY1o2Avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQmN-00H3lP-12; Wed, 01 Mar 2023 18:02:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQmK-00H3kR-2v
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 18:02:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A686461451;
	Wed,  1 Mar 2023 18:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1721DC4339E;
	Wed,  1 Mar 2023 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677693731;
	bh=LpStxG0IjAy/LEOuBDHzbJ9MpA68B0mjih3rawyQLYw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gWAF2467fnFlclkzvSQB+DTOztfYPmFq+uZlHCR2OhnEcpejXYM3sU6I1T9fMGT2o
	 WfTxGBGzIci7oXrc8rWqgF43ZMx0PPeuZDnTYeBoAu3UPIH1NFU7eRazo7l+jx2hqa
	 +UdfUi7XRa+DOVzJua/3b2FOJ+BbTdDALukZdyyNmpO7V1NmZPlIAxia9MSo2RKP23
	 n3ktsD7QgYe2+KrghF7noJaAwMKuPpVFiYwdqn75lXQxSIi+LKKjF2fzgcGBhkrkrl
	 lR9DrRvK2zxWXy9wqa+k2ST7yh7C8XugKGPa7ED4a8HI6ZZ1JQMJZVyeMpcbVDM6PI
	 nGuo8mbvkPGNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 031D8C41676;
	Wed,  1 Mar 2023 18:02:11 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for v6.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at>
References: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.3-rc1
X-PR-Tracked-Commit-Id: 8fcf2d012c8641c18adcd139dba6a1e556338d36
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e31b283a58dfe50ab1641d8fd2ead9b62f9ab256
Message-Id: <167769373100.10213.18332230181152988117.pr-tracker-bot@kernel.org>
Date: Wed, 01 Mar 2023 18:02:11 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_100212_255638_91EB5CEF 
X-CRM114-Status: UNSURE (   5.95  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 1 Mar 2023 09:07:02 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e31b283a58dfe50ab1641d8fd2ead9b62f9ab256

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
