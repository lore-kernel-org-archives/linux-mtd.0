Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4E3C7EE2D
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Feb 2023 23:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SOueeVBppuf1ajzdi3e3ziCZaEFRhcmJSB2mV/XS+g=; b=ddmLuD9P1ybSq6
	bTOYDHxDadr83KJMpU2lu7VxhYsiitXg/2ZMBEFybIqIf92/fenMVLuWt0Yo+02b9Gf/DIlDN/wBc
	o3mijwKPcnpAj/ACJPFa7B3cSAekbti375V33GYwHaKJ1Bc+AzGN1Hn4UJi/XUm68Prhrn3uV0aix
	Fook5p/yZb9pCLCfcIH+sLT5SdC103xOpoQ64dK2F891EAMuBEt68XAan2fZBJaP6I2yKW7X4R4zK
	Y8OU0Fi7SxP8MBHrcuJzZvfqvg7Dn4mhZr1n+zw5S+exCGStByLpx9+j4qIO74zcF95uDa6zwh3RD
	jHP2yXcOjmtv0XehAzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW3s7-006RgE-P0; Sat, 25 Feb 2023 23:22:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW3s2-006ReA-89
	for linux-mtd@lists.infradead.org; Sat, 25 Feb 2023 23:22:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6087160BA6;
	Sat, 25 Feb 2023 23:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 321B5C433EF;
	Sat, 25 Feb 2023 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677367342;
	bh=E6LjFQRkX5+e6/IhM1A6ia5iiMGD3tAs+jfyGi8ltVA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AmtG/yzbFm3HBtz4B+KmBMwqpf2D9PWSyh/QaKNVbCLY5bMmgHlBFhboahteIiKv/
	 jYlZvUj8223JizLNgVxNFYC7OsgzewHHxXeFPN80NoTu1vIaKM5Ym5b2ot8jN+byBm
	 QyYeCohjvmu3cjDA4o6A0mUv+JGF7X7Jm5T4sDMxmn8yYDVIfwr2C7BlPxRJStQHvB
	 k0x6D1MiY0/aQhIAwy/vCcW2atSthy0ce0oFpid2zv3qSj4gY8OVUbwBggq8eA4xRp
	 bfwzHCkPUeFMZNw6ZsEnM3lzXOn9qrq3Opr1faCDYXhUb50p2ZNTrChTUp/cP4dfJX
	 KwP2opg0Oe+aA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20606E68D26;
	Sat, 25 Feb 2023 23:22:22 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230224113919.31bd95b3@xps-13>
References: <20230224113919.31bd95b3@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230224113919.31bd95b3@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.3
X-PR-Tracked-Commit-Id: f4440abc08917d9a7032abb8a6a5d4b36ca979b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e3036a2642b6145a8117d21514bfc5f8d5ea595
Message-Id: <167736734212.9412.4435452983341536790.pr-tracker-bot@kernel.org>
Date: Sat, 25 Feb 2023 23:22:22 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_152226_377766_DA977484 
X-CRM114-Status: UNSURE (   5.11  )
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

The pull request you sent on Fri, 24 Feb 2023 11:39:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e3036a2642b6145a8117d21514bfc5f8d5ea595

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
