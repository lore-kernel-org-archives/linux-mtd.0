Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0D6C4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Nov 2023 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rntiAooWjhsVCjQK3b2oNhhu088nop4jxaaO7pWrME=; b=0vbwHJmMtJ8u51
	QkNVZWkuCPSPSYA0ZLbGlwdFfHI0ta6HbZgg6pl5hxulDMlkLgMKPvG9NwJD/72cU+aHJlCEQ0Cgg
	OQ2jzI1ux2YHiuIwAljhq5n2nwoCaH+TzBipEYgbKENMS2t3kV1Dt4dtm/tPDcoSGOsbeHhqV0g/G
	TcjPBcbloH8o3j45QTruWbz7ys2ZPyAlD5YBDce1amltCiJl/dnub6i/qd9JPGgKedMgjkTmYkmMT
	ASRnrqArOYuzYpRgAvK2r1WU/T80nGKVUkox0wUE3c2xaHdC/fEmwCZM9GccNeYwhDoOldF2wk4eD
	mZB8RTUVC3dI+vAZr75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qziFq-00FQFB-1r;
	Sun, 05 Nov 2023 18:53:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qziFl-00FQCg-2O
	for linux-mtd@lists.infradead.org;
	Sun, 05 Nov 2023 18:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 50882B80B02;
	Sun,  5 Nov 2023 18:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E702C433C7;
	Sun,  5 Nov 2023 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699210419;
	bh=M4JBT3QE9ijUui69l1vKwXF3KM5CqYYGNpDSwkuFEG0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q42Rdcn6aXh2BBrB5xQ1dDAgD5TuSskcR58KM+rgljlPa++BMKRVptjQlJn9PKb8Q
	 ai4O1+XTD7r4iYezcXgyWbJ+BGP/uyIWCH5ZH887p5rwqKdY0nBhPpiIJnLxaAp80X
	 vEv2A8oNa7y3iKu4VVf52zp5mBbRdiOV0jPzLUbIk3PEbA9xL2dqacTRFTVXjsHemu
	 aCsKhzprZLWLwgliTOhBLjEywDza0wqX3/ANu2US/11pUJEmxvFLwRlPIALM1FsOgn
	 N/5fv62oFQAg0EcAB5miL6BxiorEVOL+6l4Q1iEroUK+QEBxgA0ehdcIZEgnkHI2WM
	 zWY9e1gyt7kBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8ABC4C4316B;
	Sun,  5 Nov 2023 18:53:39 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS Updates for v6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <15692057.53962.1699180262386.JavaMail.zimbra@nod.at>
References: <15692057.53962.1699180262386.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <15692057.53962.1699180262386.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.7-rc1
X-PR-Tracked-Commit-Id: 75690493591fe283e4c92a3ba7c4420e9858abdb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2153fc3d68170bb67be8e389c2f6e0f4a9eb7cd3
Message-Id: <169921041956.20864.10618508564929955622.pr-tracker-bot@kernel.org>
Date: Sun, 05 Nov 2023 18:53:39 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_105345_963308_4E296867 
X-CRM114-Status: UNSURE (   3.70  )
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

The pull request you sent on Sun, 5 Nov 2023 11:31:02 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2153fc3d68170bb67be8e389c2f6e0f4a9eb7cd3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
