Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46156C47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 13:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1513461184
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 13:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1513461184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgU/R6kNhcfhDrwRjKLuss3raNs3uUV8HYGRKGgouU8=; b=bKw6iHSc3/cwIu
	QH7uTkTOAsHa1wHXkcy9Ekw/7uPrgSMgK/2wK0F9Yikdh2R0Im8hv3k+MjGhfDcYQaxM6BsJxD8cQ
	jsWkrIEcnsTA1D6lz63jPXwqwZbfPBUgRtGxFfBUy3/1XffBaoyPNgvKxczviVmTSkKZbKnyt05pG
	vVlrq9SDwlM+TmSWDgijSyXQg9E9ug/LhYbQoL3c3RHXAApz+7ITML2/8faNIQVQcvL5KykBM7TyY
	OKn8MokEavlhwvOJBzqWtchaabQhnqEE35FHdB+9VPFtAK8PxpOR6H2tSNxtwsX2f7H0rYkkIAFJ6
	bwnH6utbg1ArznBaCKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmcyT-00FxCO-Uy; Fri, 28 May 2021 13:56:30 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmcy5-00FwyB-Oj
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 13:56:10 +0000
Received: by mail-lj1-x232.google.com with SMTP id e11so5332858ljn.13
 for <linux-mtd@lists.infradead.org>; Fri, 28 May 2021 06:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bu3MQ6DgF0fcfplCjXBBOAim/Uo1qYJNmd9RnH8e+ks=;
 b=tVF+0kOaRRXhQna7qmOYKGJIdz3n8LS488iOoSBLmTiEfRpf0rxZ5GDdWAw97Amj5b
 N6XUEXQog0DDfJyMoez4vePANL3E893LsEQIfNfeCneI+hjM0GLI5KoM9FMFwl+INMUq
 MTFMoDr6e1gx6swr8vrpKxdhFH9oGaoPLVcBcyC7x/z7GPtnKfgfRfOv0zzdfNHADg+m
 N4IeDRSwBbtS1/iHe+GOa+/hkpWBrPdWGSrLQSONcRFNs2/TeQBK6KolPn1RWeIq+PX9
 DNu4KSv4smF14u2ueH1JT1pUfTKQRjMtclV9aY1dCqPNXAdhZ3Fqv/Dp5MkJW4/ZlL4n
 vQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bu3MQ6DgF0fcfplCjXBBOAim/Uo1qYJNmd9RnH8e+ks=;
 b=Cd+AM8wXDZ4eeGjJyYePSqEA95H8ecZ+LsKSKSAdQfkVd3tFjrHhWPtigsrCgCNatB
 vyQkV6VNqnrh3JR1DARmzieJznpCS9hvjcJh0kLGUzkOFjBNZdSTTzmgUXbcJEYyq37p
 N2Cu10v3hCduECycl0cVdICgIOLy8q/KFZUHK5E4i0i5ts3ni+J5NXHZsxo2faL/1M+H
 DipHzSFkJdVGNcAfqfL/1u8imyW+GW5Az1Sz5fq5+M4S3xvKU3gjQss4TYuWRAZHWrAU
 9Y6yx6nfDFNf8qUOcIFrHnzxPp38jINvlKLiSTC8dm9ma+4d+du5AjPCu9n+2J2Z+lsj
 Sw2A==
X-Gm-Message-State: AOAM532BoJ5yyu4m6oHx7HS6igVWNreHMSOtd1R5rCdTlloQF6dDtQ6c
 OdSPPXqWRUNhdWyEWtdCNoc/LTO5bGwe/2EZUGI=
X-Google-Smtp-Source: ABdhPJzdoAyrq+MXYaDETTn9Y5LvOV5jUsKpvHXTLV4U6vofzDvdswL5xJxnJoQQIYuEWUXo8MoedyvPApORUmIN3Rg=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr6650994ljh.490.1622210163006; 
 Fri, 28 May 2021 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210528072351.1639575-1-hs@denx.de>
 <20210528072351.1639575-3-hs@denx.de>
In-Reply-To: <20210528072351.1639575-3-hs@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 May 2021 10:55:51 -0300
Message-ID: <CAOMZO5Cq6BT_46tKGWMoLUvaHEzD-mbEF56S0TzWpQXtXRsVmQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: devices: add support for microchip 48l640
 EERAM
To: Heiko Schocher <hs@denx.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_065605_889544_F2AADB9E 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Heiko,

On Fri, May 28, 2021 at 4:26 AM Heiko Schocher <hs@denx.de> wrote:
>
> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
>
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> I tried to use drivers/mtd/devices/mchp23k256.c but this
> driver does not use any status register and there seems
> slight differences in registers (no write enable register
> for example), so I decided to make a new driver.
>
> This driver sets the continuous mode bit in Status register,
> which states you can write continuous ... but after writting
> 32 bytes the chip goes into an undefined state, so driver now
> writes data in 32 byte chunks.
>
> I also tried to use regmap, but it leads in a lot of more code,
> and as this chip has only spi interface it makes no sense, or?
>
> Tested  this driver on board imx8mp-phyboard-pollux-rdk
> board, which is already in mainline.
>
> Made some tbot tests, which write at random offset random
> length bytes with dd and and random content. Reread the data
> after a reboot and compare with the written data. Works fine.

Works for me too on an imx7d based board, thanks:

Tested-by: Fabio Estevam <festevam@denx.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
