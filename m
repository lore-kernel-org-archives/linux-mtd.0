Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmm8io/ukUuZmoX/1x5u8IC/GP8hDz20z2cfVgE0/UU=; b=AxaQr4KBXSYqGM
	7q7U8leXNc4MRtJMxWDFKkdDaBYKyA48q2pxfmd3vhFy2vMPT7iX9VuzVqiLah5XEigFeyjTN/8Wx
	DoqP8cGR1UnTduh6E9/TS5SrQyBunQ3tWVpzQlF6HUyBV/o+t3z86UBbONqmLH9VQIylyMtq9fmiC
	ADgnCQ/9GuiQL9opBGi4UA/t5O1uGrf3bpjLSYUYuACmdRpdZRlbdte1LTLkzW0qOjXCMDDXxgL4z
	CauOHAkw2gzNQIfsE6WXRTuRMqOMKo4M4NEuu9Nfdg+YqplAudABfHZdMtNTtzcSq3UBl7gsvq8tc
	jYZs67YSv6UWYjqS8KPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXr98-003HyG-Q5; Fri, 25 Mar 2022 21:06:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXr96-003HxK-El
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 21:06:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 817D1B829E8;
 Fri, 25 Mar 2022 21:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9870AC340F0;
 Fri, 25 Mar 2022 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648242413;
 bh=HBNxehuWM95mJ5tBOdvdjSVbzp99mTC/zrq/CgLQ/0w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lyR3Xc7+3i7qATxCDuL8jKg9L/LXVtU6QjGNVD0YB6PyX8GHwjd2Gc4X2iJBPtfW6
 ql1I2OPu2qNiUhzmI9XtHrdE8dwwszXspPQKmUwLIxcX+J308YKkdsixu929qxShFy
 swfkBY95k+h2LFZ14da4p0iy8/R05WRpQwtTkzMQnPoR1UPJtPHhwlr0A3Jg3l91Xj
 0dA6oedtXiTGC7BKbW24G2Jw41ItpqfSGOIA9CcHwVRwmgXFb2vaziQ7b+t4XdFrJ9
 96MEWJWPtXdkCF2eC+TGED84NaEhYeoRKA1XJjNAeSjuEfaP/umDY4WTSFDDkPwUZK
 nZJqmN15Yu4Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 85B1FE7BB0B; Fri, 25 Mar 2022 21:06:53 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220324102537.074f3a73@xps13>
References: <20220324102537.074f3a73@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20220324102537.074f3a73@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/changes-for-5.18
X-PR-Tracked-Commit-Id: 6cadd424abb63120f8346a4509dc43bddc9401d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e35a4a4e13c35f500a8d38e836b5e335c7515494
Message-Id: <164824241354.8431.2470875877028264178.pr-tracker-bot@kernel.org>
Date: Fri, 25 Mar 2022 21:06:53 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_140656_663883_9D9A3354 
X-CRM114-Status: UNSURE (   6.01  )
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

The pull request you sent on Thu, 24 Mar 2022 10:25:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/changes-for-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e35a4a4e13c35f500a8d38e836b5e335c7515494

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
