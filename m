Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC49C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 22:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E6E205CB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 22:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7ddFRdW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E6E205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7H+s6bdSxoE9943YfPFoIhMplaFub434gUACl5a5VE=; b=j7ddFRdWstXJ0u
	BDsZZcUUDdAaBLtN+88PzH+LPu4/ZAycnuXDrJ9znuMlXixQIhJw0puPA4PmsRwVyeiNXEM3x4ttr
	frx3MSfI3QoG5TIibk0gK0mOSiOW389JbGdMXt1zfzz+ZWBKJz1xc428iie8UXJjkYwtx1Q2vVQv2
	rY6H65oTZTrvpioNQ6rWGDGOxlN47nnM3DdMWJu0Mf4awrABxCjBumjHOMIeDa63kmfycFW2bocb/
	XtbTGevVEu0zk10LB8/nDV6uPY4zeQG0yf/FSX6JJUY6Jwml/RjexPG0dryHpGwVEIysyPTsUEW4l
	KkDFme27TY1EtJ7TPfjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgbgM-0001Gn-O8; Wed, 03 Jun 2020 22:16:22 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgbg9-00013g-1k; Wed, 03 Jun 2020 22:16:11 +0000
Received: by mail-il1-f193.google.com with SMTP id a13so4163233ilh.3;
 Wed, 03 Jun 2020 15:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rMYc84n19+OGgtVn9II/5P6MMogBkCCeasm/Kp8sey8=;
 b=NT8JJJyoWAwA83Ddzfl2tWPqonvnHWanho2s2qd7y4dyffqNRpTc9LRTUSujYGo0wJ
 nhyesbLquCgsJmEwNGLkLDcf/Cb05QK/KusJIS0A0cQ8C5wjQTELltAQWmunUHXp/1gs
 Gpf7CZbOxZHIQqpxJecm+tZU4epkdLvka97anpk8uDDI1LF8HmBc+loDmYh7ZCN+QZ/m
 +cQ37Z3d7EePhPVdaFOsPPktp9+2BEfZikx1957Jab9g1D+wiytFNvU2YGu9jZSK/lte
 eh4i7k2uRL1TmkzsksIi/jYAc/S6Ss1Nso7zJSzBvuB/wB6yYJS0UoEo0ulXdJsdnZVW
 JfRA==
X-Gm-Message-State: AOAM530rveoqyfBIPhwX7/D3aPRIeGu06dXX0a5ORJvKan6Im9YybuXh
 8W8DbipqKo9cXSqcLwj6iw==
X-Google-Smtp-Source: ABdhPJwHwIAVtxvUaysPu24YULecyerhtKCC4mVOZp+b8rP7kXwCis13n1FDg9z0ORHJNiIUJxrn7Q==
X-Received: by 2002:a92:9ac7:: with SMTP id c68mr1553583ill.53.1591222567528; 
 Wed, 03 Jun 2020 15:16:07 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id k18sm1406721ioj.54.2020.06.03.15.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 15:16:06 -0700 (PDT)
Received: (nullmailer pid 1973472 invoked by uid 1000);
 Wed, 03 Jun 2020 22:16:05 -0000
Date: Wed, 3 Jun 2020 16:16:05 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v10 06/20] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200603221605.GA1973010@bogus>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
 <20200603175759.19948-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603175759.19948-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_151609_107291_4C29C52A 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 03 Jun 2020 19:57:45 +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mtd/nand-controller.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 62, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mtd/nand-controller.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mtd/nand-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1303116

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
