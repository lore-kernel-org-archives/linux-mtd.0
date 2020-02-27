Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2DDC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 11:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E68624699
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 11:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtop8l7E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="bR8Qr1Dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E68624699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPjcTZPVa1Vt4Ny8wHGEbv43mP9o3nsc7tYjP8Qu+3Q=; b=dtop8l7EmGZVKQ
	o/OzxvQocrtxkivLjVmXZTFuDP1a1ytfyTF8NhKytWRy0HepaZi4mm6TG2iA00VAAGQJnByOrRQ2R
	v+VasCKEQeEK/y0QFgs6d+RG8/LrCBIRoFpMwZNERsdWD/btsRqigFqvphRDZraTK65b9P2QJvQMx
	w5fEW1cjKbnLVYghVmpQil2HREwolE04t9fb99mnCoMF8jSLs1Mto0xc+AcxbWSTPGklaMl2CP8tK
	wUkxks68B9n+OKFIhEJdIypQyz+WHNtKiTY8kYEy8hKZluj0tDc8zDYnRBbc0mu2oTCzjSKRN7jnm
	MKPevoQNKXExMSRIW9Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Gtx-0001Iv-Qi; Thu, 27 Feb 2020 11:00:21 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Gtd-0008Hl-LK; Thu, 27 Feb 2020 11:00:03 +0000
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 01RAxibb019775;
 Thu, 27 Feb 2020 19:59:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01RAxibb019775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582801185;
 bh=kOw0sBdvSt7sUjD/0HddbtyeQxtSwGi/7erPa7p/9dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bR8Qr1DrTlqgaP93XedueBODBAy2XnRRnYItjD4pySB01/bjAICgD+3tvf+lImMd3
 o2+WgmttU6bk0WT9pDau+usqOctVdRUZ681KPNGRnBtwvGNpj1pI0HlPmr1MmpmknT
 J/2py+HydW1LbXppqRFlTQXMfBd8uUBjTuf/415YtECG4MLZZ6X+fg5z3E1dVPwzZn
 OZnFB4Rq8QfoY2KrEfwORiqvLhrUnQ0Y0BsGGN+3TQrE3ZyeL5zMwPkhABj6VS3Ktz
 WgOSCofuTMBD1vUspg/3HTUMRg+PS5LVlLSZs6NVtzkBcW+I4MzMDZiD0EGd1n9DMS
 Djy2gHzX0lAMA==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id w15so799343uap.0;
 Thu, 27 Feb 2020 02:59:45 -0800 (PST)
X-Gm-Message-State: APjAAAWWH7qVjCJRo7B/MwskKA/eQa4HNIRzcRy+XBKmYXl86AoGB6ya
 jtGOHd3yBzMQBbGD8rlrl3pbUyv/efuU3MGSnNM=
X-Google-Smtp-Source: APXvYqzHVjhb5MLGMVwROtpWRonvewg9SUUG1QW9qCu9nmcL7dmHBBzmi3dUeyhriGPnm4yTXMoldh0YBTjfPTXjx24=
X-Received: by 2002:ab0:2414:: with SMTP id f20mr854899uan.121.1582801184098; 
 Thu, 27 Feb 2020 02:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20200226222722.GA18020@embeddedor>
In-Reply-To: <20200226222722.GA18020@embeddedor>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 27 Feb 2020 19:59:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPK=AgshKO1k0BtdYg5wLUp7e9s3zA2-jGLGO26a+A3A@mail.gmail.com>
Message-ID: <CAK7LNARPK=AgshKO1k0BtdYg5wLUp7e9s3zA2-jGLGO26a+A3A@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: Replace zero-length array with
 flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_030001_941545_B7887843 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Liang Yang <liang.yang@amlogic.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Xiaolei Li <xiaolei.li@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 7:25 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/raw/denali.h       | 2 +-


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  drivers/mtd/nand/raw/meson_nand.c   | 2 +-
>  drivers/mtd/nand/raw/mtk_nand.c     | 2 +-
>  drivers/mtd/nand/raw/nand_hynix.c   | 2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>

-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
