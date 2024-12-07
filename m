Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF76E7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A89en0c63B/Zu2OmoK9wzKLzQYoLVsFbO2is1GhHU9g=; b=snMkgYjKPaaNyK
	KFoo2fUbpjYOUCoFa9ifKanXjb50ZCYBJzR/ysu0+Ynua3pdzsGGWSvCp6u2TKQbV7VNpEbvtlj6g
	pMdT3/p0HYOpngtVq3973GeZr5beJz5dsr/ICiXT8817095xDz7qII2g+VX0MH5GQxx+eIVkWFTQv
	B7bgajt+WzQIV4nMnN+YzCnu5HNCjGVkayVqHHm5P2+p6mN3jInjDsmluOkmiIkIfvsIaEs25sA8W
	bvveaptCXFzdcr+D+naziG6/ZHKGMwj2maZ9jIWWiz71Zn/Zg9n32YVFtHgIXNCU76vtCTX4txfSC
	tHWo1bS6Z8Rb7XPZg7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzwS-00000004HdP-1d2R;
	Sat, 07 Dec 2024 18:54:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJzwP-00000004Hd6-1WtQ
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 18:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9369EA4083A;
	Sat,  7 Dec 2024 18:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C067C4CEDC;
	Sat,  7 Dec 2024 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733597648;
	bh=9fcThNCGMeLPhb4ryZ9bUb3LapYxnmAk+VAwsL7lXZs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kQgcLVnl6XJc/WY6GmV68a3h3CbCzvNpRbwwowii4WdWSfymNMoKbnO+aPBdUXpku
	 F683twI1u33sTnDKlNcPSi57OJMKDW2uvX2NjdNzrSIo2k3jv8mBexYtil/qhs3TK/
	 OG8JAfFwvTbjj6UxIVeus3s/RKBGh/GqwnQMlqz3AE/Zkds5OMH/5fWQp9SPFD+LXR
	 SZWRg5Gqd66yt0ZlwHeUZAteGfraMvhnTdcvHKsW/8le1hWx9KODL3hquJOcNMy4qP
	 NpGTZ4m+mM0jiAobWar6/YBaPgym7cW6oAmV1Hqyett6V+kqgqqocBOF0loM0dqQr8
	 S2mlu3IjqZQRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C35380A95D;
	Sat,  7 Dec 2024 18:54:24 +0000 (UTC)
Subject: Re: [GIT PUL] JFFS2 fixes for v6.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <972877429.45679137.1733560825113.JavaMail.zimbra@nod.at>
References: <972877429.45679137.1733560825113.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <972877429.45679137.1733560825113.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.13-rc2
X-PR-Tracked-Commit-Id: b29bf7119d6bbfd04aabb8d82b060fe2a33ef890
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6db2a5d7df3e577c268ba7955eb48e913424599
Message-Id: <173359766300.3037814.10654157760992073225.pr-tracker-bot@kernel.org>
Date: Sat, 07 Dec 2024 18:54:23 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_105409_585669_5A84B562 
X-CRM114-Status: UNSURE (   4.02  )
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

The pull request you sent on Sat, 7 Dec 2024 09:40:25 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.13-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6db2a5d7df3e577c268ba7955eb48e913424599

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
