Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9B8C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F5164D9F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F5164D9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dYMjUGwowMzZN7ZaiaSxw/BimpnAO5vYgoJEsJJDLAk=; b=bYtamgnvxDoXZQ3JKgF1vKJVJ
	01jirb9raPOV5dGZ4Go/7Qsts5PTcUjCRLQUsZcfAhYP/TDOXf7JhK3sQItw2o8y16dXS5Q2pEUTK
	pTzWZU/MU8Odx/u67y8ydwSESxmdlLdqA8ivMacUjFjkXVZ1UIg8Na7sOVoCIFCIsskejoh2fSsg0
	BO8eWUyRyV1v1hIXcL1+zRlb2adfUAOZrR9JrTA7hs3GMXzRKjiDwOksHkJ0RWHL9hvqysvIIwFfX
	E8WPxy14Jeoc349mC7j9MVRnbB9BAG5hD63+1dgHYSgpOWZNX4V2TrE/jN5ZAz2Dkyv2SoruFqODn
	nq+fEoaiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwQE-00006D-4e; Tue, 16 Feb 2021 09:13:30 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwQC-0008WH-9d
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:13:29 +0000
Received: by mail-ot1-f42.google.com with SMTP id b16so6006109otq.1
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 01:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucaaQ1ADUQy4A317BM2Jn2gGmRvVOJrGQ3s1YQX0K0s=;
 b=SOHeQ6K+SqI1nkCPOmTdBCHPoEaRA2p5ad1XFIR7RnGECi05sAiYPkMNcqRjLgbUt0
 KNvmUDClsMxb10SGLeZjUAdaJ6ureIbY9JOI4AFkThPrhy3Lq0XnzyVmvvW+x0pFIQtX
 JmJhAnkKUyxRTwxX6fWkrmZ0lZjOiSoTScqEVSaHgUaSN+neMOZh0NYLNyi7B1ZbsFP/
 s65VKNkjW4CHlIO7BTahbrmemaOkL7RVF6bxZ40em0K4Kx55oJrQTrGDRYilKNbR6zy4
 B5K87fvd6716TUBUNHylHgb3srSbrTWn42Cgmrk3jm0xaIcSGQPLhTYThJC6MB/BYPxj
 oMVQ==
X-Gm-Message-State: AOAM530agNnNrtVs0/xpGQSj68cIX9jJL/92ckudcOHEar9b85Tb2K4g
 LaiQPG8nTgoOeQL8yGJ3/bVNirLnCFN7xQmoSBE=
X-Google-Smtp-Source: ABdhPJzKXRD65Esy2e90FduDMQfkvF1Tp3lIJAEziXJuUt1F3lOaYzjpwDcyZY6EvWCmnJhfq5UPVT2eCePoy3fhcKI=
X-Received: by 2002:a05:6830:148d:: with SMTP id
 s13mr13989286otq.250.1613466790398; 
 Tue, 16 Feb 2021 01:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20210202175340.3902494-1-robh@kernel.org>
In-Reply-To: <20210202175340.3902494-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Feb 2021 10:12:59 +0100
Message-ID: <CAMuHMdWyTWqF=2fwAmkedMCrZ_owF9nhmGWYf6Xe=CRuOB1ZEQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: Convert to DT schema format
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_041328_364112_51FEEEEF 
X-CRM114-Status: GOOD (  17.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Tue, Feb 2, 2021 at 6:54 PM Rob Herring <robh@kernel.org> wrote:
> Convert the SPI-NOR binding to DT schema format. Like other memory chips,
> the compatible strings are a mess with vendor prefixes not being used
> consistently and some compatibles not documented. The resulting schema
> passes on 'compatible' checks for most in tree users with the exception
> of some oddballs.
>
> I dropped the 'm25p.*-nonjedec' compatible strings as these don't appear
> to be used anywhere.
>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI NOR flash ST M25Pxx (and similar) serial flash chips
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - pattern: "^((((micron|spansion|st),)?\
> +              (m25p(40|80|16|32|64|128)|\
> +              n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
> +              atmel,at25df(321a|641|081a)|\
> +              everspin,mr25h(10|40|128|256)|\
> +              (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
> +              (mxicy|macronix),mx25u(4033|4035)|\
> +              (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> +              (sst|microchip),sst25vf(016b|032b|040b)|\
> +              (sst,)?sst26wf016b|\
> +              (sst,)?sst25wf(040b|080)|\
> +              winbond,w25x(80|32)|\
> +              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
> +          - const: jedec,spi-nor
> +      - items:
> +          - enum:
> +              - issi,is25lp016d
> +              - micron,mt25qu02g
> +              - mxicy,mx25r1635f
> +              - mxicy,mx25u6435f
> +              - mxicy,mx25v8035f
> +              - spansion,s25sl12801
> +              - spansion,s25fs512s
> +          - const: jedec,spi-nor
> +      - const: jedec,spi-nor
> +    description:
> +      Must also include "jedec,spi-nor" for any SPI NOR flash that can be
> +      identified by the JEDEC READ ID opcode (0x9F).

Is there any value in keeping this paragraph?
The schema already requires "jedec,spi-nor".

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
