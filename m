Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB175C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:58:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB9C6135C
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB9C6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn3lPrvLeVvphjpzHVlfH/FPMp4u5MEHBJzCI7qb/zg=; b=UwSNvDX1DUSQwFZP2PAXGx/UD/
	lT+3QYTcLJEiXU9IsZAIUpcpYRj/rSJ8eOjHMQG7sNOsaDHYeKcIgzDoqeI/c3+AJ2jIw51/+Dnhq
	5yh82ybAz5tFegd6ve5UGwzxJ4wct5UzpNjyfz9Ox7/RO7YUGUaccku0d2B/9FdHq7JbxwqGMdaEb
	hNwJebjLtKkGkmhniJeQkA+AHFmLvaF39j8UhSnhj5gaRhtP6kmBnKGEMP0QObYbvdVa03Jnjy9F5
	a1dWNPnVvA5WJRTyrkV5Fcw+IYcPuOrmbIuLe5tR2WlrsabCMCqtdQRGUvcQKoYuATX/y+bq+IAoz
	jQ4KvmNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuPn-003OmJ-5r; Fri, 21 May 2021 01:57:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuPh-003OlU-Ib
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V/grUGlZ1IOFucqyPu1CObFEALt2O4ZD4el/NT6r+AA=; b=azkKAnll9jKpVkBD7cQLhLT1Ej
 5Irt7VeG//50ywXChrOFlP/26tkSdfN73CAg2R9iku7s5xBk6umqxDPOTDAOuwZtf9iXwwqDaOeaf
 YKbhnhSsl5/DwZl4oUvXt/TMaLoDSbGzzzcXkpACissbfyVzhr7eQcC56f2tF65WfPA6B5GxQB6gU
 c4lHIvcidQuq/sGB+sm6feKqhilLAYdxzStWhWTLwD3f0FTo/mRAfLwVAYw0j8EgjSRzqTCpcPgl8
 LW6jiEbhJJUPt/FF4Rgq+q88LG+5qaZNtAEV2Tg/ob3zosPLHqiyLfo4aVM6PJHSmqIDBTpCcgSNz
 At4sLFYA==;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuPf-00Gl8y-5R
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:57:20 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so6122429oty.7
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V/grUGlZ1IOFucqyPu1CObFEALt2O4ZD4el/NT6r+AA=;
 b=RW0W+vj7fv/5abRk0HHq5f2hv8FJnhlkg5wJpI2NBBzhdbFlyVWdGpfVAV1Fq90zt2
 gp3L/YwBEjFJP0V57VIArh/Uf7pg6uCNNXrG40Gp4cEBG2nAFX5oX1Z37ZvokOxjAReN
 09lYFSVLxyuP9hegoXGEYerTqrzRrEPsFgWaetMutUb1SMDtwWDkv7NX6djOSihiiWZP
 Kwd2wpfWFacUHsq/6Gfy8ythgI8Z+STgamVHAZoSffAGQnR7yucckqZvyzrrXnt4Gc6f
 9tmaf4OhRHRGLuKMfV4dE4cF89ac1Gnpy0/JPdHmAxCntr/l/k+QHpK+bQzR7HztgHJG
 MLCg==
X-Gm-Message-State: AOAM53005D+FDfJKR3JkkrZD5qEEDDxX3ZT/4JZ7wniMHc68oLWuCbcH
 EBwV/2+BgN6zM70jacxXQi9pIYBZ+g==
X-Google-Smtp-Source: ABdhPJxEPcmZQvSzJGRoVQ+CrSc/49kjuaLmfEwdVox1OJQKcJpkq2hiA9TKlvYkZ9w+0VJqBHyO+A==
X-Received: by 2002:a05:6830:1e8b:: with SMTP id
 n11mr6196444otr.327.1621562238249; 
 Thu, 20 May 2021 18:57:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n13sm911690oov.30.2021.05.20.18.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:57:17 -0700 (PDT)
Received: (nullmailer pid 2493231 invoked by uid 1000);
 Fri, 21 May 2021 01:57:16 -0000
Date: Thu, 20 May 2021 20:57:16 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Helmut Grohne <helmut.grohne@intenta.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 09/19] dt-binding: memory: pl353-smc: Detail the main
 reg property content
Message-ID: <20210521015716.GB2483864@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-10-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185719_228735_1E379A62 
X-CRM114-Status: GOOD (  16.77  )
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

On Wed, May 19, 2021 at 08:26:26PM +0200, Miquel Raynal wrote:
> Describe the two reg entries: the first one will receive the
> subcontroller configuration, the second one is for the regular cycles on
> the memory bus (eg. CMD, ADDR, DATA for a NAND device).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt        | 2 ++
>  1 file changed, 2 insertions(+)

This and patch 8 look like 1 change to me (if it stands).

> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> index 9d220d4cb39d..d388bb87365f 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> @@ -6,6 +6,8 @@ of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
>  Required properties:
>  - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
>  - reg			: Controller registers map and length.
> +			  First entry is for the configuration registers,
> +			  second entry covers the memory bus transfers.
>  - clock-names		: List of input clock names - "memclk", "apb_pclk"
>  			  (See clock bindings for details).
>  - clocks		: Clock phandles (see clock bindings for details).
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
