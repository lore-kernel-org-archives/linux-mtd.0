Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B9C77B78
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTflxgCqQYU5X8R0kugnOjQq0FHK/ieGN7r8WRaJRBA=; b=t4oAWyhGVVNoiM
	W7mMlpjW5xi8pz9M+ngExQJA3UsO1/1KuJFAhWMQgh98WExJ4YTQMAITJshXjl+tr7Qvd+VrwIGMz
	WoppEbYukEPo68D+/3rZreY1FzrEp9LzE+9Q6zZylOKqmeYJbme49WGVbQ/rkP6KoVFHJrwGQ+O0w
	z8ifZxoD9uM4/xscMFirYOh/xNefUQZZgSrps0DybyKZIS1sDYm3UZKHBEDI30dd/lIsF0vKV8iUS
	J/b1hgz7AQEh+iSq5DFhkrBTfXFBrQska+UVQP37iUTD1/FnOwB4HPjMAK22IC6Wjx1mvsgDVNdzL
	S5TezOwEABOI43beEHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puPPU-006Rul-0Z;
	Thu, 04 May 2023 03:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puPPQ-006Rtl-27
	for linux-mtd@lists.infradead.org;
	Thu, 04 May 2023 03:13:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A99963128;
	Thu,  4 May 2023 03:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71DA2C433EF;
	Thu,  4 May 2023 03:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683170011;
	bh=11kUb1AcjFKQBpL5XbdAhEqcvmUd3qcyAJSjY3lVlks=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ot/pqkKfG0neGSV+BnsFJvulSw5JOmc0GS3Xd0ytBaDBxL9y8U6CIpomVFBsGydP2
	 Gx9PLezIAzICxKODUtmSTawBQ60kKN4IiK4N13Q4zGUpjmOkWv6ftkzsnpkBD5IgoO
	 YDLMFsnaLNUT1MncwgY9DAwkTBQ5lZAm7lwqolPPZKY66lIQ0yVWZB0hAViqPpDfcl
	 pCD2fW3I7pOpSM/r0dOKU4GZY2K+vII6JvrXwXDO7E6pjXyQ6gW5+Gyj6mzvijohRP
	 jTT/GgPXcjzgwRFcqwMnmSTD4JhKEP+iWzKCbmydVRVWwfQ1EXCuH0zAzASeyW/rqy
	 xLyHxRrbu8zzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61CD2C43158;
	Thu,  4 May 2023 03:13:31 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <1235201236.2692346.1683141945109.JavaMail.zimbra@nod.at>
References: <1235201236.2692346.1683141945109.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1235201236.2692346.1683141945109.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.4-rc1
X-PR-Tracked-Commit-Id: b5fda08ef213352ac2df7447611eb4d383cce929
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f2692326b9c6db8d0e866d555606b12a507a363
Message-Id: <168317001139.23861.8677898081963620103.pr-tracker-bot@kernel.org>
Date: Thu, 04 May 2023 03:13:31 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_201332_732609_23D6CEC9 
X-CRM114-Status: UNSURE (   6.43  )
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

The pull request you sent on Wed, 3 May 2023 21:25:45 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f2692326b9c6db8d0e866d555606b12a507a363

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
