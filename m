Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658B6CCD191
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2024 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtvqP59twTZ6BA4xcteVOC7VfiptGApmV2G8BL8sQNI=; b=G/Ngzgu0LE60Gi
	DWKWwelTSb1WZLP+qzi8CVTXccM74S7p3zYUTtbeAYlbYINjNiHH+RxL1HnHhSvryVJCfpptbTZMv
	9B5q+GY78KWkN1vo2vTfElnJ+28N+G3R8rzOLsgFbFE7FKWJZ511h5KZriAcPbKhLRRCV/064oRrb
	8m0mTmr1psOYkyAykbLxL8+2tZ4x2cIjCnYAQYANoxkYOgRvNVohvngdPdD8ELW3FUnAqTwQJ3n2U
	gslffWeSmTl+C6EJLi9j/oSVdDZVd+uJvLXN2tS9ZK5gslU6ARIidVMXzf9qZ7ATX1znfFIbzKDzO
	hAW2uzLETClprjEvjpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqW2-00000007rs4-25Bu;
	Wed, 18 Sep 2024 08:58:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqVA-00000007rjo-2noq
	for linux-mtd@lists.infradead.org;
	Wed, 18 Sep 2024 08:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFE6EA40EFD;
	Wed, 18 Sep 2024 08:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778FDC4CEC3;
	Wed, 18 Sep 2024 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726649851;
	bh=pwtaSA6zXlbHbd4oCLlu4g4rv/ezyjrMIfI1sO8lHJI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JqjltCupoODY1mXycvsz0UCN93nLFBSLkZTnaVT7eW7dLiz8QWdB4PE9TPd7V6Zh2
	 6eUQR8nki3VUgMYC8/ttu1Dv2gZ6vchF6zLTAH/G7OTee1Vzu+lGhXIAJgrzNxldxz
	 Lw4LKPaHen1r+R0JDyKUWIQv8sRZlXX4O6PuYQfjTy5fnEGb/9vm6i5TODKdNv1Gou
	 RWmrTjFf6kaJwrbgWsyriKNmGlQhGvdUHt3SWn0eHODOPKiVZ5RkoLaRNSf++JLqcs
	 j0DbrSERU327pvwVYx93/jW60OYLCyOd50yddFjhU5mejRqXbKRSomhEoJMvWiUAcF
	 CoiCtlDDeHbiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E943806655;
	Wed, 18 Sep 2024 08:57:34 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240915125344.5a449216@xps-13>
References: <20240915125344.5a449216@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240915125344.5a449216@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.12
X-PR-Tracked-Commit-Id: 869acb874f2b61c34063b677c2bd29595bf446a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2471d2b3b2b88802a66e9ff97b32387e1e233470
Message-Id: <172664985295.725883.835476543813600932.pr-tracker-bot@kernel.org>
Date: Wed, 18 Sep 2024 08:57:32 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_015732_789024_68E6B518 
X-CRM114-Status: UNSURE (   4.55  )
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

The pull request you sent on Sun, 15 Sep 2024 12:53:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2471d2b3b2b88802a66e9ff97b32387e1e233470

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
