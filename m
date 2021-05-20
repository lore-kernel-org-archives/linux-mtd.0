Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9B9C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 00:19:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E36610E9
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 00:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E36610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMXe3WZ1C5i0KOgEyVNgmv4SsKjO/02T5Ib0lVB/Wfk=; b=LFe6UOup6YSyIH28OdpX61tp1B
	G5ZY+iOSu9pskM6akX/swML2mtz8RVDzV4gFamYhEi38n+KE1DBMtxoMFnf0syJq29XHEtasaOfLL
	wEBqVUJx+dQ4y0RIc7So9cYuSlMkOBPvcfxk5PZr1QwLzBcCzxoQ5VLYlhpymw304+1pjxSk2w+hP
	f9eEBR1mBTl0zpSPUizktJf6q5TV/hTaTvf15iqma7RG5XyygcwH6HZ0ryg53d75rRVxA4mTT79zj
	6ynwHOTwZjZjXB+tAA2A5E54ISQ6aWY6WytZkfdHHp2bXPBlH0TBI8CZSHGlBOc3b8zPkqLg+oIY/
	90P3mM9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljWOP-005R88-91; Thu, 20 May 2021 00:18:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljWOL-005R7p-D9
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 00:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rfubOJno7rnZfcmxfaq9FuY544FZq7RPYg4byIShu/0=; b=ee9e19hty5CJ56OLJj0C+yxBgj
 1+egfegtTil5k/z14MqAjP+z0t2XUxnEgs8EZkB5aNtLR2P6kTu33XmQs9QKp9hHlT3Lq/tcplvre
 w9/4ovXz+XRbg2gjMMH/OOrPse/plf1xjmUErar0PBs4NVFf28MLQPjYL242c+zMGFXlqX1gq3sY3
 5aqxQidi2DS/cdOWVWVyyKKpzllbprSIbAXvWUNPmV3J4Sx0G4iKWdDjN1F2hTxa/8DG2f4X5hSn/
 IQe5fJLZ6p0zTdLoASJzzJpms7UE/lhVYVA6JXF3MfvyUUOKnGRzdbUvfRzCTucuHXy0p75a7zkYt
 gXylqpgg==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljWOI-00Frc5-Lt
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 00:18:20 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so13413095oto.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 May 2021 17:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=rfubOJno7rnZfcmxfaq9FuY544FZq7RPYg4byIShu/0=;
 b=EqdxFx7LyTS0g3eDFt3d2hmbM/NVZwyMOmzs1S4vnXuDPVb25wBekweJCIQUORlpdf
 8L86cKNooH72+IX6b+AYPioGQ+Y6w4hdAUDShLNKYhcsTNrf3T0kb7CfoGvue87aMx1S
 Z2cCC8v93nBHjpOrjRRUh0z/oAMZs7dyhXu2E6guXkSEIQgmUkPZ71duLc3nqmUl864L
 dC3h/ZT3cXbYcfd8nETg5IJ0j5cg8GrymGdCMHzYoYg6p4t7KjU9APF7l5rc5B1YLE3O
 WPFLUyLPeHeO1V3r1V+3uYUHdgzClkI9BMZhJGLnV5lV3Ra+dggf443jBQE44xzYto8A
 LccQ==
X-Gm-Message-State: AOAM532FP561cnxWfOLMJycn+NzLiZiSByyar+VqSEQqeOE7xSoEt7Yh
 vr8U8t3SHPWKyS9QXfM1KA==
X-Google-Smtp-Source: ABdhPJxu55tlzcQrYvvI4bjUSD6P1xiUDlsnE6S5OnHx79RcXdAUwKLhS+8UaUzMldWkvNVqWYzmSw==
X-Received: by 2002:a9d:269:: with SMTP id 96mr1764305otb.222.1621469892748;
 Wed, 19 May 2021 17:18:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d19sm213284oop.26.2021.05.19.17.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:18:12 -0700 (PDT)
Received: (nullmailer pid 3946397 invoked by uid 1000);
 Thu, 20 May 2021 00:18:10 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michal Simek <monstr@monstr.eu>,
 Richard Weinberger <richard@nod.at>, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>, devicetree@vger.kernel.org,
 Helmut Grohne <helmut.grohne@intenta.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20210519182636.1110080-19-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-19-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v20 18/19] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Date: Wed, 19 May 2021 19:18:10 -0500
Message-Id: <1621469890.766281.3946396.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_171818_733394_35471B81 
X-CRM114-Status: GOOD (  11.66  )
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

On Wed, 19 May 2021 20:26:35 +0200, Miquel Raynal wrote:
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dts:21.11-33: Warning (reg_format): /example-0/nand-controller@0,0:reg: property has invalid length (12 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml: example-0: nand-controller@0,0:reg:0: [0, 0, 16777216] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1481118

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
