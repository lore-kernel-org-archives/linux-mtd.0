Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6Y9obj7JfQlg/HBY9DZjn1WeN5fWjHW2UuBOZgSn5U=; b=Kou9xSmIHuLmt5
	G+w650EgaoI08qFPyT0r49vhehr2bxmPNa1kAgIC12W/EePznwNaAL2DuLp59XARVLyQ28YANw8wK
	LC+xM4aoUx7GlDYQ/Pq232YOPfQ01Z6sBgB2e55B5e7wk9/jo/OYzSwMrEcTX1p2YnEDxvKmfehg4
	PdblJHC5Hy0jkIn0Dv2oLsv9ZJNvOYp2t5EExMJDaMTy4FGvZ9EewmcIG7qxsZIAayTe7HfdFGwq0
	2eyVneSRJrwV14Hseuty3GnpjiWUYy5jXiaKjkwRKcOiPLBej0svfFh5i0geYXYZOd0tg0pYGGxFe
	KSoLuwcORgqNwSEnXUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbNUj-00FIFr-Qp; Mon, 04 Apr 2022 14:15:49 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbNUX-00FICN-6o; Mon, 04 Apr 2022 14:15:38 +0000
Received: by mail-io1-xd35.google.com with SMTP id e22so11354821ioe.11;
 Mon, 04 Apr 2022 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5E21fn+577TVIeU8kFomfMeng4iJST9d5OAfTwxTna4=;
 b=WLjYGWfI8NieOzOaszwCD3go3mVW5B5I2+6Yg+OjcgoBVT7LMgFMz6W9axdgJItbWS
 kcNOl5cStadfExLLKu1xE9sG/bZt6/C3t0E0rkMUhT97PYyBmtMH6qcC8UJoejnKPJSW
 zUyrXFK85nzQBkDjkerQYx7AfBEO8Ed1TWxT4udvEf1T5G+3EPY4EACkL4d0Kp7UB+Ll
 zKiPdNxmZwIOuItE+UUMShHUPUoGhjVPS21SyhceuXkqX0zhq2MCbu1hMm0b2oYm6sCC
 Zi2FjqPaGKGlZSm3r6Ep1XtWCIDha1NmDS1Es3E2ck8hZA+Msy/JGHviUvTH1Awt+9QW
 puDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5E21fn+577TVIeU8kFomfMeng4iJST9d5OAfTwxTna4=;
 b=WYsnClIos9OAJkOvHxk/ta0yfqRuMg1lzdRQGfBhkDnLQWErJVdYdbokCamYNFBKpE
 iROCdNcVXPayD3uRqbpgJxXcGUirihMzmlwliNRRmR7H/3+kL6y/vBX0kGTTLfj1eQmp
 pPSdnu7fmnFWhhLGxpRsgrXppt0ND3rFPamK8PPRjF8DMFAqyZLsy+PcVMiofJuCDCuv
 lF3s6pOVcd1fkxLPAFINDxqVYCNKWfGo7vuIOh4nu0JfktdMSxHDmtTTOtNoRUtg31pi
 L3qhURfkUJ3SxN+6vdf2BCTrnA3/s1S4OxMkTcwzgDb8V929CkXxaKWT+R2emBTbD4eg
 D/2g==
X-Gm-Message-State: AOAM533RgA5TtdUFVR3fYU9DEkjArAOoUcQGp/IIG6LFOl7PAKR1mwCx
 MQMiI8+HAEOuJIAqhsUDsMGw9FAeHls5QKQcHPA=
X-Google-Smtp-Source: ABdhPJxbrZxaxxa23c8KuLbVlw6fjbA5zoUQwfxTtjRwR9H1HCw24823wBw9jzwWM0Oe8D9H9Q79Z4l3QqfPkd0Fz5k=
X-Received: by 2002:a6b:8e91:0:b0:645:c11f:e322 with SMTP id
 q139-20020a6b8e91000000b00645c11fe322mr113988iod.162.1649081734248; Mon, 04
 Apr 2022 07:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <14c921b5-4240-a026-252a-d5fb60836b34@linaro.org>
In-Reply-To: <14c921b5-4240-a026-252a-d5fb60836b34@linaro.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 4 Apr 2022 22:15:23 +0800
Message-ID: <CAJsYDVLY7HByymtd8kbdNGQ-oHMvpvU+CkWQgz+jOoANEwuKPQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_071537_272385_550BCE03 
X-CRM114-Status: GOOD (  10.32  )
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

On Mon, Apr 4, 2022 at 9:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> [...]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - ecc-engine
>
> Slightly slow down resends (max 1 per day). You sent v3 without giving a
> chance to review this.

I made some big changes to the driver for other review comments so I
decided to send v3 for a review of the new version. I'll wait a bit next
time.

> Wrong name here.

Oops. I'll fix this in the next version.

--
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
