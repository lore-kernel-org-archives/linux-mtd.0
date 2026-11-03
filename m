Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C846085085
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lC7ZgV56;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeahQ9Dq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YCeDT+QgK/r7PuQveND/iCWswCxvBpzvG7FjfshaAes=; b=lC7ZgV56+SjJX3/iB60mRxL2Zk
	vckl0d1nM09dy0Wy/7qSxAzP8RaVjfcAm3yK7v5L6R7y1P6862IVKdGKFI2JSzdqFppu+sheqP9wm
	ZaHJuOy9/ohRDLUnv2KjSJUi1F+T0gjb2mmxdSdUuw9EsH22YXHr1qHDeYV5lVNd0htWoRjfpCOFe
	1naAgrmqE/MFoGxKIrUn+4R1ffNgDsbJTTNNyCp8/4z3UwgWEM0MfqF7PkScj7+dGiGhzlfz80qj7
	BVJ2VrTMTDaBmEFOlMhQ96zhEiFamHUTb3C8gncqvQERL8UMseB/OsvsRS0qe1CdfWePizzrpz/TU
	LHs+9eXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBie-00000001ydq-0Q4E;
	Tue, 03 Nov 2026 10:26:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBib-00000001yda-3rT4;
	Tue, 03 Nov 2026 10:26:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE08F4010F;
	Tue,  3 Nov 2026 10:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE941F000C1;
	Tue,  3 Nov 2026 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701576;
	bh=9clrbqdXgsnOrqBlmLUFDxai3Lw9LgBHe2HqLH/Q/qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LeahQ9DqABmAbcGyj0dThYoT0DpdsUvtLcNFqMLHA1CJdSENL0/8DLpPsbhNoS2yF
	 zcOxZYbasmxfKxo4YZeIUek1YLFILiJ8neYYC0APDRMf48s08rTmCq8neceielPrL3
	 hyF1Dqhx0guchGXSEienywv2eWIJ6an+TGlo4kP8r4WkDJ1GXr7Qkz7Ue8D6qY3dEK
	 9HLopgH7WABUEAyBdBTMut1Zy0+Hq2w+WavwvK4y43pNox32G0NkaHtBxjlsho8L+K
	 gKZopNZOxsyBRuthlcghJwvTuYddNK3Ub7b/NX5KZ3b5Rf5I89o1iLT/yvxfSA+z7v
	 CNzEO7UxSdFwA==
Date: Tue, 3 Nov 2026 11:26:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, stable@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Release the HSMC clock on legacy
 init failure
Message-ID: <20261103-watchful-iguana-of-criticism-257adf@quoll>
References: <20261103100602.1310416-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103100602.1310416-1-vulab@iscas.ac.cn>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 10:06:02 +0000, Wentao Liang wrote:
> When atmel_hsmc_nand_controller_legacy_init() fails after acquiring the
> NFC clock with of_clk_get(), the error paths return without dropping the
> clock reference.  For failures after clk_prepare_enable(), the clock is
> also left enabled.  The caller returns the error without running the
> controller removal path, so the reference and the enable count are both
> leaked.
> 
> Add error unwinding that disables the clock when it was prepared and
> always puts the reference.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 26 ++++++++++++--------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
