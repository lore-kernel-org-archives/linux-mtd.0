Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A15D3B7EA
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 00:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FMz5peKFP+nWCsmlhIKYp3Wxa5oe6vJDygRbtAJShk=; b=GBBZHv5rAlnQlw
	QuqAvW6x6tLNsfS4p2D0Ez18kLGawzSIVQ9Sl8+Cm6HpooIEZCiK/0n6KOB+zUYq2R7zV50lJSRGW
	5Hv1O9lyt0Fq9IV1yGXgb43QuTsyMSKCDdFHMytm0H02X0ScYn8WIEcgPU82JkrrJmc3mRTFxz/tY
	3iFaOrssyYwh8h6n2OUbqoTX8LWKpz5J+C5std7TgVAhAiMgpRXZfR490+hzfM9KSOuLFCniryITE
	/XkG9l4GtX/tQIiPLk/aykMIeSl00+X5g2PCOLOJ8NWTndsZ73RvZnOdeaalFBKluuY9sCVycRRDN
	qlg/Ev4YO7NxpMGcvHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlN4-0000000DeSw-0col;
	Tue, 09 Dec 2025 00:14:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlN2-0000000DeSj-2wCa
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 00:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C423F60126;
	Tue,  9 Dec 2025 00:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8BFC4CEF1;
	Tue,  9 Dec 2025 00:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239263;
	bh=Xw5tm+bd0P9HBIW8jBLmATAUWxvbGWtIioAL9GJxHOM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qa4gJcJiH+7gPd+pShAI57UrzOEKfuGi//cHL2cWyMZpBy6Cb/pGP+lCmK9oUOUsa
	 7HQI8CUnkPxfcLeCaBSM6CyjK74CXWza0QcaYIYIEr/ipUcrm372i5SNPExhPJiklb
	 wBkdO0cXft6axWHpLHmaDBPGiGrU6WAxYBsRk4Yz052D/w8qGcuH/kRS/UsZo+7ovL
	 6T0tlASe5BNj1AQr87+lVdwNiIdvtLehFxIqguZMhotqwrdYSNv6nvC43+ZvD1jhHT
	 8iOPbM2iQ9+q2NRHrLEnd0lGJOToUFcwOmpl1G+hWMMgVm4Qg44tw1YoR8ypfotoOW
	 IJhEMB+Y+L97g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BACA3808200;
	Tue,  9 Dec 2025 00:11:20 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <21252217.fSG56mABFh@nailgun>
References: <21252217.fSG56mABFh@nailgun>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <21252217.fSG56mABFh@nailgun>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.19-rc1
X-PR-Tracked-Commit-Id: 0695aef23d674815c352293c49d944a2375ee9c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70e3083ec686100682c146346efc2b3780d717df
Message-Id: <176523907889.3343091.4346976752164330598.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 00:11:18 +0000
To: Richard Weinberger <richard@sigma-star.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>
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

The pull request you sent on Mon, 08 Dec 2025 21:15:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70e3083ec686100682c146346efc2b3780d717df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
