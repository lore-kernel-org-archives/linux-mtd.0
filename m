Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A9AE6FE4E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vb3Nw1r+zkQbCwLMmifBvoiJhxOPk4IFWULdv7RPdu4=; b=R+sGCwumC1oBOk
	uI6HaX4GFtOr6WK+5ei4gyirVc5HIAuNxxqABg6IkCtvlpNq6tlvalDrXbqJ5PKKVj0bIFEbho5ZY
	6GsaB242hH96v0MZwXVpUFeqft7YNbrsEGuuhjMRbL7oHQUgRYqSoLkgUGkNgYODGRLnaH9zNZIOt
	/45TYqXaOMmz4Fm/iYW/vtS6ukubI/7bqE47I2a5TS4nIkr4onMeI/5V3a8lxc2VM4zO6ZsPT1Nhx
	50/sltp0IK9eHySSC8DpQpRWz0XWZxdFBArKCD00ctJK6il3Uxs1x/4q0yVLd5JXbZFgt7xMzeX3i
	xK/qemGbh9160kxIutwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVd-009FZ2-1T;
	Fri, 22 Sep 2023 14:51:57 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVY-009FTn-20
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFAE324000B;
	Fri, 22 Sep 2023 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWj4fDfrncvglMKc2oAIEDq1g/mg4BnB8RvFBc7svIE=;
	b=pJxpH0gSZj6K/xGcOkOlfCoRcAO+/IqCCwjw/tpuQQgDqwOTxXRNHuguXNLbQA0q2vqw6u
	yTDeNK5mZFi4GXxuYKCjDZC8rDhijez1IqRU3PflEql5A52IFM7YuF8fOqAWeHdWplm0N4
	4oZEz8fd8K0NH6HihCxPiHMsle2S/ydHbDRP/G9AfRVFddrwZNex0cRAk211HxvUkc6DhQ
	Q8P3yw6mWP32rDqfe/eum3dWZex71urFEov9wNUB7aom01Y6UOPtj08ga47uLGZK+Z/QDb
	MURtRwUfHa1ezm3ZYod9ouNVDWpcXf0IRxYKCGL4G/iaeO9REXlY9GFSKhQYNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: denali: Annotate struct denali_chip with __counted_by
Date: Fri, 22 Sep 2023 16:51:48 +0200
Message-Id: <20230922145148.578528-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201227.never.483-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'48ec74fd8af6d94becf6b53af0c49c888511ec38'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075152_864558_EE73C8FE 
X-CRM114-Status: UNSURE (   7.73  )
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

On Fri, 2023-09-15 at 20:12:28 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct denali_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
