Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD5C32771
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 00:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE918246AF
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 00:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtvgQ5lB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWVNFYn/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE918246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7FUVsoBzsZsE+HDXsw1YfoTDUCz37FnA2ddTTKu8lI=; b=gtvgQ5lBOoTFRz
	BW581cjuTktx3VL/TerZFnlmTL1VgzJ/yECHR7+WQ4c913bbB0xI9xM4sacZsQOlaOD3Un4c+CQ/f
	uuJXablYX02kGkMTU2urdN9mZFH+j68VCQHQMxGUeuZFAKqcyyFL7P2XgAOZySU9u4JgPnb7Hnz14
	KUdNU+2NVgyLSzc3jCNu9yKmMapexEoDS1Y1oerXm1U2wSdJH8Li1aNDNxjF4BP2HNpHEHbmbP3HW
	SpIufzvgTnItaUmlhedjDOdi/eBSlTnRvv/F7R6ebEV6jV6Ee/IkyUG/tqAQw9riK0pOJwkrPTMcy
	mXMK4IHyKZIMvpZ6Kolg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isyiK-0006g9-7m; Sun, 19 Jan 2020 00:45:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isyiI-0005lN-7C
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 00:45:15 +0000
Subject: Re: [GIT PULL] mtd: Fixes for 5.5-rc7 or final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579394703;
 bh=4jaTZsPssUnlGROcOhT9Ai+w5KGJFxOEw+2uudQnpy0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=UWVNFYn/z1ZQgCH7GtDcE6gkEijahAwJrCSjvQbwCoOWR/FM+gfdFJTmQyOJZFTBs
 MSWWzu1UwpfVTFtDIlbm1//YwG2HvAe8CCPJmN8z6JVQB4+qtOkDokGw5WZSE7aWKR
 GmlypmKMC6gETolecujM8ez4+btdv/Jr6BQH2cSM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200118231006.6776f277@xps13>
References: <20200118231006.6776f277@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200118231006.6776f277@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.5-rc7
X-PR-Tracked-Commit-Id: d70486668cdf51b14a50425ab45fc18677a167b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f8972a3127ff46df62ae30057d29606968ec4aa
Message-Id: <157939470381.10292.5450797739537723471.pr-tracker-bot@kernel.org>
Date: Sun, 19 Jan 2020 00:45:03 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200118_164514_284304_EEE90AA2 
X-CRM114-Status: UNSURE (   2.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 18 Jan 2020 23:13:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f8972a3127ff46df62ae30057d29606968ec4aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
