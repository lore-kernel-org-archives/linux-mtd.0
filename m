Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269C1C02183
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3e5zdCx1K1gXLzlzUvvvShjyrz9cpXL4DJRUWojLis=; b=PsUIQXogRUo23k
	ECsFWzQ8R94CcKFfJObGMAFawpoCF1V/rpkOcXCJH4wd/jqUwVInkVOqjQ8jQgJp4w0SDBJm9q3ej
	YS+8eRnfIDIrETUModcQC4iG/1Xku4tL6nF8PP6U8B9QWHAZylbr3RMTqftlnSD5N4+uPvDYM1Q+X
	155r21wiFKQ2FmSUPsDgT/zYyVTNPdX9LTnV5/LpUW55NkLp6GOTvqSpNYiDGKPD15GKQZo6O8upm
	Yk3y8ciN3giHHMdwWL1aqwtHokDk7HyChkBggvn/J8RucsKaBcVxit/Mawsg3d71qdofY9/AT5Lux
	ecSwqunL/FuEAhxQUOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw2R-00000001ZPS-3qoN;
	Fri, 17 Jan 2025 23:46:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw1S-00000001ZCu-0JVq
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jan 2025 23:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3C475C62AF;
	Fri, 17 Jan 2025 23:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B70C4CEDD;
	Fri, 17 Jan 2025 23:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157503;
	bh=CabJ7syIzJE8FFIegac4CGeksVzciSFs/sE52SNoXU8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fpeDB26iw7QiqP+LLACurWbLxV+tnq1GFZ1LdJu2RoGxMhWL+PByQIuMuabHSmJS4
	 lM0cOwQenIxAOy8onzAzDEba5Fhc9TjqnskNwg3QIZt04rGfer2Xd7hy7nfgBdUiOs
	 KPqF+4Ece91CSYWH80g+79XCUxbGKCW1RZgqgb06mKFDQSxpgCVqWI6n6KOmVRCL9P
	 Oa9u2M/iyHgvlb2Gx8GEvF7DLCsjM8kJ8NKU3owGkhtJz7e1ZEbiZ9ejPVDZqVi0UT
	 HiNertJh7JgmeS+6KLFtdSP0nSorB+DQL3Ap1bJRwolMPy967u/8VgXDup3oR39Qp1
	 wy9IrzFoJJb6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF36380AA62;
	Fri, 17 Jan 2025 23:45:27 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.13 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h65xgspt.fsf@bootlin.com>
References: <87h65xgspt.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87h65xgspt.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.13
X-PR-Tracked-Commit-Id: d15638bf76ad47874ecb5dc386f0945fc0b2a875
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42f38ccb00dffdb198d26d18681ea37d95881bcf
Message-Id: <173715752637.2291664.15355370622302184418.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:26 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_154506_197018_8D85679F 
X-CRM114-Status: UNSURE (   4.66  )
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

The pull request you sent on Fri, 17 Jan 2025 20:12:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42f38ccb00dffdb198d26d18681ea37d95881bcf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
