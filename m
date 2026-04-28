Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AB1FF8868
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2026 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoWvQldcbDCn7MQ6bZlnoxK1Rs+jTZAFdWN9cprDlZQ=; b=g5e2fhDzpcie0M
	h1aCqojHmf9tn4QNZizs6HdSivrOf4NZfe0U6pc3JUtD6VjwEuPQdgVdDhwFC+XL/6qnkhDBLd4em
	l77+S2u60XrO6d39odzxFsd1Xo5Rp9c85dUq2N5KxZQM+L4wcItXM71zcceVkvJqWdIDN8ZOXXhIn
	bzgNFwn+JpdHGHQRG3MGjHR+ZpXTL3MB4fXA5ruxoOi0kMGGl4+V1m77jsCYciLSB79+nHrRO9TTR
	a/urD9znVDKpMcEwFykK7yRHugGJ6D26Yw9Dujdd6QOqYGMIJorDNbi9Xkh8euVADAd/lghhpyE7h
	gSINQiF+bWqdpSTMzogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhnr-00000001SRp-0P9h;
	Tue, 28 Apr 2026 12:44:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhno-00000001SQl-29Sb
	for linux-mtd@lists.infradead.org;
	Tue, 28 Apr 2026 12:44:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D288D1A346F;
	Tue, 28 Apr 2026 12:44:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7804601D0;
	Tue, 28 Apr 2026 12:44:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7056210728B2D;
	Tue, 28 Apr 2026 14:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777380273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sz0zbVibYD3ws766mYrKtBGdJgj3I/pYhnlAXRz8F84=;
	b=q8UPeq/PDsYwFot0SvyZRpslhROcaSLOmfgDwKPM9fMDqPvX6zFXnZXtm4p1jiwRuhASnv
	HruUr3EJBZA51npI3/aq4ibQoZzcS5YaWyz/4MkBd0ipYuYj1ef+G1s8lbrJCrP8dI8n8y
	uNM1Ca2SD1VJp7q0FWSn4OoeFrZ+wF2ri2hiqd7TIFfmarFFjcmJ82wjt8/LnWoalnicI2
	UVjDwVNAcnSVaglr7wmc1sztJYUPhS9g+oZv2Ay0xeM0YnuT2Q6C6smSWtd0+2k7FCkxof
	e7tINB0SofrQfyZMVgWqHarDKShk5qQ4114N+sScP8eo6Yc12ckDhvUrB3sFYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
	(Miquel Raynal's message of "Thu, 26 Mar 2026 17:47:14 +0100")
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 14:44:33 +0200
Message-ID: <878qa7dzke.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_054436_687449_83799350 
X-CRM114-Status: GOOD (  12.26  )
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

On 26/03/2026 at 17:47:14 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> TI errata i2351 explains there is a problem with CS handling, SPI NOR
> are immune to the problem, but the CS being deasserted spuriously when
> there is DMA arbitration on long accesses (every 1023 bytes), SPI NAND
> continuous reads cannot be leveraged.
>
> Link: https://www.ti.com/lit/er/sprz544c/sprz544c.pdf
>
> I created a 2-page read setup for testing all variants available on a
> W35N chip wired to this controller. I reliably observed all variants to
> always (in my tests) report correct data, except the 8D-8D-8D
> variant *when setting an extended number of dummy cycles* (>= 12, so 24
> dummy bytes). In this case, I got the first 6144 bytes correct (over
> 8192), the rest being full of ones (0xFF), indicating the CS has likely
> been deasserted there. This is not exactly 6 x 1023 bytes (?), but
> close.
>
> This series shall be applied on top of the SPI NAND continuous read
> series that I am also carrying, but ideally not too far in the future
> because there are Winbond (continuous read capable) NAND chips mounted
> on TI platforms AM62 based which could make use of that new feature and
> expose the issue described above.

Applied to nand/next (except the spi patch).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
