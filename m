Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95BBC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pg4ImgfH3na0D0GUcdguCCRvDXrOrWz4SUI5WOss8rE=; b=L3KHOQHl5HgaPo
	Nk51eNefJGGYy0nD5xuHZpk+BC5DckZ2tbWLWR3xBijda6yVgG9NKRTgb2/5ADe3ip4hMWq624B47
	Qx8+JGhVi5P+Uow5nY6VXZBfIE81SK3SAKSa3qSHgO+p13Wsaxuq90U0MZhv6tY82MCZywT0pzZ4o
	1GEUWForgWbAG1LbJfZuOTQLkqam1QRo7xGtDoheL15kO+Kpja0eecnOHVgAR2Vqx9VMA5n0LATqi
	O5YPbOR8UwQcR8rK3MeQcLljp7bZkELyejU/pTqlLU3GGJcNoq8K9GcFAcOXWL8wbOTmaeOZSg1PK
	GvmthbfLXhJzjd8LM3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVjC-000Ri0-NV; Wed, 01 Jun 2022 21:18:06 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVjA-000RhZ-JK
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 21:18:05 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-d39f741ba0so4337141fac.13
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2022 14:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wB6dT/XCvf3C+B5FfUFc5pk+O7AJqhAY3bJMVvBLmO0=;
        b=7oyT2tktKCYr/f663XRcSnVNF7cdjH8zPk0BwJtZYGGHKHIsMFZv0az1eQWkCwcRqb
         TPI/gMbnUrpvF398bKucuOwl6rg5Rpj8+BPM4R8guCR6YWC2GAYF7PKroSg5uimHfFaJ
         tS6Qo6Ev8t84ML0EQUrmdb4u+0i+JZB2txFe4h8cjjEzqsDFhvtM4tEPZAaRaUnu7o/H
         5DVh9MWtpobaWvHh5DBr3MfpEqqfuld+KdFOkl2jpLNxIH+FoQBw77deFwxEfmm+XnID
         JdTjdL4DLZRg/wSK1ZqNupZ45k1RJaTSfJoaoSDn7VZZDKcyI/Ekxmio8DkPss0t3lqX
         DaLQ==
X-Gm-Message-State: AOAM532YnvQ/SwyX2y8PbxBxPaXrLedNIzKkQi4N8eyeRY2jLexCANE+
	9JRVITJcA1YeFkHdtUQbMdl0TnJLhg==
X-Google-Smtp-Source: ABdhPJyK7+g+68SDuh+gdaVuR1iTT6Wt141GPzQP3A1z+JoOYLQVSfSPqgb5fY0eBo6C+3xfL+BLrQ==
X-Received: by 2002:a05:6870:8888:b0:e9:a3eb:a52d with SMTP id m8-20020a056870888800b000e9a3eba52dmr904142oam.181.1654118283911;
        Wed, 01 Jun 2022 14:18:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o27-20020a9d411b000000b0060b469fa02dsm1344521ote.20.2022.06.01.14.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:18:03 -0700 (PDT)
Received: (nullmailer pid 472063 invoked by uid 1000);
	Wed, 01 Jun 2022 21:18:02 -0000
Date: Wed, 1 Jun 2022 16:18:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
Message-ID: <20220601211802.GA472030-robh@kernel.org>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220519190112.6344-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519190112.6344-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_141804_673705_77D2FB5A 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, 19 May 2022 21:01:12 +0200, Ansuel Smith wrote:
> Document new qcom,boot-pages binding used to apply special
> read/write configuration to boot pages.
> 
> QCOM apply a special configuration where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
