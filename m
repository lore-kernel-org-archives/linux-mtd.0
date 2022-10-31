Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3825ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3o8COAOCAmtgasZFN2XzduCsa6dKvse0PjfjTzgPLk=; b=cQEuWIXfbC1zMn
	B9kqJSDtJR8OxYnSYOFwq01NZbjhD6C+a+KuGuZu6MWkDKqOdh9L4JnWp+EG1Ds4qSksuvx2PnxhL
	de8QqjULwMCpr5/RiI/YFuximdZKBJrgptDc+HV1SJEkQyP+o0dpySTsR9l499x+pByACAAwJzMMn
	chqzMGjc6TSghzY+WwNqcnLYCdHeNCSb2XDZ3f/cr7Dekx3LD3hvr/QSeRn56TlmDeKNSC24wT6ci
	hzsBlvMofRJfpcrPEyY0meFhbMkvnppCJ/tBf30u2NWNCr2aH4qSY/TSzg0yN5/GLZZVscmg1rFVi
	LTrFWGrQJ4oon3QWn/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opd41-00G5vQ-8M; Mon, 31 Oct 2022 22:15:25 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbuN-00FNpS-RD; Mon, 31 Oct 2022 21:01:25 +0000
Received: by mail-ot1-f43.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so7445514otu.7;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=987jdJA0Irwu+IZt+ZSzTaDZw4daVI3hNs/okiLh6vM=;
        b=ku3VmHZHcwShADr5aJ3d0A1UcQV1bgWOKuNCax8Zok9dik432iklgbFXoA31BuJR8n
         p9cQMgldFajf4D4auRHkJrFaJC2XbkPgcbBXimtXjtK/h1+OvfGQ2EtFMpSsAFe82VKf
         qov5W8MDe1gIQdpUXAUwSxTrZmfuYpWrPi19K17xkitdsUzEig+rYb8PX47h+xwRUxrD
         WI0OOi4+5Boaf99fZlZ3mwOjcTy52zE/aqVpjh0cqIegDaJSTtAkWjSvMMrWH0eucGx/
         6iBuyFgpTKAcUMj65fFS7mBZ8wZzCpgg8oCWsi/DG9F7K65TF3RXR17w+mmLjTcU9cBg
         kPnw==
X-Gm-Message-State: ACrzQf3Xq0WsLdIQNb6sad3KuoixCyapumg+kq8G+sG/eQDa2Y6UVf50
	//S2T72bXZz9KGEu5twBLg==
X-Google-Smtp-Source: AMsMyM6jt4nH7hVXWH5OCQjRysxBsStJNZ3rr+kyfIzYoof8j3D7438kxcV2e885MttFwNCwrGNN3w==
X-Received: by 2002:a9d:22a5:0:b0:66c:358b:3931 with SMTP id y34-20020a9d22a5000000b0066c358b3931mr7533751ota.79.1667250080171;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ej32-20020a056870f72000b0013b9ee734dcsm3586697oab.35.2022.10.31.14.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:01:19 -0700 (PDT)
Received: (nullmailer pid 3512396 invoked by uid 1000);
	Mon, 31 Oct 2022 21:01:21 -0000
Date: Mon, 31 Oct 2022 16:01:21 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/12] dt-bindings: mtd: Argue in favor of keeping
 additionalProperties set to true
Message-ID: <20221031210121.GA3510754-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-12-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-12-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_140123_894185_CF1E3058 
X-CRM114-Status: GOOD (  12.16  )
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

On Sat, Oct 29, 2022 at 01:59:32AM +0200, Miquel Raynal wrote:
> In most cases we try to avoidit but in some cases this is

avoid it

> needed. Clarify why by adding a small comment.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
>  Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
