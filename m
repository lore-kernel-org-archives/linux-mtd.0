Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720B4C73C66
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 00:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40734214C6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 00:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BkXr6e6b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpgdE9e7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40734214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GpxnPFuAEoJu2Ng8igAQ4X9ZMXyYXjV6wL6nnD1YeU=; b=BkXr6e6baIy/ud
	AT1O5jz2E6gjHwDng8k6rRfJ7mWqeOuSx/G8H0ZTVwiQ2n9XGGNxMNiVbwd2wQexgKmGtFwhF/L35
	7DB9crXBQUkNW63hLYqY7w0uzoVGGoCa+Mz0YC4H/b2iVeiG7ZGy+Qdjvqsv264v1c8Fc5y4SYGMB
	xD4WKJYdPsnQvH/zyzIHNGWh75YI+9/T8EgfGnB9VZY0G+MDwOyTnGGINupbi4sWE+YDHtL1jINYw
	IV0g29WokYCw/O8cytTEr5qPCV7k3fwXFk8WZBMiGluxO6Fv08jlPVhu434v1moLXMwf8EaMUYRTk
	XrcxkaEeOZoLe80SZEtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmosz-0007ps-As; Mon, 15 Jul 2019 00:30:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmosk-0007eB-AK
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 00:30:19 +0000
Subject: Re: [GIT PULL] UBIFS changes for 5.3-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563150618;
 bh=ShejkeLF6lCFtEkBsQAxiOpZfWyxT6RFvGykJxV/Eyc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TpgdE9e73UKQuaSVJP13cmM/01SzDP/+CMbbpGYyERDVApU7a+/1mOpbH1hlFZCEb
 A6rTnqBN3fQFNP9ktgsc0Mul3w41aTgdPMddERqXsWD2FfmPFbdjV/MeaCXpnuCghq
 ooTZ6oQMZ/wVgyGHWGPR53cjEuJ2OBkhcdMJjZe8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1267151613.38686.1563130929727.JavaMail.zimbra@nod.at>
References: <1267151613.38686.1563130929727.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1267151613.38686.1563130929727.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/upstream-5.3-rc1
X-PR-Tracked-Commit-Id: 8009ce956c3d28022af6b122e50213ad830fc902
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a318423b61e8c67aa5c0a428540c58439a20baac
Message-Id: <156315061806.32091.17822041540808146049.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jul 2019 00:30:18 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190714_173018_369289_1B47AA07 
X-CRM114-Status: UNSURE (   1.33  )
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

The pull request you sent on Sun, 14 Jul 2019 21:02:09 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a318423b61e8c67aa5c0a428540c58439a20baac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
