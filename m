Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93BC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 23:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipYnHu8eAeqnR8AEi065+GQQf3JlIPsrbHRhhWhjQIg=; b=EeDhQ3CVYrHJNM
	Ou/FsOf/vz+cOTxmchbhNQRvWUe0VYOpRgOBi9lAhLvmeM6WJcnJMxnqAoX0e8YE91vAWSdmuoCRD
	rXWoq2IBpJ/rnUV9PIG54dlVi27ofudIwexXUDRGgCNYbZtp1PB24rCsUHAXsvMTjh34hXqDQ6sk2
	P2Dz0X4+skANJb0gKyIYA9ywuz8DQbNxJBfUOd2gPlDeqYDOyLDys/znCgj6uVexUgX6v1twRwfID
	mFM/aIdfOPys7NePWNq3Vn3h+WGq4UmO1oCuOqTFM4J+S2vmD5gSuqE7zl1ucR85aR2LJjzUnJ5Uv
	BuIfDgn3/TYXAjYVaegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na486-003wml-6o; Thu, 31 Mar 2022 23:23:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na482-003wkt-BG
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 23:23:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E298E6171A;
 Thu, 31 Mar 2022 23:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D23A5C340ED;
 Thu, 31 Mar 2022 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648768976;
 bh=p9c6mAkztJWuLmDG7umbW8w15HYGZoRSvxkQNVEeU1o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=JC6gcklF/sQihUQZq5DNWo5QhGHPsmr9/iNF/x/QiDwJlfXewhFft4n2E8jGlu/O/
 vSIva8jtebnBrupCXTHZtT3231b8wFTUq/HG38Kr1hoJrdzpniU1mu6/pXUpQJ14n9
 x8PfKRm8QlT5FkJFUjTAex5W6vFdOw7vYlstjgd/MoJ3PUgA+Nc0MF0RZb3SupXiAj
 aKk4FusGageTG02F/7JBHBdFnelCZtdZS/Sok3kG8q89BgZHk4Yah2YWdkqvr889r/
 aLo6NVWgr0ZyIrN3c1loTTdok4a5uZfrAc55PFifk0Xx3m7x/wfs8B6oadAAaKNuZ+
 sXTR9U6vfWyTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C09A7E7BB0B; Thu, 31 Mar 2022 23:22:56 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS fixes for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <678407645.204324.1648760660133.JavaMail.zimbra@nod.at>
References: <678407645.204324.1648760660133.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <678407645.204324.1648760660133.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.18-rc1
X-PR-Tracked-Commit-Id: 705757274599e2e064dd3054aabc74e8af31a095
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a87a08e3bf2decaed29c4dfde3916676f9b966a8
Message-Id: <164876897678.28012.16351343936896890210.pr-tracker-bot@kernel.org>
Date: Thu, 31 Mar 2022 23:22:56 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_162258_477393_0ECE9881 
X-CRM114-Status: UNSURE (   5.46  )
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

The pull request you sent on Thu, 31 Mar 2022 23:04:20 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a87a08e3bf2decaed29c4dfde3916676f9b966a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
