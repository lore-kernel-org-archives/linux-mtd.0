Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0074C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0946613F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0946613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFTSoM/4pz1vlj+YffkHChV4LBUFnu0Kx34F0c3zOJo=; b=DSxrUYCi371Wpb
	ujEXbNlKHtca4l5W2+Qte2oMI6kM/9sAYh61hBpObAsbcyLDYjl5uizqzJOsWL0Mzf0fBEMbgo+/O
	ASw7plIYFSw+pKEswMGtSFC14DuuZjjD50LB1DVYY/khYYI3vMmdcc19uoPOIYnsznH4agTdAd0Gi
	tyeDIFncyIAPJyVZ8NRKQnTBhbJ30+iqrcbwTBO2G5gpNXXQeUbY45HQlU9gGKsKt+K97aZBFEs4o
	5WdzMUx48FiLbg5w0FTs/uACvhz8t03dvm/PkkvXTtI+wR1EmA4jNirBuqrNlTOJ24869TeLOudsL
	CqUxbfhPkthe9GfMGCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr3r3-00Fh6T-EG; Wed, 09 Jun 2021 19:27:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr3qo-00Fh4u-LH; Wed, 09 Jun 2021 19:26:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C59F261359;
 Wed,  9 Jun 2021 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623266813;
 bh=96jmhnDdYUYzWGwtTwwo8iS1dyMXAQKNuE9fkGS8Jp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QEeuED2qUENZ5eKaeFZq3umwdELglPNxR3cRotVCa4Oo5IP/ZaglO7x6AD14MdWNU
 8P+AYdzyEBcvxcaHeIvg/rM0p4CZYGk+XjjYgkfaDGm9Q64vn0dI5/qoGoZPWj3sFo
 UpaKQZNB1EXW8aRdLzNc99VG1fKuOyjVLpznxdXOG3Cb4wdW+veNCumvP7KFB7CAzL
 ancWjMbJ8bDn92OnLrBC915Ctc8fDuC8IDnv0YDTBFxBat3821kieMJBgWQmh3qizb
 uP5GNw2QKtQvWtLKsQCvAPizgfhDcFOZLRRbB0kBM2YQ8yXfUN144FEm+NBbgSh3ZX
 GveVNpCQUHIpA==
Received: by mail-qk1-f176.google.com with SMTP id o27so24831637qkj.9;
 Wed, 09 Jun 2021 12:26:53 -0700 (PDT)
X-Gm-Message-State: AOAM533jYqMxSF/m+3j7GpkzoVNaeeMimhBc8YMf2LbtCCu1QQlBHpKC
 wHYDbgF8P5arJ8QmSapkIZYExCIWPexBFIAH9g==
X-Google-Smtp-Source: ABdhPJwIF2VAc3W3tDLHATbFdB2v0fwn3EwAFw2Dy6hysy99DIc0dA4ocPbE/DdU1zN+5F7yffjXWx/yn9jFgvfWsnM=
X-Received: by 2002:a37:947:: with SMTP id 68mr1188220qkj.364.1623266812990;
 Wed, 09 Jun 2021 12:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
 <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
 <20210609153410.53eadf8e@xps13>
 <77db74d3-c44a-6aa3-1b61-f6bed565fa04@canonical.com>
 <20210609161128.16cdf5ec@xps13>
 <32c7adf2-6f4e-ef2d-a137-a9674f9e6baa@canonical.com>
In-Reply-To: <32c7adf2-6f4e-ef2d-a137-a9674f9e6baa@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 9 Jun 2021 14:26:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJW6Nt5h_gpfd5OgaTjSQGnrH2mCdwDeWvsnq1y_3uV=A@mail.gmail.com>
Message-ID: <CAL_JsqJW6Nt5h_gpfd5OgaTjSQGnrH2mCdwDeWvsnq1y_3uV=A@mail.gmail.com>
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
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
X-CRM114-CacheID: sfid-20210609_122654_759100_B6E29FCE 
X-CRM114-Status: GOOD (  22.29  )
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

On Wed, Jun 9, 2021 at 10:26 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 09/06/2021 16:11, Miquel Raynal wrote:
> > Hi Krzysztof, Rob,
> >
> > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> > Jun 2021 15:54:19 +0200:
> >
> >> On 09/06/2021 15:34, Miquel Raynal wrote:
> >>> Hi Krzysztof,
> >>>
> >>> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> >>> Jun 2021 14:12:40 +0200:
> >>>
> >>>> On 09/06/2021 10:01, Miquel Raynal wrote:
> >>>>> Convert this binding file to yaml schema.
> >>>>>
> >>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>>> ---
> >>>>>  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
> >>>>>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
> >>>>>  2 files changed, 133 insertions(+), 45 deletions(-)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> >>>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..1de6f87d4986
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> >>>>> @@ -0,0 +1,133 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> >>>>> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> >>>>> +
> >>>>> +description:
> >>>>> +  The PL353 Static Memory Controller is a bus where you can connect two kinds
> >>>>> +  of memory interfaces, which are NAND and memory mapped interfaces (such as
> >>>>> +  SRAM or NOR).
> >>>>> +
> >>>>> +# We need a select here so we don't match all nodes with 'arm,primecell'
> >>>>> +select:
> >>>>> +  properties:
> >>>>> +    compatible:
> >>>>> +      contains:
> >>>>> +        enum:
> >>>>> +          - arm,pl353-smc-r2p1
> >>>>
> >>>> That's a const... but also I don't get the need for select.
> >>>
> >>> I think this is needed to ensure this binding is not enforced against
> >>> arm,primecell compatible nodes which are not featuring the
> >>> arm,pl353-smc-r2p1 compatible.
> >>
> >> Which seems to be result of unusual compatible match, so once you
> >> convert to regular match, this select is not needed.
> >
> > I don't think so, I received a hint from Rob some time ago, he told
> > me to add this additional select line as in all other arm,primecell
> > binding.
> >
> > Rob, any additional info regarding this?
>
> Hmm, I think you' are right. Since arm,primecell is used in many other
> compatibles (including ones without schema yet), the select is needed.
>
> In such case the select can be only:
>
> select:
>   properties:
>     compatible:
>       contains:
>         const: arm,pl353-smc-r2p1

The above is true if there's no 'compatible'. So you need 'required: [
compatible ]' as well.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
