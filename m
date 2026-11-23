Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C74606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TusU1sm1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XnhYjMjT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rYJm5k+27c23+ZY4qzzVKUEcslJCsaQG3KxJC24aGT8=; b=TusU1sm14qYhHW0Ilg8SGdsURB
	x9QqzcePNKs8/smFZDa7MBlC+cZfIzxov5u0c5fzfpYk4VFxUGk7/iJWya//0eeY+wvDpRVaYWn4r
	NsN/LrsLnyLIQO6LPUFfMifw1D8WyPc7SIik+V6A2tSFehSaiVj9hEyxb32HQr3K5wFf3tFtKFMK2
	NcsoxXy8X/HyIIY8FeMnr2rtBIfC2kRJbVyOhLMYSGN992DSB64uvr+snyAG6eNkKdVp3uSQPbOIz
	34Q6kYr0BfshrUaagHig7mVB8hmYRJvdPHse+NFk0b4hILE7+XzM8AL6lFywQtamu1PCviO4PVeve
	Nn+unUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUo2-00000003h9e-3Jlo;
	Mon, 23 Nov 2026 14:14:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUny-00000003h8c-3iTL
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 14:14:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53D494E4126E;
	Mon, 23 Nov 2026 14:14:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D33A601E1;
	Mon, 23 Nov 2026 14:14:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0DED11E6A4C1;
	Mon, 23 Nov 2026 15:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795443234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=nsdKbIq36FccgQPqfh448GwbaW+3f8OpmGVjFlQ7f0g=;
	b=XnhYjMjTclObhst0aAEM0y3bJQXQR6cpMOqc6MhJ3wSz/AlktiY1ml+VnUwWOMiOCUl/Dq
	OUYl5eOOhsyZNKYGbmumLIbXQV6QwCfpXQ45y7DHeBAIlya9J+WnIvcs9xP4vq3XZybDZG
	2/c0Jer2kVEydpLrpjkpMtTx0NYGlqtfkdyIrw9FVX8eSVx96mYCG3WvOAuH7HJRTzc4h8
	59Y50GvwIW+XmJP+JxfwzbtnrC1xrQkL4foNpEy1W+zJkK5dsy3KmqP3DVOFHhLsKO5T75
	aANYJSXHsZ8qedaAwFOPQbo3gwJ35/zobcxZFj9hCKw//+KuX8fk/wW3E0GkTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-spi@vger.kernel.org,  Bharat Bhushan
 <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham <sgoutham@marvell.com>,
  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v4 2/7] mtd: spi-nor: Wait for NOR ready with
 poll_timeout_us()
In-Reply-To: <20261016102917.171095-3-paul.cercueil@bootlin.com> (Paul
	Cercueil's message of "Fri, 16 Oct 2026 12:29:12 +0200")
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
	<20261016102917.171095-3-paul.cercueil@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 15:13:49 +0100
Message-ID: <874id7vdnm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_061403_561359_CE5E10ED 
X-CRM114-Status: GOOD (  10.14  )
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

On 16/10/2026 at 12:29:12 +02, Paul Cercueil <paul.cercueil@bootlin.com> wrote:

> From: Tanmay Jagdale <tanmay@marvell.com>
>
> Instead of polling for the spi_nor_ready() with a custom loop, use
> poll_timeout_us(). The sleep period between two polls is set to 100 us
> which I think should be fine.
>
> This will make it simpler to support waiting for the SPI NOR in atomic
> context later.
>
> Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
