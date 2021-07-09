Return-Path: <SRS0=zNLG=MB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D5C07E99
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 17:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0C2613D0
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 17:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0C2613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEGFUhfepJ/bNTq3iclZyuo3QTBvVavOI8aO9K6rH50=; b=DKeA/6UBR/Qsqw
	Km7Y9IONtLSJGlmonT3kZ4bSSxcU/RWVJcwcts2anO05c+065mM92PIWccewR0rnTlHYUkq4Z0Lgs
	QxEIbMdnqqYhIER8KAPrIxYASE6zLH4s1FhLPMJCl1kMNRRfjhnJQMtVR+48d5l3LtMqB7Faeps/c
	arvgp+dhUn49fROsbOj4pb8rY9uytKqGiVj4enUu2UBnpTylvvKRZFPeZ7AhhY1UXeVra0gEMrtjQ
	fc38PeAOftA/BYmVWtCPq+2J71PFfwgwAubSsXAHlPUGGbbn7AIHYPC/u7D2UL+lljjXyJ64udzeh
	QeN8OecFldLyZoS1lzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1uVO-002E74-Hj; Fri, 09 Jul 2021 17:41:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1uVL-002E6L-OQ
 for linux-mtd@lists.infradead.org; Fri, 09 Jul 2021 17:41:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 69111613C3;
 Fri,  9 Jul 2021 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625852494;
 bh=s7NHSmEvVLDK8ELKiralJ+3di6Ye5BtwUViSqtRFX9E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GUTyEm8xPp6iORWjK6uruak4u9nf4kfLoAsM4KWDhlw+xGDGwO95Jw11ZqjDwpyva
 Ypj8QRLqIOXIYe4DfaSdM7ZCkYv4W1RWANvEHZZL/Avim5HWi0ZiNvTVnmzGmrwSjN
 4UKPPsnDq7hbJNDASy8dBK9kYGL2RYAOK3frgsrHl4o/JNQ+YDRa9vq0lW5lIaw5FN
 A3JKpCyhR8D65nYZBaSIX/zO5v/sL5eWzGJbxX6o3FI9MmHqD+uWBhuHCsPc+5y4PR
 +IgWN1MGNzCNvBLUiVbnAJH24DijZPnjVTdObtSXyDPNZ5g05deuJkexC6n1unsDsy
 Y+/xILoq/hz6A==
Subject: Re: [GIT PULL] UBIFS changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <245242026.4934.1625778600867.JavaMail.zimbra@nod.at>
References: <245242026.4934.1625778600867.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <245242026.4934.1625778600867.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.14-rc1
X-PR-Tracked-Commit-Id: a801fcfeef96702fa3f9b22ad56c5eb1989d9221
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a400bf28334fc7734639db3566394e1fc80670c
Message-Id: <162585249429.25269.16275890531912140965.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jul 2021 17:41:34 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_104135_852226_0346266A 
X-CRM114-Status: UNSURE (   3.95  )
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

The pull request you sent on Thu, 8 Jul 2021 23:10:00 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a400bf28334fc7734639db3566394e1fc80670c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
