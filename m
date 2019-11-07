Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C20C5DF61
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04EB2166E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsN05C4V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHfIIwuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04EB2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuc5VwiwLzHBlR8yRkbY48oP4YaG+iOfxc/fVhB4S2I=; b=BsN05C4V6Ifpuc
	M64VV20vCtnhBPjY/typ5nNkQkjvt9ehRSHdxACCPOztTy/8QaIdxzqivLQOaffP9e3gUiVerHW6V
	w8t2etTu71Ng+eVX/YwXoSYmUHM13QApi3wwaKogCF3vfk//v1zqUvDvvXa+0Z0/7327OgxRBAY5e
	umHtvhp7cFCGUTkqOGLjI0l+3YF1GMlbO6VEE7gt71Zxy5vWeZQ4R7JnWmpzitLo9ewKXWXWIuUdU
	E/XSf4YaFsG79on0whd6in/I9iAGFewABTa/L5x+k0MgJutVQblGexW/kY+7WfjDoxbB0krmiqulM
	my8NfP10o4RTHa/3E3Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSe31-0006Ky-6R; Thu, 07 Nov 2019 09:25:47 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSe2y-0006KY-Li; Thu, 07 Nov 2019 09:25:45 +0000
Received: by mail-ot1-x344.google.com with SMTP id 94so1407703oty.8;
 Thu, 07 Nov 2019 01:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8p26XYqH5TPqHeQad7U65Znhq7tW+I3xCdiHZkPSpw=;
 b=QHfIIwuD2yv6I76g8JQ2D3pTFBro5Jhl/JMGULBBB3QmkDldjRx8CNGkL31TzAll6b
 7TH0ng15f4+P1S53c69OJTrUGN5DKrZNCO/hNdEiuGf8E9akHxAu1UUgCV33PMhyipjK
 wqqP7AVEBCrNUYL+rxd2BEmDqFEXCKjVD3QieWTN5PwpxJJZUvy8+7QX2n5PnVAmOjyZ
 qyjjtFO+GELGo1jcBkXENU3vVcVOTlGAouLwupNRtg7i6iaqw1YKIiN5eTjIHfwNWmj/
 DSVz7qYjs4qHromtabMMTi8NHJB4CG/9hJC/gI1kS8VbG5fznQRTrKhM+fCeU5R0f8RB
 FP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8p26XYqH5TPqHeQad7U65Znhq7tW+I3xCdiHZkPSpw=;
 b=ujuQCOAGKHLoI5KNR4HVWmmLpyhu836DxlsWOcPO7QttDyfC0+rskFeyx59KsuJCKD
 69Fjrv+pTJgdHc0FthL2wQdLWzlQE6JL4VGrYejz9NeEHAXlMcTUpEud/nNFlQYhUFT2
 zo3zNFsDPbo+xRBK3lOPDrnYFdLH8GPZXukobCdURFPOPekG75fcPE0xSBs5IkydXhWD
 qkw+/Xvs3EnGew8qjY0utWPV+4dJ7VDUOL1P4fLOJADhUzMcZi79PlOcf5n/OhwFsi2j
 uJycG/G9n8k+jghGc8bue8G63APYGWwRPBfZfW9Sh632xiK3YMZ74Gh0/xKidpoWgdwg
 rxAw==
X-Gm-Message-State: APjAAAVVs56UxD6Xup54u7eow4HMOlQRdaYnEll487WPYYMJHzUqoWsb
 9/IyC0UAXnKxWz0Dbt40mw9nD3R+qLP/azfaGvM=
X-Google-Smtp-Source: APXvYqytqNiv5noMGnzCkM3rhghUIUChzKwN8or6v9tCbNWgAONdjfZGD/sKd5quAzzGMSJy96OxTz6jDoGYY1aFd9Q=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr171271otl.84.1573118743606;
 Thu, 07 Nov 2019 01:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-3-gch981213@gmail.com>
 <20191107010928.GA14186@bogus>
In-Reply-To: <20191107010928.GA14186@bogus>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 7 Nov 2019 17:25:32 +0800
Message-ID: <CAJsYDV+M4kH5aCcJxxLB7UMhT7VsRXJW+RYcykHMTZW+1ftC9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: mtk-quadspi: update bindings for
 mmap flash read
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_012544_710044_DF70A8B0 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Thu, Nov 7, 2019 at 9:09 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 06, 2019 at 10:07:48PM +0800, Chuanhong Guo wrote:
> > update register descriptions and add an example binding using it.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  .../devicetree/bindings/mtd/mtk-quadspi.txt   | 21 ++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > index a12e3b5c495d..4860f6e96f5a 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -12,7 +12,10 @@ Required properties:
> >                 "mediatek,mt7623-nor", "mediatek,mt8173-nor"
> >                 "mediatek,mt7629-nor", "mediatek,mt8173-nor"
> >                 "mediatek,mt8173-nor"
> > -- reg:                 physical base address and length of the controller's register
> > +- reg:                 Contains one or two entries, each of which is a tuple consisting of a
> > +               physical address and length. The first entry is the address and length
> > +               of the controller register set. The optional second entry is the address
> > +               and length of the area where the nor flash is mapped to.
>
> All the compatibles support 2 entries? If not, which ones?

It should be. I implemented it as an optional feature only because I
don't know the mapped address space for all these chips and can't
update every device trees.

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
