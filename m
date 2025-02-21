Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBAC021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKdSqFURBA6a3ZXjZwMvyQl/r74By2OXR01SP0ldMqs=; b=2iI6WNiF7x+nq6
	rRjbFFcpq6tFZQHBc9/jEoUYOMO0JB3enj/ckyJV1vnnrOjTnTQL/RKj0eEB4rDtEcRQKecEi60y4
	hOATOTHAj5TVdJNRqJeet6MNGMMHv8xm1LRdwlXJJ96E0vjI/p9EZTvzPbqknN7aYpn3Rbi2TWbR9
	de7joB1l1PW+3mJN3uY9zn4XtHgbfkvbRiJ4dSMmJCLwhoR9+FkOVMzlLShlDJdG5s2GhjoJIp0Yu
	PjwHuxti69Z4z84EbbvVJxMAoMjPrSWalb4gHn3VX3OG1jeadlGPRQ46+WEqtuToF29bPQP7hKA6F
	yc9aETB7yMeqxk/gtj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXjL-00000006Wbh-3seA;
	Fri, 21 Feb 2025 18:26:31 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWXZ-00000006K6X-2yi5
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 17:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A55DC614EB;
	Fri, 21 Feb 2025 17:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C463FC4CEE2;
	Fri, 21 Feb 2025 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157816;
	bh=TG0TAasOTuNmF0CkIXQVF0oc/npI6oZC9uhR109NIks=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PGG4M+va+qP7GRz0xohfSFzyprVqK5c1XKhzSR78T6wWR5jhbadTe1tu+mMA1L2Ua
	 lHd0CNsocQ+JxZuGzxa+rRv5LTj4oD9Ef2kew/S0WyLQljhAjtrw4yE0Az76icZ7yQ
	 QQjazoDShH0iwAKRTYl4JfP7roKIzXW/MUmyzSy9m875wdWozm2XnU7QWe+o8hlVHE
	 qhaxQ1onKEExfpHAD5OYd4yc67FgaUujKNY8R6NidGAe8JfbV6JE34onln+87EF8+W
	 a38wgrojDtOWk2J5srXTQRB6ZubSSTZD3xUVmDAdNC8w6g05UVW75k+Lq3Riy4mhc6
	 HHsTW0I+eftDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7EF380CEEE;
	Fri, 21 Feb 2025 17:10:48 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.14-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ikp3ffrn.fsf@bootlin.com>
References: <87ikp3ffrn.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87ikp3ffrn.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.14-rc4
X-PR-Tracked-Commit-Id: 1dbf60277e9b6181d2366a94c974728106cdd551
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3daad8215143340c0870c5489e599fd059037e9
Message-Id: <174015784748.2120648.13804450615112893474.pr-tracker-bot@kernel.org>
Date: Fri, 21 Feb 2025 17:10:47 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
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

The pull request you sent on Fri, 21 Feb 2025 17:01:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.14-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3daad8215143340c0870c5489e599fd059037e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
