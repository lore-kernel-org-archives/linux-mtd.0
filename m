Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C0FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B83619E7
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27B83619E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U9noi3ASkXTAfA0OBnxI9hL1G6UXaXx0Zg1NLe7FyyM=; b=yhf6ZLzvRl/g4FBIsAIMM8GFXh
	K0O8n2YBmmKkGZaL31Ia5qVN98yzq1aOzNbfNinObVed+bIbu8zEbGXipBZH7mK2mcy9oOFkQ+dRH
	HE+nG5lAK2iHsk1V7G4zc6HhuQL1QRYNZIQmM94XpzI9AP5Rw0bGi/Hy+7kukuDKHlrzQWeRsQRnD
	QC/pXZEuabE0HVP63MbuY9B6jIQOHBHgQXApKvb5Zmktdekh8BOgJwBAMt7UIfGn9bnsUtkcmMVLQ
	ahhrtd2Cp+5DPAl2pqDgBM3jwVgmlWym42Forh+yiFSTbqND/CSiF7IGYpmtTuedorc7ukQdk/axi
	TcoD84wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEV2-00HAIj-9h; Fri, 01 Oct 2021 09:06:36 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEUz-00HAIC-Tw
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 09:06:35 +0000
Received: by mail-yb1-xb31.google.com with SMTP id q189so1006205ybq.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2021 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=sxJ7l8B7Ljw39q9CkARpipwcpIu37e5gtQDM+cATqHE=;
 b=ElWaZIBpBrKhdeB7VeSlSnwX3ldr2KIWRlbDEFLg/2pZL1nQW3eUOG8slMcyFt4C5s
 jY09wxwXwzndohjHjnAsTnDwEhwPbhwj5V8QvrcYJwHtsGuNsE2EGRiyjaKQTwivnw83
 8Z4B1U5GQc1gcCTmNAlugx5BPmWUMe7fPjtqyon4hm+tfeqf651n8SkcEJxp12bhbqC0
 tztieSewqmlB1f+ejEfgFS5vjKax9sp9cbDuahW2dTAX9TzoVedzdl3xFI/X4RFN63DB
 d1ZBbx800WT18OTmZuI+2ZF8Zs+9gJjWvAXcvMtaulbtuKkrsnMMe66sbYvr+eJFjWU8
 8zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sxJ7l8B7Ljw39q9CkARpipwcpIu37e5gtQDM+cATqHE=;
 b=AUduBGKplOL+RjQktqZ30KFK5m8Ic5uGA60HQkbBqK7XZzF7QIfUtgHjg8HJ9icwR5
 41Fnqa7AZeE5opofms1OkKwoVjcivSb5vFqqnBTq7vA6owgVwufffXSvH5iR+R0TBkJW
 Ln2B+DYErn05JnHEn4L5AsCVGUMv8iGX9x+DR2hs+0HQwh68axwaAw8eqp5SB3n0DRQL
 /mm+b3XOKAuJCKWWXycg6qzneNWypHQBTU07jncx/ZZporfkXlj7lo7rymGsZSL3RPGc
 g59SgYfQQunZCuLwgZu5Fa8e35mBEGID7JfZ2JMZRBsbzl3A/sf/PkudqplFPPMsskm/
 o9qg==
X-Gm-Message-State: AOAM530X8jTToj1mjGAFRKxDUKBU4+bI293gllI7zDGPTXiEtf1ZmJcQ
 3v64oZszsPfR1qqXs2pK+/eb71yFU//N0H+mWzA=
X-Google-Smtp-Source: ABdhPJwa0O6LDb69yBOtSHQNzBKwyjv3RDtcol0EkDQPnWG9G5+YLs2EdsLK8pb4psp9jvGVSpDiTV07qnieumlyfoQ=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr4943436ybc.218.1633079192918; 
 Fri, 01 Oct 2021 02:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXMc1A4D/y4kjim@shikoro>
 <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
 <YVbM3z7x+D0MCkTF@ninjato>
In-Reply-To: <YVbM3z7x+D0MCkTF@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Oct 2021 10:06:06 +0100
Message-ID: <CA+V-a8uyQmW3+4hAt4534spKeQHDoeZzuJJE4RY70KLZfYOXoA@mail.gmail.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org, 
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_020633_988928_76BC35E2 
X-CRM114-Status: GOOD (  22.54  )
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

On Fri, Oct 1, 2021 at 9:55 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > > Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
> > > datasheets? I am asking because I have a patch pending to remove writing
> > > to undocumented locations. So, I was aboout to remove the IO3FV and
> > > IO2FV macros.
> > >
> > Yes they are documented, you should be able to download the HW manual from [1]
>
> Great, then I will keep them!
>
> > > > +     regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> > > > +     regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000024);
> > >
> > > Can't we have defines for these magic values? At least in my latest Gen3
> > > documentation, these values are explained.
> > >
> > RZ/G2L manual doesn't explain these bits. Let me refer to R-Car Gen3
> > and define them as macros.
>
> Seems like we have the best of both worlds then with the documentation
> ;)
>
Indeed :)

> > > > +     if (rpc->type == RPCIF_RCAR_GEN3) {
> > > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
> > > > +                          RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
> > > > +     } else {
> > > > +             regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> > > > +             dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> > > > +             dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> > > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
> > >
> > > regmap_update_bits?
> > >
> > Im a bit hesitant to use regmap_update_bits() here as some of the bits
> > are not documented.
>
> Hmm, maybe I should then update the patch avoiding undocumented register
> access beforehand? I will download your docs and see what remains and
> send that out for you to check. Somewhen later today.
>
> Sounds good?
>
Fine with me.

Cheers,
Prabhakar

> Happy hacking,
>
>    Wolfram
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
