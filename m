Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02152C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 19:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF93260F23
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 19:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF93260F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr7ZBKxVmAJHFUIGuLUKYlOD0p6KJsklBTEH7Oe8TD8=; b=Bk6kqycCFuDsrL
	fstiQR/Ao0aSYlBKzr+DquKtWtzpw4RWXB3CqO+TK+P9vI4GE/eL8uEtozpHUsSoMSdxv+t40JyUB
	XXOn9cS/vjhiy6YaMhysKQNP1hzzs5laCeJQF8DYeCp/AXQAMrmyP3fmCykbIIshnwljwhlxcs6xy
	x/MbWbEaJJ41986OtMe3qrruJDAUcYf4KUspPwldOMuuYbAOF68l2HniJ1gpU8dhF7d8HtsHidlEi
	iNZroSzKSGnQJojYYw57kEl1R/BG2AcrzSfz0tu0QPjswM0/l/rwKoXvwXHp1edvZ1aAKWnCy2lfl
	1zHieThrufUpWJmIatfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSlFc-005aZR-Vp; Tue, 21 Sep 2021 19:16:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSlFa-005aYr-Ca
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 19:16:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6774A61283
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632251777;
 bh=y7t65FuUj5M7zHUNcxaXF8xZfHxxqS+Py2uO/oFuGbM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BhMOi9IH4aXuRUEQvYaIyBPtIwepzEo1TnBdbKhE1sb1ceupjaKCfRTQS/jHX88Co
 ih+iBXBmdLdkNx1t5uxAaXBnbQxlJmxO7wk/0TP8jhVr9vunmbtFb4gV2C5y5lQhaK
 jDeUi8PCnXV6T1NhweJ2hnnGGbStXvmMHHvnq2Hm8ojn9MXWofIddPddcMaZuOPEcF
 mvKOttk8GncAltKNYv8BM9MiDUw7HMLf93nONzOd2l30mYZfKKaTnOXYu6g8RHb2ds
 18jw1q8+CAIdprMKqONGjgF9chmpPzSzpJ8CVPgvvqgYIJjEgE+2SQybS2WYnGUsku
 VYnMuRJxfmIpw==
Received: by mail-ed1-f51.google.com with SMTP id r5so336786edi.10
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 12:16:17 -0700 (PDT)
X-Gm-Message-State: AOAM530dKF4ZNXGeTAeGQvZS+pDwAwVF/R8xdPdQzKsU06CifZBBHwX0
 EI6+9yFva6CInrRKwuJMK8fbpl+McMNHoPYVvA==
X-Google-Smtp-Source: ABdhPJzGJFcDleoc9cfu1inyaDPtLW0450eB/KUF4KeBvjL3Emzrqd9wTIf+OICoPmSMZNLiZJgjpxdrYOvYsVRyY4o=
X-Received: by 2002:a50:e004:: with SMTP id e4mr37623631edl.164.1632251775461; 
 Tue, 21 Sep 2021 12:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
 <20210920150651.vvdhennblwhdi3jw@mobilestation>
 <YUj6RUNYDoWA30Ln@robh.at.kernel.org>
 <3c03fcdd-b015-8fda-eadc-e1b6d24ba88d@ti.com>
In-Reply-To: <3c03fcdd-b015-8fda-eadc-e1b6d24ba88d@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Sep 2021 14:16:02 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+sg7f4pJGBhU48a4=uR7cYQmXsoSjbrktovV94m3+qFw@mail.gmail.com>
Message-ID: <CAL_Jsq+sg7f4pJGBhU48a4=uR7cYQmXsoSjbrktovV94m3+qFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
To: Apurva Nandan <a-nandan@ti.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_121618_498809_4E6CC82D 
X-CRM114-Status: GOOD (  38.12  )
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

On Tue, Sep 21, 2021 at 8:43 AM Apurva Nandan <a-nandan@ti.com> wrote:
>
> Hi Rob,
>
> On 21/09/21 2:46 am, Rob Herring wrote:
> > On Mon, Sep 20, 2021 at 06:06:51PM +0300, Serge Semin wrote:
> >> Hello Apurva
> >>
> >> On Mon, Sep 20, 2021 at 07:57:12PM +0530, Apurva Nandan wrote:
> >>> Convert spi-nand.txt binding to YAML format with an added example.
> >>>
> >>> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> >>> ---
> >>>   .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
> >>>   .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
> >>>   2 files changed, 62 insertions(+), 5 deletions(-)
> >>>   delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
> >>>   create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> >> Thanks for the bindings conversion patch. There are several comments
> >> below. But before addressing them it would be better to also get a
> >> response from Rob.
> >>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> >>> deleted file mode 100644
> >>> index 8b51f3b6d55c..000000000000
> >>> --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
> >>> +++ /dev/null
> >>> @@ -1,5 +0,0 @@
> >>> -SPI NAND flash
> >>> -
> >>> -Required properties:
> >>> -- compatible: should be "spi-nand"
> >>> -- reg: should encode the chip-select line used to access the NAND chip
> >>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> >>> new file mode 100644
> >>> index 000000000000..601beba8d971
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> >>> @@ -0,0 +1,62 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: SPI NAND flash
> >>> +
> >>> +maintainers:
> >>> +  - Apurva Nandan <a-nandan@ti.com>
> >>> +
> >>> +allOf:
> >>> +  - $ref: "mtd.yaml#"
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: spi-nand
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  spi-max-frequency: true
> >>> +  spi-rx-bus-width: true
> >>> +  spi-tx-bus-width: true
> >>> +  rx-sample-delay-ns: true
> >> Since it's an SPI-client device there are more than these properties
> >> could be set for it. See the SPI-controller bindings schema:
> >> Documentation/devicetree/bindings/spi/spi-controller.yaml
> >> So there is two possible ways to make it more generic:
> >> 1) Detach the spi-client part from the spi-controller.yaml bindings
> >> into a dedicated DT-schema file and refer to that new scheme from
> >> here.
> > Yes, as mentioned there's patches doing this. But the above is fine.
> > There's some value in defining here which properties are valid.
> Yeah right
> >> 2) Forget about these controller-specific properties and let the
> >> parental SPI-controller bindings parsing them. Of course there must be
> >> at least one of the next properties declared for it to work:
> >> {unevaluatedProperties, additionalProperties}.
> >>
> >> It's up to Rob to decided which approach is better though...
> >>
> >>> +
> >>> +  '#address-cells': true
> >>> +  '#size-cells': true
> >> Aren't they always equal to 1?
> > No SPI nand devices >4GB?
> Yeah, we have SPI NANDs >4GB, and "'#address-cells': true" allows those
> sizes.
> >
> >>> +
> >>> +additionalProperties:
> >>> +  type: object
> >> I'd suggest to elaborate the way the partition sub-nodes looks
> >> like, for instance, the node names, supported compatible names,
> >> labels, etc.
> > That should probably all be in mtd.yaml. The question here is whether
> > partitions are always under a 'partitions' node. Maybe this is new
> > enough that only the new way has to be supported. Though if mtd.yaml
> > supported both forms, allowing both all the time is okay IMO.
> >
> > Rob
>
> I had added the "partition" node properties in the v1 patch, but as per
> the reviews I removed it.
> I think we can prefer having them in mtd.yaml if needed, in a separate
> patch series.
> Do you prefer the mtd.yaml changes as a part of this series or as a
> separate patch?
>
> Other than that, I don't find any need for a v3 patch re-roll, do you agree?

Yeah, I suppose not.

Reviewed-by: Rob Herring <robh@kernel.org>

And actually, it's Miquel that should apply these 2 rather than Mark.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
