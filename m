Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449D9C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGGHc4YftUGeQkekZKXQZFTXpI30AP7QuIYpManhyco=; b=0pXsZmJU168+21
	Cr4+EI/GzQ7q+r/84nZ20o4G0uZ9+n8jmKoGJa9TD2E6wALzoPTV8u6LtlLpkSasbPqwYRkYnF8hw
	lWkcgpW6GBK3ztXg7v1N1csabBJAzMyXrRQaGsb6A/3rwP8OTCTIf0gGzTLgSnpRgqRd596LdPaow
	dQ+CrtOeUNBBkn0U2froPHGJ2WxNUbwtik9R+C/lyVXCMhAof5jK8kfpBvpYtIA+t660ojUzRB3Es
	Cokt38/qRgVPBCPxm+3tu52fJZeGdKQLrmrVAgp99Yp1ofzNMZ6mPgA+usnhzRED7Z5n7T949Hsoc
	IuD5FFZNlQpBsVYaYhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYVH-00000000AMH-1jQD;
	Mon, 26 Feb 2024 10:46:35 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTg-000000009LZ-0QQh;
	Mon, 26 Feb 2024 10:45:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF8E860004;
	Mon, 26 Feb 2024 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGgPJz7fSzd/AZd1yCsvBP21oXYDl6x0rUru9QRjD0w=;
	b=DVwvJSXc5bXXPn2OPpJw7oRqWLPyrxYwOS3U3LQ/yXluXgLPB8m7RJsSCoqZgY1P20oC64
	qllddgqLbaLor00kNBhegbQIVaGaKDOmgvk6sHoR4HyP4SGAE1xX9QDLLR8UGeVWB5cysR
	bBdJy2znddpu9ejf/buZ5G48djWvNj3SiUtJuT+SQ4k90crC1gkxfcIKVwRq5VMMgNKokE
	ynUOOV3c9mdL+oSNN1TelRJU62h0pvjpTo0ZjvYIhKbrRc6aSdKBgt8iC9J2ORJ9fUdXuM
	6p+hWmfX+IrtkE7Ij4Mrhfq23om1OPNsKQynZXuRKALOGTXzC8LscfZmVv4QYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Roland Stigge <stigge@antcom.de>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
Date: Mon, 26 Feb 2024 11:44:52 +0100
Message-Id: <20240226104452.490015-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213100146.455811-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'347b828882e6334690e7003ce5e2fe5f233dc508'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024456_630899_9614A589 
X-CRM114-Status: UNSURE (   8.00  )
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

On Tue, 2024-02-13 at 10:00:09 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about mismatched function prototypes:
> 
> drivers/mtd/nand/raw/lpc32xx_mlc.c:783:29: error: cast from 'irqreturn_t (*)(int, struct lpc32xx_nand_host *)' (aka 'enum irqreturn (*)(int, struct lpc32xx_nand_host *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> 
> Change the interrupt handler to the normal way of just passing
> a void* pointer and converting it inside the function..
> 
> Fixes: 70f7cb78ec53 ("mtd: add LPC32xx MLC NAND driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
