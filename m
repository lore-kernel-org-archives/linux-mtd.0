Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D880C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 21:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKeL7mXl4cg9WzKaPSuXpftC2Et3tPZD67oCPc5yPBM=; b=CsnE5QPh7ZwNSM
	KDKWHgiN5xevIYQ7SnY/M3HT2Srp5hQGZXg4DWlQ+Iys+OWTfmTaBx7BUOFp6Kk1im+LXWOQ84Dkb
	xZ9iHfD9xZa5/QGVNm1x+vN11wn4LIpmqhDRJXOuoyuD3S1WS03/XiEFzJYaV60nTYt2dq1s9yKik
	ZOR+7kRPHM1z8+naGyt9qE92Ofep8A1vo3PKXH3OAkxCeRPvdg4euBEvqntMr0zGZ+Wp9ABb17qYI
	r3Z1Hou+aX9lU26kkcDVMCWJ3zuFG7uVrs6xMVl2etKw9RWIfa96LuDw06+evUYR+Irwf3IZTwhJS
	3V8bOjsc1MlURUNl/lpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttfu-0000000Exs8-2B3a;
	Tue, 11 Aug 2026 21:06:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttft-0000000Exs1-1lDQ
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 21:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11C8F600AE;
	Tue, 11 Aug 2026 21:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3941F000E9;
	Tue, 11 Aug 2026 21:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786482375;
	bh=EhjW6ig3KupFzP4t4FyIIv9XWBFJCYOdoRCmDXSj8BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SEbjoM83hiZiHshLul1EMh0IRSTPewpFKncXYImY1QB1+THj7wTI4gFnA4Hai1PFg
	 sx214piirRp/oII/sYLuXrv6tmo1UYiBzubutdbpAgWEEzKDE8+5La3TrURAg0CA11
	 S2rMcjjp9efYJHtNqRLcqXP5LnQopK2I+WtUaNNh1V4xg5Jo+Ccg9D9cAemsZ/pTaB
	 li8jG13yf3GpZg6xygbCxmEeKRqVvd69uf/GqATeZzzDsH3wTC7vWBUKFLi+rnI2jQ
	 ipi7Y49dj3TbBBg2cMf41pEn8Kanv1iagAZJey2CeaaMJmRkYTfnwUPgdSkGetbyA/
	 cBIZn4zZrWQOQ==
From: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: headers: clean up some kernel-doc comments
Date: Tue, 11 Aug 2026 23:05:53 +0200
Message-ID: <178648234018.3948622.4036568993369014811.b4-ty@b4>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729172044.1793865-1-rdunlap@infradead.org>
References: <20260729172044.1793865-1-rdunlap@infradead.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Richard Weinberger <richard@nod.at>


On Wed, 29 Jul 2026 10:20:41 -0700, Randy Dunlap wrote:
> Clean up kernel-doc comments in 3 ubifs header files:
> 
>  [PATCH 1/3] ubifs: debug.h: fix kernel-doc struct prototypes
>  [PATCH 2/3] ubifs: key.h: use correct function parameter name
>  [PATCH 3/3] ubifs: ubifs.h: clean up kernel-doc comments
> 
>  fs/ubifs/debug.h |    4 ++--
>  fs/ubifs/key.h   |    2 +-
>  fs/ubifs/ubifs.h |   20 ++++++++++++--------
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> [...]

Applied, thanks!

[1/3] ubifs: debug.h: fix kernel-doc struct prototypes
      commit: f06711486c12c1fbb3ea9c0c595ca244b111891f
[2/3] ubifs: key.h: use correct function parameter name
      commit: abd6591fb5cc1490ab2cf5d9ff513a6677fa57b2
[3/3] ubifs: ubifs.h: clean up kernel-doc comments
      commit: 4e5e02340a18183b0f8ad633da1516cad92ee43e

Best regards,
-- 
Richard Weinberger <richard@nod.at>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
