Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB1C43603
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 20:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6527324679
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 20:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WDO6USDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6527324679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV3bP9Tsz4vzFTHbEtSNG+gbXfQYIL+gv/Av7CpO+ig=; b=WDO6USDxpb/roJ
	V0L8r5mfKi6ql+0YmjRIjE0WiPIXIJieh0eCAI5yn/qx1W9P8fBFOx3lo5dzIhQlripr8BIqA540q
	shom6TK9REzrtFCH3iav5igBnLQ4UyOsuHUTE5bTQGiQREtDXqVBvHFzN745/6U/dug4h7zFRcc5R
	U+MGWSAQBB1PwxB4WY4ZND/ELFw1cKCoFbb2f+2+op4qNG7jQd1+nOMhHkp4wPZgnhEdfuX1jfxWC
	85ApmBl5HTTsqqL+3y3mZviDxdC8e529aTCJth3ZNSKnWXO/ConqGw1tfivzv+4Qup9UcjQBtkyOs
	IQHmyXHTw3ffcew8c1mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii2bh-00018m-B7; Thu, 19 Dec 2019 20:41:13 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii2bf-00018K-0q
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 20:41:12 +0000
Received: by mail-ot1-f68.google.com with SMTP id k14so8768500otn.4
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2019 12:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ByzWV9jQ42I8H61pJhTEJg2HQzKM8ixPWx+v2AukYEM=;
 b=kDNn5iUh+TUVlBbCUET1QNy7SqKjbUw2duG97/KN+BUGtxJzreXnmzDqaNTnIkFiJa
 0zOFDMOxbBJsJrLOpdNI+PWnxhOXBA6KzY9J013iOjkvqAKiuheq1ibLYhEJKwW33UmC
 0oDyk5VGx7cIhQM30FjPi6gZzhBF5vbifT9K1zyD4jw7NxRdne2p2VADuK/guviNZv2L
 n7HW6L5tQFnDArCWGHX+cMX3RMwBh2zpS692d7qg9ziMKWlu/kilshVQm2SAt6nUj2EZ
 iNYhStyYW2CzrKYLacV727fzM8nHVxxAOFvcDik3nohZIJzbOBMKmWrdO2xcYM/Hbz/E
 4MoA==
X-Gm-Message-State: APjAAAUR4KSHKoTtcGPSqyet3ovepXopAyrMo41nm9n1Ib3ft0bSdqrf
 yyQLxwe6qlUnXQkF1wUEIw==
X-Google-Smtp-Source: APXvYqyjooKf0liQejF9UvfBxpvsFYqG02ef2XIHLdG9X32cx+nGtgWDEym6T58BParbzR1dPtH5+A==
X-Received: by 2002:a9d:65da:: with SMTP id z26mr2006772oth.197.1576788070351; 
 Thu, 19 Dec 2019 12:41:10 -0800 (PST)
Received: from localhost (ip-184-205-110-29.ftwttx.spcsdns.net.
 [184.205.110.29])
 by smtp.gmail.com with ESMTPSA id j23sm2333837oij.56.2019.12.19.12.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 12:41:09 -0800 (PST)
Date: Thu, 19 Dec 2019 14:41:07 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 1/2] dt-binding: mtd: denali_dt: document reset property
Message-ID: <20191219204107.GA7670@bogus>
References: <20191211054538.8283-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211054538.8283-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_124111_068120_531EAC4D 
X-CRM114-Status: GOOD (  15.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-mtd@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 11 Dec 2019 14:45:37 +0900, Masahiro Yamada wrote:
> According to the Denali NAND Flash Memory Controller User's Guide,
> this IP has two reset signals.
> 
>   rst_n:     reset most of FFs in the controller core
>   reg_rst_n: reset all FFs in the register interface, and in the
>              initialization sequencer
> 
> This commit specifies those reset signals.
> 
> It is possible to control them separately from the IP point of view
> although they might be often tied up together in actual SoC integration.
> 
> At least for the upstream platforms, Altera/Intel SOCFPGA and Socionext
> UniPhier, the reset controller seems to provide only 1-bit control for
> the NAND controller. If it is the case, the resets property should
> reference to the same phandles for "nand" and "reg" resets, like this:
> 
>     resets = <&nand_rst>, <&nand_rst>;
>     reset-names = "nand", "reg";
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>  - Split into two patches
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
