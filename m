Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B860E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTdQI6ReZ5GWD4rTHgMSw5zvLvCWb+JvvIkjN3ty0oc=; b=CEtgcj+/JUqYBc
	f2O7NAYXDoTIKYaCpA5uLjFaU68r7fQ4x6jXHdM2E/hHCoAPpWgTK6DK6pFwHXtfA9PgEOzv7J7mW
	9vqLUZ7+Z6xb8u/Cohoj2oKmWT+bJa3P3bTqIk3WWAdJtQPFvhqVQW1DEOFhK/1rl/M6+av6tYXZ+
	8Ra08/8Y220pKzxXUXy0ECI58x9U/Ul4ZGY8xG9FtPyJMm8Z58d4Uyg8x8+FDggGmEhdFij3wC9I8
	krmxTdcElY3c50b9cr8Z0y8F4Npcv8iKvJwXnVGUWuXVgcnq5EubdUx7yV6fZ3Uw/RB03OU6ntPeW
	JAfKNFVvWhJ8cWJHHZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVJ-009FKy-11;
	Fri, 22 Sep 2023 14:51:37 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVG-009FIf-17
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ED6440006;
	Fri, 22 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgHJuKg5HRqpSv30Wkn8rdxT30HVuVeNt+VcBKLGGpc=;
	b=P9PvPY7jpMihl5dTG+wRJYtY7A42XnHEAaF2q4JKTw0zeWlimnvoOBUVo+wo0cGb7paiUr
	oO3qeB75J28kkPojsdU7CxTSKwF3lfTi+7b4VJVfQckaHaB4FVQDF0NlyFbkDoct1leKzk
	vpQfHLZ0Oa4o/udm7DS/T73jn8g4jPBSkRGz7Ycs1Dd/i0tgll2m8lZaMYH0+WjodfaI8s
	8bOxLjzz4TkVfi+p2pg5/3jePr+p3CxMaGtqHPplxhJWHVWOWa+N8f+7Vm+/81OMOeFWJv
	IbybVn1IqXhtz/QQz9knqrT1LcAWLQM2YaI87fbgv4wYMsgt2NndQ4yAh6mzPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: renesas: Annotate struct rnand_chip with __counted_by
Date: Fri, 22 Sep 2023 16:51:31 +0200
Message-Id: <20230922145131.578390-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201254.never.511-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb5fce7d90a1d1c72a1179686989ef8f02aee8e4'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075134_528151_5EF03B28 
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

On Fri, 2023-09-15 at 20:12:54 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct rnand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
