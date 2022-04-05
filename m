Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419C1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBjGRyxNk4JVcmltaQ3K+tCgiQckiRrIYDglcCJDgrA=; b=y8eMHNJMDnVA41
	rC5VPSo+MplnRhE26mg+sxhe5fKrXim1GEw6+EjKnARfEsbub/tvhHIlN2JuW8ILFwjzkSVggkns7
	Lcx/bpiL6GpAhcVfD2MJL9IVpNJ7Ke4TcaFaDHpRl1NQkG9kqL41gtptNUN4YfWw4ow/fgC5TgtGN
	qO1IstTZOcLfFfpcAvNBygH1SY5ypFR8yTbzdQmSzP1jqSGNJJ0FrrfuszH1RIoUuUPqhqspabQil
	6dRHFQ6oAv3+nbijSLES0Six7oLojmnP4wWvjsyhXIkD6lnzzqe2rXuBdHm9ELY1QxgnRJ0t1HZjV
	aewy1lRUYMWUhugM1gJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbZMe-00GxM2-Do; Tue, 05 Apr 2022 02:56:16 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbZMS-00GxKJ-AI; Tue, 05 Apr 2022 02:56:05 +0000
Received: by mail-io1-xd35.google.com with SMTP id z6so13728259iot.0;
 Mon, 04 Apr 2022 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3yv5M0ISj3OX+DOMKzeUfYigLUei4YvBEe35BUC17o=;
 b=Iby+H9vRR0KxP8wmPtDjQoteNOmv+p844+8qA1h05FUmIW6offZ4WiuaCgWKkD5786
 2K4vaN0cJBuUjjSWl4P0i7kOAFoRFmzBZi5iSeXJNLZhQJ3vSph+J4pah8CZ+AOrTlkH
 K6D3s7I0Pct4kOQo8T4buUuUp2vy2MPMFLRUC809BtNucg4JQdP/qpNuzDgELI0QAjLu
 W16Lj6UvH+BhREZ+6vlIy+yeM6/n3URXWQHaPOxA99v5Ly9x09pe/og6JFll6Anhcefo
 hTxxzRcRxVlPUKvgeIw9jynwNv3OaL0dT6bLAoipXA2R/wXCgPjSBtEJHg3OtHVO3jGS
 AcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3yv5M0ISj3OX+DOMKzeUfYigLUei4YvBEe35BUC17o=;
 b=4y53qO+nKUJ3CryMdNO1HungUabgxEOZANfjqkzct6V5pkdPOfxFtcrISbvtIYHTp7
 0FI4EGbreGl45GmdNYMLIr9bb+54pjy0TLSwpBDyrE1TCTRia4XWHkxJ1S49Xt9PsWyc
 fKvqMgHyEFaPWNvVSxxR8xYyW1JVNZrz1xfKAI14tf3IfPmOZV4AjxGB76sHhqnBRnMX
 QF7iQzSMoUAFoHMyStkJqUk3F8wVFmzxvN3bqNT8A+jE1d6FoGf5LZFtK/3VjtjrmFM9
 9tvSjDtIsyCfupAsnCSZ1ZdJ2cmimJ6fm6YNhBQWTr0vAAuXjXO9oxafH9T0mLD6cNbn
 A0qQ==
X-Gm-Message-State: AOAM531JhoMhxfv8pfmRMNhiqCy4cEW/UXsW/q3C+t7eq+WkGSJw8zz3
 aoi+D3eloU2EoGhCSz+KB2aCUOhUKUGHpfCF18s=
X-Google-Smtp-Source: ABdhPJw5IPJXC5+wEEp+ZE5Rd8BQ1UNxzVXfXqR1Eu2OFd1PaDiIVCwKZaHIurGuhLQhMFWhAJtYSP96dKLBe+/HEWo=
X-Received: by 2002:a05:6638:d16:b0:323:63cd:c144 with SMTP id
 q22-20020a0566380d1600b0032363cdc144mr841464jaj.76.1649127362523; Mon, 04 Apr
 2022 19:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
In-Reply-To: <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 5 Apr 2022 10:55:51 +0800
Message-ID: <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Pratyush Yadav <p.yadav@ti.com>, 
 linux-arm-kernel@lists.infradead.org, Cai Huoqing <cai.huoqing@linux.dev>, 
 Roger Quadros <rogerq@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mediatek@lists.infradead.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>, Florian Fainelli <f.fainelli@gmail.com>, 
 Colin Ian King <colin.king@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_195604_434228_1AB2A5C7 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Rob!

On Tue, Apr 5, 2022 at 12:09 AM Rob Herring <robh@kernel.org> wrote:
> [...]
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml: spi@1100d000: 'ecc-engine' is a required property
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml:0:0: /example-0/soc/spi@1100d000/flash@0: failed to match any schema with compatible: ['spi-nand']

I ran the tests myself and it's only complaining about the ecc-engine name:

/home/user/src/kernels/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dtb:
spi@1100d000: 'ecc-engine' is a required property
From schema: /home/user/src/kernels/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

It says nothing about the spi-nand part.
I'd like to keep the flash@0 node in the example to demonstrate the
nand-ecc-engine usage. What should I do?
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
