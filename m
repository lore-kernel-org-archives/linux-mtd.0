Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14A606A31F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fT4bZ/fv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vq6KJY5/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HXnDWFolD712Zy76Gj4ci1Uwrdu6Z0Zb3VmAdmBPjxg=; b=fT4bZ/fvO5THmgHbJSNUR+2D9H
	kyi6O0DKiNuluA7PllxGZdmo2eevdABW903pNXNHx1myrAWPiZxGWCphgRhzYmxBk65laW1wPBW+J
	rO42lGa1KrbT0+/m6xCJLIQRs+/5zVw4G0MHK4c30FTgX8a3HRegHO2b3Mp1DMjsJkS9dZr3UINbb
	v5HYwZxSnMMLpFfcTzwZrkrypcTozNBKrqnGZwEUzNvkWgXlws3JKMCZWUfSPOkYBn8F2IuFopbMS
	Zhr5qwGygnS+rKOi9BdvVEKxjtWzC7Bm9XMbBrYStptbopoQUmibuz/bSqI+p2yoiyQgbe3UsDbCa
	wKnR4OOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoYZ-0000000C0uC-1mmJ;
	Fri, 30 Oct 2026 15:30:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoYW-0000000C0sv-2bqL
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:30:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A1CA5C49F63;
	Fri, 30 Oct 2026 15:31:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6F5D603C2;
	Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD7F81032912E;
	Fri, 30 Oct 2026 16:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793374206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1o4CZDZu+gULwQEasnXj9CMdx8xc0cnQ7Pve1CdeUsM=;
	b=Vq6KJY5/MC4ZIDB6v8sJFdtKcMSg2Z7pOq1l33uLq1CTt3KgQ9M3QJ7ZNMWFThmrkLnm91
	gS/e0cmipNsiSCTlQyKBMl/b6jY9pE/UvIKd9uzDhK8q+6e5nZ2+2+Oe5o9En7X3uKLKL5
	LCzd199jgcx1W1vSFj2IopJ/fIHOlpA5YoiqnhUYSSmHwcekM5EzCbweuGjEvxWDECG8gY
	qsk7BXjPSpBBW4vSdyeRxnLPiWK42LeVQonVGiSskhyu+hbeeL2Gm9swlOVU7hgs9piX9W
	9orN1VNV54tTIyudtE1wnoEZEp8t8cpfmBng6iZComo/LpUucmjhYojMB6jRxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Richard Weinberger <richard@nod.at>,
  linux-mtd@lists.infradead.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: retire data DMA before
 unmapping on errors
In-Reply-To: <20261030151843.2953269-1-samarth.colleges@gmail.com> (Samarth
	Narang's message of "Fri, 30 Oct 2026 15:18:43 +0000")
References: <20261030151843.2953269-1-samarth.colleges@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 16:30:01 +0100
Message-ID: <87tsm3cikm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_083012_819465_58EA8D84 
X-CRM114-Status: GOOD (  11.07  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 at 15:18:43 GMT, Samarth Narang <samarth.colleges@gmail.com> wrote:

> When ECC descriptor preparation or submission fails in
> stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
> terminating the previously issued DMA descriptor. The descriptor may
> remain queued and execute when the next page operation starts,
> potentially writing into a buffer that has already been unmapped and
> returned to the NAND core. The timeout paths have a similar issue, as
> they use dmaengine_terminate_all(), which does not guarantee that DMA
> has stopped before the buffer is unmapped.
>
> Terminate the outstanding data descriptor on ECC error paths and use
> dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
> stopped before the associated mapping is released.
>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

Seems like you have a lot of them, so I'll drop the individual
submissions. Please create a series with all the ones related to the
subsystem you would like to contribute.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
