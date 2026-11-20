Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68460A2600
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sxZiJWJn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLbMn2xB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/UW7No5KyLuMKp82iBB9mbNTrUasPAyACAfihxO+i8g=; b=sxZiJWJn46PIELycK8RySzQOsN
	rAOR2bJUdG2VZD/Px4hTy4R94wxsIJFS5tZZAJlo4tHzRmENp90lddSrnmwZw3GpmEOT8NJPy4obE
	nyacJ90vaWBvGzJTMaEt0CnAeq4lbJoThMaZFc5D1tJi2lbLPZuriuyQgatYiw+PS2cwLvZWHml4+
	4XypP4FBDYeryuSJPbAaw79RuXQQ5gzh9P4wJngxbFVrkIqLGyq4p8MqiGJIQJohgCl/VzOR0KkAf
	SQ9BApUBCi5gBfhEZJ/4gQFRfb71Q6qls7X93OMVXVpCzcVdZ2yOWz69IrEsiCaPFJ1r3kLDc+5XF
	72PfUxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNi9-0000000ExBp-0gYE;
	Fri, 20 Nov 2026 12:27:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNi7-0000000ExB2-31tS
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 12:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2869561160;
	Fri, 20 Nov 2026 12:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1F01F000E1;
	Fri, 20 Nov 2026 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177642;
	bh=WeFdTE4PR68OQCnZa7+zxRrhnvY3a7YtcGXshXCKTgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kLbMn2xBkz95rHft/v4+ZMDSvSxBYWNlZDLIhB6PVLI4VtASoCQJ/dnAvVS6PZvDc
	 0N0sOxY/8fWX0z8fi3SbwvjHIkiLqX3Qt9SesXVtORAXSWYh1sIuSeuFRhPlCLnZNb
	 KsxYvYWlYBpoiINnrEjEb71oEw0J4Sz53YiHJOqdtNyrIO0pND3R/ozy2j845BY2oP
	 h467FfPfq5TpapIMMiK9OZEJOjsz9nqXKxcKVFUkmgANhwvUM+ETv5H1BMx6QYLAjQ
	 5x/MIwyDIReeF94wsHu5b/Qm2U1xy/RbjMbL4vEZnEaCODy51ay+wEVgEGsY/KbCUK
	 4a3/gcNZZ/G6Q==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Bart Van Assche <bvanassche@acm.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
Message-Id: <179517764105.1011003.7250063376346500539.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:27:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 06 Nov 2026 13:04:53 -0800, Bart Van Assche wrote:
> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
> called after spi_nor_ready() returns 0. If the flash is already ready on
> the first status check, the function returns before reaching
> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
> programs and sector erases complete synchronously during the MMIO write,
> combined with a controller driver that polls without sleeping.
> Consequently, multi-sector erases in spi_nor_erase() and multi-page
> writes in spi_nor_write() may iterate over thousands of sectors or pages
> without ever yielding the CPU on kernels built without
> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
> This triggers soft lockup and RCU stall reports.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
      commit: bcfbc784fce431f0f2b0a25c238b61feda2b710a

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
