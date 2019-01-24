Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7151C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9103D21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/+Pdjc+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="XtKMY2l1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9103D21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RGBfAQRGZ9+UxVozKBV9GvfUxAAWYkNFdF/YblbGhCQ=; b=n/+
	Pdjc+gSHzAhMOPGY1JyazTNvCRjTAMJMYWq2sCj6IScftISbang63kqWcIUfhyc1gZrcwXdCtHQar
	JqgyLFez3WmE0Cv1/qyR9O96cw7qsEerr09Lemd+t+0YFwLEOoaJnlIW0F5hf84eZt22kfUYm1KAs
	0KjL0hGYNBiknFem3N+s5fJEFHGNKMYWeB/yHKz2i5yeuGnHHjMrxSM1ygGVuHZpWYrenLW9HuBhW
	0vZRTFvvMbtdlm6Tglz/eZvm04hv09xKYl760Twq6nI7Y6fUL0E+tQFpqbaDsx3xs4BXOJpV8zpw5
	1pUgyUwG4tHVT795PZ0z6vQlYGKVLGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmWVC-0001um-1l; Thu, 24 Jan 2019 04:20:30 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmWUj-0000Jj-JG
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 04:20:04 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0O4JI04030691;
 Thu, 24 Jan 2019 13:19:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0O4JI04030691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548303559;
 bh=TKNrR5jzjw6WrXHxtJ82ro++BWFAOJtU+JQPQgQeqyU=;
 h=From:To:Cc:Subject:Date:From;
 b=XtKMY2l1dEMLzsTwZOLssUz+jvBW+3PoAbXzMrK+477EUnJFw++mfZGNLW3cxkKDT
 C5m9NYp7EQZLq5YmOOzww7hVsbVZSIO+X2hyg9PjJh8z2XqvDUY3sanUiPpsTO26HJ
 7/wCPzTEYZyxT2kmumGw03PdO2Gcx+N8qx3iLjteUxFVYI3vEWGTgH4+FVKBO/fqap
 BhuJMWmQQ2enNoL8dQniomxKMJUKJrAITo18RsgnURD3+5aKG5bL/CI0zP1L1jSiLe
 90UbSSGTm8tyWnULR9S+zhOUn5BxAmkF48OO5pXeKtYSXonL1x6vvG6/Xg+FxKkKPT
 faw4CUCFv6jXQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: rawnand: denali: just trivial cleanups
Date: Thu, 24 Jan 2019 13:19:05 +0900
Message-Id: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_202001_992991_1C08A684 
X-CRM114-Status: UNSURE (   6.27  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org




Masahiro Yamada (2):
  mtd: rawnand: denali: remove unneeded denali_reset_irq() call
  mtd: rawnand: denali: remove unused function argument 'raw'

 drivers/mtd/nand/raw/denali.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
