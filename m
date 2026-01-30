Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A3D73E87
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 00:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76+GVIhHQg5jIW7cM8bfTrr12dWjOtQUSQXbJdF1z1k=; b=sDfwHge/RB+uk9
	eahDsKgv7Psqmhx+K+uLahQpX8ojnFZVvglg0Fiek9II+5Z6LmlUOywATo1aUrXkTB5rTu5t9CYEP
	M1ewhJtxlkiqPBNIj7HvTIRpb0Hl3STYxHEMcTK4QTLKHU3VXBUm9l1GZykfyGgLhmo508QWdi5SF
	GtxVh2gadxAOMefS/FrvMpqomvY7aQBGhzu3mJbHg1LegQCGsF6g1qg9KfdTKPjr75DMkMBOO04C7
	6kWNhmNbffNAq4KgBD4eqeD4Ls1O/awMOUk8FOK/R6PUhQS0JLP3bCs0RM9WqnwLIcBXh4tXHL4x8
	ImM0zF8n6hqxeeDh+TIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlcNW-00000000ox2-1ugh;
	Fri, 30 Jan 2026 00:28:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlcNV-00000000oww-00JX
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 00:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 251F560054;
	Fri, 30 Jan 2026 00:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0F8C4CEF7;
	Fri, 30 Jan 2026 00:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769732925;
	bh=ixQuXphMSHBhjr8YVZe5T7aun2mH1nznJkhot/vgJKs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vRB8+jzJwDaVhiYQfQgo8xUH23qYe6BeJE4a8tKE9zNFyGW+2yxku4DaW35NT4QoI
	 rY1gDOf6MjC95q5Vy+l4TdTc5/W4NkiAJd2ka32Vs/SPwbkEEnwPCZcN5WvjldcxVP
	 Y1iuvEQ5tuOXqkSKUBhJIDADFrBBrRePOC/dsEP4HA3rUxp9CRq07JzTyR6PHLJVxF
	 lciLzjem+GfSU1/zopZ1AL4x94nJys/NyA8phy+iON78w5LFqGt7CQ9de2YN+KYtOY
	 DNup6OB4kgVyexbmggDsIqkju0jm6d0NKZDtN5vITh4ccRJ5INlmRlExrm+TzJO/o7
	 56ytQISl3LCCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DC6380CEDD;
	Fri, 30 Jan 2026 00:28:39 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jyx0jjox.fsf@bootlin.com>
References: <87jyx0jjox.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87jyx0jjox.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.19-rc8
X-PR-Tracked-Commit-Id: 2f6d2c8d9ac05a7a1c02333f6ad30868246880d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9f6ac972ec0139a7988fe713740a957aea5d999
Message-Id: <176973291847.3113374.14157646046859030354.pr-tracker-bot@kernel.org>
Date: Fri, 30 Jan 2026 00:28:38 +0000
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

The pull request you sent on Thu, 29 Jan 2026 20:35:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9f6ac972ec0139a7988fe713740a957aea5d999

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
