Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C23C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwTM6l1a6djBZD4wabO4YKUhFf1/Oy1iQ9sseMmYTME=; b=GyTwVEu2JjQI5d
	tG2bOeK7N8wSS/wLqi/tnNTWHqg+nJkQ2OC4rrZWRuOb5fY3p13v3ImX2viVskK2zmQ0G9aKXKHSb
	c+YfT7WUnoWolay8StloOYW5VytKV0dxnylarDSJKACEocTFpsszZmd+t0/ASth0scSWGF+ys5PhX
	1F7VzZx8bcUE1hkxQLH+kMLI0JdgYlo0WTouZwSPj883dHmA0kfflEa0qGkuFbGKcuvPguiNeqosF
	imN0cZE9SU5Kxna9JM/Iffh9jyMrtCiYcL/yaqimYKteJsLYpN3C1ajlVEWYZwZ0VKUp2Z5c8GtVv
	QOX8a5ypnAuACDwkj8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kP-00FlMN-2G;
	Thu, 27 Jul 2023 15:17:49 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kL-00FlG6-34
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:17:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92E5C60007;
	Thu, 27 Jul 2023 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNG9tje3l3xvzkqp9p4Pdm+9j03eaDrBKVPPDevDw7w=;
	b=a8isnEEHtGmLESwkXnzgHu0zmOpF5SXA6XP6oLmnOaOB1NpUhdjXq+lDqG08hOsvMhiCAH
	YEyUuVY5aldv26ZSUh6y+CkxEFf1ERZbglj77phxqtrpUCxVA/KVko+8jZUCaipIxNYuqw
	JN1ddb7ZXDTXbFwdVL080k2EYfyfxz4kMk8AU1+ouspuqrgeIqNCzUDR488no7iZEpU2vR
	KjXU5qUOULncJ4Suzpdkxg1MpctDH/yPuVmtrTnG02ZswGZODWuij9dKVKNpyv/5vmuTuB
	+AbUa1TBEMTWdvefjTzngTIPUtsdm7pyI3Cu8LZ3aG4M7pjtr4rstY/LhPuUuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peter Foley <pefoley2@pefoley.com>,
	Pedro Falcato <pedro.falcato@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Mark Brown <broonie@kernel.org>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: avoid holes in struct spi_mem_op
Date: Thu, 27 Jul 2023 17:17:38 +0200
Message-Id: <20230727151738.586338-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719190045.4007391-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'71c8f9cf2623d0db79665f876b95afcdd8214aec'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081746_143422_09B96367 
X-CRM114-Status: GOOD (  16.92  )
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

On Wed, 2023-07-19 at 19:00:25 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc gets confused when -ftrivial-auto-var-init=pattern is used on sparse
> bit fields such as 'struct spi_mem_op', which caused the previous false
> positive warning about an uninitialized variable:
> 
> drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]
> 
> In fact, the variable is fully initialized and gcc does not see it being
> used, so the warning is entirely bogus. The problem appears to be
> a misoptimization in the initialization of single bit fields when the
> rest of the bytes are not initialized.
> 
> A previous workaround added another initialization, which ended up
> shutting up the warning in spansion.c, though it apparently still happens
> in other files as reported by Peter Foley in the gcc bugzilla. The
> workaround of adding a fake initialization seems particularly bad
> because it would set values that can never be correct but prevent the
> compiler from warning about actually missing initializations.
> 
> Revert the broken workaround and instead pad the structure to only
> have bitfields that add up to full bytes, which should avoid this
> behavior in all drivers.
> 
> I also filed a new bug against gcc with what I found, so this can
> hopefully be addressed in future gcc releases. At the moment, only
> gcc-12 and gcc-13 are affected.
> 
> Cc: Peter Foley <pefoley2@pefoley.com>
> Cc: Pedro Falcato <pedro.falcato@gmail.com>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110743
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108402
> Link: https://godbolt.org/z/efMMsG1Kx
> Fixes: 420c4495b5e56 ("mtd: spi-nor: spansion: make sure local struct does not contain garbage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
