Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF339C71157
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA6LjYLSU2MyGVpXGzbhUw5Jvw1bkOAUKbkOM4nBLas=; b=SeeGWTSfKWr5GC
	zIO4U215Avb941jnPJNrwMXQaYzOmEya3oXDVKPYYRqFnRS2/YcNTbR+hthdjkpyTXMF6JKWoAtSN
	UmudHb+Xgc0m3sheHSElvMRjNeb6Qf95Iak7O63HSuiEIqfcfRU4klKtKKFKq30U3SnG5lniQRzYB
	nJ9WBFbbpdl/08/Mh9m/XMSWWPnsJP077RtnI3rTNQminxk2sK2dTujErdn3uOpgfwLD8f5dkELKh
	40eLZo6qFeMzcn9pn48y2HQOPPwF3Cqv5t4iHIzBGfO6AxEcMhDBrrv7Bx1Xpef0WuooBZ0fzupgV
	z7n5y4I7Clb8B6izg42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f4-009VdY-0V;
	Fri, 18 Aug 2023 14:41:14 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0ex-009Vd0-1u;
	Fri, 18 Aug 2023 14:41:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3484000B;
	Fri, 18 Aug 2023 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzX5gdoM5Yb2BGcVq37IpqionhzjbjtyvP3bnUvQiDw=;
	b=V87xDitMUJrKWq1YkcG7Wsyxo2OQedOTU68DgooM0ImRY44bfh8wkRsM7HLAJwElq39AGw
	PU3iW4u5nZMtWbVzmRFewIS0cLYSn43ActAK8jeCR23NgYzrwR1QJxEahFY4lUhwXosWM2
	oH7hvIzsBAfWqnIdlfjziCyfNze8isSRP/17HLcd2ETibq4emfsr+cx3VEQWMY12Xyzpi5
	TRPGFtZ8P8bZiOGILbotojeTQMcSGNF8GASdtuyOMg+FgwrR3u5JcExuSp/CAQAa7NgQgO
	4C2PTs5oP+ISlghU1+NgGEoXFPfUl4O+DfBIThD10n5QswTMkFskD2eVbgpV4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
Date: Fri, 18 Aug 2023 16:40:59 +0200
Message-Id: <20230818144100.145691-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816-void-drivers-mtd-maps-physmap-versatile-v2-1-433a25272bfa@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a417ab334dccb603f6296cbf04c9f8059bc252eb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074107_920004_0137AD12 
X-CRM114-Status: UNSURE (   8.42  )
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

On Wed, 2023-08-16 at 18:26:44 UTC, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
> |               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;
> 
> This is due to the fact that `devid->data` is a void* while `enum versatile_flashprot`
> has the size of an int.
> 
> Cast `devid->data` to a uintptr_t to silence the above warning for clang
> builds using W=1.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
