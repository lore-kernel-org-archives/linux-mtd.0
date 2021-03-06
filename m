Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335ECC433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 21:02:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADF1650A2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 21:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADF1650A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OmeafU8H3mD+prN5I0yO4Ai04bmu6g2PeOaxGg8whw0=; b=Fk4VHiPxgrnRX7wTvPuCFWw57
	MgPBtEsuyuNm1xgs9+tuatLivjEk7SzxZ4oAfd8EE/o/kwsCGQdKQaAdTkr0xxTpfLCe7KaD2alQY
	YOfa1lQUa03sFrcxvrUzirpze2WoitWhPkq+zBEICWb0B3mSQtphvJsgZRerde9qfGJ2eq343qFD2
	W1ysKuafTCP56db4y/XwfOP7112prkJzQTgs4TYzq/vmLqxbkUmmaI5XzK7tgfAeytkj/Q1wJfO9n
	tdVYFPq2IrB+Hf4dQVRiPs79wi9VVZq2uc0cdj2b46SC+7rRllJRH3I2+Y9R5jqCcph6M5dhFtZel
	qjgIXEaFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIe3K-004w5y-DU; Sat, 06 Mar 2021 21:01:34 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIe3G-004w3K-Bx
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 21:01:32 +0000
Received: by mail-qt1-f173.google.com with SMTP id v3so4698313qtw.4
 for <linux-mtd@lists.infradead.org>; Sat, 06 Mar 2021 13:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l85sQMIs+NfNFMSyOF38inzETHxxqxRPmN1d4ghhsRA=;
 b=ERIwxTByOdkWtzaX3I8u/qYSkH45dL4T8ueJol9mZuIFoscLrC93eKU6FXtj0barYe
 iCXtdG3VQ+C+mmZNqya221304ROAwyoqnLcqxJ2qazU4Ay7Eh3zds7IWO0z8TheB9oy2
 GnDbBvY818XezYvoyZgS/58alR2DJ8ttj8Mocgi8sACK2XKXswD16A5w5jP/+NKxPlrk
 ExIfHYVbfK7EOu8oH+AGgKtnJ5F7RPom/8mN15D7nuzkj3Wy9ERXaJM0pDFtxG/sMw8T
 wTVFE21BFFY2b/LwY4vVf7IOv2aVYWjWHeIWXOOiSZwo0gbHsPYZGZGdpL0kt1Im3fi8
 lI1Q==
X-Gm-Message-State: AOAM532JJsfp47C63QMrjBA+3oKVpvSjrXp/VwB8qjSjGleJl9+dQIAB
 IXxo9CaoOUyqXFKaD84I6Q==
X-Google-Smtp-Source: ABdhPJwcxDxL6OjU73HMeWCdrmgJ3tmXgvyChPWpEtRNLPoyQ+FJMd18SBMBCDOEgP0URXUs4vWwEw==
X-Received: by 2002:a05:622a:28d:: with SMTP id
 z13mr14573106qtw.87.1615064489260; 
 Sat, 06 Mar 2021 13:01:29 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id d16sm4550200qka.43.2021.03.06.13.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:01:28 -0800 (PST)
Received: (nullmailer pid 1206171 invoked by uid 1000);
 Sat, 06 Mar 2021 21:01:23 -0000
Date: Sat, 6 Mar 2021 14:01:23 -0700
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org, richard@nod.at,
 boris.brezillon@collabora.com, linux-arm-msm@vger.kernel.org,
 Daniele.Palmas@telit.com, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Convert Qcom NANDc binding to
 YAML
Message-ID: <20210306210123.GA1206091@robh.at.kernel.org>
References: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
 <20210225140842.66927-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225140842.66927-2-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_210130_665115_F1C98465 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

On Thu, 25 Feb 2021 19:38:40 +0530, Manivannan Sadhasivam wrote:
> Convert Qcom NANDc devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
>  .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
>  2 files changed, 196 insertions(+), 142 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
