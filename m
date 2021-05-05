Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D7C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 01:18:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038FD600D1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 01:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038FD600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgZ/BT2MphpuCMjmTWgI3pngTEVxzrXJ5bIybEQz034=; b=KZ4x9CeUTD+kl3w3ehz/Qnwl94
	E82/rqhhIMrOFSjSIC/X/5+JsjBv7j+jO07Ft29sR+Yofd7KL1D4s/2O66IAR5T+eOhd1gMlgKmV/
	mmRNfK7z9rY3j40q4Rhe6aBl2bXyOaAEBUAqceDClsrRm7zvf20AuoAWVLu9RmN8uNLvf4YXyys7m
	lrbY8q1cjeQYEd0QBtHyOeiqnd2jt1ImPhxJCVD/0dl1nzMFs5foZadrGE7A0BbYS4F5vzuQu88dK
	lfWQJajUgSUUdFcH914Ta7xfz9Iwfqx0ZQW/uIbHNmcw6JVqUe6s6bPf/D8xCpIjUnw1ov9qcgo32
	0Ur60alA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le6A6-00HVy6-3v; Wed, 05 May 2021 01:17:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le6A3-00HVxy-Ln
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 01:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wfFhZjh0CixniazcTAsaXmXlJThFs4bjN73+Gsn/IXA=; b=b9AbjXRPCkskLQEsEkgteOIJLf
 4Ytt9h7qyAWrHTqC4uvz/qlLho9DwtkO0YsAJj6kbTZd0MOHmWqD2CPLc081NaYlW8PO6YrME6FwL
 fAVhA9m4GMXjtPRrj4ispDmZ9OGDazCnCgu2UgvzqWPXjnxB2SMIJsPaL9XYLg1cv62eMOcnWqk4O
 Bdd/udL8kl0aesAm7MXcZ6t9tdXadtoS1g/KFUEZ3N5Au5F0APDEZlkxxHCz8+FT3A1giu2o1OaVJ
 nYNtUZ6ILCw14Rmsp+4Ogp2h6kj8zCdXCXKlyccQ2fdEXCtmbPyutFuAlLHK3mDkg7JbrugV6rGl+
 YDNCTAaQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le6A1-004NHK-0Z
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 01:17:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id AF557600D1;
 Wed,  5 May 2021 01:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620177428;
 bh=tOvpORL4pZCL/85TtD6K9Nbq4340ZVvyD3mf9i3tQcw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=aTKnCJYUdKHY6B9G6Qe4vttFNmvUT8BBMtxBtoAf9N7LOzJyalkXSb9hTA1aahw5J
 n6zdiCpi7G0NhUNhtNTiR0ZER4gSGgWPxw+Np+hVQIKvSy6o+QQXxDRn2kCeq/t5T/
 UBwHeXbOyK5QQJMmqlA/aOIaHbORV2AdhGSN5KUyJmuV15J+1RNjWQtrCNWP/wadjF
 4e25Si6T88dvQJHSYQ0qxpxMIgSfT3Y6IhSQ7fZ108IcrIA7xfM000PHwEAuWJzgAY
 /9vwfccJho+yx7cdOmBx35Z4AFOhen2vd7v4wi+SIiMNFgfccUB/VdVz0H3zEM4hwp
 Rxvj/1fLAW+Zw==
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <1258125270.55580.1620159361990.JavaMail.zimbra@nod.at>
References: <1258125270.55580.1620159361990.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1258125270.55580.1620159361990.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.13-rc1
X-PR-Tracked-Commit-Id: 9a29f7f020e06f14eb126bcb84a7f0d166415824
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51f629446cd172e324deb0146741888cac5dedca
Message-Id: <162017742858.16566.6652519615271581325.pr-tracker-bot@kernel.org>
Date: Wed, 05 May 2021 01:17:08 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_181709_098671_4C506704 
X-CRM114-Status: UNSURE (   4.20  )
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

The pull request you sent on Tue, 4 May 2021 22:16:02 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51f629446cd172e324deb0146741888cac5dedca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
