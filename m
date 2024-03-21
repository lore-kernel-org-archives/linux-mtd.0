Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF572C54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFpkTTTauSbiUZuUwwDqs4Ru7RfVVfi5Z6BqOXSa0zQ=; b=TyZLb1sO19yUIt
	A/Qou3nk0OmV3Os88icLs27y0M2S50+/8d+EmFzsHHxaxPz+AdgOgnKz1HThqJc1M7b+/z67eghmR
	FJNxcsmYnLAkv1dE4v4MlSUYQTRBrSrg38sOD8/fgbKeIVNVdiEQVQVZuYcest+jeivrV75dbUFMK
	0cvv3a/Jia1gY1JhOH4ZBLiHd8qHviWaOolGQJCaReQPY0stfrySJzV+eQYSVWDE2aYpNuNT1mzXO
	uygGEEHRxnXFZs4BRbIe8/m7xw2YvGg1+JzCUD7igyfsqiYHzeQTYZZnt/mErOgsh9kU/WcoOau0G
	TZ1/alQ9un+hDfRTfTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQqc-00000004wbB-06yu;
	Thu, 21 Mar 2024 22:25:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQqY-00000004wYt-3V6E
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 22:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F76ECE169C;
	Thu, 21 Mar 2024 22:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52002C433F1;
	Thu, 21 Mar 2024 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711059910;
	bh=GEWNaHp0RBHe9+Ju50wlKLeG3lw9qy9FeS8LdAMnL6o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L7cKaOuOe7YuZwMgY4grHuxf03E/JQWfZKvVUBxwIrC33kLJOcP/H5eSuJaeJK/QB
	 HZp+Vqrn6JfNQW+qi9SSg4Sdu/TudO334Ur4JqlEdMlorVZybdMsFjriTEn+vUO33W
	 YOL7j1r82gusFlYsa7a5f/CRkgoIRqv2lhazg+zhdPWvhuOi+Nv/wQ3jUXFn+yrgFJ
	 1dZHNIiPSVlMBatNemWRDkC7cQJDkV1cwJjb+nyBLq/FC3FFkdwqiBQLXY3sHE/V0+
	 iADHPt4seUN8jWIo7l6nI/MzgQqBQDhcO9pnq7TbqL0CibX+OG7w8ckwuOXSKwnbj5
	 8UaVsiOvz08gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 471B9D95060;
	Thu, 21 Mar 2024 22:25:10 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1722992374.86554.1711052004278.JavaMail.zimbra@nod.at>
References: <1722992374.86554.1711052004278.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1722992374.86554.1711052004278.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.9-rc1
X-PR-Tracked-Commit-Id: b8a77b9a5f9c2ba313f2beef8440b6f9f69768e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85a79128c4f5723f812ab8d5ee465ec660e223f1
Message-Id: <171105991028.29795.7624151013270733326.pr-tracker-bot@kernel.org>
Date: Thu, 21 Mar 2024 22:25:10 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_152515_064575_E4C80D19 
X-CRM114-Status: UNSURE (   4.42  )
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

The pull request you sent on Thu, 21 Mar 2024 21:13:24 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85a79128c4f5723f812ab8d5ee465ec660e223f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
