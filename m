Return-Path: <SRS0=E9oc=N3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8222C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Sep 2021 19:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919A461157
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Sep 2021 19:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 919A461157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zdfi3FTEA8wfy9UPj0SIhcQuCXLoeB2Q2k2Wn6e3gQ=; b=qkN0u7hGRguhR7
	rp/9xRXpx7KdhdJkW/brK7Q2Pwo+FQ/Lz34PngwBywoIZ+3o33bZlPkYQxFtQMXLdXvP/zNmHsD8n
	sClJwMT3rPGh7aB2WefVOUnmJYNiAmfeiqofnLQzlcKBd1FN7roF+KEbsDTccSGQzxlq+benIUJFz
	AIF14FR5RtB8ThtzNKm6XLb4vJpLugP7T6S4eshOgYMDk91Fif3ecWW/H3DcLw+Vwi7CV9ydl/SNl
	9sFxNUekVh26cOolHQpvvuv+rmlbwB83KbYDPOb7XUksfMPynQNxyF8NWTMBK6OiwqTQUdsgen4rd
	QobhljwValIxH06uw0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMxTu-00GIJ9-Rk; Sun, 05 Sep 2021 19:07:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMxTr-00GIIc-UQ
 for linux-mtd@lists.infradead.org; Sun, 05 Sep 2021 19:07:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EF3E260F5B;
 Sun,  5 Sep 2021 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630868823;
 bh=DTO549HVdfyZqGh47aCecpLiom7JCFP6BlT5P11RTTE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hWD2Kmcv1a67pBN8zp8hRURn6rm4nejRNB7/Fbqx70VRvKQJoI1VUFYScPo3SiSNO
 05+YPewxYi1xV/8S9LGYizQXWaZmQrcAjn7jVcpiFHkCciHjcElRr2sbQv6EIlgWr2
 1kxcjXm7K9pvhY4MVCB0Ob2Me9nNqQ7JZgnuGsl/Q3V87dvqjL44rgdi0S2zB6kKjB
 7qsaz/vUEA4gjQAJLibY9YJk9vNc4HX5cM5ymQXF7yit0C4xL01W1hPMoMr8pnwxWv
 VZh1t4bupRP0FvHpbUlJ0JOr1lOU8b3IdsnKFPX7nGJ4sWi10UhbmNqIh+PPE31jrh
 Nl3r++1e8XF9A==
Subject: Re: [GIT PULL] mtd: Changes for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210903114946.3f874e6e@xps13>
References: <20210903114946.3f874e6e@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20210903114946.3f874e6e@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.15
X-PR-Tracked-Commit-Id: c1fe77e42440d2cad76055df6fb58caabf622d51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b6dc4f40c5264556223ba94693f20d83796ab1f
Message-Id: <163086882283.6256.17944151994530666959.pr-tracker-bot@kernel.org>
Date: Sun, 05 Sep 2021 19:07:02 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_120704_040432_D51E7667 
X-CRM114-Status: UNSURE (   4.06  )
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

The pull request you sent on Fri, 3 Sep 2021 11:49:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b6dc4f40c5264556223ba94693f20d83796ab1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
