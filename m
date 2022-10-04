Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A785C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 03:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWXm5Jqw1umJjqYGwWtfTeaQEarqvG8yHDa8yEAZUhA=; b=Gb9t6OY4+Valgw
	AC1JZ2IdDeZZUaT8sk8L/2IqCOHBP2BtDLNcF1ir7s66JnbCKltJ0tQ0EAhOc84NSNvm7TMvCBFc7
	p3ZTQYk9jkio9Y00IjGP+Fmp7kHtNqaxuRoEHKWyuRFHZLgkziH4ykO/SbHC/uuzc9NTC9fPsY/9D
	W80YS/XV83J0Sd0kDlcYI485loT0LLUht3enjxosIMWKmc4alOmsHWg98a/l9iLUD2jVloSPUCWFI
	bIwvCiKA/mSlwtO7/92wXXdi6kc9zLEeclB4zDPn69u9hrBUuGisLun7ar0xP5lIcSk0MvHSX+RPM
	pANX1QxckjZBwqMBMSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofYrc-008SA1-T5; Tue, 04 Oct 2022 03:45:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofYrY-008S9P-9z
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 03:44:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A7ECCB818FC;
	Tue,  4 Oct 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ECE5C433D7;
	Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664855093;
	bh=QXEoLo1dKWbjRA3Zt6TXmiZvUSJjyNbwwOlKDlL1NAs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gWveEPYzx5AH+T1YmlA4iOwhhrea6wFD5bVYGBs1il6oYjkJ4bivt+5qY5sYi8hg6
	 8IMzvdujb+Z3atrRc0rjQn8yScBSUXJDYb6VBspkMNns+rurWIEI4aV2KGzRsrzNby
	 zNslCoPpfkkvURRdX7x+WaHPZI4CEJxj9kSUBxpXh6pHA8cZFoDjVawUAFfTHajOd3
	 8ghbr/pXYQPRRmhLwUYm7igpANf0DG30ZLXZah3FDSx4hJTj6g82UpAIiSXbO5z3B2
	 KyQ9BrawmXWNu16KqBBwVkiLF6DRXCwa1sN6KQSdsM71hNEyYE0OLuhDD4lvcXS+Io
	 qyZTK0tnCGoJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44292C072E7;
	Tue,  4 Oct 2022 03:44:53 +0000 (UTC)
Subject: Re: [GIT PULL] fscrypt updates for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YzpQMx1FiZp/PsM3@quark>
References: <YzpQMx1FiZp/PsM3@quark>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <YzpQMx1FiZp/PsM3@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 0e91fc1e0f5c70ce575451103ec66c2ec21f1a6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 438b2cdd17a6c9df607f574bd13b6b637795a411
Message-Id: <166485509327.18435.1743382934950044503.pr-tracker-bot@kernel.org>
Date: Tue, 04 Oct 2022 03:44:53 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_204456_513430_DEDC877E 
X-CRM114-Status: UNSURE (   5.90  )
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

The pull request you sent on Sun, 2 Oct 2022 20:00:03 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/438b2cdd17a6c9df607f574bd13b6b637795a411

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
