Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF78C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 16:43:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447D364F9C
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 16:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447D364F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNJnr9AHQhuvdBB4P10sm09AIfmy4m8gCq4fT5HGetY=; b=ZwhKFLJt/MwiLUFr7++n1pFel+
	6U6tHuza+QpcVI22QcrE4wnjTl3IuRxTrvYXJ6Ys8rkuWf1aFAJYC4K0SAFdpXw/I29cir3xVfa/H
	YO/MdCKhEQMkrvrTdiB6i5NiLFEBsWFgDg6duZOpiUGnGsSyCYiDPwlJt5h7yLFxZc8lKmNv+4sFU
	ECcQusNO3w2sA+cFx5snReA+aw7+4E7wGz4IZDKdyn3QmX/BHa76qpXdF50RP0aX85cbrPVAhzYS2
	gpo33d0NaExEoc3SnZbsCyu4b5koy2Br7liggeXtLkOLpblRNLRmdtyRWIWfmKiSYMDcku6AzoERL
	pqeD8q7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKONR-009bKY-Cj; Thu, 11 Mar 2021 16:41:33 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKONO-009bJn-63
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 16:41:32 +0000
Received: by mail-io1-f41.google.com with SMTP id n132so22628069iod.0
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 08:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=i8xfhIr1HLKCJnIosV9G52CMLBMofdfXZRG6SJhuaFY=;
 b=TmAmakX4h95K8uBnM/UzI8qKJ/8Ngt4rxneL6QcX9NPhghTYfnXp6NJ+y3uk/BRmOu
 5bXsSrxXawFUJZ5afY7l71nvI7XJa+0feFfeOEZ+C1YBsi4DWySm6h5k6r1HBz+kpy2T
 Q1XPjVYMPUX3yih41atARgnLzMKEvEiy+vlCKr7gWH0wBqjX//LlRP7/IrBm+lHUleSV
 bRPEXG7Tebv0QtA5OpccNP/g4OEPch8hxQ29XkRsijL1Y3TsFXjWIJEVG39mTSFRO/Or
 HXdD++jlaJGNLbNDItL2+ERnEkBkh83zUugsUUPQCe60ZkJdRzRz8mF0elwYTbHnvBv6
 zXRA==
X-Gm-Message-State: AOAM530IrFtCW4k0KP3JVn11ATZQVpFmmIWF4L7yHeEiL3P98JC7g1QG
 tiZka5/SmFZoUbY8PYmJkA==
X-Google-Smtp-Source: ABdhPJyrqwtFe/6yLzfUrLFLJXu5wGkfX/qCwYmYeFMxYMOiwqsjWEhjvtr5J7/dDyzmgV5dkXd+qg==
X-Received: by 2002:a5e:980e:: with SMTP id s14mr7151701ioj.63.1615480888727; 
 Thu, 11 Mar 2021 08:41:28 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x2sm1497206ilj.31.2021.03.11.08.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:41:27 -0800 (PST)
Received: (nullmailer pid 841931 invoked by uid 1000);
 Thu, 11 Mar 2021 16:41:02 -0000
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
In-Reply-To: <20210311051309.16789-2-ansuelsmth@gmail.com>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
 <20210311051309.16789-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.520618.841930.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_164130_536528_0C4692DE 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 11 Mar 2021 06:12:48 +0100, Ansuel Smith wrote:
> Document nvmem-cells compatible used to treat mtd partitions as a
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.example.dt.yaml: art@1200000: $nodename:0: 'art@1200000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.example.dt.yaml: calibration@f00000: $nodename:0: 'calibration@f00000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

See https://patchwork.ozlabs.org/patch/1451109

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
