Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D71EC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9P5QBtQGyB+4GSIpUc0zK90L6RujH8WeTLeVpfnc8w=; b=KLOfuzKdxszSTB
	0XPKyA09Jrjj349HDGXab3yu4FOp/YjY5yr697DO7xx182LBCZjBFQhkC/qCBJkZdaNjPuykvUgQm
	nBE+1WywU/+IpgUrqHzyXJAI14fjNHpLQpEtHvf/2r119vEXqrv+4hwNko54yBWohFtOQHpL7Ub+r
	MhUJb8sQr+gAQ1fCwcX4XINMpWgP7RdJcHW2DTH57c4y9A2xqF68cNM7YB7UDb4CAVP1iNF6rg0IM
	PiCTWkaJrlddfUmuup8UTE0iNu3vKF4NGdOLrDAwhJ4r0t9kCRKXuO4LPNIoQGhPAG2gfSICEY1JV
	z7QzJN/mHRTBWUMLTl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxFAm-0092Co-Cy; Fri, 03 Jun 2022 21:49:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxFAb-0092BA-HH
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:49:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 260CB61B40;
	Fri,  3 Jun 2022 21:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ACB3C385B8;
	Fri,  3 Jun 2022 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654292964;
	bh=Ra/1vMUODVaI6X6h0mV5GWOubOGFzt15KpoDc+wQNGQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lUHwEWzZdkl5yASd4IPe4w/2Aq4tvUryOFRy4zNZENYtclnVlxb+c1mqii8t7dmMf
	 7eNjUJ94A/axeDc4j88KCo6IorGHVpA1bFP1dm5XA4lIoUAm+IcJcdezVCOUJXc7fB
	 y3JlttMzK7mN+lYnTQUjvY9OS3/cjgRV+Olo5jxRPDNG++FUuki4gVG2+pjnkl9/RQ
	 h9tPCkHszEtiPqvxD1l/adyiNSg8UJYf/cLyajdU79TYvRhI+9CQrD5mEg+vCaeOxc
	 mpyQ2T9+oPDVPvVNIYKNcmLNV6g6wmSCnQYhSizgJANrbB2iRzYWHsKpZ1EXWa5Cvg
	 FW7Ls3+ElMAgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7852BF0394E;
	Fri,  3 Jun 2022 21:49:24 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for v5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <735024820.130152.1654260428562.JavaMail.zimbra@nod.at>
References: <735024820.130152.1654260428562.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <735024820.130152.1654260428562.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.19-rc1
X-PR-Tracked-Commit-Id: 8c03a1c21d72210f81cb369cc528e3fde4b45411
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 744983d8784214c4f184be7448efb216315b48ae
Message-Id: <165429296448.7657.17494611384445521933.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jun 2022 21:49:24 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_144925_644120_2FFBAB14 
X-CRM114-Status: UNSURE (   5.25  )
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

The pull request you sent on Fri, 3 Jun 2022 14:47:08 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/744983d8784214c4f184be7448efb216315b48ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
