Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF70C3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 20:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAA021873
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 20:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UdxKT5NH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEvFmxHR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCAA021873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msBnmnWg8fqdPifTq8ezTiLxKEWkuVZa4djBDbUZixs=; b=UdxKT5NH4DITb4
	ZlStOGwT289WKm90VTp18BtsXd6MNngCp7E651nnpjmdGqZfx472yfrjXLSfpkgzQv42qjp0NgGxs
	MGqXyCi12UKihN2JMt7mbwnOoCIU2893hnPCZ3R8hkjh+wkii6Kxsjc/1dcvQr2eP32O7Yp/ZLhSX
	rvlwU3kbsTXf2NaqCMCKXcVSV9eT49dabV0cqRhTUHBiJip7dTWyg1K+6xcpK1tPnuWzM25PUv+jQ
	er6WRVZ65p++kxRU9WnDwLGC9duTpUbcgkDM+PRV9BaRo2tafqeXrSoY4sijkXYb8kpfuxoweJuF0
	vixU4g6YyPier6AvyiUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzS37-0004tf-D4; Sun, 18 Aug 2019 20:45:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzS33-0004tB-Er
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 20:45:11 +0000
Subject: Re: [GIT PULL] MTD fixes for 5.3-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566161107;
 bh=nYiLMgUrXGKIpXN2ehblBaOOx9yD7IfxQF1a+juTTUI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZEvFmxHRpUyBPi726JonFvYLQMhXCxkzKlkJxmRiPvLlVHU3rWAyKUN0MjUKsT0JE
 1ql8chb9VQLM2sCw5TG6jEFFYYfiwgN56iwQUbwICReaBdAutq+1jWfOiUH2Bw0fE2
 iHs3OC3/fIkdcvZhJawDoVvdBvGTCTAWCjXMuceA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <260502461.69486.1566157514722.JavaMail.zimbra@nod.at>
References: <260502461.69486.1566157514722.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <260502461.69486.1566157514722.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/fixes-for-5.3-rc5
X-PR-Tracked-Commit-Id: 834de5c1aa768eb3d233d6544ea7153826c4b206
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6825e5a6c45dbd473f8b2993a065bbea15347632
Message-Id: <156616110763.8960.15932184598951681488.pr-tracker-bot@kernel.org>
Date: Sun, 18 Aug 2019 20:45:07 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_134509_520672_F8FE83E6 
X-CRM114-Status: UNSURE (   1.38  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 18 Aug 2019 21:45:14 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6825e5a6c45dbd473f8b2993a065bbea15347632

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
