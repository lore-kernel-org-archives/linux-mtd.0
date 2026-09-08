Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463DBC79F99
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaVhwgw+n95ER7jtLvIGgV4gZIjfk5rFwam0PT5Qyrg=; b=LCGD9UAM4V3IQm
	YhTULQh8kSiLVTyMDyVwpQG0Gg6QENlhytNGxN6As/bTrkaC1ox9ePcgJCfTARdASD/MZW0cOcrXu
	8+3VL0cfWQUEEgaPb69dma0MgLJIiRYjqjlftGI9bde5uBdhWhBuUX8aU0xtlAPObHe8EzINIbe5A
	3NjAlaySzS7pFcy4/TWWFCr0COkjqzWMw2I0AIgCy9P1x2Ui+RDvBLm1/JiNEtMPtS+KTOeoSoXEr
	3vf4ZsHAcfXiGtArSwXTvaguvucrcNnXvZY1P9jVwIT3zEsElQOoLsJt47qtMhthlwldLtOcj5c6k
	PS/eIw965U/7kGzNeKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wj2-00000009GQU-1mN5;
	Tue, 08 Sep 2026 14:23:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wiz-00000009GPb-0gLZ
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 14:23:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF2391A1A5F;
	Tue,  8 Sep 2026 14:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2A8D603C4;
	Tue,  8 Sep 2026 14:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B59EA11C7AF4F;
	Tue,  8 Sep 2026 16:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788877371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r4WcVwJlAzuVfNTRa6K7DKxEadAS1Eak2yTrvNVf/t0=;
	b=AxJ9Fp5HlfBE5bikqJQUJyrn4SaOZ4JUyUCNsg5AqkyFADS9syKyvQ1IOfrLpe6dYA18Wl
	Cotr+r0M9dCZmioI6o12FqqVCEH60py+7MW4/yxeFx+dIkwn6QyQv5LbtmH+4ieCL6Nm8e
	4ebttxHJL2Z45x6sieycjY9yZKjY+LO0RXpoSVfq7e/QEXGveUifKnB9XO/PWkdLbKu0cb
	QKG9rXTIxF8I20TCIHhWrptR676uQsmSdENRHKIdg/N1gbUQkoaBVFAQ+2LwhEMvY5vhcN
	6qr06W2/J+jelEhTNXA0U7yrTsyiY4ZnoDDmBony7NQBjAH76WP/Tmw7PuZ8ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zongzhen Feng <1768315307@qq.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH v3] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com> (Zongzhen
	Feng's message of "Tue, 8 Sep 2026 18:19:58 +0800")
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 16:22:46 +0200
Message-ID: <87o6e7u8jt.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_072301_360949_C85D8258 
X-CRM114-Status: UNSURE (   6.68  )
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

SGVsbG8gWm9uZ3poZW4sCgpPbiAwOC8wOS8yMDI2IGF0IDE4OjE5OjU4ICswOCwgWm9uZ3poZW4g
RmVuZyA8MTc2ODMxNTMwN0BxcS5jb20+IHdyb3RlOgoKPiBXaGVuIHNxdWFzaGZzIHJlYWRzIGZp
bGVzIHRocm91Z2ggbXRkYmxvY2ssIHRoZSBtdGRibG9jayBsYXllcgo+IHNwbGl0cyBJL08gaW50
byA1MTItYnl0ZSBzZWN0b3JzLiBGb3IgYSA0Sy1wYWdlIFNQSSBOQU5ELCB0aGlzCj4gbWVhbnMg
cmVhZGluZyB0aGUgc2FtZSBwYWdlIDggdGltZXMgKDQwOTYgLyA1MTIpLCBnZW5lcmF0aW5nIDd4
Cj4gcmVkdW5kYW50IFNQSSByZWFkLWZyb20tY2FjaGUgb3BlcmF0aW9ucy4gRWFjaCBzdWNoIG9w
ZXJhdGlvbgo+IGludm9sdmVzIGEgZnVsbCBTUEkgYnVzIHRyYW5zYWN0aW9uLCBzaWduaWZpY2Fu
dGx5IHNsb3dpbmcgZG93bgo+IGJvb3QgdGltZSBhbmQgZmlsZSBhY2Nlc3MuCgpJIGhhdmVuJ3Qg
bWFkZSBhIHJldmlldyB5ZXQsIGJ1dCB0aGVyZSBhcmUgc3RpbGwgYSBsb3Qgb2YgU2FzaGlrbwpj
b21wbGFpbnRzIGFuZCB0aGV5IGxvb2sgcmVhc29uYWJsZS4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sg
dGhlbT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
