Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB091C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:59:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09326135C
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09326135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrbA9yXe/0P4AIXeGi6x+qN8FgJwF/XQ+DAKslqta04=; b=jpkZhHYmKXZPNRLdnjTdx6hkby
	zS7sZgl1YW+vyNHur+AVGqrZPAjnFCXK9UnAQzoPM0zfUi3M690K+nMqDHXibQuJHMDJFD2ce6kmZ
	G3X94pt9LxvaqB/RSZDE1+TOjOLfcARVKnw1ZwKtHcSmKPIYLOBUB3zjwLyN1UfHO79yPc0X5qZG1
	USUYAalBOlcrAUKppMtaO4O640l7UVyq76G2CqocovERYdLuYT+ha7uorXglRm1p5Xt05Ct55ur5V
	yLgwTioOw1/6GjY/Njf1ahhxu0/isu16yiOc2TDzWeyi0dlua2Up76WzY8cnwqFRWOkXGx5qtL98E
	Yk2s3mRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuQt-003PA8-Dz; Fri, 21 May 2021 01:58:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuQL-003Oxm-FS
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Q3AVBLeEjNCGN7VKTkQFrmo0hpViq6C5T/td9kc4Wtc=; b=Zlh3xTArSFsYTzwb19jIEzneA3
 iBGxQ6V/mciky/ruiwRkHddndkks1p0R4ZEvK1//PCys9vqQBc6VuJW/6gVlAC7TGb9h7h4WFNTsb
 F7Y3rX0mRNzeT1T02F3JsP9ExAlyo04LDYMng1ClSDCxAwDyrZJM6HDDoN6z0zOhUsT2kTGElC1Df
 k6gz9VsJxyMyb6UwBOyTIsyUdjef7AAdJrxuoZed0FHouam4tci+KkZ4jQ2ANzchmIwA1LUiXbe1h
 3CxMD6ar5asqZmNZIGWNUh+LFgrGid0OHWploNEOa2vpf6BL1L+MeYRBEB5i8W0vlOu0A4hfcSYOE
 s8PBlXcA==;
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuQJ-00GlAe-0g
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:58:00 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 q17-20020a4a33110000b029020ebab0e615so2316528ooq.8
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q3AVBLeEjNCGN7VKTkQFrmo0hpViq6C5T/td9kc4Wtc=;
 b=nu2Dt3Jq8VvmFitInlrF5TWLqVkB8Ou88aQbT1w/0Xu2xDSngyzP2yLaQByA5emCF/
 V+9HU+lvJ8PZKT7Py1wUCJjSctl7C8gLMRxsspxhuf6nRI3aaWT+lMP0VgRCPyhO8Hsv
 d8BV7sTX3ChniiWtvPKaR74QHPq+4e+2787jBFxw6gb2Z+5ahU43L/uifA57hWQpdYgs
 vFCaUHakyH96nYgcfc8ssZfwkEpGDudPZNg6HJnYY3/jOgoosKi3NLu//ZuuGwjiCkfp
 sZgxXKdXGiGVAERnyFMSRjQWCjAPbuxBYDkcnTIyEz4xOMJbn6VkVVavMnzLhwChz2/L
 faNQ==
X-Gm-Message-State: AOAM5305n4qmRLNNdTTE3A/akJDEWojPsmiPXUCMwbQ0RUZ82Ok1xWbK
 mGDTw90hqrKcOWWh2it2aA==
X-Google-Smtp-Source: ABdhPJyM3l84gvuir/2ulWRoGXGz1qtS2ZijHaIYTaoX19YDlJHfqGi8aGyPcL4RD9+2kOnB8Yhn6Q==
X-Received: by 2002:a4a:b402:: with SMTP id y2mr6035318oon.87.1621562278050;
 Thu, 20 May 2021 18:57:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y14sm974929otq.4.2021.05.20.18.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:57:57 -0700 (PDT)
Received: (nullmailer pid 2494659 invoked by uid 1000);
 Fri, 21 May 2021 01:57:56 -0000
Date: Thu, 20 May 2021 20:57:56 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Srinivas Goud <sgoud@xilinx.com>,
 Helmut Grohne <helmut.grohne@intenta.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v20 03/19] dt-binding: memory: pl353-smc: Drop the
 partitioning section
Message-ID: <20210521015756.GA2494603@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185759_074529_D7FD2A1C 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, 19 May 2021 20:26:20 +0200, Miquel Raynal wrote:
> This sentence does not belong to this file as this file describes the
> bus on which various controllers are wired to.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt        | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
