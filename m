Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD4CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 173CC613AC
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 173CC613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9ONPQu492Oroh9CGQW3fEXLZ/EZlMewWLzIbPJJToE=; b=feiBixJY6/1c7F
	1kI2q7RgAkRDGSYsYOoPnHBmh9JjeYkjbdgIz2GbdQEk+9IodzsYnkn7PXFRnCT+gER95c6c4vVat
	L5kfjm5IQPvGC6cd69CvBSoYkdp9Un9gcGq8wbHC0yJ3qtuRE77VOkyQAw9pAKe+HXc5Ac0qX2Frt
	L5YNEPFyUYrnA1WYLYBNWUTxoFec1Cb/7SXtw1mczsxosVw6rTnuL44dAf5bRL1cfgwtlXjW8ZGhT
	TWBLsvzwkxg1KI+aJgXJ4t40mKkMFl1Uz9URojdFjC3Gl/TFYkvoCr2ujFEY9PLanlCrofwzzPvVi
	lb9oRlltdgUbDc07O9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvuD-001FQO-GJ; Tue, 16 Nov 2021 10:41:37 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvtE-001F7v-SB
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 10:40:38 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i194so22745455yba.6
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eacFzYG4y/pmaSwfOMyeXjG9lV8APV1lD0PKm7xyB/I=;
 b=ngwEN5TVA0svBcjJzzGL3O55/UcHEaakrj43No/oa9ntWIMLYsEhfed8sbkStcQWPF
 mg2pG3j1UkaSqg/kJkmcuNx+G9pPLSPBoy/ei0/rXFe+9vVyJ9GoJ5tRffF71YzpIuyT
 e5azrTImutlNzMLBHObvpiQBqkI5W0r8kwKaBEpdaBv6NBk1WFNb1sl4+JlE4rN+VhKo
 V2qJG+l5lDVJHsluuO7KfGwWJBQEtYtU318jcreBbEloKsGX1Be32f4o8Y0VZhuqVjJB
 O7tc+UIYF0c9f5ZAjStsKrxP3v8vXPQQZ7UpYQCp44J1JjCWaHfL+Ri9cOx/SQdho+Qo
 c77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eacFzYG4y/pmaSwfOMyeXjG9lV8APV1lD0PKm7xyB/I=;
 b=y0zgzFo2z5/Lsld8pTy/LgyjQQ9EQqo7KTOC3nE+8SzBIUVFXCtFZMd1A1LcBAt2e/
 YMQhfhWxXVvLU1cNZPIHzhkK7z6LEjBLbLPSlVn6Vm8QDtiPcxdPUSJAAY3fRyYFOpZd
 0xcptHqflcmKJ9wZtSADFX4+mma8OE4J990yCA9IWbrZBz/GVekSS72Ppc0Zd8puptV0
 WILEky7uEzzW3iFTc7FCkouWa6CiQkjN+7JqKO3fU/2KBrMMqqo6yE866EER361wBQe1
 yKxPzOm5oPNdcuP7HoEqnuRuT0I5DhdtQtKtET8yxip0PW7snU8mWNshzFLndK88lrsl
 F6wQ==
X-Gm-Message-State: AOAM533q8V2EO+z0YGCxXdY2UmKSLQUR8rQqs0Ru08CWO69x6NCKGZOT
 xNSOHwEZtXOEB+91eWgmZWOgewdmmE0d0fgXALI=
X-Google-Smtp-Source: ABdhPJxQlTsxuIuK8DAfcNTrc65rpOtrU8od9nVzHXcfzD8nb+05xUlyFaZ6Ir0Ny/pG8KtbRieCnOZ3Z7a/mNeCAJ8=
X-Received: by 2002:a25:c792:: with SMTP id w140mr6655608ybe.131.1637059234773; 
 Tue, 16 Nov 2021 02:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a8b126e6-62e7-7979-01cb-b7a1ce4ae8d1@canonical.com>
In-Reply-To: <a8b126e6-62e7-7979-01cb-b7a1ce4ae8d1@canonical.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 16 Nov 2021 10:40:08 +0000
Message-ID: <CA+V-a8t=JsMJ=w9dDpeUfdTUwFhnHrZ-eWdpTmvOxC0uvOz4Wg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support for RZ/G2L
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_024036_976474_B1A4FDA4 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Krzysztof,

On Tue, Nov 16, 2021 at 10:33 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 25/10/2021 22:56, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series adds a couple of fixes for rpc-if driver and
> > adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> > is identical to the RPC-IF block found on R-Car Gen3 SoC's.
> >
> > Cheers,
> > Prabhakar
> >
> > Changes for v2:
> > * Rebased the patches on linux-next
> > * Split patch 5 from v1
> > * Included RB tags
> > * Fixed review comments pointed by Wolfram
> >
> > v1:
> > https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> > 20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > Lad Prabhakar (7):
> >   dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
> >   dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
> >   spi: spi-rpc-if: Check return value of rpcif_sw_init()
> >   mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
> >   memory: renesas-rpc-if: Return error in case devm_ioremap_resource()
> >     fails
> >   memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
> >   memory: renesas-rpc-if: Add support for RZ/G2L
> >
>
> Applied parts 1, 2, 5 and 6. I think 7 is going to have a new version
> due to Wolfram's comments?
>
Thank you for queuing up the patches, wrt patch 7/7 this can also be
picked up, after the internal discussion it was clear that we cannot
use the R-car hw manual for RZ/G2L (we will have to live with magic
values). Wolfram has agreed on this and has already Acked patch 7/7.

Cheers,
Prabhakar

>
> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
