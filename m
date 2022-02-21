Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ACDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 02:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDtX9Ry0iDiUhPfpLerY0FLA1rcSVpdQn3iJSkHGcRw=; b=H/CxhAPZTkbpAg
	YFvV//IGw9ucsEO+SH6lbt5pGrPAt2O5pcQpP7Wwqpn9Ds94L8ujndjgdR0vgisJKDaktCw+0Pc/C
	gbQXO2jSwPtYdPrsVHLhdgTxuxvvc87BXEZwWjM1KPE+yAwS/YdQLKDc+CSTbXuurUoPrAGeSOOqX
	DFrakS2+oKOEzFEQnUKQahO5FWxpmvKV3Cbs36TVvHeoOj39ccYWlXP5O+JMYanvfqN8MLk6Z8cxZ
	0lGxQLy2sRdQMns2aneJQcW0GxL4mtS+YOJM+2gWvT+dJDFXy/FTBwITczjBO9+hF+u0OBtoNvn89
	4uQZDKIhmJQV4ibG8O+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyYx-0033iq-4e; Mon, 21 Feb 2022 02:36:31 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyYm-0033eW-NK
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 02:36:25 +0000
Received: by mail-il1-f173.google.com with SMTP id h11so8985482ilq.9
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 18:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=uAgMNJsD7INE5dFmY8Xlz21D6qpjVxGcjpghogIYeNY=;
 b=yl52lKSi7FjOStAcXuxTDsx4+/qRknEagzheONEAnroEdnreMbvNzelPCTE/AUNdbb
 H9+oizZStTd+3l2kA8Y0ZelHAlgOlyxAC/oA7yX0Sfrk6TdoD7Rt6/AheX2jfLCxXYKz
 y13/tVj4tzsp7oWn/8wfTEnGF7NiJ3qPoK+QW1ratcw1YE6UAZsC7zatPsKhYCXsrXRm
 cxgniFs9Pz/sJ0UNvZsa2gs4tHwWNuffrsPt44938uE5EM9rNFNW/1U2e6SFP26IDEze
 BFgL6+4zOSbvGcUAwz1iW6NpHP8muXFKDTPF1hF0Ulk1FYqEF7MYiu30x0ueV8K8Y6bu
 ZuwQ==
X-Gm-Message-State: AOAM532yIdptKMHMrcsqNF0e49hJjnquJeoE/GqnSrhMZieQnwqTH668
 glY1DJYOng2fYb8iHGF9L5qWZCVApA==
X-Google-Smtp-Source: ABdhPJz2DfaQWNzJPUw3IqWnC9QhQKn66unhRPcWMPIvrixApoeelkVT8Tp/miCfwnh3IxQWexkAKA==
X-Received: by 2002:a92:ca0a:0:b0:2b7:bca5:63df with SMTP id
 j10-20020a92ca0a000000b002b7bca563dfmr14222447ils.232.1645410979730; 
 Sun, 20 Feb 2022 18:36:19 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id e5sm7232198ilq.9.2022.02.20.18.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:36:19 -0800 (PST)
Received: (nullmailer pid 2041551 invoked by uid 1000);
 Mon, 21 Feb 2022 02:36:09 -0000
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
In-Reply-To: <20220220173905.14165-2-ansuelsmth@gmail.com>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document new
 partition-dynamic nodes
Date: Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.414517.2041550.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_183620_808896_852FBE8E 
X-CRM114-Status: GOOD (  14.85  )
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

On Sun, 20 Feb 2022 18:39:04 +0100, Ansuel Smith wrote:
> Document new partition-dynamic nodes used to provide an OF node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.
> 
> With these special partitions, only the label is required as the parser
> will provide reg and offset of the mtd. NVMEM will use the data from the
> parser and provide the NVMEM cells declared in the DTS, "connecting" the
> dynamic partition with a static declaration of cells in them.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.example.dt.yaml: partitions: '#address-cells', '#size-cells', 'art' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1595230

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
