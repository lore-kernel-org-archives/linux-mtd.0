Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF692C48BCD
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BCD613FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83BCD613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LieAkNw84xa5TcY6cdWbeUqPeK4QaU/fhKlXt4AdBJQ=; b=SCp1e6kW5Fp+CK
	w4dusnP53R/0RviqxoHhVr3zwFx8cPT4Lxn6VKvFOe+BE0d37OK7M0q3GANpmE8OJuncXNydAVdet
	KjuVqjT5UKsaxuPy7/t2gvpqD8WrPovR5q7vy8TDnHDfz5vzCc/DaMp9flHhZGNLkKo1FZ2xEHVm5
	sPr6pQmQ77KsN6UgeSVrNeHvsXdO+pvEE6OxPmevR2pn5lse7MDRJnD4284HjZlu7c2NClD8PCHL9
	9P6PmlBPp+CEzLXpdm5j9objQvOUiUJVRCONUdQOhfsPrS5UgxwiqdlKe9IOQDGui0Qvw3X/GFicd
	1S7XPmVa9uXx6c3cE7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrAX4-00GSpU-UF; Thu, 10 Jun 2021 02:34:58 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrAX2-00GSUS-CS; Thu, 10 Jun 2021 02:34:57 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so12316973otl.0; 
 Wed, 09 Jun 2021 19:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w3Qk3mDaHVdG6iOni8nUWBguXf5d+3DBDCqBEu56Bpg=;
 b=T8eKqtQDuZV23ePWNCAKMRTxLOhpFeu+MkXi/wtyAblnUJUICAW/EYnvSopWvbp6LE
 fZmavmEAcNRnkJodjUkLa40DqUFQzGYYVHbS49pmZY68BychSi5inG9XNDcWlDypNNhs
 VrxW/5VvYnG4MgOPNsUI4M31J5VEtMvaldKxQJ7VD1g9Si+bAkCM1zHJfGJESbUnj8pB
 kbOJO5O1zKv6tttBlwH0nvMGg2s7LyhjP7beWBEa+jSg9KoLuxWvD5tBW9CptQ6Uaf7E
 ciEl9mUg32jFFa7fLJ8RPTPxCuAZseuvXwQxLLkWnyGCmga770Xa2yQR+fakqupm20un
 AIgw==
X-Gm-Message-State: AOAM531j7K6Kk7sGckXyGZuQPItzXUHTMVfIeatQu8CT8ExUKLD3taXM
 K5mHVz0rbCDQNYI1SZAByw==
X-Google-Smtp-Source: ABdhPJz5Fm5SOTjq59+89tCBY1vEuqORfUL+b3CCToeDK1+/IClyQhAK5cM1UmY8xOZaiA5MX01xGQ==
X-Received: by 2002:a05:6830:22ec:: with SMTP id
 t12mr540593otc.243.1623292373914; 
 Wed, 09 Jun 2021 19:32:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w186sm319636oib.58.2021.06.09.19.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 19:32:53 -0700 (PDT)
Received: (nullmailer pid 672655 invoked by uid 1000);
 Thu, 10 Jun 2021 02:32:51 -0000
Date: Wed, 9 Jun 2021 21:32:51 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210610023251.GA648931@robh.at.kernel.org>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
 <57ef16cd-33e7-6c16-3a24-9634f47831b3@canonical.com>
 <20210609153621.1303bc4d@xps13>
 <6fb9c0e4-43cb-d224-0ebe-568f62ac35b1@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fb9c0e4-43cb-d224-0ebe-568f62ac35b1@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_193456_448612_69D7C1C8 
X-CRM114-Status: GOOD (  22.85  )
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

On Wed, Jun 09, 2021 at 03:57:05PM +0200, Krzysztof Kozlowski wrote:
> On 09/06/2021 15:36, Miquel Raynal wrote:
> > Hi Krzysztof,
> > 
> > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> > Jun 2021 14:01:10 +0200:
> > 
> >> On 09/06/2021 10:01, Miquel Raynal wrote:
> >>> Add a yaml description of this NAND controller which is described as a
> >>> subnode of the SMC bus.
> >>>
> >>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>> ---
> >>>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 57 +++++++++++++++++++
> >>>  1 file changed, 57 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> >>> new file mode 100644
> >>> index 000000000000..e72fa14b4385
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> >>> @@ -0,0 +1,57 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mtd/arm,pl353-nand-r2p1.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: PL353 NAND Controller device tree bindings
> >>> +
> >>> +allOf:
> >>> +  - $ref: "nand-controller.yaml"
> >>> +
> >>> +maintainers:
> >>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> >>> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:  
> >>
> >> That's not an enum, but simple const without items.
> > 
> > Ok.
> > 
> >>
> >>> +          - arm,pl353-nand-r2p1
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - items:
> >>> +          - description: CS with regard to the parent ranges property
> >>> +          - description: Offset of the memory region requested by the device
> >>> +          - description: Length of the memory region requested by the device  
> >>
> >> Doesn't it depend on parent's address/size cells?
> > 
> > Yes, but as the child nodes are not defined in the parent's binding
> > (ie. the SMC) I think it's interesting to have them defined here, no?
> 
> The trouble is if parent decides to have different address/size cells.
> The schema will stop matching. I am actually not that sure if such case
> is real since the pl353 NAND part will usually be connected to pl353
> SMC. However the schema now hard-codes specific dependency against
> parent schema/node.
> 
> Rob,
> Maybe you have here some thoughts?

I think it is fine given the parent child coupling.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
