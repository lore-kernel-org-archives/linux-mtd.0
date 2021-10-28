Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE304C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7866A610C8
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7866A610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9np1QG0SubDpBQiEoQxO8M+Kqs2UB87PUSPjSEvdgw=; b=i6kzgOUSn+sdz8
	nBiR4Cfy50aM1oEiqOCN+EesSvLpm8t/3JQ8Anhr8NDru9aQR1wKVztCI2ViuNmPSTchQ4ipWuEjt
	KcTVDp5Ysj3CKOKSKJ6nIQ3ZmPV4A7xz+iM/aZwj57kiPGEC8vkn1A+yl8jIsp8UjyhBR27Q+L6M8
	Eb5XS5ZpVa7ripgsk08dmedrGNYxnLBNrvuokXKbUkorWPYCkgQAHFXrkYn5Pc0sPfOkBSdQlYuUz
	H8WRVVSIqxh1d8899P/d8xp8XPW/Kg0paxAJsV5IEeoyoi8pmVJjQipQxl4uv+geHMbpbjSTRwp92
	U3k8pgsHP989VRvl9ohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDAc-009BPJ-Mh; Thu, 28 Oct 2021 21:42:46 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgDAa-009BOo-7n
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:42:45 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 71-20020a9d034d000000b00553e24ce2b8so5924061otv.7
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uVpB6t/XH+sh2qfT1aM2PNoYeGU85zqXSS4jjTp9y90=;
 b=TMSz8qf2T1rLPLRzNpjaFRHuSvEmj24EwXLs0WBBzZzmFexom3gDp0TK1nj4kx3l+k
 sFztvU/WLVs5pQwZUDTouublUJ7Tt2UxK6/ArV8VVzqCuqyzf2aq6SZopsg/kdJwe0AC
 zzKJsMZakuRw5XYRlYKVzUTQ7GgPAdQVrqaY4wSNdSj9LTicPk2kbx1Et+spcnxxhe9Q
 jhzWpPGwVyDlsWnFHYPbur/+C6MlEUjXXq2IlnF2+Gj8Md1QjIoG4TnwW8RfoMVzcG/I
 taPDaRBm0FxhFQK8hOOMBUJ5EmLYFry6y1YIsxOcli1M2XLRALPsid1lpzXtAV6X/N8y
 bhQA==
X-Gm-Message-State: AOAM533Cz52c9aHQePsWyGi1TE59NIXfVXwd5Gvb6nL2th1SBw2Ac1BO
 ZE69MHZYvvUtoO4wo81VQE9wlrDHeA==
X-Google-Smtp-Source: ABdhPJy03vHBCBw25GpIZT2cQy06T0I69YsG5Io9Nkfdi9p8Jll53OaZVmFHQAoQgzXTLljfZbxSqQ==
X-Received: by 2002:a05:6830:40b0:: with SMTP id
 x48mr5379834ott.89.1635456915421; 
 Thu, 28 Oct 2021 14:35:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r22sm1352984otq.5.2021.10.28.14.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:35:14 -0700 (PDT)
Received: (nullmailer pid 627527 invoked by uid 1000);
 Thu, 28 Oct 2021 21:35:13 -0000
Date: Thu, 28 Oct 2021 16:35:13 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jaime Liao <jaimeliao@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 08/18] dt-bindings: mtd: Describe Macronix NAND ECC engine
Message-ID: <YXsXkfGNtMFLPMA2@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_144244_289792_2F804C6D 
X-CRM114-Status: GOOD (  11.24  )
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

On Wed, 20 Oct 2021 16:27:59 +0200, Miquel Raynal wrote:
> Describe Macronix NAND ECC engine. This engine may be used as an
> external engine or can be pipelined with either a raw NAND controller or
> a SPI controller. Both hardware designs with a SPI controller are shown
> in the examples.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/mxicy,nand-ecc-engine.yaml   | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
