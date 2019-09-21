Return-Path: <SRS0=szY+=XQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D7C4740C
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 18:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1B32190F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 18:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fSH4W6nd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5jgx1ci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1B32190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvSvzzsdrM5mcVY9U7zQLdDeZ442qeXNOBj0NIVZc4I=; b=fSH4W6ndNw0i42
	29GYigZTq6gw99omkJ6cBXwALKMIfYoN6nGNHLxbF5BSKKp87ko1Q26BH3jTpSzA1vpQQoj3GDkDI
	WUV3SncnZZgosCN7vWkzDwbFqVJwSk00nJnCXqUIcoBjRSX26WlzgmcmQdSh45g/NHxfXZOTcghxD
	suv+BxZuR3ZSGhZf1WIMg4U7IdIpG5eLtRzU5CSYAl2FrPlgJ4rA/QPJeIDbgY1dbScb3SjUrn6iQ
	0k3a1Iqcsojf9dNIsIAMOH2jdl1XpMx9x7HQavGpK80RSQOuPvjI6g2tmvQcQhcljVJla79wIWi69
	HXy4+ryGoOnsJR0pYXYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBjv9-0002Kl-LF; Sat, 21 Sep 2019 18:15:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBjun-00022s-M3
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2019 18:15:26 +0000
Subject: Re: [GIT PULL] UBI/UBIFS/JFFS2 updates for 5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569089725;
 bh=/SsYhComEN4S1FrwRkyBrwL7UDfxZ1mFJAKMOXx7ocM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=j5jgx1ciiClxji32isQYJC5F6rqS0Xeeu0D4nOySPirwF+McIXF/+3AOxbx+VYrvZ
 xQQMdOPyT8+UvUErCLuenzzr1VgLX4+iEt6gxVIof/ESqAv3cDhX220BHYqJI8WKVt
 oQdKKnQMjiiB4hIs6PawC7xkkTjsXnrGhn+8cCeg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1224182178.3529.1569051402039.JavaMail.zimbra@nod.at>
References: <1224182178.3529.1569051402039.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1224182178.3529.1569051402039.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/upstream-5.4-rc1
X-PR-Tracked-Commit-Id: 6a379f67454a3c740671ed6c7793b76ffecef50b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 104c0d6bc43e10ba84931c45b67e2c76c9c67f68
Message-Id: <156908972540.32474.6167862187176290736.pr-tracker-bot@kernel.org>
Date: Sat, 21 Sep 2019 18:15:25 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_111525_737903_36B1BDD6 
X-CRM114-Status: UNSURE (   1.41  )
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

The pull request you sent on Sat, 21 Sep 2019 09:36:42 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/104c0d6bc43e10ba84931c45b67e2c76c9c67f68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
