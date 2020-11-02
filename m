Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3703C4742C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:43:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A832240C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Al4oBcAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A832240C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TO4oA8f5FJEGAh8zDCCR7K5WR55vNgCXxDvm6ZQLoA=; b=Al4oBcAgnnOURq+/5POSQJxKE
	/0YMGeSlkDq7aWoDAzRkyOyawAgbZq2y9R5qgoOIqrF86cXZTs15fXA2n+MK/dcMf3lH6IvufECcG
	QgsZo8aNiyQRCaVb3rf1+IRf1rikZrNgPM30P4pTdj4Rgsw162jHdBH1WBmxmd8fBA1+Vb0x/EslT
	rxjEj8C60QuGibt4xEi547XWDrHKX44d6WeGrz254KDLbagarP5/tuop2QBUKWvRCfrQwbMsOvTRc
	F58TH3lr3DMzLiykmYEPKJyeeb5OpRhRp1BD5wcU4fnNfKEwqMKaCXlNrd+lUS+LYESHaEuLhMcU+
	qKm3gdwQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZ9P-0001lW-RS; Mon, 02 Nov 2020 12:41:31 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZ9N-0001kq-LA
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:41:30 +0000
Received: by mail-wr1-f66.google.com with SMTP id w1so14444686wrm.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 04:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vE+PH3YLHOhOeLKgAfBwuoHNLUQzsqJV1bKYObjVQTA=;
 b=E1rBbVJVyafkP6633m84uKddYH98tO5rR1+PW4M2IrLXF2zUGiZm/r0Wbz6Fm6zAM/
 dOMRNTy5AoNXB4n0lgKbkytlUrpFsVqhJVwYl5eRFcfO9AQ3Li8ZlZrQq3xEpjOINPtq
 P4QzV3lTgUT99bA1ZdeM6d8NrydnFzNOyRSk88UhS/5TMvdtW97Q84/tIollph+ahWS3
 WO8Ykyg1IyZOCkvapA0Js8r0N6xiH/xVBcUy7DUctZ0cemEW6UT2gGrhtMSjWjBZzESA
 VBOItCNU9qvAa8JLYDLFdt9RSWvofnYTZmvbkuso2nPzrAE04BBIQwSEC0CzdZ2j+GCa
 7qCg==
X-Gm-Message-State: AOAM530oVlGQZ0IJ029Z7aHWTM5NNblaWaP77nxbftZ3O530ASMiXSDj
 dJm9w+C/GzLmiJtF8oGa+xc=
X-Google-Smtp-Source: ABdhPJxO96MjaHNz8VC1k9cRxHvlW6BeV6r7uvMv+QRAZP+NenJAbJ9TbyqjTJjr4zWYDBgKznzRcA==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr6564318wrj.328.1604320888114; 
 Mon, 02 Nov 2020 04:41:28 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b8sm1396420wmj.9.2020.11.02.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 04:41:26 -0800 (PST)
Date: Mon, 2 Nov 2020 13:41:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 17/23] mtd: nand: raw: s3c2410: Add documentation for 2
 missing struct members
Message-ID: <20201102124125.GA437900@kozik-lap>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-18-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102115406.1074327-18-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_074129_728061_71D86FEB 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: linux-samsung-soc@vger.kernel.org, vigneshr@ti.com,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 02, 2020 at 11:54:00AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

It took me some time to spot why the "mtds" change is there, so maybe
add to the commit msg:
"Correct also typo controoler -> controller."

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/nand/raw/s3c2410.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
> index cb2d1b4e278cb..f0a4535c812aa 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
>  
>  /**
>   * struct s3c2410_nand_info - NAND controller state.
> - * @mtds: An array of MTD instances on this controoler.
> + * @controller: Base controller structure.
> + * @mtds: An array of MTD instances on this controller.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
