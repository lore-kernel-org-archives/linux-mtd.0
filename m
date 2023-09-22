Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A29E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jd4ZhUthTOOMU6KvPRqgXqkEHVEz36rpdzvvufybo8=; b=0lM9ZUNZpLM0y0
	QKC4Wm75u5SGMwt2Wbs7pk0ydSmfu/G2yI9WcbxeDK+j7wBs0HmDbg/MuskZ5HULj0/O93e/6pgzf
	zGAmWI/Xswhf1wZBge0BC0nPRV6sP3q0DFm4BaKPgg8anNHB7lsadNiO6BOmeRDLlEtV2Apdzr5RF
	qqayn0idX6TT6+5dbPh5ENuhPYbAqEejcJxIzATYmhnvczvFFP99qxvea7aYdkei5Up3WKqYDsYF+
	beD/XJ37pXQiJ7DTTTg27NEcI3nS+oL2MGSU7nxdeHXF9oSsH7EXZG83khPdjs0CLlOw6T72QY8pL
	J/3kRIXKv6R+enbp+vsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVG-009FJA-2J;
	Fri, 22 Sep 2023 14:51:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVC-009FHE-1m;
	Fri, 22 Sep 2023 14:51:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6490BFF813;
	Fri, 22 Sep 2023 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgBDirPTqxgTDO2XAiry4qG7/bll/CNM60TrxqLCNGY=;
	b=AIdCt9e2LNJpI87WwQM+5UJwotUsKKbst/wms/4/j09lqFQs9UPOCPd0do4QQYIT8NB+TS
	rh4Fq5yH0OcSOc87UlGc6l+fN4UigUSZ9tGFPYeqgad3NG1V9Uysu9fpNvNulVFMa2zv9L
	xCxuHqt3jNVQXTtpnhbeBHfdPhSKxbcyZB4h/K9dXC2mBjkRCvqmtmn4Dw7nByz8iEx8bW
	pscEyJ8hUd3GIKwx2z8EtqNNfXADRd9Kzx2Bp63RY7v0zWQ0t3X1GWs8siOa9waN+r3G9s
	Ab9h1WKoGv6osFbBr7TqNi+wm1bPRg5MEnkxJSrLVEBlhCy8rrmuyJGbkryg3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Manuel Dipolt <mdipolt@robart.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: Annotate struct sunxi_nand_chip with __counted_by
Date: Fri, 22 Sep 2023 16:51:24 +0200
Message-Id: <20230922145125.578362-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201300.never.057-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'28a05da765c0cd21654ef5fed3b53af5cd278d63'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075130_722530_83C929DE 
X-CRM114-Status: UNSURE (   8.59  )
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

On Fri, 2023-09-15 at 20:13:01 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct sunxi_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Manuel Dipolt <mdipolt@robart.cc>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
