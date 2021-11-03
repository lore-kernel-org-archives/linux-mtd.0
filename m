Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6CCC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 09:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF85561101
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 09:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF85561101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s97/oHkpZ9kxU+iLYSPFjNhNE12LnkWKPs8iGSitzzU=; b=jTpzxOisAxxmc5UjVGZyW1D9Dc
	JfyB+1n1hkMQh6ZBCP9jHErIcZil/qFUB0KIeEok5K27dkakM6Pavi7tTm4raTT19TOoFsTLcxTcN
	mTuSwer6tBFlmnJ++3uu29dh9fvXSNQZArbF3arqPHD71ONP+oBh4Lp73v82auCMn9TSc+lyMzOjA
	3/gUfyYWdvYLPkrD3Idw4RChFk8HdwyxqXkcQm5G+0ksE1Ep5CghriNSEqDnjfH4b4S+YF6Wfdduo
	V4Y/LYKlPuPCip079mHDMXJzwvsecxJ/3gX2bQ6WQ0vJ8kkKbljD8UlL92hg9sBoK5bcMHE3ib0k8
	3RXz2Mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miCKh-004gRg-Fp; Wed, 03 Nov 2021 09:13:23 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miCKe-004gOw-P0
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 09:13:22 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 131so4726026ybc.7
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=B9PO03tEZQxGDCWOiWP9E4WHsaZ/xui8yPJ2nq9Ie+E=;
 b=KNkljUFA7c2Z2y1ulLlQsP7Ck0sCiTe9vVMCyYsujALg8/+6C1sTuzdfujkKce2TSP
 2qc3FJADfMuB/Dkf3wAWX1tNWyKGhsi1X/vIYT2I4dFb63ADvugoIAjwBSoyf1YVnCuP
 UjYlAlHZcTxh0mAA4eF++mz/VcVZH/iXBLc5TBoplRRfdKWSc24lMgXTGcX1Mo//I4lb
 0wBsK+ruU1brPD+R1um24lQM9ztWRNvk7R2gcznkFTeJy5TuZjos7StSNgZ5u4dJUh8y
 EQg/PS+44XnptkjqcWiQ438ZCekYA8zhoxGBkJYeVkUfHs3DqCDZ2J8TuLeP48JKv9Fe
 IpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=B9PO03tEZQxGDCWOiWP9E4WHsaZ/xui8yPJ2nq9Ie+E=;
 b=COeM1quf8WZwkzsXdjv7070Cl6g5lcJIsDeK/uK9lBytqQstv3t057Q4IvTjvlnOO6
 4AW6Ti75PBuQX+QpGAtEyRj1Bmg7ZrPFdU0jpHzFDa+e78zl6eUpgVBKtsFroJIXlL1U
 pDCGe1XYlommuoXwreHEeTL9MbIEosyOFxa2zxuE23pwylg9d9mMjDjrXfzDlmMHcTEo
 YrSicoF9oZjPXNGXyN3ME5JYAcKUhLzedHSawKwUUIiVdCoWD31fySBz3YhU5VTkJrq+
 oZNOFPL9/IigPGFFYVhycuQBlaFgGQuB7jCcM+P+spCYcOYX9sKx2abustmtb8tfMMeA
 pDHA==
X-Gm-Message-State: AOAM532+wg73/TP9TdNJNCXiOg14dKtSLLYrho2ohMAbh9a7KyBmD8W0
 uK3H6XSHxR+Ee4dgtVjNnsrP6tzafnq55sPY1lY=
X-Google-Smtp-Source: ABdhPJy1YH1/YROO6BKv2SUado0SiJ9R1kr1ijbKaVjaSEbKjRERIu7xzUuf3qc1RKL89AnRU8esbXV+6wS1mZageH0=
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr16947684ybe.422.1635930799289; 
 Wed, 03 Nov 2021 02:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YYElefbpP4pwfmUl@shikoro>
 <CA+V-a8uJxeSr=uoF14gccuSLG7WRqRk8X8uD9UDoxKPGM8hGgQ@mail.gmail.com>
 <YYJLSCE9ak2I/9A/@ninjato>
In-Reply-To: <YYJLSCE9ak2I/9A/@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Nov 2021 09:12:53 +0000
Message-ID: <CA+V-a8sidj+FXF0k4dPCgZz2RUHyKsghc75-=Ka2vCkJEFP+xg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_021320_843036_B9F6A140 
X-CRM114-Status: GOOD (  17.59  )
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

Hi Wolfram,

On Wed, Nov 3, 2021 at 8:41 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > Oops I missed that, does the below look good?
>
> Yes, only a minor nit.
>
> >
> > #define RPCIF_PHYADD_ADD_MD 0x00
> > #define RPCIF_PHYADD_ADD_RDLSEL 0x22
> > #define RPCIF_PHYADD_ADD_FDLSEL 0x24
> > #define RPCIF_PHYADD_ADD_RDLMON 0x26
> > #define RPCIF_PHYADD_ADD_FDLMON 0x28
> >
> > #define RPCIF_PHYADD_ACCEN BIT(31)
> > #define RPCIF_PHYADD_RW BIT(30)
>
> Maybe we could leave this because we don't use it? You decide.
>
Agreed will drop RPCIF_PHYADD_RW macro.

> > > +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
> > > +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
> > >
> > For the above do you have any suggestions? As I couldn't find any
> > details about it or shall I just go with magic numbers for now?
>
> Ack. I couldn't find docs about these as well. I suggest to add a
> comment where this value came from. We can ask the BSP and/or HW team
> for details and update this pair incrementally.
>
Thanks, I'll add a comment stating the values have come from the
RZ/G2L HW manual.

Cheers,
Prabhakar

> > thanks, once we agree upon above I shall re-spin v3.
>
> Cool, looking forward to it!
>
> Happy hacking,
>
>    Wolfram
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
