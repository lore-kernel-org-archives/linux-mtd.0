Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A456C4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/ndhNjUmlK54wPh22u7+Dy7WlThh1yNDndFeJJwocI=; b=EYheuotjbnL1q5
	zJCj/N3qEj0nayDreU3qrCqrzJP1TbL1Q45iyEjE6tS93txCkm1mWzhRCh0yDGCCH9llCtlq76rtH
	TO6Ys+P3VRyC7+6MsWdA9cs/MLVdUWUhHUT8kZ6C1Ldn7lOYWS89PHgfk6HZbTy/R3PocplSp7CV4
	0Rh439HehnubLqS3gI47yxqiPXOUhs0qNv4QJ0frTIfhSe58pS5qR0UEQRyW6tCiwYus9kyNB1IaC
	EFi5sYA6nUDLFIts4Ea6Qf5bE78Wz8ZIsO1UTOHFzxc/pnyC6KR9AYe8lxlZs6xmvyM1jZ+ei2z7N
	qyvec3gpvJsdyZ2tI8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oroR3-00AJTv-SO; Sun, 06 Nov 2022 22:48:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oroQz-00AJTG-QO
	for linux-mtd@lists.infradead.org; Sun, 06 Nov 2022 22:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7DE8BB80D40;
	Sun,  6 Nov 2022 22:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03CAC433C1;
	Sun,  6 Nov 2022 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667774885;
	bh=w5IZtVGyB78C1pybpSuLuYkijzB0ftqE393WbSFktkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaC6OlFLcOMzUE08QXHlxeviBOEKxpNZDfUAS5FpYV3NZegWUOgiTKbxCRjp5lI2+
	 N5jkQZruY/MJFMvzzTjsczKB0O8B4lLPjG7MPKbu3VToR6Xrk6tSIlr77obc3JCKLr
	 H9CbJ0ocG8j/BC+BnJDl+HD20Sp9Ptc3tk0GwbhwOCApwjz2TiFSBN3hAlW5I1AyKz
	 cjVGd4kbvaEZN3ced56kLDaKMd4EIh9fKmkP50Lq940BPPh/6/U49SDHO+P8u67lmE
	 MtsWK8+2PSvIN9eCZQ4/y2SPN4ROAR1X4l+p2z9SCfcP6rjCyw3MgCROd0kubwm2yr
	 JTwHx4aLc2LZg==
Date: Sun, 6 Nov 2022 23:48:02 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix formatting in spi_nor_read_raw()
 kerneldoc comment
Message-ID: <20221106224802.suut4pni6u2c27tv@yadavpratyush.com>
References: <20221101162906.990125-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101162906.990125-1-j.neuschaefer@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_144810_044119_2DFF8B07 
X-CRM114-Status: GOOD (  17.54  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/11/22 05:29PM, Jonathan Neusch=E4fer wrote:
> It doesn't make sense to put "set" on its own line like that.
> =

> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

> ---
>  drivers/mtd/spi-nor/sfdp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 2257f1b4c2e2d..3e0bb383ab8e2 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -135,8 +135,7 @@ struct sfdp_4bait {
>  /**
>   * spi_nor_read_raw() - raw read of serial flash memory. read_opcode,
>   *			addr_nbytes and read_dummy members of the struct spi_nor
> - *			should be previously
> - * set.
> + *			should be previously set.
>   * @nor:	pointer to a 'struct spi_nor'
>   * @addr:	offset in the serial flash memory
>   * @len:	number of bytes to read
> --
> 2.35.1
> =


-- =

Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
