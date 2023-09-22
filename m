Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39DFE6FE41
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/v2uVYXWHJ/DQrAt4zlWZSIY4IpQ7Q1BlBVZaDXta8s=; b=mEZPtOctNxjs8w
	pVnq8Fw1NP1xcQRR8wrUfu/SrTNNikcbrI1JHejXtIKZqeoOWP7jlHtQX7E4qZz2SVzsG/IbxteGA
	+vnTUlHUjaquYavT1dvMkRMavI85XZACgHuI7YiKRQUX4nppiCIJaD7D5uT0SOxVIUzOeG6N8uhc+
	rdpEDxhBOlZF7fOkRdXlY8LwQdEirDkFu4Py+RnefgrB8uE/uZEu4+CH196AnBr11zgj+ErKhEGPG
	6Js6Ce4tIDbP8j77Rckx7iEElbJYSTIorZJmFH3F8+RCMJ5r277uIQKhiJzIBMBRJukLO9/9s3ZgI
	GtIvunkklOzFvUixT4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVy-009FqD-1a;
	Fri, 22 Sep 2023 14:52:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVk-009FaW-0P
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:52:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D72B2000E;
	Fri, 22 Sep 2023 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o23Cc0FFWfuaisglu/zx7gjXkLITwnTaKZbP64i0tac=;
	b=nsxfQPGWVQJRnAu5gkhteHpytyLkF1lnmqBHmQ2eii2GY/8osYzbEekL4VuFeZDAap0iGX
	4sirbERV8nPq2OYeyK0KLsh2v6J3C4pjO08DWeiexwHUwiVAVPDY9BPat0Jv/X7skX742j
	lgFWlwd+qaJn1Im51wu5OX3hV5YD8rf5YSwvfHvhy8m5YqR9GB2uJ/WzxDZtivFEbgRu4s
	uhIZvUhRrFQVvW7N0PImT3b4Gq9Ht+Sb/OWXfbKvXu79kdsHqE1BPiQSQgiLA2gMFby+pP
	9ei4v23LBXp9dbsGhGVg5RKZAq1DbvCTkS7ASazqKBSaYGPbC8mQHHHcwbJsnA==
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
Subject: Re: [PATCH] mtd: cfi: Annotate struct cfi_private with __counted_by
Date: Fri, 22 Sep 2023 16:51:56 +0200
Message-Id: <20230922145156.578585-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201206.never.107-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1442d628d05c7aad86e5754fa554f32edc3e77a8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075204_320021_E20B0573 
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

On Fri, 2023-09-15 at 20:12:06 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cfi_private.
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
