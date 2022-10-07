Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A317CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHYvJUfmkk7J3R6+MP2FFL9khfUa6BIoWElA3kTc+Js=; b=kJ7941iWlbk+Wd
	IgT1rwi7+ey4JJRW/rI8oO021C76dL666Zm+9sQgeXG1X3H/22F/RqMW4VubWSTnqkHAsG1X0j/3w
	vjfQ2AOORvLtFHunD5kq30En+RqeQaEhv8KNKB8F1Vp4I/kbpWDpDZ890JJPAWuumANLBeev/hhgJ
	MlZAIIdG+VMbvlFno3FzNGY6woldPyZr8Bq67vxsPWrZP4a8xIc8oIPH5xR/rKc0LimlnUu8yLi5+
	bsQDUqhCpikFki709m+OiBZq2tQuaJXNsAaqEGnCGqGmpK4oHtblcRzHW1uUHGvBA2DthbARHWxda
	2h2k8RXBMwFTCqccF/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogstO-00ACqS-GD; Fri, 07 Oct 2022 19:20:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogstL-00ACpb-Kc
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 19:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD70E61D1B;
	Fri,  7 Oct 2022 19:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACFB5C433C1;
	Fri,  7 Oct 2022 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665170413;
	bh=To4qfShJi/DvHw7N6YLrxUt+VFPce+fdBNcr5fO6rKY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WX7obP38rpSUR3xYvdl7RBMMgw74qBRIXkjD5I1F1uzKuFi9LzqPIn7HLLGN0Psso
	 jFW4QWpTwaLyCKIzSvBM52XEf51rPJCun3C9Akr1Fp01Pms7qKbrfjJgZpY30BBzbX
	 dKHtaPbiY+9Yt6Ok7q0tSjiwgVvuJZAl9qukMyyPE+yd0KHwynDVZQiFVrjf+G8ZlL
	 DDkZ3U5Y8an4TspUjH5aGJvF9XbSuNULzCqaUtUUuuBzovdSM0Oyok4A7ggObx2RKN
	 baab+EFThxGZipjdyKz8G5/vcC3dEpK/pJgE0Uf26pNu6+DQkW6ltssXjUpneVDeWs
	 TeSE/sxsjidqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A72DE2A05C;
	Fri,  7 Oct 2022 19:20:13 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221007172337.32e05296@xps-13>
References: <20221007172337.32e05296@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20221007172337.32e05296@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.1
X-PR-Tracked-Commit-Id: 63c30d70443064d71340e02024b4a463db5c77d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1227db9eab18f1ebaac990223d3f18eaddf1b442
Message-Id: <166517041362.8063.1721460274279860546.pr-tracker-bot@kernel.org>
Date: Fri, 07 Oct 2022 19:20:13 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_122015_751736_CBCC73D7 
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

The pull request you sent on Fri, 7 Oct 2022 17:23:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1227db9eab18f1ebaac990223d3f18eaddf1b442

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
