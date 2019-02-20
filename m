Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A9AC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 17:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C712146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 17:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SC1F+js6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhm5vt6c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C712146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2kvlCmc3CEL5ZcI4C8UJizsj/T8MI427vgGWFl1KnU=; b=SC1F+js6fbTDP3
	NDOC81vOiHwMkFjM50EOWT1epuS14g1WpizRbFP8cD5XALQrK4kb//dl8CDoyL0+TuE/JgJaTYvUr
	aWPRfzaONzH/oWKeKpoHfVtJe4cgVq66cvQ8zfGC91tgvSLTNi3CoLPmaKBYbVdhfd0uQotZXMkMu
	71n+FVjNPRGzVhs1GOvwNN4bX+Ryf02EmZ/UHwpO4licO5kiDZHWi5vIxBsk+WR1Z3kLoF24Ed5sM
	VbsN4IAAh9ayuSg+qhCVgYK/ilenHSRSB4YMwah1UOOPh+TB+NfoOT0LyZweBnk/L6bceufjG/3/H
	q6MdLwlpCxKlJjswSd5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwW0X-0001Yn-1M; Wed, 20 Feb 2019 17:50:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwW0S-0000fJ-LK
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 17:50:06 +0000
Subject: Re: [GIT PULL] mtd: Fixes for 5.0/5.0-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550685002;
 bh=zg+Ej0D/7BhoH1v/DwKVwEnzQ3Gs2hKPIFRdMtQx6Fs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bhm5vt6ckYnfBfzeVos418IUynFUekxz1N9nEN0+1xjaqoLPb0bsD2ECwYQKlF2g1
 TZNWlcNXUHNw/7oWofjWKYlPrK9yAVRznI+tSx8683PQedkNkrm6y/y1+diQwrvFWD
 b17daVGyCKfgi6XTYO/uWuMYVggd/gReIiDv8Xd0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190220085653.182aa2c6@collabora.com>
References: <20190220085653.182aa2c6@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190220085653.182aa2c6@collabora.com>
X-PR-Tracked-Remote: git://git.infradead.org/linux-mtd.git
 tags/mtd/fixes-for-5.0-rc8
X-PR-Tracked-Commit-Id: 3e35730dd7540bad2d4e002703996391d9be49a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d9d592caf8cc5d91f7923c5e717b69d0b1e246f
Message-Id: <155068500279.4632.10929354702405821983.pr-tracker-bot@kernel.org>
Date: Wed, 20 Feb 2019 17:50:02 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_095004_720581_D61A221A 
X-CRM114-Status: UNSURE (   3.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 20 Feb 2019 08:56:53 +0100:

> git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-5.0-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d9d592caf8cc5d91f7923c5e717b69d0b1e246f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
