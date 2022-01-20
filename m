Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB71CC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC9q87Yb+tHuHYs42//AFRqzV8q3fcUJ70+m5795UtM=; b=dpLXPhn2HSeMex
	XM5QTBCpsGnQK3kUZqGlpoR0paE6iEpOzdF6mC1FYloL1ryGGF67n7sllsCULlh/BvoITc2siRlkJ
	zm2A4nqoSyqaX3eBMi39XKJ2SOcuDPw0ZhB0X1R5BzoJmBrgeEOgev+rXBzaAFY3VZI7qtmobgW55
	yuGaz6FjLuDTs/mkmQ9gCxkpP6viIjtE86LszJklLc9ATtAZ3SVEHArFL9n9D+GUgea9GPrZNyiM/
	g28sJr76thr4F5b+svYCg3e4MTZ744QXBiYoCDF+F1LFA7fQh373ndxj9wSdly9zI4i1b/wmSlXim
	C7YhfLINDsDh/vrMWEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAfyv-00DIfY-Oc; Thu, 20 Jan 2022 22:32:37 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAfyt-00DIes-KF
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 22:32:37 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so9453587oti.9
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 14:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Qk+KVq+IEtQ2KJ1s+kYA1v3op5u0MiFtVTneB8j+4Gc=;
 b=JHwggNJdy0WV9TUFjLIi/FZwEGKHH4PB/vMCzvVn0lcmANNszpFh1Om8b13kOAu18z
 UanQp8s1udiPXo6lR+dweJZ6++b7VMXgvW4vM/kpyN4LptTDshqxaoxDjc/sS6Kgoo/P
 D8NJLQEDriVRILks753VtGK5H7Hdaow1LjBwi8H7sWYP2ZOfAHe3VVqXDAIfB4h6+3ty
 zvkEd348FhcHe5YDtqQWAmNEROUgpmW6CYcSObBVYjimbmqd28Ae1BcF3tInccThO+YD
 tghNmvkZhI8SMNZUC5RRe19h7puAILnSMGusxRKau7lik23tbsHkI447f7orH4YO8f3h
 n4Cg==
X-Gm-Message-State: AOAM530OHLj5eaaZXWAkE4ogzS8B8LkrB5dmgxGs2BOr1RsoBf34JCO0
 UhooeSp3+unRwX8UUbROo4wKERkb0g==
X-Google-Smtp-Source: ABdhPJyMAA182WiefyQ1snVqf2+n/o1Y5BQiyJ6E/Mn8qFkrr457ICztjZxr28+T+/s0YjTjzzPy3A==
X-Received: by 2002:a9d:24a2:: with SMTP id z31mr755556ota.216.1642717953907; 
 Thu, 20 Jan 2022 14:32:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h2sm232992otm.11.2022.01.20.14.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 14:32:32 -0800 (PST)
Received: (nullmailer pid 2059832 invoked by uid 1000);
 Thu, 20 Jan 2022 22:32:31 -0000
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220120202615.28076-2-ansuelsmth@gmail.com>
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
 <20220120202615.28076-2-ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
Date: Thu, 20 Jan 2022 16:32:31 -0600
Message-Id: <1642717951.834828.2059831.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_143235_687874_F360A4B7 
X-CRM114-Status: GOOD (  12.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 20 Jan 2022 21:26:14 +0100, Ansuel Smith wrote:
> Document new dynamic-partitions node used to provide an of node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.example.dt.yaml: partitions: 'hwlocks' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.example.dt.yaml: partitions: 'oneOf' conditional failed, one must be fixed:
	'reg' is a required property
	'no-map' is a required property
	'memory-region' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.example.dt.yaml: partitions: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1582321

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
