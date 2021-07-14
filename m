Return-Path: <SRS0=9oOa=MG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A145EC12002
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 23:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC73613C8
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 23:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC73613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Hq98DgZnKcjvtZgbFMsmHC4KpaP8IDaJjyB6Y7PFQ4=; b=MF8+dXBxtwoPD3
	nzSc3wPqRVlVkkM7lMgv2FNNEj6ncQozEgoJrtT2umKsq/5u50qwRX+cG3F+VJUJtbmBo+9TORTrZ
	rsz8Ok91LXnVV9YMPrj1cMOy7xszF2UgKkQCjsIgBOWytDmEfazww31eforesv4iPfMdbnbZbk392
	LCElFS83EaotLKgvLPJjXWwHVoypAP2QN16ulw3dQ4m0MRxhzD6ku0P8nxi5DPGY4W21szqWfagg6
	FaW9tIJGAz66tfDH6gypGf+Pucnmlu5fjnvb2rosco7Zj8RxCvU1Bbdlh3sT/bxVcXsLyuJmlhOTF
	+duiHehWHMH0r+E0qAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3oQY-00GLTf-4I; Wed, 14 Jul 2021 23:36:30 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3lt3-00FBOY-H4
 for linux-mtd@lists.infradead.org; Wed, 14 Jul 2021 20:53:46 +0000
Received: by mail-il1-f178.google.com with SMTP id j5so2948301ilk.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jul 2021 13:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jr13OOnV/5xQJZmAAzLknLpGGMlSu87JqZcDrYUOYUI=;
 b=TslzljIpQYxI3ZyyO8GI5P9QWCeVLv1G3g5RtciIZyNknLbFKbrNxD70Z1woO++r2L
 wHb7yBuSZmwtOVp+S4/EFclnCaqg5MD+lCsa64sa4speaPQwtCLkXLNTo0359E6HPZVh
 VgYrtkA0jMDqOc0WK9//jY0q0avSqKCMG/576pDtEpWhtgyyjma8zNVHEww0sbY4KhH6
 drMjmrjHWdhkfJFgdsBvR8a+vY3bglWglRPLBOB++S+FznKC20tcMS9HEEbAy1EKZ7F5
 MsZZaXnQBFvz3hwhU7AMVdLRncpqzcEtvJq5Eqp7uGhqyxdfxa+UbqEdEfvYsfVCdMm0
 Yddg==
X-Gm-Message-State: AOAM533b54ilwN3qNGiRjBZfDPSfONENQZ91PtaynaPLYqrGZYNNZmb0
 KGKP75pl/WEGoP1HAbBD5w==
X-Google-Smtp-Source: ABdhPJz56d6TGksTBsE+Egmj4caxPDuY0YSu77IZ0tPX1ExSHNPhuqc/BGv3+2ro0VauAnkfNAH/6Q==
X-Received: by 2002:a92:d98c:: with SMTP id r12mr8512532iln.304.1626296024209; 
 Wed, 14 Jul 2021 13:53:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x1sm1752660ioa.54.2021.07.14.13.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:53:43 -0700 (PDT)
Received: (nullmailer pid 3503450 invoked by uid 1000);
 Wed, 14 Jul 2021 20:53:42 -0000
Date: Wed, 14 Jul 2021 14:53:42 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] dt_bindings: mtd: partitions: redboot: convert to YAML
Message-ID: <20210714205342.GA3503393@robh.at.kernel.org>
References: <20210628191440.2823024-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628191440.2823024-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_135345_650275_2B866924 
X-CRM114-Status: GOOD (  10.30  )
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

On Mon, 28 Jun 2021 19:14:40 +0000, Corentin Labbe wrote:
> Converts mtd/partitions/redboot-fis.txt to YAML.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - fixed yamllint errors
> - removed @0 from flash
> 
>  .../bindings/mtd/partitions/redboot-fis.txt   | 27 ------------
>  .../bindings/mtd/partitions/redboot-fis.yaml  | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
