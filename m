Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B1E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tgns8AAsOCY88d9WJXoXBduUlgPU9g7voWrYhSgN8Lk=; b=CCUv1DsA8SBEOk
	Ao8/du53cLrNjg7PK8bktlZA/NQvSErDoEZEqCgcLpm6aPnlSKEf7mfXq1ElM7reDhTvwP8KZPKmS
	iIA3DFnKWbFCwpSVetJc1tH7P/0h/kFuU6Jct6JILug1TRgZCc68EtGPmWiqZn8ZF74ifucm/KNFm
	ddfkss6lby4afNSp7gQJ9VdAQVhVP4BJNkn7s054BpefbnWyZaLd04J3fMZrczdxoOLGm6wkcaNu5
	2M+E6lMX7ePqHAsKy2/NRN6HVIWNDLKI6TIljxRcHR8hWtQv71+x2df1iFysIyLyt9UH94PFwL76F
	Qcglv2UbJRq1aEIDuWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVq-009FkO-1r;
	Fri, 22 Sep 2023 14:52:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVp-009Fit-1v
	for linux-mtd@bombadil.infradead.org;
	Fri, 22 Sep 2023 14:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D0rPmS/SmEM2jLWeeTbONX0A5F24gbmlgrD32arq0jU=; b=Ll+MATsmSp/SBrbS55R/dEjClF
	DPK8yA9JdoAn+sdwv/5dkBwGuEeKEWDuxWT7gGezdAa8Zh9ICpEOUKl90CkHwsShf98rEd7e/BcS6
	kb2H20JlnLOgKMFLlBVOOf3npuFFacTwmLhafxpUJyNpbPc+FEQKWy4lYvQQVVmMibPBIGYnN8Nbb
	kr6XqD9tRVWra+9/TZzyIK7o6ds74N5vXoZOugGCOWOYHFwZeAjBCT4S6tMdV/fRWjGDbzdgqVrIm
	8CKTasrNXiuoo3REtffPJmaLTujIpK04bnoAC0oGX3V0yAX8wWOzturAOAPSXg53oBJ+H+BFn7d5n
	8zmhBxWw==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVk-00GLiu-2E
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:52:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B3B820007;
	Fri, 22 Sep 2023 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0rPmS/SmEM2jLWeeTbONX0A5F24gbmlgrD32arq0jU=;
	b=gi9kK4FRbFb0TcyXmBz68cfL9tIuDgyuKDIh4K1s3TYcoRSzffTRtN7pzc736yys8s0Kp5
	aB0rjFXKJJGK5Rs1D9up1SPstSZRWF6ybOvKdejkMSGwkrAzNqVQvY9UmygmNV+90zpvWM
	zyGYGilq+t4E0mlGNVlq4frhT/PMvy3aPEMuCiZq3YF6YB63ZgqFq1Q5+ZBa1iQ/8sFXi/
	uKG2SyZ6ipMgyZ3KdEmFIWOV0oTcIlHubIWl3wD5YjjL1atUToRBHpvwG1c02PEWuBXGgf
	EiqP6bG6pS96tb6pa6SJErpXh4aq51CBTKb7/qsY93jgCzQlXL9VOzlh7PtjXw==
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
Subject: Re: [PATCH] mtd: Annotate struct lpddr_private with __counted_by
Date: Fri, 22 Sep 2023 16:52:00 +0200
Message-Id: <20230922145200.578613-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201159.never.112-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f1a9be986cedbef839062428e8e9b2bcc9c58af5'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_155206_301852_36A37C93 
X-CRM114-Status: UNSURE (   7.78  )
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

On Fri, 2023-09-15 at 20:12:00 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct lpddr_private.
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
