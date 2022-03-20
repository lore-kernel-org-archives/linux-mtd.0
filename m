Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436AAC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q26GhjcqISZh6UF0/CO5yrJvwFpx4CeX3WIeNvxUiy8=; b=NNsOagbpJdqsoj
	zIZJMBXWfsA80pWe5ZSykRgdKpSs+c9aFAkfAv651kxpXNfJDDRfx/TsCna2TcG/CYqCuWAfzTHkk
	M2nJAUU2FYt9ETSLFoFsbbeCCutC3izqdwgG98hboYBC+Hm+ni5e8C3aLGk5pAIoEO4o1NxkBa17X
	Wo7/Uu4CkqpMUBW3D1K0UkuuXNvpET4pyQgV5ZOmg9Tw5N/aaVTvQpNX87Xz53OHMTyWBT3uJ6taP
	idptpiCMML8DZs4n/k3Wf7Bx6JtDbZLPnt2jgAZkn5zb9li612JzetDyJB+sVzhkaC9S6pwxwq7gm
	altcmiLc2nb5r2W7QKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVrir-004yEA-4D; Sun, 20 Mar 2022 09:19:37 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVril-004yDs-ME
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 09:19:32 +0000
Received: by mail-io1-xd2f.google.com with SMTP id l18so13854821ioj.2
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSgE6yqkno7KzD+jL8KRzD/isTc5hJCWP4hnpiIR8X0=;
 b=CsH4edHw8WSKA94Lkc0rOnB7epUJgnoD9Z8QTIYRO+a7K5/9ktJb4FXPKuKdspVABe
 yO0B/EVW1+xR5TwBuBHBxQLHZVzQA0TtjFk3FeuKxKNnJbSMzPL3PF6amOdMsFRZ5FJf
 8+ULmopFYRwJzxXyZwFBXiB39pkcHq/ySbCSubyQ8wTiNHWUd+bDswhEjebmqkMkoZF2
 JN+MyQEDLTZuREXBzgl/oI1/ro9up2bOsQZE0fbod8i0DseBXBPEjm2J+qwIBlHztvWc
 VnVUJdbWnTWIgbCTeMflxK0zEbDn4BHzZ1gNX7sOddt7rMJzg+IMupiLUULkBl4Rm/El
 6H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSgE6yqkno7KzD+jL8KRzD/isTc5hJCWP4hnpiIR8X0=;
 b=YK26QYHaEC0h2gNr3EQJCEYKoMWj8D3kHum+AbGvEcA5sAB3eJJFCcFgJN+l8X7xbB
 ZfmLso0BdMwlZN3FbN4NIioLkIXlvCRKt7oYi/mxtg0SaOr3rpyLdIm7BfkK2gjKafXB
 uM9/NU1if1obYF8xYHKH13P6azn7eEYK/19xnGi8oG6hqCggxf0xpOFuYvs6xDT93Xwp
 cqNoHpMEGImw1tZz6TnUXyyEiAr4N1YB2a5mLb5Wd7rTwaFl3dkJOyVjSOViGMl1CudU
 IEXGYaQloOyrbpioyn8wggubAmdYFs4WkLVCNlHWkuo98rf9Sk5bu/YJu+jgx1dfQ/ot
 Xi7Q==
X-Gm-Message-State: AOAM5338m5znNkRT/if5OK0r0BX2C2lpePfDaSjYFSn/L3nwyPV6gcnM
 DxGj0tq2DWPuuGTs6T54DWhaj+Kh5LABQYYHXCcnN24xIBo=
X-Google-Smtp-Source: ABdhPJwx5w7JImU6Tkv500kqsx5RX2SPwULSRkx+D7lzBJknKujzkeLLzikMQyYbCqkLa86AF4+AVAEjSZatRWHJpJk=
X-Received: by 2002:a05:6638:531:b0:317:af7d:d934 with SMTP id
 j17-20020a056638053100b00317af7dd934mr7797245jar.307.1647767969638; Sun, 20
 Mar 2022 02:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220319083301.87400-1-gch981213@gmail.com>
In-Reply-To: <20220319083301.87400-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 20 Mar 2022 17:19:18 +0800
Message-ID: <CAJsYDVLORFCt75Nv1+3wNd2=mMhHQm6Hb_iQ_HGO=Qgg6iV0eQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Stefan Roese <sr@denx.de>, 
 Reto Schneider <reto.schneider@husqvarnagroup.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_021931_775438_21C599C0 
X-CRM114-Status: UNSURE (   9.60  )
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

Hi!

On Sat, Mar 19, 2022 at 4:33 PM Chuanhong Guo <gch981213@gmail.com> wrote:
> [...]
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -39,6 +39,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants_f,
>                 SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
>                 SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
>
> +static SPINAND_OP_VARIANTS(read_cache_variants_q5,
> +               SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),

I just noticed that only GD5F1GQ5 has 2 dummy bytes. GD5F2GQ5 and
GD5F4GQ6 have 4 dummy bytes instead.
I'll rename this variant to 1gq5 and submit a new version of this with
a series of
patches for other GD SPI NANDs.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
