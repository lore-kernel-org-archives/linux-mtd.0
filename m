Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3018E776C6
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIg1TL3O+fC39wOT30EuTbldyXBRstPd0GBh7Yt5RcY=; b=QXqPcKW0MUZ5ng
	c1yTIdKv7Zdvdv6B6sIAzjpqnAFhCutnA5YBiKfggMvt3kkBMDuHos4RCKgRFEB3RdAKqfzNAIjKS
	6iZMhD6gRgh3gXNZUPjcLyL+PhryXXTlD4o6OIPd5ANUhMizbzEjaQPdkb+0+kj9ZhduxP7Gnooch
	1Har5ThusmxXHTSwApZpCS2AYlk3edEMBwOSQ3PuFwVaOqGu/xpE8M8hq2Cb4sn0CHfYCoVW0R554
	kHafGzjC1ITrWXUTsjnY1H4Jc42byJHt+0HN5MrCOkCSn1kW4hMm7z5PXo/bb9k4dZTpEjKnRJXvm
	MLQznMEQcSGmL0bdVNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQdY-00DPcA-2R;
	Mon, 02 Oct 2023 21:39:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQdW-00DPbq-1a
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 21:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B800CE12DC;
	Mon,  2 Oct 2023 21:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAC89C433C7;
	Mon,  2 Oct 2023 21:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696282764;
	bh=ndHudXxfpkFVThd9Wgq9YbeY/Bk5VGTSkZo7dmn2Lhc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dWlvBgh7WMDf2Hnu+fdKBOL+WXajVwzlBF8J+ndRbdzPCeAVBga2RPkqaVvbvqQan
	 91AZ+BYcxy77Mgx8EaMDBuLW7LSEccboQheEqB/wrh2/H1BEzoyjdJxR5q+gldVBvY
	 KYaZg8IvUYx4/HZ0+EMHUA7dR7B4nPXveL/m1EUECfA/S6qygb6oyFq83rSJNlmbKC
	 nSgJ81QagbnDwFZQ9eT0SPg953hqNXht4Zomv9NmMtjrlVquiElm16p1gYo4GbpFMf
	 i0dPcqGUkZkEIFHYb3bXnSRtpukirpNcDOnmNfWCGRAjh+JaW1NzMo7nm4/nVZgSI1
	 Lh02i1AEVCf2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98133E632D0;
	Mon,  2 Oct 2023 21:39:24 +0000 (UTC)
Subject: Re: [GIT PULL] UBI fixes for v6.6-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <764987343.25592.1696244076263.JavaMail.zimbra@nod.at>
References: <764987343.25592.1696244076263.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <764987343.25592.1696244076263.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.6-rc5
X-PR-Tracked-Commit-Id: 017c73a34a661a861712f7cc1393a123e5b2208c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3
Message-Id: <169628276461.9367.12359946752946294729.pr-tracker-bot@kernel.org>
Date: Mon, 02 Oct 2023 21:39:24 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_143930_724898_37EF3232 
X-CRM114-Status: UNSURE (   4.39  )
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

The pull request you sent on Mon, 2 Oct 2023 12:54:36 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.6-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
