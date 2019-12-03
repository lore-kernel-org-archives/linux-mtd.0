Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE0BC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 01:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E98206DC
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 01:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVeLhySB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyD3chR9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E98206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d3QOSYCGWGgGe5OlPfdJtJ2AijK+eqxe4HXkuqh4TM=; b=gVeLhySBFvZ7XK
	HCl6hPH8i4zoG2xeUpTMPQUkv/+h7UdBp81QYIG9u2zlbLm+M/vJc/jmxR6yRYbbOOzgvd+a+hrpc
	6I6wMi2IEyQM6Ukt3e9anmmBpRL6qQPyGFhU45lcDTdzJcndtqcNz8TEXnENhHTvgRUGZiboS2o1C
	FDEOH49c86zXleVzk4kRo6O6uJtfsUCIN3g8gFVH5tQOVcU3c1bbx/UGCwuY/Ny0pJlaUFKD028ny
	pRrIftMcfzZdPQU0qv2qi5q9zbuV7+LN5UaiHpvFM5827iXhmEKmWMkMTxejWFU6pegMhi1E8EcTs
	xkBZbaZ2VKbTNA/r1eBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibx1B-0003l2-K5; Tue, 03 Dec 2019 01:30:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibx18-0003kI-EZ
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 01:30:19 +0000
Subject: Re: [GIT PULL] UBI/UBIFS/JFFS2 changes for v5.5-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575336618;
 bh=t0492yjQtzcuOnpNEzTssNPJaZmkH18aG64RsUtFj+M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hyD3chR9f+ve08UXF5blHs5WYigCEmCMA6mNFKa8sQyTm6tg/lT7EKhxk/7eLVBEi
 uMpNN5zkJDZpbf1BLWo/liWZfgr62cb/w9KexVJlmtfr2xbloAgv/YqWczP9pbQ8kB
 kCyVD4Z0g/5OuGxvzkSYp3cX309gZKJ7VpcwrRlk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1044415561.103245.1575231527451.JavaMail.zimbra@nod.at>
References: <1044415561.103245.1575231527451.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1044415561.103245.1575231527451.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/upstream-5.5-rc1
X-PR-Tracked-Commit-Id: 6e78c01fde9023e0701f3af880c1fd9de6e4e8e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3a251e366e1a007c7ce7b2809b67f4dece6b17c
Message-Id: <157533661816.4888.1012998876032231528.pr-tracker-bot@kernel.org>
Date: Tue, 03 Dec 2019 01:30:18 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_173018_503524_3222469B 
X-CRM114-Status: UNSURE (   1.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 1 Dec 2019 21:18:47 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3a251e366e1a007c7ce7b2809b67f4dece6b17c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
