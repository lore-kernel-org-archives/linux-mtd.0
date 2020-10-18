Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04107C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 17:11:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8101C2222B
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 17:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hdqqpla+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/pDSZ6S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8101C2222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHuZTalFzZ7/9F7SpsGR5luet+uJHlbDN4OMK9A3TxI=; b=hdqqpla+E5uTP1lmGtrZFVe+LQ
	lBupMNqL7Wjgwp66VujUBj373IdN9J7OVh8OB2gGr3zGOYwmsoQfNVVaEAsHLz/gr6S4IVgvw1kHO
	9UHorXiWkrS0X4KMG8ES/KBb37ZYZdC4MtaY9hxReiMzsA+ESXcSax51TzkkjyPRSxk4Zt+gwQlVA
	E5I+WFwupo1BAsgUMgJeMomaZ4x43aIA4TSi1Zdxrpv+Y3u8b3AIrArZf5ZU+PWuOJz13TUFLZJmx
	1PPMdfcRB4d3DyWNp9AKna0Ws3xUUutLhoP1eGOKwdfjZpyN3sPMVX4kc4iof3gRqwC/TvmQudmAf
	UOAoFE+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUCCv-00054u-I8; Sun, 18 Oct 2020 17:10:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUCCn-00053o-VH
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 17:10:51 +0000
Subject: Re: [GIT PULL] UBI and UBIFS fixes for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603041048;
 bh=BPBRwZ5kam2+V0pZI/COi1Qkx/EKC8puSwFojWdfmI4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=c/pDSZ6SzBW2scjZroMmirXRcIH06nAy1Z9jyQR3GLTp4kcsTodJ61vnOWO7UfGq1
 vaGb5QX2e3e4Lruk39Lx4E+3Zt2k6OMQmGavVTVuI5GsRi1WElpfBIzFkp3eJ45H2W
 RpgjHeARX/TyyqIBw0AMgDLqG0ZS07GprufFnIUk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1486301546.204164.1602963471897.JavaMail.zimbra@nod.at>
References: <1486301546.204164.1602963471897.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1486301546.204164.1602963471897.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.10-rc1-part2
X-PR-Tracked-Commit-Id: 78c7d49f55d8631b67c09f9bfbe8155211a9ea06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 429731277dfd4b7940cff206dcde28b771b29210
Message-Id: <160304104849.11245.6099427735521173761.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2020 17:10:48 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_131050_153763_7B2EF53E 
X-CRM114-Status: UNSURE (   4.16  )
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

The pull request you sent on Sat, 17 Oct 2020 21:37:51 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.10-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/429731277dfd4b7940cff206dcde28b771b29210

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
