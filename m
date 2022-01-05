Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E302C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8qAx/CfSSRo7IbMscyoF9zfu05w3w2IiaIAxr8ATKQ=; b=PyXVd8qFA/Lyoq
	ZjT3OWdE+RMhmFRRgzY9KLsoJYh+wOPlVNkLSJA+7pBlt8CtEYh+TX7eNASpUOBiCWP21HjbVqiVh
	rqGeIqyJlp5x7FCP4VMGqJRg/JZXtozCGXXxeG9XqBDF6wu1ozOd7ns1+ggPx8Y5UA5Q6KFvZhwF2
	h2dGFvZ57kcQFDG7oAvqSVYcGk+i+z2Jl0Ryqm63k75jRYpm2ZwWidkKe0oLOAbBy6YTqzrrWCUF3
	gBL3Whf1qpyAPF8eRcpvwM0xCcPAsWJopBnrMMzVWMXNh6NM8bKgi3biL613o2jYLJw5i5aCr41Ff
	uOCQ3yrorRXDtYtGL7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n57AK-00EyCd-Ju; Wed, 05 Jan 2022 14:21:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n57A7-00Ey9u-45; Wed, 05 Jan 2022 14:21:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4069B81B49;
 Wed,  5 Jan 2022 14:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C26BC36AE0;
 Wed,  5 Jan 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641392468;
 bh=E/9ltYS2K5Hxriu8AEcuLBY1l76gjiW63MfmoNf0ni4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lo0jTGxbgIi8f5WN4DeqUQI5WFEd9KLCb8SCzISdMLCEV79JGbJ8HWVJZRMhF2ntZ
 CSvczBgOuBw7SfLhpg6PQT/tL64I6nNcpuNZHaZIUkcn4Li/yu47+21vzRNzLTISZ5
 Sec4J+a/zl56Z09x88hP+Tb+ZYgkwkCYIVl7Jb+ZtS1tD0JU9jKRt4aiMtxnq6xEsV
 jOmnq5E31L5Qvv75bu54ofngKAyjCoKBz4yu9XcunMya+HFoXbpDGbaJDOHKXRf17W
 GV2YGwpGt4F4/JHjUSrgPaKuZXxdwIXV9me32vwNewrZCnfncMmN/ZZFQOxxwFTX0v
 563O9RM7x08KA==
Received: by mail-ed1-f43.google.com with SMTP id z29so162586628edl.7;
 Wed, 05 Jan 2022 06:21:08 -0800 (PST)
X-Gm-Message-State: AOAM533sMNZXFlbboRBeitX7tXAbTypowotqOmbmqFBn7NCPkDbLSvtb
 EtL3cIXmQ3jWdS5nQnz/dX8A7KInU+TeUl6cfQ==
X-Google-Smtp-Source: ABdhPJzBpVRSW7VkVRmzynvUWQHPBJVDPx6RJI26AVYJne7hYLyrJZaVCzqukAdZjts9d2twY6gG657GUpDxNisWVcw=
X-Received: by 2002:a17:906:7945:: with SMTP id
 l5mr42818868ejo.82.1641392466769; 
 Wed, 05 Jan 2022 06:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-3-michael@walle.cc>
 <YdRh2lp5Ca08gHtR@robh.at.kernel.org>
 <084b306b7c49ce8085dd867663945d29@walle.cc>
In-Reply-To: <084b306b7c49ce8085dd867663945d29@walle.cc>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Jan 2022 08:20:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLm9M2HJWbDnWxdMNiL2W40h2n=F1kj0XWizQUcmVk0+w@mail.gmail.com>
Message-ID: <CAL_JsqLm9M2HJWbDnWxdMNiL2W40h2n=F1kj0XWizQUcmVk0+w@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: nvmem: add transformation bindings
To: Michael Walle <michael@walle.cc>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_062111_465855_0D6DC147 
X-CRM114-Status: GOOD (  27.86  )
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

On Wed, Jan 5, 2022 at 2:25 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-01-04 16:03, schrieb Rob Herring:
> > On Tue, Dec 28, 2021 at 03:25:43PM +0100, Michael Walle wrote:
> >> Just add a simple list of the supported devices which need a nvmem
> >> transformations.
> >>
> >> Also, since the compatible string is prepended to the actual nvmem
> >> compatible string, we need to match using "contains" instead of an
> >> exact
> >> match.
> >>
> >> Signed-off-by: Michael Walle <michael@walle.cc>
> >> ---
> >>  .../devicetree/bindings/mtd/mtd.yaml          |  7 +--
> >>  .../bindings/nvmem/nvmem-transformations.yaml | 46
> >> +++++++++++++++++++
> >>  2 files changed, 50 insertions(+), 3 deletions(-)
> >>  create mode 100644
> >> Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml
> >> b/Documentation/devicetree/bindings/mtd/mtd.yaml
> >> index 376b679cfc70..0291e439b6a6 100644
> >> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> >> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> >> @@ -33,9 +33,10 @@ patternProperties:
> >>
> >>      properties:
> >>        compatible:
> >> -        enum:
> >> -          - user-otp
> >> -          - factory-otp
> >> +        contains:
> >> +          enum:
> >> +            - user-otp
> >> +            - factory-otp
> >
> > If the addition is only compatible strings, then I would just add them
> > here. Otherwise this needs to be structured a bit differently. More on
> > that below.
>
> I wanted to avoid having these compatible strings "cluttered" all around
> the various files. Esp. having a specific compatible string in a generic
> mtd.yaml. But if everyone is fine with that, I'll just move it here.
>
> >>
> >>      required:
> >>        - compatible
> >> diff --git
> >> a/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> >> b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> >> new file mode 100644
> >> index 000000000000..8c8d85fd6d27
> >> --- /dev/null
> >> +++
> >> b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> >> @@ -0,0 +1,46 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/nvmem/nvmem-transformations.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: NVMEM transformations Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> +
> >> +description: |
> >> +  This is a list NVMEM devices which need transformations.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +        - enum:
> >> +          - kontron,sl28-vpd
> >> +        - const: user-otp
> >> +      - const: user-otp
> >
> > This will be applied to any node containing 'user-otp'. You need a
> > custom 'select' to avoid that.
>
> Out of curiosity, you mean something like:
>
> select:
>    compatible:
>      contains:
>        enum:
>          - kontron,sl28-vpd

Yes, that's correct.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
