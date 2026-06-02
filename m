Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDA1CD6E57
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INBPTtIbJVoRanDHHfV3qgeH9vUj+Fyi+MEmAFnfscc=; b=yKlgUBqkysePDn
	IUerfcFCJea7CYWosaDrTsJPPI7Wg9gJuVKuwnXAVWMTGdi9oTZ2OrYwF69+wgIZCLsIhL1sbKiln
	XRWPPBNMofNWhbvv5ZVV/E8wn5LJHAv97L4sERwbGKEz/sW5TVjPWczHUivJfQ66j30p9CAewJHF8
	hgKII0+UsHA7veSpcAVa6lMYb7qeSRyZFlMHWPNgQdv3zeQP1feN8aDPD5wovG75vzphHIlGux3z1
	xUY+aIdIyRvUeFd86caEjTGjXtQDKJFPRyBzztFicebLJ1z2Q4Auwyw7K6OUuQeZWD2v5V4nKWXMZ
	RjUSnq4c6pRYLC9UQ0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsW-0000000CiYt-3vMd;
	Tue, 02 Jun 2026 09:57:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsR-0000000CiXX-2Ngm
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 09:57:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 107A04E42DC0;
	Tue,  2 Jun 2026 09:57:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAB59603BC;
	Tue,  2 Jun 2026 09:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5E3B1088817C;
	Tue,  2 Jun 2026 11:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780394254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6YEAwXu9u2T6foeNhTKGbgxkWXhM35Rvs16f6vC//7A=;
	b=sFXLZwLGRi4NTRx1H+ElbZWS4oiapNv3Pe5YJM321FdCengPRmf2Ri8UepUHA2b64q9kFa
	E8zJzwPJRVe8l1iJ2cSbeuWI7UjgpI2AKLAdl57ozwwslZyQgZqdn+NUTZDmPSU7fotTSH
	V4jHGMgwNMM1zALotrh6/sVuPwALB4JldESgTCHj2RXekBca2ngZZd3hOKwLnFXRo+SFcR
	MlblrG18XVD/oQvTY3yMtdaCnKOnrfCQlRB1mLCYZqAn/7Pmw2NzpFm8ccRKHgmA3dbB64
	bep7rV2wsFIP7iX4TCXBxbAIoh/4Cj+Og2FsHXH76zmv+zP6FIe1AnKazZuK1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove
 SKIP_SFDP flag
In-Reply-To: <20260601125438.3481722-2-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 1 Jun 2026 14:52:43 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
	<20260601125438.3481722-2-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 11:57:31 +0200
Message-ID: <875x41nu2c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025739_750953_8AD3E929 
X-CRM114-Status: UNSURE (   8.34  )
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

Hi Michael,

> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 65227d989de1..092450375d4e 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -868,7 +868,7 @@ static const struct flash_info spansion_nor_parts[] = {
>  		.name = "s25fl256s0",
>  		.size = SZ_32M,
>  		.sector_size = SZ_256K,
> -		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.mfr_flags = USE_CLSR,
>  	}, {
>  		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),

Fine by me. I believe the expected behaviour should just be an empty
feedback, leading to the SFDP to be invalid and thus SFDP parsing
skipped, right?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
