Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432A7C83F25
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zAGQI8GsBXRDNLwp0OUu7jmXVNC4TaSSj6ZiRonWIA=; b=J/mZHZgaAa49fFUO5KCZB+WtSt
	HI0+VhsHeOXipFAnQ+levvpO7ckiTPZzhAap26damwbuQSrHkhEaD/Sui0p9S1oKSf4KK+1FuaTF4
	O3wJtInuSmrnHJxbLK/Xb4ppXkgQLYEViE3nakn0VAQakBLuqn9zXBSpndI3WnM7U6T/UJdvTYo0D
	jN7YLFqPvqw3+pqqHUFN/j64SVlxUAgihxEZUi5W4UAPw9nOS5kl7cI2UML/UqVVzU5np16cRmIec
	YF0Ft2vw7Hllptlf6yDq8hRIXnnRJNfI8vQil7icW8Pf/1cKQ3Zcen0SBI4PovixCuAiAxOYnB3m4
	1Z4MwCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8b9-00000001rew-1RTg;
	Tue, 22 Jul 2025 08:43:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8b7-00000001rec-133M
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 08:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC44E600AC;
	Tue, 22 Jul 2025 08:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0E0C4CEEB;
	Tue, 22 Jul 2025 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753173820;
	bh=q4R786VWDMTYlJcgS8N5GDJSAYM0n7uM2RZhr8sh6bU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KpF7Ac+Nwiv6J883iTqJgCLDIPoUS1/atUgs1ArBBDjtfiaOoJ9w8BHxZkqSHiGmz
	 WULdkT/1XLV657JH68Cjunhz6iYWjNlt6OKpAtDyxmpfuy3bB5vObpJxH5n08yMWCI
	 Y78ljZbQ4hZ4/KmMF6shKxE8IUu+YiSCl/SGwrBce2uaqwsAUAyhL4kNswGCtxxUX/
	 rDveTzxGBLwGZ37SYVK96JYvVjSycuNLdZqCWa0yErilVciYnc5bTk19y5sl52uj4n
	 aD1isib+eUYzINs0qHCKLtxtgQv6IdQoDz5z0E3Szra1VYyXIDWLNpJMz+6f+sz0Kz
	 ncaATxNqBOQ0w==
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 10:43:36 +0200
From: Michael Walle <mwalle@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, Richard
 Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
In-Reply-To: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
Message-ID: <9eabfe619554cbdd493086dcffef8f44@kernel.org>
X-Sender: mwalle@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Marek,

> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[] 
> = {
>  		.id = SNOR_ID(0xef, 0x80, 0x20),
>  		.name = "w25q512nwm",
>  		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
> +	}, {
> +		/* W77Q51NW */
> +		.id = SNOR_ID(0xef, 0x8a, 0x1a),
> +		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),

Did you also test the OTP read and write? I'd guess so, because 
otherwise
you wouldn't need that entry at all, right? Or is it because of the
winbond_nor_late_init() which will be called as a manufacturer fixup?
In that case we could do the same as in commit afe1ea1344bb ("mtd: 
spi-nor:
add support for Macronix Octal flash").

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
