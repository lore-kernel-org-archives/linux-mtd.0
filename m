Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3007DC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 19:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CC6613C9
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 19:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CC6613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQ9jHAiP3KPj/kTrZnVQaid9Beu/TCzb3NhrDCr48Iw=; b=TAA2BHV0/3UP9H
	fagyXYX6OvspuMinlNn5j3QhFR5lh9aCw4CMjhTIFbuicNoVu08iLIDNKSdLthHPFaPK4ffzkpeXV
	BR+xsKEEyH3/N5d7o8Acq7rWX26gfpuLUNVQNTUQ4TfpieAwtRpr6oW69O0HlCgogTaBsGDekPdUy
	Feog8luCLWdT/mLVkBlcdLqE7Jo8ZDY883lxINLQzpCbo0rRr2FXoErJpVeDFlcMxkuW5Wydg16qs
	39g0NPKp2J7oiBKuTfntXjOymeWeNdIqsuDTa6xX0bc2LgkAYLSwPVR+hirYR6qfxxIghq4Q8HvYY
	r6vgVFZq15MJsf98Lamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0UCR-009i85-18; Mon, 05 Jul 2021 19:24:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0UCP-009i7n-00
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 19:24:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 805EA6141C;
 Mon,  5 Jul 2021 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625513048;
 bh=uVX2yCpdtPvb/0LsatUmREaH7MB/H+IPC31fTSSuQ94=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=JdV8+CB1NY2KzmlCyrbmaRm0nAY/pJTi92mAPnJNxO36UenP81ZkBPI4RdMP3zgVL
 +mP3vB0IDPoGBUkMXpIMAix9OLYvJXollazGK0RD54MXUcEHEyWwxHcm1TCp4+cv1e
 OVX9K/141IPkII51eh9NyMAHz/iEc6WHHaW//1axGFdURQ1hxCdAwQXT78VMXqJv1U
 3W5wInV6fCTKuDTH1Bawwn472/lEsmV+jwGtkcGc3EV65UzSKMibFectqlYxSy2G2M
 Tq0dmaqF2ujw5Y2oabuvPQm4btr58Ij1QT3zK7btMEYd7fdLLxhNeJgs3xtBzOAiCD
 /ClzCe8NrRuKg==
Subject: Re: [GIT PULL] MTD updates for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <713549850.26791.1625426900795.JavaMail.zimbra@nod.at>
References: <713549850.26791.1625426900795.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <713549850.26791.1625426900795.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.14
X-PR-Tracked-Commit-Id: 0bcc3939c98d83955397eac1584d5f791fdc88d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da85e7ed6993144a9ca43a1106c7f898626390a3
Message-Id: <162551304848.9654.340536382376523669.pr-tracker-bot@kernel.org>
Date: Mon, 05 Jul 2021 19:24:08 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_122409_090078_FB8009CC 
X-CRM114-Status: UNSURE (   3.57  )
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

The pull request you sent on Sun, 4 Jul 2021 21:28:20 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da85e7ed6993144a9ca43a1106c7f898626390a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
