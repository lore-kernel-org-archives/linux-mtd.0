Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7lcQ2qrFq7F5Jb3zbPoZ/DdfhilUEFf7ZVlhIS7Oxw=; b=YbddfACtJ3hlWY
	P1pN9/RUUkYt6SkMtfus87WeNbFDLjdc1tghoDmMmHuVup2sQ+7CvH8pG1f/EdnGcutmnBzS1czcw
	sqNybGcPlOzGTuTi181mSlkYdW6eQKwxyuORGw52655Y0By4PEx8/xsaLzwEQ9FFDV/amQ+x5VY8k
	6JoMc5kDqsLiVZ2FBGiBTeZt6mL4YeTRdHhCLCJB65o7bW0SN/n+NORUYoAOCJ5pLIWCrH+n/eujb
	+zLH97oN6VYapBcEiohiiuN+KwEjXRT6caTD/gpG0A2i9CNk7xy9eutEUwRo8gB6Jd964CYINEYBS
	b1cXwwNH27YZx1n07gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEbN8-00Bby1-Ub; Thu, 21 Jul 2022 18:58:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEbN6-00Bbuw-6L
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 18:58:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 174DAB82642;
	Thu, 21 Jul 2022 18:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A60F1C3411E;
	Thu, 21 Jul 2022 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658429880;
	bh=L1a1dJ1Q7yv/Uynd18WPyAqSHQ1eoKFvhjTWuxPZnhk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fg6FusY7IZ6xqVSxhaivnLD9p8O/UtSWhobOzkl6SXrwWyXd3n/v3Uf3E6wu1sJqW
	 c0mgmHtK/T9wB4zVJkl2vxkiNoJSgDTKQIiYR61eK+UqHSWMOgc3Qh2QIvuBHUxRTt
	 eR3RlEmWoBEwgrAeYyjl9eYzURrkou4MJbWDo71mC24Q+eFskA3cKHUtz7ucEZf5S0
	 NQXiI47NC9YwP04N/4/CCVj8IkUFZfZgczGNAbWPTSzWbcVKeA0ywsdCY/ONgg976A
	 n0soDooFTnIeMxtSpR1QKk8z0QQD76Weo0vlfyolVBHvCRgWUwRTC5eMF0JiutVQ+2
	 LeL6tL9AZSkow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94517E451B0;
	Thu, 21 Jul 2022 18:58:00 +0000 (UTC)
Subject: Re: [GIT PULL] MTD fix for 5.19-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <1803003448.13661.1658415349943.JavaMail.zimbra@nod.at>
References: <1803003448.13661.1658415349943.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1803003448.13661.1658415349943.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-final
X-PR-Tracked-Commit-Id: 0fddf9ad06fd9f439f137139861556671673e31c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68e77ffbfd06ae3ef8f2abf1c3b971383c866983
Message-Id: <165842988060.25323.8126060370434664563.pr-tracker-bot@kernel.org>
Date: Thu, 21 Jul 2022 18:58:00 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_115804_419595_4364F913 
X-CRM114-Status: UNSURE (   5.59  )
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

The pull request you sent on Thu, 21 Jul 2022 16:55:49 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68e77ffbfd06ae3ef8f2abf1c3b971383c866983

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
