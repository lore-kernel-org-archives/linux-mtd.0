Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CEBC48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:36:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8297E613D4
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8297E613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/ODaQ0P8nRmr7OTRCBEsTMu9RyPqj5sblltz41YCzI=; b=NEzW20rwVSmi+r
	4ByWU7mLBCn5ekUsw+OipJRho24nBRU/b9S0imH259T8gh0HN1O1gIumJ0iZ/ytHErPuaSQuYl/E/
	liHorQkLZSz9HeD4hfkbtjG7chA4d2wtSLpE9vUCp1NOuzN8Y94NxhVkjdTi05bUdg3DiVWh53EXP
	YlUIdxPo136SddGp15YPwhVm1cHwRQcKR+a6nUDqEpsYMfttl0fRyoakVtJwL4aBjL8QCuHe3DJvj
	8xlEMP2eX7A9nROAt8sfIMWkoqOqOnCYe4ciVieVbD572lr4XR5zOJeJer97J8OBwIOBRq+koJFgx
	hFd1kb69DBO8s+aXlVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr3zF-00Fi6u-Hw; Wed, 09 Jun 2021 19:35:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr3z1-00Fi5Z-JY; Wed, 09 Jun 2021 19:35:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EADF61287;
 Wed,  9 Jun 2021 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623267323;
 bh=Rb8w6UjuDMmlZuyHx9Ur9fRekoEfzLMt84rAQy0iXAg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j/Jselrgx3+ysGSiAxb5+FZNXYl81L/la3bNgHVIUoq28TUs/IUzpm2xR9irO4fB9
 d4uriMHZ+5TkxEOL3mHMy6YtM7Om/wix2c/rYJvo442T0SLuBi6oyZFdxTOKMCfAX6
 BsOKsNHEy6OI+aVkm/wFxvN3kaszNbj0rS/Rw3TLkWNx6uKy7jt6svGk1NwhG7bQTI
 MeHiotEaHSMgZt2NFF2efMQN3ZHYRBah1zq8Za13JkTie1sM1L5ps4req3LLbhkLOC
 Ji9wMyQM7U6v5yHLY80smLdOHsmvTS/75Vjw2fCh7rqI7WHniSiTM76y1b5PFLtUT9
 MtLB7gcgrXIuQ==
Received: by mail-ed1-f54.google.com with SMTP id cb9so29891779edb.1;
 Wed, 09 Jun 2021 12:35:23 -0700 (PDT)
X-Gm-Message-State: AOAM531XGHEGP066vQBU5lM1fDLPK6t6A1zfujrW21AmWj6r8+pFbYO7
 +G/rzaqqIgPaxOMpEi86KLyU2SSr5yDooObYNw==
X-Google-Smtp-Source: ABdhPJyQAe9Rk2VNHsqANmo9SGouwrqZPoV3pKjW0S+0nYq4rEDtuK7M3muw2U4Jeg0hIGlfxhB7E+efgIo9NtqqWR4=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr1030756edz.62.1623267321741; 
 Wed, 09 Jun 2021 12:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
 <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
 <20210609153410.53eadf8e@xps13>
In-Reply-To: <20210609153410.53eadf8e@xps13>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 9 Jun 2021 14:35:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJP2Thvehn-OfsYYdBOTqQTp_-HFoKAK6aT27JENDWWdA@mail.gmail.com>
Message-ID: <CAL_JsqJP2Thvehn-OfsYYdBOTqQTp_-HFoKAK6aT27JENDWWdA@mail.gmail.com>
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, 
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli <nagasure@xilinx.com>, 
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Helmut Grohne <helmut.grohne@intenta.de>, 
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_123523_700396_892EBC25 
X-CRM114-Status: GOOD (  40.01  )
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

On Wed, Jun 9, 2021 at 8:34 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Krzysztof,
>
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> Jun 2021 14:12:40 +0200:
>
> > On 09/06/2021 10:01, Miquel Raynal wrote:
> > > Convert this binding file to yaml schema.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
> > >  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
> > >  2 files changed, 133 insertions(+), 45 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> > > new file mode 100644
> > > index 000000000000..1de6f87d4986
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> > > @@ -0,0 +1,133 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> > > +
> > > +description:
> > > +  The PL353 Static Memory Controller is a bus where you can connect two kinds
> > > +  of memory interfaces, which are NAND and memory mapped interfaces (such as
> > > +  SRAM or NOR).
> > > +
> > > +# We need a select here so we don't match all nodes with 'arm,primecell'
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - arm,pl353-smc-r2p1
> >
> > That's a const... but also I don't get the need for select.
>
> I think this is needed to ensure this binding is not enforced against
> arm,primecell compatible nodes which are not featuring the
> arm,pl353-smc-r2p1 compatible.
>
> >
> > > +  required:
> > > +    - compatible

Ah, required is there already. So only change is using 'const' for single entry.

> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^memory-controller@[0-9a-f]+$"
> > > +
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - arm,pl353-smc-r2p1
> > > +          - enum:
> > > +              - arm,primecell
> >
> > This looks unusual. Basically you change the bindings, because before
> > they required "arm,pl353-smc-r2p1", "arm,primecell".
>
> That is precisely what I try to match and I think it works. Perhaps
> this version is easier to extend when a new compatible comes in.
> However, I am fine using an alternative formula, like below if you
> think it's better:
>
> compatible:
>   items:
>     - const: arm,pl353-smc-r2p1
>     - const: arm,primecell

Yes, please.

> > Don't you want here items:
> >  - const: ...
> >  - const: ...
> > ?
> >
> > > +
> > > +  "#address-cells":
> > > +    const: 2
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: configuration registers for the host and sub-controllers
> >
> > Just maxItems. Description is obvious.
>
> I don't think it is that obvious because there are actually 4 areas
> and, because of the yaml language, we only describe one in the reg
> property while the others and defined in the ranges property, but
> that's fine by me, I'll drop the description and stick to a
> maxItems entry.

I think it is worthwhile to state what region this is AND the chip
select regions are in 'ranges'. Without the latter part, I agree it
seems like a genericish description.

> >
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: the clock for the memory device bus
> > > +      - description: the main clock of the controller
> >
> > Isn't apb_pclk the bus clock (so second item below)?
>
> The SMC has two clock domains referred as aclk and mclk. In the TRM,
> aclk is described as "Clock for the AXI domain". The AXI interface is
> used to trigger CMD/ADDR/DATA cycles on the memory bus. There is also
> an APB interface used to reach the SMC registers. I *think* that
> both APB and AXI domains are fed by the same apb_pclk source but I
> might be wrong. Hence memclk would just feed the memory bus that bonds
> the memory device (eg. the NAND flash) to the host controller.
>
> This is my current understanding but if you think it works differently
> I'm all ears because this part is not 100% clear to me.
>
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: memclk
> > > +      - const: apb_pclk
> >
> >
> > > +
> > > +  ranges:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +    description: |
> > > +      Memory bus areas for interacting with the devices. Reflects
> > > +      the memory layout with four integer values following:
> > > +      <cs-number> 0 <offset> <size>
> > > +    items:
> > > +      - description: NAND bank 0
> > > +      - description: NOR/SRAM bank 0
> > > +      - description: NOR/SRAM bank 1
> > > +
> > > +  interrupts: true
> > > +
> > > +patternProperties:
> > > +  ".*@[0-9]+,[0-9]+$":
> >
> > Match with start ^. I think you cannot have 9 nodes and hex can appear
> > in address so maybe:
> > "^.*@[0-3],[a-f0-9]+$":
>
> I think Rob even now prefers to drop the ^.* prefix, but you're right on
> the two other points so I'll stick to:
>
>   "@[0-3],[a-f0-9]+$"

+1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
