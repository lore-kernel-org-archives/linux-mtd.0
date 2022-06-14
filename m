Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C87C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgwaftwcFJ/uBOSMlfKaiMIYXRXGlAF4ziu72uc8Or4=; b=BaTsDtIiIJzAmZ
	KbxL5cIhfVp9u0VI6ZdI+SD3xNSNRAloRPnbMk8soixAvm11gjDR7YJazfuvCS/Ers3z77gpwyWbH
	O1mbi25QQsTnn1xDFX/niN0O1k1VHUh+YQlFuIMGTm2Fy5XT/CbqZ0E6zOgjkYzWdctMJVdH96zCW
	su20Ong/b3tmC2yvP5g9qurynjWSBQ2j3T0CQAm7tJzP99OM6mO18ApOPszXlvHMrV6Z4VB0smN9U
	YireX8tmiqC/syCsoeVztwq8FrDqvKLgtDv7OqLuhKA1OxrEA2FgE0bjZfDnodLHnfD1elx+YofHp
	w4d5j/K09URRJsMaoJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Dei-00BId1-4n; Tue, 14 Jun 2022 21:00:56 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Def-00BIcG-C5
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 21:00:54 +0000
Received: by mail-io1-f47.google.com with SMTP id y79so10726013iof.2
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 14:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6wiAEAPY25hq39gjHNba18GOciZXRMGE+/vSibk2A0Y=;
        b=A8ogtpwzx3tye7cTdFsa68GV1Su2bJEr++X2AhryoRxQO5t45sqjNdGG+qSGIe5HWs
         xJ/lI/q5D56rBjT6mBnfoijK4sWdFW4Gvr/Npc9f8G/ZooeaVmJYvHqx9+uBHDaiIUbF
         h2OaHuCgD63dNIZ/e8AShjeUfVD3KFWwzhEBM7jx4rXOblf2umQ0LQ9ZWgz7m6fc2mmh
         0WO2r0vdbY88QIBgAqJ0CdUxBfMIW9kjyF78Yewzp8WXbld4kBRLqFKZQMmvctH+qOvk
         DHn6JCNa+f7e0Qe7OJ7GzRvW8kxTzC65NoljCEEq3rFw9oOqL9Wb4+ne4BgenesC8A86
         +0jw==
X-Gm-Message-State: AOAM533T420aVcxqRcXPpmapoWmjfA40HSNUm6cTxtuQrD3NRhilAJMY
	VslP7eT7ULznRXda5briJg==
X-Google-Smtp-Source: ABdhPJzIytzKnEVgu1QnavMIZw8F2v0fC5i8fFAEMNNu8RKGv/X2WWcvM5eIkW4e+95ltwCWuCHhLA==
X-Received: by 2002:a05:6638:1342:b0:331:e382:b0af with SMTP id u2-20020a056638134200b00331e382b0afmr4132233jad.32.1655240452595;
        Tue, 14 Jun 2022 14:00:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u12-20020a92d1cc000000b002d77ea49cd7sm5954020ilg.28.2022.06.14.14.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:00:52 -0700 (PDT)
Received: (nullmailer pid 2556989 invoked by uid 1000);
	Tue, 14 Jun 2022 21:00:50 -0000
Date: Tue, 14 Jun 2022 15:00:50 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Andy Gross <agross@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v6 3/3] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-partitions binding
Message-ID: <20220614210050.GA2556790-robh@kernel.org>
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
 <20220609132344.17548-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609132344.17548-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_140053_465286_19D2A011 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, 09 Jun 2022 15:23:44 +0200, Ansuel Smith wrote:
> Document new qcom,boot-partition binding used to apply special
> read/write layout to boot partitions.
> 
> QCOM apply a special layout where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
