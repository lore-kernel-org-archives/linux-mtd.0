Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD0C83F15
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKmCxy51uYeXxQenjMo+Tqj8FZppFpWoI3XaIBmiCUk=; b=nQTkICBcXNUxiI
	VlQ9s3l1Krx6sIh4s5t78XAdEtecNY5MdbrRpvMV0r45NsWWBfinOkigBBOcABTv+UfZO9Uec0HpW
	EzjSnPGrHGf7NjcqfJRon8WwgEe29bOO17hh0ccY6q7LuUtwxTNMmswtbTvG8VmABNX4BqZmoBKeP
	T9J8xSFJWhXE6rPii6jn1yk46pvzm9XH3I0d7gu7EbthQGy3KNOSijLhyPgoq1q9iF6f1zHCQTuCU
	MYacX/K1Vte1TPnO9o3pL4D9H8WnABChuTJouhfRJNcTkbAd3adOKBlirBt1UYjgXu4H5SiPVqxJS
	QQYyGPp7FfYXdgZupCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadgK-009kTe-1R;
	Mon, 28 Aug 2023 14:57:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qadgH-009kT0-09
	for linux-mtd@lists.infradead.org;
	Mon, 28 Aug 2023 14:57:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADA2D1BF207;
	Mon, 28 Aug 2023 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693234643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bKJk4wMc6vYXGJ/Nba7NCHSjT/CZJQKtm8Mhtz9xxc=;
	b=b1JQ2p//EMwBuCfU1KehNjEXwK/kzqXJv5BxYV59Tkeqq1cS53DFQtDBkopXslV9rPKIte
	zeBu1reB7S4hXkkEoljYiZaBYVjc7hUu487I0phneIJ7+H/DZXKFQJSN2HcJYefuOpM9aO
	fkK3RvgYEwPzDTcaOHkCce9iaGbg77WZ3QhEjxNUoekP9xzgQNJE5iNk8dfNZ9+zW3Cm14
	EFGPO/B3IGr4oiO56PTE3bXIT0R92fHgWtylERJ2jB9rPOYrxFtyUKB4Rd+C5yoNqSeAxH
	1I4jpTau156pOIv8dTVrCJ6rIq2HWCsHTPEHFdLXB4dpHgqjfSN9bRivjk2tpA==
Date: Mon, 28 Aug 2023 16:57:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.6-rc1
Message-ID: <20230828165721.10876db4@xps-13>
In-Reply-To: <20230828111316.27f97e4a@xps-13>
References: <20230828111316.27f97e4a@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_075729_224518_9EDE7530 
X-CRM114-Status: UNSURE (   5.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gTW9uLCAyOCBBdWcgMjAyMyAxMTox
MzoxNiArMDIwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgTkFORCBQUiBmb3IgNi42LXJj
MS4KCk1lcmdlZCBpbnRvIG10ZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
