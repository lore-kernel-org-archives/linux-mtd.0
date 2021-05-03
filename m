Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA836C433B4
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 17:13:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1A461139
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 17:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1A461139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQHsB3eI4i0q1PN9U3DH28b3nrbw+4lrPNTLUjhimHo=; b=R236SK8VrEBybE9BlGQJ8QeBU
	WPP9AZsVtcv6IvXOrxiiOtSsFEFlMrG3cwHVeBFDYuM6tiT28rfezDIRqdQvjii19ezhRYn481Cy+
	j0QMcvQIxM4q5D7Fk6ufISfkpa4Hk8+FEhzbrrFUm4jUAacerPsZ48yXyFuWjCPCHGIjK8YagXvTM
	PYelhLXY+CE6n/mBWgSLDR8+Vo51L/yoB6FYfgSynylq8U/p+70fVoNWU8c8ImDmDmXZPEx1Dtd11
	IzZqb++Hes8suM9MeIY3BbKA9ro9WFd6J29YNG1YKik3EKkV/Oaob/CPoRXvXSCwwM8QmMAl3cUj1
	A2ro772NQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldc82-00EUGW-UN; Mon, 03 May 2021 17:13:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldc7z-00EUFP-OT
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 17:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PrYZjc9ZeAaylfGZNHsPJJqtE6OP3ubmNVC/kS3BNiE=; b=4IGTeBp+ZqYQA2u9Er0GRplfJY
 rxgN+xU1W8kFulgER7xQWpcGqhFe8TWW+cFHjzDx5qDNwa6cBKJUkT/ffSPA5KW8tIG03S/KN0PlD
 7IYlcAxeQq56Q1AfO1KayfkLepUbalYxW4pewjTKXraIyHneJFU3SboCcmhKOIfu5OTKte8quMS57
 bUk41Pe7cN+LK0LNd8kIO6WQfXeP7wrfXVB4jfGPLdPzEOvh+bSJfF6WfhGHOPE+4HfgyjJQLPzFO
 +BoRbOoO25DpqTZ1KB4nZtTa3K7AvMXgwxKUx98FfkCM+ckPh5ByWZZiHijtlHNFqFVsFX3Wi5SrY
 qDRmKQPw==;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldc7x-003KfN-4M
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 17:13:02 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so5080377oth.5
 for <linux-mtd@lists.infradead.org>; Mon, 03 May 2021 10:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PrYZjc9ZeAaylfGZNHsPJJqtE6OP3ubmNVC/kS3BNiE=;
 b=QOjYaweGllVwDdM4FQQwrc9id7QOyUJwq+c+SlM6ztumkbUWxbCfIgE+cEsPpZELC2
 eMJRCvhHsX+QGYUiWZTjLNBovlqvlnwhUVLRU4Y5VuzE3AvWOJDWoCdvuiZkJ+VqhCG9
 YQ7DuVYMOyGJcnidIbcuUQEWxwYKb4wGloEtqhiDcO8amG++9tEhS65Qj8exMVldSUFs
 d0PKrL1WNbR3POIXzNq1iUKY+rRCFJifyuU98h8tiTgXjebs7fIyVaS46RjpvJoHlnA8
 yaFvh+fBNsIcKujHaVrIqK+cysF5cUC7xnhmZntje5OXZBDqDBr+gGzF48A67aPaiWqj
 ll4w==
X-Gm-Message-State: AOAM533j1hdTT2b1C9P0MxOq5SKpjZE+eUbFkTFK8tpKfMa0J3FiwkRn
 iMtJp2/bq0eEwh9Cf4ekeQ==
X-Google-Smtp-Source: ABdhPJxH3dRPJChZ0Za5RQASFcgUFBTFgzRgh2UbjxoGII4egCMhCBnEZJdwXGEhqjqxib3XnQ+nyA==
X-Received: by 2002:a9d:425:: with SMTP id 34mr15825076otc.25.1620061979847;
 Mon, 03 May 2021 10:12:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q24sm104460otg.81.2021.05.03.10.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:12:59 -0700 (PDT)
Received: (nullmailer pid 2028023 invoked by uid 1000);
 Mon, 03 May 2021 17:12:58 -0000
Date: Mon, 3 May 2021 12:12:58 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: mtd: spi-nor: add otp property
Message-ID: <20210503171258.GA2027968@robh.at.kernel.org>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-5-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210424110608.15748-5-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_101301_190361_2BDDB1F9 
X-CRM114-Status: GOOD (  10.65  )
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

On Sat, 24 Apr 2021 13:06:07 +0200, Michael Walle wrote:
> SPI-NOR flashes may have OTP regions and have a nvmem binding. This
> binding is described in mtd.yaml.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v1:
>  - none
> 
> Changes since RFC:
>  - new patch
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
