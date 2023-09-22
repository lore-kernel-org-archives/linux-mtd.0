Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A89FE6FE41
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtAxy2YC/5zl1uUS2dcl9uWqd17Q8JHwfjXVIvuzAqg=; b=jW17jjc/Knkb7Z
	9uLnuaz3XixF+EASe+MxRyhqdoZCISBdECSJfq0iPZ1qLkwah8UFkFH1h3qs+3J5K98hnBI2p7sLF
	qtbijjlu3SQZZ5WzTB/mbpyUZQeHanKjSo4SfSwX7LnT6yrJUU9T9IS60AXKTf1nZqhlXyZyCVmqn
	2lPM92yEaDX6VQCjcht7SzgHv6CJDGcTcX6w/MN36S37CqW9EvX5jUEMfQwFiEsf4kHaiQ29vKOZ5
	z19ykkKR/sVfIirNlLoc0XM9gJEdaVAp51aMk0vTMwDAWJkSVusz07Ffw2ZDHmoHEDd+ggyQRUjB7
	mv52f9EhSTK5fimoifDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVb-009FXA-1w;
	Fri, 22 Sep 2023 14:51:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVT-009FQI-2e
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F3C60002;
	Fri, 22 Sep 2023 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxkNTHSpXY1FBSVoWeaPKNX10l14oI/LawwsZvgPfC0=;
	b=lOrRisDvkm2oli7EqfXVLclHRxqKI3Mn1eN2ahFXZmvQjGv6VFSwK+Vximt5IEmcIldgSC
	ZZ6YuTHvOnDLpBhEgDSh6HayOwTez/xagZukxdfzgU9L13tguMC48964xWfggdG34KHKMb
	rdvvog6LNY0wzBTLVY9OJFEx3FEHpkajrG4ReNZfjq2mnSC/BaMYfMIekNBav7IWbf1zI/
	zDx2rPUD/3mCU3MpK5ke3IUktsEa9ItrGNSdVYTFD2UiTfzsqohnGgslpWpLDH4XjKly8E
	U+W2S0HxefYCGSjQrqIV4s2VMbNB3/z9oZpREBOSmR1rJiosJWKNREMD5uBTNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ingenic: Annotate struct ingenic_nfc with __counted_by
Date: Fri, 22 Sep 2023 16:51:44 +0200
Message-Id: <20230922145144.578496-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201234.never.868-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e87f0d64c9063eb26337db79edeccbdd0710eb66'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075148_017392_5E972F83 
X-CRM114-Status: UNSURE (   7.93  )
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

On Fri, 2023-09-15 at 20:12:35 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ingenic_nfc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
