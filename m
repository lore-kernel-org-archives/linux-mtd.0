Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF4C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCivfJBD2/7KwWl/2Mf7oAy7JeYslQqx5Ak6ggTla7M=; b=1pwXXLSq8TKNVB
	5AKa3Szj4sZrNEtjJpXqPLg4SGiIR90yHYuZE1VTyfxB+JvgsYP7EWsAVVRhGOB0RLmo0feRaG7ZM
	IZJP7jnVPBJDwe0AwXkGalGUgwqIQpWn/jXOcV3z1F1EtdcwhGUf/j3pfkvEQS1fwVGVHDrx+lG0N
	N/93wWn6E2sWQvve37cQv8sHSYGyiDOHxYzcK6C4gHm8QTiobb7qQJaf/1+NzOULdRr31HGHQRY6c
	ZnQ3c4P6BS/TP7jH2n92rcphbGFBHzlWNZH89eHhoEsY3+ziwtYkxVVXXHPDg49dSAmWk2WkubiEj
	u5D7QjZlc+1tm8pskW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dtU-00000005VK6-2Hie;
	Thu, 16 May 2024 16:23:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dtQ-00000005VIm-0Z1P
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 16:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E45E61781;
	Thu, 16 May 2024 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCADC113CC;
	Thu, 16 May 2024 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715876623;
	bh=NWcuja2TGvoqXsxcrE5MZdVTFlrrtNmTLn/25njXllw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OTLedGxN9zu9QDg+g0UYEemiGx5U3mOHXRfwOHogsoOBmxq0jPz8Gc5wCjc8VLxF1
	 fV2pdtoUguDN93irirzKcq9TmwnN9sD3SNszpC1kyKG5+mBeoTs7Lws3apZc3iEIJz
	 ji4Di/duAC5vAFZA0/VnWykECzcXnm1MaDOJS0BgWl/yU1v2p25AN4tSa8QcsIMtlO
	 PQXPHUJIiO007uq/I66+EDwjtzEWGwx/44SkFlhiBXDnhp5a2PKaXl0YxHTVgheXZv
	 DaxtX5yYrJa5BGKFWRm4drvtne38oZNaTCOVkuymQ4oM4SJTlrCKVrisv6i2V/VO7V
	 11n6HkaUvjtNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20919C43339;
	Thu, 16 May 2024 16:23:43 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240516111016.10d8abc4@xps-13>
References: <20240516111016.10d8abc4@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20240516111016.10d8abc4@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.10
X-PR-Tracked-Commit-Id: 552c9380f98fc47950870ef0935f94cf3acec087
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b426433c03a6eb547515edbe74ebb3a90b9979dd
Message-Id: <171587662312.28916.5460814490515635624.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2024 16:23:43 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_092344_241508_AA4501AB 
X-CRM114-Status: UNSURE (   4.44  )
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

The pull request you sent on Thu, 16 May 2024 11:10:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b426433c03a6eb547515edbe74ebb3a90b9979dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
