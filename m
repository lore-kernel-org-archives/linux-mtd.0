Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F6AC10F1E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 05:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cwlv/R7j31Uj84p1cq3Jwjuwhl8VbSuiCxfG5IjVPXE=; b=eAHmxDTRnDV4jn
	2dkX1Ua/HaBnoqtiRjUCtanN4szE/tWu8+Mwi8UU0acsEwRg9PMA06W2fUm/FTik7GA/y7np19MLv
	vDmKDwhLClUrhcrOgnCKlbe9o8qO0JFM1zzdcND/33jtHssLFmaGl5w95+al6lmBlpoOo82lLU7MV
	S8UW5kaAFrqn5bg/ApTtbghAYtPylIhNTb0AmxS72UFkQ5cbB4z5C0BCM3JlrW/dSec8wP5fgoii7
	g/7xUVLUsI2A5gnu5Piqpa6+wozXwxk/J1ChFDQbtIj6o6IdeZcluv3iCMniR4xnqQKGQ7TN1eHww
	OuBCNm/uTOrnkZnTPa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4xOn-00B5Mx-0f; Tue, 13 Dec 2022 05:00:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4xOi-00B5Le-G5
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2022 05:00:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 31843B810D9;
	Tue, 13 Dec 2022 05:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA7F8C433D2;
	Tue, 13 Dec 2022 05:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670907605;
	bh=bWHTLgFxQc2o39iSKlfIsi3HueJcoojwB6FD6+BZaL4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UACdc+N63MewVjY1V87dLL3dUoq4j35AW4bq3IwmzddfYe0NAX8dTXtLGXrvkAN3L
	 NsOAZnPyfr8JAUj/Vo7+rPZ/q1tz1vMlZ+12mVFjAOMTOYTzt1Ge7gGSi3OQUg/ToU
	 y4eko5o2ShNW7a9wl6lMBVHezZU0vQ4NLQ6VZPyu5jbt5MvoQo2aTlvm1V6Vgt3KIX
	 TysN2qxL6Ymi4z0bJbJIrwZdLOPWVOqBsT2YwuvQeQeRBrF31DrWFDkN6fZn4VhY8W
	 /awKEYGXDmBksT3tH3Crh2I6OVdws60pNX/k+7cAKkyg49mjpSPam5UJTrr2jcSnvp
	 cdi2ZNPGvS33g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BEB28C395EE;
	Tue, 13 Dec 2022 05:00:04 +0000 (UTC)
Subject: Re: [GIT PULL] fscrypt updates for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5ayAsXkTF3jK13s@sol.localdomain>
References: <Y5ayAsXkTF3jK13s@sol.localdomain>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <Y5ayAsXkTF3jK13s@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 41952551acb405080726aa38a8a7ce317d9de4bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8129bac60f30936d2339535841db5b66d0520a67
Message-Id: <167090760471.4886.14328396193429514472.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 05:00:04 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_210008_718566_67C5BBD1 
X-CRM114-Status: UNSURE (   5.72  )
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

The pull request you sent on Sun, 11 Dec 2022 20:45:54 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8129bac60f30936d2339535841db5b66d0520a67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
