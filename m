Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAD2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BCD60F58
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22BCD60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5RHQl2DCATP72R6b5aHiytPmdjuaSJZhLPRROwpIBU=; b=XrrR/XIZMdvOtM
	xgcVSxywNeITx2lfWmmPwVrZpLjCxCpYr0cBZJK9S6zn01+BTgsi6pfOmpwY7EkgITPCcfmRiTt1J
	fe8w890YQJ6jIq8ZVrMmpu2qN75CXufwUgoNCRhjj9sHI4ERGGGpl4b+A7j/7KfMgxucOn3iiVKN2
	LY+ukYkp/F9rmDHESLbCQLgTbqAsV5O5jGztMfNJudLrxachcovCHT7X52rjTYLkM+pk6oRB2rU/U
	oofZ0LBgDqEHmUALemgMCJXCSmfQA+tm01815yN5y5+Leg969d4tru+mUy0v3f/oh1HDxQ3MhI+uJ
	luKGT0M16NrfRNNS+sSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYm9v-002BEZ-8p; Fri, 08 Oct 2021 09:27:19 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYm9s-002BDC-IP
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 09:27:17 +0000
Received: by mail-vs1-f50.google.com with SMTP id w13so9872744vsa.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vIxqZ8vYkfX7BBcbiKGGKsrdng7+H+Cq45sUTEZMSXg=;
 b=SuiAyACEBEBaWrrPnm54txS+UvE8PRSshQXOrygiNQFeuoPHDxY5s+jJ3f36yR6Bec
 FIX7aYDUukg8RoWdMxp9WdgBtV+d5Tnf7YHrTdOsPaHoyfXMwfwSOSZZCym2ZesZD3gJ
 TQOMrjQX/BpLddWu8JNn9ChLJYygQRptGmX4O9B1S8dWLKocOKjrspFjQt/7b2lNWBSv
 VtiyVDCw54hdK8Q5Ecrf14QdDtvosfw0Ig6tKLvm8EsBIF3b4iqsvbd2H11huDKlKVs4
 30fS/MYs8u8LWb1JyqyAz2+gsppTYUxsk102fMwCoylqTe1DfUgOjqwEbdyEWk5MPIAl
 I5Pw==
X-Gm-Message-State: AOAM530deeAsDL4R+O9V0mymXvM5is+cY1WFmACeg3zviUXAqxAAVdLV
 OlGBtTXZU/tDrtcY8VASdrP9uZFKbP7icx0Rcnc=
X-Google-Smtp-Source: ABdhPJzo2GMDwS4XL8GaqtAxYSHO5tU8oRsCkFAUO5XMKVVRxBe8G5avT2hGBR+Rk6tHcw+u6K58Nb/PFfsDHGycMak=
X-Received: by 2002:a05:6102:d8c:: with SMTP id
 d12mr2395147vst.35.1633685234262; 
 Fri, 08 Oct 2021 02:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928140721.8805-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Oct 2021 11:27:03 +0200
Message-ID: <CAMuHMdW_X+ji9316DkKP20zgwjn+AzXTXKKJ4nox5XkeiwQQ8w@mail.gmail.com>
Subject: Re: [PATCH 4/6] mtd: hyperbus: rpc-if: Check return value of
 rpcif_sw_init()
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_022716_634399_412EB6B7 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Sep 28, 2021 at 4:07 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> rpcif_sw_init() can fail so make sure we check the return value
> of it and on error exit rpcif_hb_probe() callback with error code.
>
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
