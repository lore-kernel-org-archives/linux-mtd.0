Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F2606A5F9
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xlOMWNSR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qCMpHgry
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4HzYUwGltz2GtRbdAN3VTyEQAcwoYD0/FpZOaD57+Yg=; b=xlOMWNSR+EmAxN3B5/3hqOKowt
	ls7Yqsy6MQScdS7KOmcYln0+jeELlVT3iG10/ft37ss/qDpzu2C2hjJEMggBGhcbLaHjOpLemHiZO
	C4KpK0cKMDSMZRTfa3XpmTfawA6QxalAGj04KHjUkhOP+uVWd+rOX6FPmuMbreFzYFX8qP+xq3V8V
	2varSxoY+NWLq5ECyZw7ANJGJNOrh/hlJB+GQkPPAP1iWIl9GVTa08qH7wDBIWJxJIABPjccE9Z0m
	eq1Gg0P1543x6uh5as9LnFTeysMMi5DIG1wPabCaGRAfZHlabMNw1j6ZukJRzkdbLy/Ct2CmfnKRD
	vLkXGLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6gr-00000007Yl1-3rnF;
	Wed, 28 Oct 2026 16:39:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6gp-00000007Yis-2Hb9
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 16:39:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63874C4FED5;
	Wed, 28 Oct 2026 16:40:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54A7E60769;
	Wed, 28 Oct 2026 16:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4ABD103290D5;
	Wed, 28 Oct 2026 17:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793205580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=d047tn7ZyUAE4CZJF6OwqmbdpCg4ZRFaWnDJv2Xlu+8=;
	b=qCMpHgryog1vBCpYw2HnRskue6gsLgB9uoaHyNvM0YNItQkxRCo1T8oI+12cGb5oxg6MgS
	EKhcVHkSpJmnXgfq03mwJGrHU6ylLbZNOshuzLyT1eTX31bfoylyj6RjFTeTa91PVNX3uA
	CFDxOIL63kdYVpkQfQtYyg/55KilXBl/VU1++SiVbKEjHIqY3qphAdZqMYGB+2bC8GGbl/
	4MOIDH9pwJEfT7Vdg+fVsuEpQIAxgZ3O10KHXWyo4M32AwlQ2xslc/Y1AAmDKDqMFHMV4q
	LTGC39X7sUZYIBe9gi1HS29LySxXbrl1x144YQZPz+lqRxwlrLlStqOmUUvgtQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/5] spi: dw: Add DDR (Dual Data-Rate) support for
 enhanced SPI mode
In-Reply-To: <20261028121100.79667-3-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Wed, 28 Oct 2026 05:10:57 -0700")
References: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
	<20261028121100.79667-3-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 28 Oct 2026 17:39:32 +0100
Message-ID: <87a4nxg4or.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_093951_773419_C7C95D4F 
X-CRM114-Status: GOOD (  15.07  )
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

On 28/10/2026 at 05:10:57 -07, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Add support for 1S-xD-xD DDR transfers in the enhanced SPI mode of the
> DW SPI controller, on controllers that have DW_SPI_CAP_DDR.
>
> SPI_CTRLR0.SPI_DDR_EN switches the address, dummy and data phases to
> DDR all together, and it only applies to the Dual/Quad/Octal frame
> formats. So in supports_op() only accept DTR operations where the
> command is sent in STR on one line, the data phase uses two lines or
> more, and the address and dummy phases are DTR on the data lines.
> DDR instruction phase (8D-8D-8D) is not supported for now.
>
> For DDR transfers the dummy phase takes two bits per clock on each
> line, so the wait cycles must be halved. Factor the wait cycle
> calculation into dw_spi_enh_wait_cycles(), so that supports_op() and
> exec_op() use the same value, and refuse dummy phases that are not a
> whole number of clock cycles.
>
> When DDR is enabled, program the DDR_DRIVE_EDGE register. The
> recommended TDE value is SCKDV / 4, clamped to SCKDV / 2 - 1 and to
> the field width. The register is only written when the controller
> supports DDR.
>
> Finally, advertise DTR to the spi-mem layer through a dedicated
> dw_spi_ddr_mem_caps when the controller has DW_SPI_CAP_DDR.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Looks correct to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
