Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF74C0218C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2025 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+piz6JLG2bGvmDFWEfikEltQcAYc0UfHYIohcjz2kA=; b=PF2D54EJNKWjMq
	EhvNuQljWc3vTNo4oUPhAfbvsf1R0iTp+0E7FlDC3rEmZlDUSTEzVqimgpiZGenlMg1gYSlzNiZSz
	iBwgfssBdjeHX2izVdj2F+yqMVA1l5+n6unle8SOJyzvnGdpch3V2LegPkxR1/fakwFXDXg8jmQW7
	wS4SMvZ+4HH2upv8GsFrc4jxvaB9oX+4vFhaX/h6v0Yp3JwORd3gG9sL1APl1WSGWdKkPSeZoBY39
	zlFWe8pRyKVcNiu7dfUP/X1iH1Q7SClZ31CDIBnM0iUqonpwNRA0M9QHSe8ZQ7TY91+qtY6jj5pVc
	E+YJKCHBkUmzG29Uj4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGYN-0000000EQQ6-25Yl;
	Fri, 24 Jan 2025 10:04:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGYK-0000000EQPc-3VBG
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jan 2025 10:04:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9B2A1BF207;
	Fri, 24 Jan 2025 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737713078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAGKP9r3CkDC/Vt1ENUN658pp/2I7l8310m6VBSllY4=;
	b=WRt6tHrSpmo9tWlH3Go0fF/27Z7l2WG431V2R6AlkI781vxd73MKyD/krKjTTkLco1+3+A
	Mtnl311Y8F760rbFSe1pwaM945APX/Bd2BRgSNPBtt19M64s0ddtXPJySppeDig62dojmX
	JwE1sZ5vmj5HitHjLbEklg+JJqH8MH29s0xnNqUfsUcEWbxBIuWpyQUBws3/qN76BDL7+u
	xWJVHDHac0XsD7gn1YvDmNRVa/q9yG8UTalw69oWwTzr7zA2PKUq9TdzTQSGyCdkPnKlw/
	l/lAqbFEgOE/Ly8KWxtxGTUym55wfANU7hNUEJL3W+8KoOlgzkUon/THoxdEYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.14
In-Reply-To: <mafs0sepd4u0j.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	20 Jan 2025 11:14:20 +0000")
References: <mafs0sepd4u0j.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 24 Jan 2025 11:04:37 +0100
Message-ID: <87v7u4il3e.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_020441_041948_71C2549A 
X-CRM114-Status: UNSURE (   5.21  )
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

SGkgUHJhdHl1c2gsCgpPbiAyMC8wMS8yMDI1IGF0IDExOjE0OjIwIEdNVCwgUHJhdHl1c2ggWWFk
YXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJlIGFy
ZSB0aGUgU1BJIE5PUiBjaGFuZ2VzIGZvciB2Ni4xNC4KClB1bGxlZCBpbnRvIG10ZC9uZXh0LCB0
aGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
