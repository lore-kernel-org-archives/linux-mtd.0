Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE695C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:13:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F6E61376
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F6E61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6tCaTGzejaFkBDmmj2Fq5Ur3aEc6/oDEkVMojWqS/Y=; b=bM0J1xxxXKcwFf
	alACsdWW7CpQv6Hm0FP7y5+2WkGrVqzjJMo5U/bmvgVkLtriguHQCV3d9rIG2zTmi6axQEOkQGWug
	KDvA8w/6AB6DMhYHDJzvFS/vhsgbdb5RVLLTQjHKCGby8wjd/aMnhCMP+r3m8MzxeNThGDTr3kx8O
	JPzKE7blq95IzNRCaDIo8fsqVMRQYmQ2Oiho9WlLtJjc+1GjubP2OEEmOEStACD9fkOvOkohXCYEI
	hIwwDrkkT72tM1tEiGOrd6AcXxB1T+5kqEdWw2Zuk3MLGPpHVT7S1tgjDRPpVMIAOBs08jWvVZPpP
	WSvknrunq2lZRdk5UU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1kl-00FDe8-VO; Wed, 09 Jun 2021 17:12:32 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr0sy-00Eqy7-O6; Wed, 09 Jun 2021 16:16:58 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 l15-20020a05683016cfb02903fca0eacd15so557476otr.7; 
 Wed, 09 Jun 2021 09:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CHX5KZWTpPcC/yJko/I/+4jvnHoXctpkINpWSG1gYOU=;
 b=JC+PizxLg23qghV+ExlKl/oN4AILsI0m3aODKVXQagzlmxOpjWGf+G/3aNY7bAlM6d
 Ljo1iO/SxsGXofDzCY6IR5RBQXHLPaE4AB/vyg9cTH5L26SaUYbL8xwDb5nxcFkfWqgx
 q3zXs8n+bKYddsGDE2ishJxeruSadQqrucv2w0j6R4nUcTXTORw8QMnO2I/Zx8lxjfhP
 WnlOlQXc0suY06lcOBImbKo7hLVrYMWvudYs888FkExi9TfJtBku5BOilX6khFI7E5VX
 9Kkh7hmbji6v6ndYeF1S5Sc9HJjLUFJjpWLaemdjFmviXHQ4u21QpE2b5ALwy74Vk6+7
 8f6Q==
X-Gm-Message-State: AOAM532NUaXrSPdkI6LkTz8Q1F8ix3B93mBzePGGyxsrw0vzmy/TDK17
 PBP72dR71uoq8k3HFfyiOg==
X-Google-Smtp-Source: ABdhPJxVyGxyGLGNx7gbHhTpkRi1VCa2iO+S92c5wEEUjPoMljEIPQVGMfNm0TNIzliApcqPK7juEQ==
X-Received: by 2002:a9d:7a5:: with SMTP id 34mr140930oto.371.1623255415676;
 Wed, 09 Jun 2021 09:16:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p25sm34364ood.4.2021.06.09.09.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:55 -0700 (PDT)
Received: (nullmailer pid 3763306 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, linux-mtd@lists.infradead.org,
 helmut.grohne@intenta.de, Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Srinivas Goud <sgoud@xilinx.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
In-Reply-To: <20210609080112.1753221-18-miquel.raynal@bootlin.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.668043.3763305.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_091656_847030_6FAA89A8 
X-CRM114-Status: GOOD (  12.06  )
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

On Wed, 09 Jun 2021 10:01:11 +0200, Miquel Raynal wrote:
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml:0:0: /example-0/memory-controller@e000e000: failed to match any schema with compatible: ['arm,pl353-smc-r2p1', 'arm,primecell']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489731

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
