Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C3C3601E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xw5Do1FY+hLpE3rTRtSTvJ9iPvOKWlgozsPXlRPgSPM=; b=s0QSp/KQuOdPth
	DyizZwjpvjZx9vKLP/L8YNn/PIrT64ON72VXYMXL94ASTO4hR5dQX+tNslWtushTEXzOCHLsfZIO2
	LVw9r9skWy1zr/yxvSrPf3OOF08yF+djCQWwNVLB3VF2MJOL0ZSBrt2Rmzg37MzJMgWdyfknv204j
	xgFgGjdmogMMS7XgEmdzS+bfck8T4BVr/ZETvKSTmV/5nY3UiBzzy3Z2Tt7utSi5Bp6ueF3EHoDeL
	IBk7/YtvgD7SkBdjslOXKWutZ0DF4v+cNw1VXtgs/2/g5Q9FpVszy4km9h9jJ08ZbStd0XnnB1Qnq
	sBEgeadZ1oACEl5Oc5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sb3-0000000Amqi-1U3J;
	Thu, 10 Apr 2025 14:09:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sb1-0000000AmqW-3eqj
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 14:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7BC6844D;
	Thu, 10 Apr 2025 14:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28DBC4CEE8;
	Thu, 10 Apr 2025 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294175;
	bh=hnc1HD5fbqLWewm3HtfKeq9YNebjhVnVUk0MfPuXTkk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NIwHjEZ0mBZJljZaXszq9gD176kD5ClRGvR+jgR964IUaf7aUe2stWe6FpWb2Eg9k
	 oL9ad6CuJ9lt/zng1/c1RPd3mVT7v5K8cVJl8a3BIHm2bapj3LyrxeQ45IG9ohF0V0
	 bFxKl1ZTTCeey1E1WXx76Bq4imy1bP+ejZ9q8FRPwJR5aLg29BIAgrXQzNoXPOcgO2
	 l78gA2W6PTt4D/grh7iB6uJab/OnL0K0bDYDjRyE1eDWXdXkXb9aKNjtdDSvGGVbtu
	 VRq6/sRJidEBgJyEVjLf9qvSrN8WGOATXKEnXb32wQhf3mbFQHVLH/6RSrvR1QBug3
	 T6wqOmCskMQgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE384380CEF4;
	Thu, 10 Apr 2025 14:10:13 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h62wcvno.fsf@bootlin.com>
References: <87h62wcvno.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87h62wcvno.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.15-rc2
X-PR-Tracked-Commit-Id: 1c1fd374a2fe72b8a6dde62d3c3a9fd153e7581c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4991c01ad07c1b3954a95e49bfae80c726b4b48
Message-Id: <174429421227.3685623.2999815226849881135.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 14:10:12 +0000
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

The pull request you sent on Thu, 10 Apr 2025 09:39:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.15-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4991c01ad07c1b3954a95e49bfae80c726b4b48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
