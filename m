Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39D5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF7E61027
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EF7E61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biDSgDyp0xgOocIoXwNEHClewG1RHvjce0xcjjz/fMI=; b=1BwTl/p9mIoGyM
	80GSV9c5SlAb1z/s+RKRsdtHT+UWmhyjSVDMtiTCfpIJH1qLE/oP71Eg68i93wlKt2+welTQv8mMu
	oZ01vfqT5/5B8+TWz/Q2HZcF7N7dZ3hkHCwDYj88hb4ygl3HMrXM0ZWblL6fXOx/4s3udV+wcmKuv
	zemAnA6doXhwNgV7YA0TymsSww05N8nNm/6pBhQUIo0NPuGMmHm0T6ex7gtOQoBPH5yGKB7x5ocfJ
	JPTX1rydgdDJKoFSMi0h06Mba+pfPvwz1bV0sXzqDG2pPk9Dc4snCIJ6k33jWfuL+2uo7ReabjXYn
	7BLgJZwncgxNIPva22tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOMr-007fFc-1g; Fri, 15 Oct 2021 14:39:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbOIh-007doM-BY
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 14:35:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5447961214;
 Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634308510;
 bh=T9mFZK6z4XrXK5srmw5gyWKHnyNNrM0CFmu4WcqEzmM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=UQCFVAm1Kmydj5UZl90JvOFkYmGLqAFrHWddgVZhVAnx2uxBkCg+N3T30RFXLv0Dm
 AuQn4+a4diohPKfWZRvUZhyJqTfuBoSaDX0FcSKbpstAaopgMSxD+j8QnVVBX79wbL
 5ctTFdqIU7hV7W0dAD/hckUn0HZ+5bi3D/0hVSx1pPS6L3tsQ6hIe8buh8vO6pz7xj
 CmxRLJ5TjPxlKGvCCaz2FWHMW8Wc0X54wW/Q5qlBkq53u1B3DmeavMI/edPXCjWN/t
 ljuiilM4xSDUJ3iAWhkUOMw9sr4+TLx9Bu0OecpeUBpOWgnKTD1IvHTM71z17iag+D
 SbSwJun8RXgxQ==
Subject: Re: [GIT PULL] mtd: Fixes for 5.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211015121631.2d9fa93c@xps13>
References: <20211015121631.2d9fa93c@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211015121631.2d9fa93c@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.15-rc6
X-PR-Tracked-Commit-Id: f60f5741002b9fde748cff65fd09bd6222c5db0c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e795d94deafd007bd6702679a02b82facc6e7ea
Message-Id: <163430851025.21069.13663451040102869717.pr-tracker-bot@kernel.org>
Date: Fri, 15 Oct 2021 14:35:10 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_073511_459215_62CFDB6B 
X-CRM114-Status: UNSURE (   3.09  )
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

The pull request you sent on Fri, 15 Oct 2021 12:16:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e795d94deafd007bd6702679a02b82facc6e7ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
