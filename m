Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7472CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmfoHCiX7ZEc+xPo0r30pierVB9OZ4U8xvYRwfK0Lwg=; b=wcap0gGn9c5dP7
	sosnr+Pfq8bERYhPM/pbQEzcpwGaY/8Gu05akeD0dXFzAJJS6o+qh+cUAxmMOTBcm7gIbSLzj29vY
	ia6iikhNEyatDyFaheVS9gkmct16f9ufBu4o1+6gzOreePbFwXFhqxRPm46kM6+lB9VvTG7dAPVem
	Ww/b0MYK39Az/ghjaWwi9Y1Bb2CY5pTa40vcHk6gi4uxOkYk8HUpa9GkvOj4n9lxcR/q2JzwRhL5F
	p0k9twk0FnCu97471SooV7SpxnGR7K0oQCRXVCWKqZWltNq3sCQsQsP0IGdvVlmQ1cVRZJKNL7bb4
	4qbkQXRrH1SNs4C0oqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMB4R-006XKi-Kl; Mon, 21 Feb 2022 15:57:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMB4K-006XIu-Ur
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 15:57:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id s24so23904174edr.5
 for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2022 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NSVr0UaSWz2MJOjywj5QL59VZ16irz/Lajj782o4eJQ=;
 b=QQZwNVp1wf19mb1jBrCGmpNT/MUdKH6CEmcsv1lEj7qJMquOydefa08uMW7DuSVfrS
 dz7JhF1Inicn+AXa23+7UTcsMYOpvstKP3RitiDVaG/OyrYCjzld40l111xu3q6GMtkI
 yco6LkSwURf3voNuaeOFsEOm152vxeFFv2KKbib73fUD/UmeO5lu64+hHZVmTAE16leZ
 TnDg1VGIGZs2CkOT54V0KaYPhOTb+kv7EQC9jCTgGMQGi9NgMog+yMU8pKA+JHqskulp
 Nuzqm0/H3xQon+GaiM+mG6n69SpyGVfurmuc9BlYflpro/fD6ajgQl63LkvR+0llEGL/
 Mz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NSVr0UaSWz2MJOjywj5QL59VZ16irz/Lajj782o4eJQ=;
 b=hfHHLx1XRWYrcdq2aag44P6/EAfTxxi06dVIS+gqlbTqW5E1Vp9r6XwXgbwTZurWYl
 gPwWRgpn6K2k3RhICs7yXqydu9ikw6FffUnxDlLG+2aV42P/UkpU4WzUepuasvp7cEY9
 XUZmKCwj+QOafKV23AL8QU/c4wUbBPKLg4zVu1ZBVauAJOJbjiqp/n4JNUTDhzK8Hyfe
 pjFEcfx9Ayj0Y/RsgtcDGjcQ5Cry71LjrgT6JDG48QQ2JYpCmvO0qJpZGZ2MSmPlVYHX
 Xpd3cN/XsLOPx4LbpQrjzZHrYujRFuJryl1xyhGzqsVvfRYuGSRt+DoByFpp92vs90QL
 W9qw==
X-Gm-Message-State: AOAM532zSeAni8TIIalTL/GKGaXbQX+CrWkI3UoMARkmz+E7hJkmtSHz
 wrEtuKTTu9elXGf83AWzlyc=
X-Google-Smtp-Source: ABdhPJxCIp0Ja49K3sb0ldfgLY3BkK8GAlDyfezaFbQJadNkmK+XUL0RetdGTC52oRPAhnbC5WJJ0g==
X-Received: by 2002:a50:8750:0:b0:410:f1b7:86af with SMTP id
 16-20020a508750000000b00410f1b786afmr21936676edv.11.1645459062824; 
 Mon, 21 Feb 2022 07:57:42 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.gmail.com with ESMTPSA id t4sm2944659edd.7.2022.02.21.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 07:57:42 -0800 (PST)
Date: Mon, 21 Feb 2022 16:57:40 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document
 new partition-dynamic nodes
Message-ID: <YhO2dK0eNP9fOeOZ@Ansuel-xps.localdomain>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
 <1645410969.414517.2041550.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1645410969.414517.2041550.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_075745_038159_DB7C9CDF 
X-CRM114-Status: GOOD (  23.21  )
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

On Sun, Feb 20, 2022 at 08:36:09PM -0600, Rob Herring wrote:
> On Sun, 20 Feb 2022 18:39:04 +0100, Ansuel Smith wrote:
> > Document new partition-dynamic nodes used to provide an OF node for
> > partition registred at runtime by parsers. This is required for nvmem
> > system to declare and detect nvmem-cells.
> > 
> > With these special partitions, only the label is required as the parser
> > will provide reg and offset of the mtd. NVMEM will use the data from the
> > parser and provide the NVMEM cells declared in the DTS, "connecting" the
> > dynamic partition with a static declaration of cells in them.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.example.dt.yaml: partitions: '#address-cells', '#size-cells', 'art' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1595230
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Considering the idea of this partition-dynamic, should these warning be
ignored or the smem-part should include the ref of these new partitions?

Or should I remove the example?
(or should I add the example to smem-part instead of partition-dynamic)

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
