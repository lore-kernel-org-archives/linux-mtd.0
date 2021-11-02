Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3CFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 23:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1266C61073
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 23:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1266C61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qXXdDnUYYnakYXSE1NDTxppT08dzPqTrMoyO3UWKmwE=; b=N3Mto80ao86KpW+UDZQXKcFYfY
	vI9EwmoADTI7VrxYfYoCofbaj/mCQ5kUhVRtAET5dGwEaXm3BzMgSHT9PmeGo6qaka+muisQijylk
	sSBZcNVGEuyjt3dSHrMAdmUM/8FkZTsBPG5R0PbLvkBTuMWpfMU/2LhZLXkJDQ95j9b49sarjIuac
	R5uMLDav/KZublRaSuc3yBfRQQrsEX30k8oe28I1EbYMJ5RakUqr5O4uXV3aSlsWd/0xjicBtz6OP
	Y2+lwpRXcWAala6LHhTFMk3B5HC9w2kvuorRvvE61QAUYkZUvEcuAHjZU/TM7N51GoeJa/TVM1upp
	2hTIAj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3AS-003O4P-3f; Tue, 02 Nov 2021 23:26:12 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3AO-003O3f-MV
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 23:26:10 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 131so2058328ybc.7
 for <linux-mtd@lists.infradead.org>; Tue, 02 Nov 2021 16:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Cu6J0IQ4SS7piVDY+POK17T7s5SlbfDSNogv9COZfaU=;
 b=YO06sruHwC5tUgAXNeHgGeaZaGnp92/QWUrvCSGUnpDqr9ZWplO8rNzvu1cCyqL5hz
 BoPmf49zAjvhKafF0J0rtslVp8loGQ3yofsK64n4oY5rJE8uIio7xO6PLSqsH8dw6yWn
 Czy6abIv7AOxA43e7APwiuwbsp+Y+jbFOVSo4C1pMj+cZQHZDGpzDrhemxOg1PkDfbbf
 3jBH5zbW9IRkrNXSDWT1nODkOmgK+Y5cPZT5RC5aWhYv+H/QkkNYDGAT5252O4CKn9M0
 moCr20unk6aa0cH8Gji2JBSnk0028qZ8Se1BNgtY2fsUt/g3+doQbOJCBVZgxK9NazYX
 o1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Cu6J0IQ4SS7piVDY+POK17T7s5SlbfDSNogv9COZfaU=;
 b=CO4CKj8P7Z6wlW+XWj2I8DWKeADdf006ZjLE2jRXE7qAFaq6JzP/arTygZoTXnzq7f
 Pw2QLchzrAHiPF78JUIlfG1R1R9A/z4wKWOb5wMw1W0O75g2M+s9bIzGjG0ONUafGXay
 fZwyXKCSq7dhP+x4Dr/1My060ruLQ+3tWwo65ltqFe3djQ8V715VcL1lK2KG7C835K1w
 sVAeQFaVWPY6RaFNfGaxyd30XotK0EV6ELypsvMx0/Xd8UHaKVf2VKtayJCv8OaEAOO4
 fNj3Ek9KIDaCnphPTUPTZsQU/7Q/kD9cpr+JcaSDHEw48/Hoq/Zo9uYwj208Ym8wT00p
 Q/mQ==
X-Gm-Message-State: AOAM531KS7mUjY7B+gKY6KmbuLjqo2xK6B+vCnro4ZJIzDiNPMqdtN5J
 vh7d6mksFyQu/WuKmDMupGXUWBuCcZ9gbqT466w=
X-Google-Smtp-Source: ABdhPJwedsYZLDHlJQjqewFfB4TtfbiChus+iG3ErkENprCWnTpybff4ZfVlqb49nzVBliXr45KvILkjXpx7uOdGgvk=
X-Received: by 2002:a25:f502:: with SMTP id a2mr42181223ybe.254.1635895567114; 
 Tue, 02 Nov 2021 16:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YYElefbpP4pwfmUl@shikoro>
In-Reply-To: <YYElefbpP4pwfmUl@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Nov 2021 23:25:40 +0000
Message-ID: <CA+V-a8uJxeSr=uoF14gccuSLG7WRqRk8X8uD9UDoxKPGM8hGgQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
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
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_162608_762585_E9A12EBC 
X-CRM114-Status: GOOD (  15.49  )
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

Thank you for the review.

On Tue, Nov 2, 2021 at 11:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > +#define RPCIF_PHYADD         0x0070  /* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
> > +#define RPCIF_PHYWR          0x0074  /* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
>
> Nice detailed research, thanks! Minor nit: Keep the sorting
> alphabetical: D3, E3, V3M.
>
> > +static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
> > +{
> > +     u32 data;
> > +
> > +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
> > +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000022);
> > +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000024);
> > +
> > +     regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
> > +     regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
> > +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
> > +}
>
> Still magic values here. Don't you have them explained in your Gen3
> documentation? It is tables 62.16 and 62.17 in my versions.
>
Oops I missed that, does the below look good?

#define RPCIF_PHYADD_ADD_MD 0x00
#define RPCIF_PHYADD_ADD_RDLSEL 0x22
#define RPCIF_PHYADD_ADD_FDLSEL 0x24
#define RPCIF_PHYADD_ADD_RDLMON 0x26
#define RPCIF_PHYADD_ADD_FDLMON 0x28

#define RPCIF_PHYADD_ACCEN BIT(31)
#define RPCIF_PHYADD_RW BIT(30)
#define RPCIF_PHYADD_ADD(v) (v & 0x3f)

#define RPCIF_MD_PHYREGEN_VAL 0xa539
#define RPCIF_MD_PHYREGEN(v) ((v & 0xffff) << 16)

#define RPCIF_RDLSEL_QSPI0DLTAPSEL(v) (v & 0x1f)
#define RPCIF_RDLSEL_QSPI0DLSETEN(v) ((v & 0x1) << 7)
#define RPCIF_RDLSEL_QSPI1DLTAPSEL(v) ((v & 0x1f) << 8)
#define RPCIF_RDLSEL_QSPI1DLSETEN(v) ((v & 0x1) << 15)

#define RPCIF_FDLSEL_QSPI0DLTAPSEL(v) (v & 0x1f)
#define RPCIF_FDLSEL_QSPI0DLSETEN(v) ((v & 0x1) << 7)
#define RPCIF_FDLSEL_QSPI1DLTAPSEL(v) ((v & 0x1f) << 8)
#define RPCIF_FDLSEL_QSPI1DLSETEN(v) ((v & 0x1) << 15)

> +     regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
> +     regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
>
For the above do you have any suggestions? As I couldn't find any
details about it or shall I just go with magic numbers for now?

> Other than these, looks good.
>
thanks, once we agree upon above I shall re-spin v3.

Cheers,
Prabhakar

> Thanks,
>
>    Wolfram

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
