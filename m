Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3EBC48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 21:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7CE61209
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 21:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B7CE61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilQcybaWNUFRFaIs1K7S9qJEyaNsMaufPaxDa2/UP+M=; b=qLyn+xjZd8PN3J
	vk1S/Q5NopAUop6m+eTFlLT7ZR61G+M2xL1H6kTySROCpFQU5MZQBt0lIp9kh14b+v4gJUQz7ZTGR
	vGLw4V4fbwOm+2e9ZudzYuLfMPie5AmAXs/5SkV12CzcqxGVrlCUvi0qwqx7inCgWybCQgMnVjycv
	RVkSdahnSubwGU2h6w06C4RFWyWmFq1QOdaucHk9+cUtPreDYVCWMXmO0V+6w8bfDmqHGWZHU9g51
	LN1yn0B4cWffMlFFpSCHy2IO6oECaliMw2W6Ge31p0Y11fTn/hcaMtYOa7BV7SjFwCN4FxHJGdJPU
	VXFvKWrfPgoPtG+PrzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLtU-00FZc8-Ow; Fri, 18 Jun 2021 21:19:16 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLtP-00FZbR-OR
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 21:19:12 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so11046815otu.6
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2021 14:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l9X3y+oTgc/s2ZKvtLg5eTECZ40y9Q5YZF/VApYDZBQ=;
 b=DuN2pEXZUyUfJp2ged1gnqmQ73v3sayW+QHjU5/cdmo2BP3BpQeBWSLNgPpYOf/qGZ
 poZ7htgy7iJdcx+7OFXwxshKSB7L/hTZBySa5YymyvIcEqXfsNbi7EMvd+Ow5JlDbosY
 BnVjO8PbbzzAZyqYSAS4ZeUmpVhNHC81xloGamoi5IipJp37d3z9wntm9I2PBE9SLHnz
 aLtdGQZLUL5pkir29xrNgz+P2lwz3aYyQSLNF5/3ErgxUGTwT+L3/pLGlQ7V7A/BgdVc
 CTahjsU/k0mdPGajyhzjSien6VHUVmz+WDQ7HlMU/nW6ClLZ64e5T18M/Ozf7L6qJ0o8
 wYtw==
X-Gm-Message-State: AOAM530NTuXFaOv4Fy4qKsj0EJA6BhDwQMRjapQT/f+mt4DFr4trF2YL
 lE+pUrW3tCb7C5ku9hiubQ==
X-Google-Smtp-Source: ABdhPJzmhQMJ0CZuK+9aZ2YQsXhrGQtK/6F7eadkW7wgdNpSwDHyCtr4t3BoZWIZ5CFVWk+qHiDeiQ==
X-Received: by 2002:a05:6830:90c:: with SMTP id
 v12mr10672467ott.7.1624051150835; 
 Fri, 18 Jun 2021 14:19:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h7sm2368212ots.44.2021.06.18.14.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:19:09 -0700 (PDT)
Received: (nullmailer pid 2927088 invoked by uid 1000);
 Fri, 18 Jun 2021 21:19:08 -0000
Date: Fri, 18 Jun 2021 15:19:08 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 "Ryan J . Barnett" <ryan.barnett@collins.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] dt-bindings: mtd: gpmc: Fix the ECC bytes vs. OOB bytes
 equation
Message-ID: <20210618211908.GA2927042@robh.at.kernel.org>
References: <20210610143945.3504781-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610143945.3504781-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_141911_837715_44CC61EA 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, 10 Jun 2021 16:39:45 +0200, Miquel Raynal wrote:
> "PAGESIZE / 512" is the number of ECC chunks.
> "ECC_BYTES" is the number of bytes needed to store a single ECC code.
> "2" is the space reserved by the bad block marker.
> 
> "2 + (PAGESIZE / 512) * ECC_BYTES" should of course be lower or equal
> than the total number of OOB bytes, otherwise it won't fit.
> 
> Fix the equation by substituting s/>=/<=/.
> 
> Suggested-by: Ryan J. Barnett <ryan.barnett@collins.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmc-nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
