Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C323C33FE1
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 13:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E8F2070B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 13:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/asiD4r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK3PQOfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E8F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFB2fGCjLq7ZUe5hDeTjldA+MG3omn8gWIWuLuY/3Uc=; b=C/asiD4rNw81BF
	hW5Ag6fxIUIIg8LUmD2Xr0bAimVBznBuhfsJHYWnYOZeT1qznvE+3irhh4NY4uAp/0fkZLEeq79aG
	9K+KAQGVazHcZ88crAs5SFKBl1niiqc4NeIkGXKeYFvg+79A2e2FmdDR3fPOssnyqY5J3BkpMjgJ/
	McwiJioyckU3oci5cC8QTOxXuZykG9nz25v2nwQ+v8i0qpCOeHum8beYRImPUPnq4tp3DNOZl4t14
	6WEUXmKNfqww1fbVbaUSOPf5vxOuVTeIl5h8pOXjIJJBXM2aeTstdaP6qTATm+L/PeOj2988oC5GT
	l3xuqLDUKgr1JzKypoPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3gQq-0004n4-TB; Mon, 17 Feb 2020 13:27:28 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gQo-0004jj-AL; Mon, 17 Feb 2020 13:27:27 +0000
Received: by mail-ot1-x341.google.com with SMTP id g64so16019442otb.13;
 Mon, 17 Feb 2020 05:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4K5yGFPXOf61DlsEHfe0CyYhpMZ6ZeXAnaZdK4Fn80=;
 b=VK3PQOfXl5r684jgNfBzZP4Vltv2wxmq+C78aWnQNBVxviA09zBxTvPFGbxmhQ0Q9p
 Fi/xPqyGGfFTN/gQEce+Z3AzbOMHAubFg/ce6r3IcNKNwRAjoUxfBe+OjDPt+Lx+b/E8
 PN3iL9ogosi/8dWBsfMZY348izA0vqI562G5r9Xs9/uPuvdSUIR0xIyTq27o90F9PiaE
 OiMFrRRtzZrU/zyLcCE+rENBNc1Iic+xIjWFQSdV1R8XMs0zKng/RVJfRWh5BOhZEqSG
 HpN4speHrFA7w79OMl0NpkumgXdn7gwtyvkxnuYWse7aFTUZzPc9L8vHyceQWNtrJekf
 2htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4K5yGFPXOf61DlsEHfe0CyYhpMZ6ZeXAnaZdK4Fn80=;
 b=Lgq2efAHKCXbjtqEd3A48pcNKXltzHS5DdKhwMPSgqPt8MpC9xbP6Agx9vEhc2KRt9
 ostTiuB5f32FF18Ufj7PoAViqwNz04m3ZAyD99/N8ZsOQnOkftS26iU01sQC0/gCJorY
 N3nCBnkw7K5KdiZel+u+KyyY5oUN6y5xPCM9U4Kcztpw8OL9/m0A22q+AVUzKwLdcx4F
 dWGFwgXOC/mMAvvBcJQ3gdjg4jO4aUMJ2BWI9F0v+64WX7K+cqjxUq/QH/00XHGWEU/z
 4wBC7CFLvISXUtWeXRnkshcKgNbeuoGVq28x+6LYgJn/gUn/micI75LF8urp+S/wrYTs
 uRsQ==
X-Gm-Message-State: APjAAAWTzz8/HaemcQod8oWv0PHd7ljB6VE706XfnzWV79dFXcLJF+zG
 l4zV4hCj6pKwYFqEeDAbWlhiRCP2TjLoxTLJrXM=
X-Google-Smtp-Source: APXvYqxpRwM9jhB9uzXIZbj7xCzbRssl0WGuCjLsfZ/ewhMADMb/ShN3pe5IjsDrGmngkOedkTvr9RwiMANO8McUZGA=
X-Received: by 2002:a05:6830:1e72:: with SMTP id
 m18mr11333643otr.226.1581946044780; 
 Mon, 17 Feb 2020 05:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-38-miquel.raynal@bootlin.com>
In-Reply-To: <20190919193141.7865-38-miquel.raynal@bootlin.com>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 17 Feb 2020 14:27:13 +0100
Message-ID: <CAO1O6sdVqNFG+2O1AY1qN2Q4dUFhtAMk5Qr+Np3s_poSqFp+Og@mail.gmail.com>
Subject: Re: [PATCH v3 37/40] mtd: spinand: Propagate ECC information to the
 MTD structure
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_052726_356581_A0DC457E 
X-CRM114-Status: GOOD (  22.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Den tors 19 sep. 2019 kl 21:56 skrev Miquel Raynal <miquel.raynal@bootlin.com>:
>
> This is done by default in the raw NAND core (nand_base.c) but was
> missing in the SPI-NAND core. Without these two lines the ecc_strength
> and ecc_step_size values are not exported to the user through sysfs.
>
> This fix depends on recent changes and should not be backported as-is.
>
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index a521eeb0d351..36b99f68da81 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1135,6 +1135,10 @@ static int spinand_init(struct spinand_device *spinand)
>
>         mtd->oobavail = ret;
>
> +       /* Propagate ECC information to mtd_info */
> +       mtd->ecc_strength = nand->ecc.ctx.conf.strength;
> +       mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
> +
>         return 0;
>
>  err_cleanup_ecc_engine:
> --

If I follow the code flow correctly, it seems this is more important
than just exposing the value to the user through sysfs. The
mtd_read_oob function uses the ecc_strength and bitflip_threshold
values to decide if it should return -EUCLEAN or 0 for a read with
correctable bitflips:

if (mtd->ecc_strength == 0)
        return 0; /* device lacks ecc */
return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;

The -EUCLEAN error code is then used in UBI for the wear level logic,
so it would be nice if this could be fixed.
Now both ecc_strength and bitflip_threshold is 0 for me with my SPI
NAND flash, as exposed through sysfs, so I assume the wear level logic
doesn't work right now.

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
