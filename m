Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57068C61DD6
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d7RNNpY9XipJvXIb2KL4AGfVlV8IA2GxjZ9L2NxPsmo=; b=iSxT0DxEIq2W2y1KA14SlO0+IE
	OcyJUjrcDMkEwLuiQFusjC2UI4syFtfRQzEhQ+91bLekrCeth5bKDPaQ6EFspP4O62ppxFZc2VtBR
	ZKCL0HZEa56z+kuCPcsJHwE06pKiaNnaPQ8aSKYc6tw0KhVPilzodn/pLkKuUF+SP6//IKRLbf1kz
	aIYwNxibhws2IeJ9QTugsUh6R0wOeAkQWCNKCEytJq4Ufq4h5wowWKC+/QzGxN6HOAv11fibFEERX
	550s6g2E3QN8E/z0hrXdfjyGqLjMmOLiblADubw1v09GG04W9dTp4UlHQsVsP6qssre2m3THvzYr7
	U8B7nZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Swo-0000000217H-2wUE;
	Fri, 04 Sep 2026 12:23:10 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Swk-0000000216U-4Bl9
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 12:23:09 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788524576; bh=OaCBTGoBVl3jnXkNN020dqv
	JEP5sgbgbDM0zjnwKsJw=; b=rBuaNKyLB2UkcjaoYZPKI1/1TF5qGGoR8dTurP3KsR2MRWb5hu
	zF3/OJ0wiV+MGJdd8OYst0kLtexy2CdfLMCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788524576; bh=OaCBTGoBVl3jnXkNN020dqv
	JEP5sgbgbDM0zjnwKsJw=; b=czaThMSF5tMtiFc6BR5pJrv/aHq0/Ms2tHucEIg7g5UkM2wJzp
	ezhjNFXQbchMrl401nShD9u+Mda8pahXbt5piWkadECCkmXvRTzzEGrfVDQIbaC968gHsLzHzr9
	nrU/hAIoDoNeft6mpJIeQQs1XiLDnXAXdSLcQsWyAW0K1/RD3uCfH+EJzKLR0pmig0lesuAAY7s
	mAaDG+fJVkkJEdBOIIv3Fr5lG7oAGXdhwvgFKKCitnvJVJ0lksVHTi5iHb6vn558HpcNkIYdIVh
	jLRcLnYKVjTOEs0hG3LM3LVtln8lcZJXyddHMbs+dhecmgujtG1QlYx1AEn9xQfb3og==;
From: "Richard Weinberger" <richard@nod.at>
To: "Hemanth Selam" <hemanth.selam@gmail.com>, 
	"David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: AW: [PATCH] jffs2: fix typo "informations" in comments
Message-ID: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
In-Reply-To: <20260904112814.6768-1-hemanth.selam@gmail.com>
References: <20260904112814.6768-1-hemanth.selam@gmail.com>
Date: Fri, 4 Sep 2026 12:22:56 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052307_194586_2A9988CB 
X-CRM114-Status: UNSURE (   6.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Fri, Sep 4, 2026, 13:28 schrieb Hemanth Selam <hemanth.selam@gmail.com>:

> Correct "informations" to "information", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.

Ack.

> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

What really creeps me out is that you're using Cursor/Opus for spell-check patches.
Please think about the environment.  Neither electricity nor water is free.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
