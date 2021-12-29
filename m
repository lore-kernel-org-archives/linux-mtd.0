Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5425C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgWoBkq1qxXpgJhUWwlWyfUEg5IZajekbN/BFZYoBGM=; b=JzX6TXLRF2UKYZ
	M34kupGFZaa7oj9sspAi03aYAuX0/+35Z1LPkan4l5R5hWMQ9kbFNssi9N48zIhkyy34RgHxnoA6O
	rp2TZtGbe7MhdbDt2hnMOrsAfPt4FnRjZ9mrNiqrYr041CAJ6IuE35z/+IhqQv/gRTQn0YdgsQAy9
	xvxRkO/DE9j21qXUyNuwrm11Jvi8Pzq8EyCZ0lgqm0xPeu25TUIsnlejdPoNiBM0oZLKQ2fWRRPie
	3M7BCe7Z8tLbgo23PLFQH9l7IcC2E4I8A3KRUxt3W3dJcNIN4heCxqR50NtNUw28irHuQipqCfRlX
	SIKfjsNvyNvpFjQ9oItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2cqw-003CF0-5U; Wed, 29 Dec 2021 17:35:06 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2cqs-003CDJ-9f; Wed, 29 Dec 2021 17:35:03 +0000
Received: by mail-vk1-f177.google.com with SMTP id s144so12408430vkb.8;
 Wed, 29 Dec 2021 09:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=aUHpp8EvSHkbTSOpO7EAhwgN47lj/B2NCRjAH8ogVNY=;
 b=or4EK7J/jKbqF5mAkycmYbdfLyzyK4FzySvcRq3A/Qj5tTKigD0ZF5+SFyl9kDKKVz
 1bXLSC1h2KPap0DhhP3BL5iWT9WWjp3d+kYOawg8wkMEJvNqH9Nm0fy6JCNbzEwLk66g
 ZyMZp0wPoUfYwSLOQ00MU2bBzdAdul8CRWkFnTkNw1QgcwwPmmB8oyD7JaMTsHyxWd6g
 rTALVp3j0ZSQ8sxr+juxzOUDy1ui0Q++E5NlLL5jaNbDnWXhn6klap742sNIcNof9iiw
 PgtbLs6m/DgKJaxINsQhOo0BvRxZNwtT1NmrrD0mGUTBAFw/YjpSG1H+JMFzuXBH24ke
 1ZsA==
X-Gm-Message-State: AOAM530A+byQ+s9PrTkgX22bmvl1MgAeshwCT2UYeKChaQuGYR/7p/Ho
 CUldTihmJEO8Su+tF2ETBg==
X-Google-Smtp-Source: ABdhPJyOF0vl8XP8OvBBTML/uKoHyRuxtjN0Rnlem0Y5Od2GAtuBNGgE57jGrVSn7Nm5hRfh5D2x1w==
X-Received: by 2002:a05:6122:91e:: with SMTP id
 j30mr9169182vka.20.1640799299996; 
 Wed, 29 Dec 2021 09:34:59 -0800 (PST)
Received: from robh.at.kernel.org ([209.91.231.198])
 by smtp.gmail.com with ESMTPSA id m62sm1805207uam.0.2021.12.29.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:34:59 -0800 (PST)
Received: (nullmailer pid 824017 invoked by uid 1000);
 Wed, 29 Dec 2021 17:34:56 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <20211228142549.1275412-3-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-3-michael@walle.cc>
Subject: Re: [PATCH 2/8] dt-bindings: nvmem: add transformation bindings
Date: Wed, 29 Dec 2021 13:34:56 -0400
Message-Id: <1640799296.468454.824016.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_093502_370823_DFEABBE6 
X-CRM114-Status: GOOD (  13.74  )
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

On Tue, 28 Dec 2021 15:25:43 +0100, Michael Walle wrote:
> Just add a simple list of the supported devices which need a nvmem
> transformations.
> 
> Also, since the compatible string is prepended to the actual nvmem
> compatible string, we need to match using "contains" instead of an exact
> match.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../devicetree/bindings/mtd/mtd.yaml          |  7 +--
>  .../bindings/nvmem/nvmem-transformations.yaml | 46 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1573687

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
