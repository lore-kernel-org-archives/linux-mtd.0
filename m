Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E45C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 07:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC13160F6B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 07:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC13160F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fo8RYoVcIJzAEAMHG4Vs3h1MCqLXC79mHB2CJkqZgR4=; b=Rijgd9qDKVVyun
	TYkScIIxhzkEHzfp3pwcj/imhGVpLvVDSbTbCHEUb7vDXnr1jzpg8ThlMDgyaYThPtmKPQCLkHhxV
	/+pqcnKICmUoRdcoStKE5km2puYvVV3kvujRjF3ArdTTeQR36Zrq191Ot44wZvh2DiyFRddYA80cF
	dDikp8xVNeXnutfnuPLt67liyHhVJIvI4TDB1XP1ezTOtpMnUL3vMrsYPiMvmlUpCi7KoIn3sT0SD
	zg7R/f4jWI6pltf8SN6ZSzczwIMHwVndLAF7ZZIKP7GZDRpZeVjA3ZCIFXRBEJ12+9G34maLdbazv
	eu9Rj9aBTfQWWX22ZVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7Qh-005ywK-2A; Tue, 28 Sep 2021 07:21:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV7Qb-005yvq-Ui
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 07:21:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D699611F0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Sep 2021 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632813685;
 bh=1vCeBFREgFqNmjnqSD8QSqzhTQtP23m82uhe/dRbgLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YqfrqX7ZlSlofL7C1/wQ7IUwrJkTw9CqpPRHZslW+FIRaAAScuwi5ZoaDEPbs4U41
 XBEF7TUGLtAQ4/BiNhR4eDgNbN/gEBHR7LxnvLatWkO/rInZn8g7uFphgZ4UBe/vSq
 oy5z12/P74uYyMAkbW8C1++uBkW32hUkAhxbhS9ivzd1mffMrif11WqmJ5humpwVn2
 Wsif7bwPlOkWNOOXkk5tfwoPW4+ceVWQh91U1AFCgQS7CQMkxyuyf0WY757Ugq9gwY
 b2LLUkqpCy2sj3SSfCWLYaH7nDc4h9IAff4jlktkEkfzpX02YbrDIZLSqc6ovb7GOd
 iOKZoGkbSXWkA==
Received: by mail-wm1-f51.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso1299939wma.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Sep 2021 00:21:25 -0700 (PDT)
X-Gm-Message-State: AOAM532rIKafa3ekkbm3WjIgilSakSpaav/hcP53yNw1/G/TSQVKzhXm
 s5OX7myaflqvzMM4fWa8vb9b6tO6xnNFYN9vhN8=
X-Google-Smtp-Source: ABdhPJwbCQmeMFRTHAfW2rGv1bv9smZcCJCl+Hvbj4Ep77VpYBu11sQ4eO26bqF2GKn8LVbqwYZX9/dKQFvdi0VtGIw=
X-Received: by 2002:a05:600c:22d4:: with SMTP id
 20mr3210797wmg.82.1632813683951; 
 Tue, 28 Sep 2021 00:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210927141045.1597593-1-arnd@kernel.org>
 <CACRpkdbirEZiKQxSWSsiwwvpui5Pw6vON-C-=BLJei0s8znLxg@mail.gmail.com>
In-Reply-To: <CACRpkdbirEZiKQxSWSsiwwvpui5Pw6vON-C-=BLJei0s8znLxg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Sep 2021 09:21:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=u+iUXshuGu72N63ME5cD4PX_H2C1+rtTOEtN_rdddg@mail.gmail.com>
Message-ID: <CAK8P3a1=u+iUXshuGu72N63ME5cD4PX_H2C1+rtTOEtN_rdddg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Arnd Bergmann <arnd@arndb.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_002126_033875_F573BF93 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, Sep 28, 2021 at 1:28 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Sep 27, 2021 at 4:10 PM Arnd Bergmann <arnd@kernel.org> wrote:

> > Any other ideas for how to address it?
>
> We will "soon" have IXP4xx transitioned to device tree and then
> physmap-ixp4xx.c is used instead, and this entire driver can be
> deleted. I will get there, we just need to remember to mop of cruft
> like this at the end of it.

Ah, perfect. In that case I'm not worried about my patch doing anything
wrong at all, and we can just backport that to stable kernels after it's
merged, while future kernels will won't even need it.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
