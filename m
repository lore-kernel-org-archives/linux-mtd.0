Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441A9CD6133
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX7VKiKzzYz/+psVmhQ1bnWEoolToIyMGck6cM73gX0=; b=zymM3huskLuOcw
	UFIuwus/0Tfg0ABMm61O/UfT9C3L14xIG49qNDiWvqyxFN68RLmGtB3L142Sxv1rcHO+i4ZdgfvLK
	hrIOku3JmUyK+FMpSgw/zuga80xbgKAIl4LKd2eWF0S8nSiVdW/aqOJfxJKgbipyxSnvxzw0txWG1
	m2gJ/wAXYDxaf8+Yd5D0Jk3k0geyGMyCh5rPgWzvS0f0NvffxCXQflpJlcxU66bDSjgc50lWdsmqa
	NTJadEPNTrBC7+mBecr5GCX4YCbjBwd8WeCMtwEHaC0lvcfTqsdFHnCUhv9bMchdJtNTrnJ15dg1y
	jorQPKO94Zb2HSuEBXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwiV-00BZ9f-29;
	Mon, 09 Oct 2023 20:19:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwiT-00BZ9F-24;
	Mon, 09 Oct 2023 20:19:02 +0000
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qpwiI-0004zP-2L; Mon, 09 Oct 2023 22:18:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: rockchip: Use struct_size()
Date: Mon, 09 Oct 2023 22:18:49 +0200
Message-ID: <3186469.5fSG56mABF@phil>
In-Reply-To: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
References: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_131901_685567_820FB347 
X-CRM114-Status: GOOD (  11.26  )
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

Am Sonntag, 1. Oktober 2023, 09:44:04 CEST schrieb Christophe JAILLET:
> Use struct_size() instead of hand writing it.
> This is less verbose and more robust.
> 
> While at it, prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with __counted_by
> can have their accesses bounds-checked at run-time checking via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions).
> 
> Also remove a useless comment about the position of a flex-array in a
> structure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Heiko Stuebner <heiko@sntech.de>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
