Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38230606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xym9qMYD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B3bSM3ji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9GiKz+vdXxOmfGCNAlV6O7DuOFoTUXWvNF6SnjbabBY=; b=Xym9qMYDhraimrtk3OueA+tNxb
	RkRG9iRBbg2CyCpH/9yf/iKimNKGxT7Exemf2AKEWyuS5ROBcpkoEMCRvSspQ80itWxoTSYSEMr6o
	qn9T86BrgrIa5uRTf5DuI8wY+xWGqz/laa3mrelqx+8JyysuL5sVxq0MgXBG0h/jC2wvCWJAms00/
	GOPIUnztBTZ0IQBjT8Zw9h4Sf1brhiBcwyAymLYe0OOLVReWmvkEYyxxZkYcEQwPPPD3eVxebZ7Nb
	6PprFDJnwGsUyO8Qsxjo2zi2if1JNXM3oSa6vDORTMJWxax5d1YpmWdHVq6T5FWXE0UNDADMBsa5T
	5G+/ltMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdnG-0000000E7Vs-1DyH;
	Thu, 26 Nov 2026 18:02:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdnC-0000000E7UP-3xFX
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 18:02:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ECF84C2B9D5;
	Thu, 26 Nov 2026 18:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EB9660558;
	Thu, 26 Nov 2026 18:01:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0528A11E69167;
	Thu, 26 Nov 2026 19:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795716111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kl7bg688dXQ0GAc0QXvKBX0thFl5TKdWcSAQVME7qL0=;
	b=B3bSM3jiUK4noIe6e1knXOQNbSpWZfGs3R1GXa6wZ3FImgsCFptNW6q0DzKt+gmqZvJQwr
	dSDr5dkmCUujMxkPkyiCmAu5OIPMV2KCIB5nIqOnhcWe8/cpFFuLy0q5S2eyDqRrlFYASw
	BLVGru3+EVfYM60JVxcPnUdxeTeLHvaURR2I7Jo2V2nROSta4wyy2wmxD06IUhaWbe+A/C
	n4ZaOb7a3xXMHJ/zTBslsJw4duEKvRGRIzNtI+1kIUoRR0GvZCZ9NKhKTzCvAgPMUOh6gf
	36MLWOi+y2LzIHyIWhRKguPoWy8G4K0y5cLjKMrqBLFbP7dAdE+j/2+nFrRqRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Stefan Agner <stefan@agner.ch>,  Lucas Stach
 <dev@lynxeye.de>,  Thierry Reding <thierry.reding@kernel.org>,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Dmitry Osipenko <digetx@gmail.com>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-tegra@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
In-Reply-To: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:05:55 -0700")
References: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 19:01:45 +0100
Message-ID: <87se0nv5di.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_100159_735881_E1AFF673 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/2026 at 14:05:55 -07, James Hilliard <james.hilliard1@gmail.com> wrote:

> The managed IRQ handler remains installed until devres cleanup, after
> removal or a late probe failure has suspended the controller and disabled
> its clock. The handler can still be accessing registers at that point:
> it signals the command and DMA completions before its final register
> accesses, so waiting for a NAND operation does not drain the IRQ handler.
>
> Mask controller interrupts and release the managed IRQ before dropping
> the runtime PM reference. Apply the same ordering when chip initialization
> fails after the IRQ has been requested.

Can we instead include power mangement in the devres logic? In general
when one need to manually devm_remove/freee/unregister(), it means there
is problem and the solution is incorrect.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
