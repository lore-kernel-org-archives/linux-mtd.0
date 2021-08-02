Return-Path: <SRS0=IJUr=MZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AB0C4338F
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 20:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25F7604D7
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 20:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B25F7604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYEZcp/Lna9U6q2y06PbGpk/meYctevmbBBdNkumDUI=; b=SdmLx2gjuiDcfu
	+cVAZQVdcBoH6rGf+QGFZBEowdeZlT3AlPsI/mgtcIEV27Kb+Y9SCl6aSy/a3uuRSMVyWVX3gjBN0
	aVZ/G8sb0DpQkHhWbSUsqneftpXFJA7QEwM2BuEvgQT3l3fmsAQpOEnL88/tr1tceUz1ZkksRqtj9
	VOSXN1QDC1Ygoy+BzU+AVtq2n19fAEZZrz3F5iTLu0I81wvirJ0p3Q5SC+IOu/GQXosXggEHsspg6
	sMy936kRONrL4iwJoK03bQ2JEUBaywh5RlQGwVbWrtqm0MU7n+UdCVwtHgaMyPLuExUN+Oshnw2/s
	qiK0HmDgaKGGmTj9UMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAek0-000BlS-Qi; Mon, 02 Aug 2021 20:40:52 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAejx-000BkV-Sq
 for linux-mtd@lists.infradead.org; Mon, 02 Aug 2021 20:40:51 +0000
Received: by mail-io1-f48.google.com with SMTP id 185so21830020iou.10
 for <linux-mtd@lists.infradead.org>; Mon, 02 Aug 2021 13:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uc/rr/5xcuhR+zif0CpvyF7mUh82ehF886KfvVGZcB0=;
 b=CBWtuMvTMm6UKXYQmPipcjq2XHZcNV3sHfiWHXohssH5/Pw6YK5YurFj8lD5CfzHBd
 Mlmzv4mPvTLdR5E+lvjZiNrg6SdLJrrucrRwOOvSBdjT5xa92lJpuh82EjXhP5aKunMm
 qKiSmQ8vpoaK7Zdyp4YVHjQLEbsVcLP07lyq4zWtHD3OsL4iR6kxlmyecpKpsFQZ68Or
 pfz36xfO079j2PC4Kxl6x0UjsHaEfBHyg5RAnLyLEFaTKAHefIqlZlk6eNeRuWKJZc6D
 gYe65dxu5SF66GNbjgu6r6BLZheakGftXKkMeSxV8BWnrsRvZvgIyJ+0VTyovqNMoVCm
 edrA==
X-Gm-Message-State: AOAM532d3vw9qo0UDkCGw0VDhCVAZdutDInexk7t5xrsbR0xEc4iHuD2
 aAMrMc71164pghe3WrNUUQ==
X-Google-Smtp-Source: ABdhPJxnLXrZtIwbHJwJS1JysQYhqQudWRsgjCyynZjPxToZnlkja1X5wSw4jWZEi12yEAxyZL0t/Q==
X-Received: by 2002:a05:6638:3824:: with SMTP id
 i36mr16493740jav.11.1627936847813; 
 Mon, 02 Aug 2021 13:40:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f9sm6296535ile.38.2021.08.02.13.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:40:47 -0700 (PDT)
Received: (nullmailer pid 1570511 invoked by uid 1000);
 Mon, 02 Aug 2021 20:40:45 -0000
Date: Mon, 2 Aug 2021 14:40:45 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: memory: renesas,rpc-if: Miscellaneous
 improvements
Message-ID: <YQhYTXTRBl6HkTL/@robh.at.kernel.org>
References: <d81b59a513c2a5204c8378b4a89cd07f97c46797.1627401508.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d81b59a513c2a5204c8378b4a89cd07f97c46797.1627401508.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_134049_978524_F0F2A4AE 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, 27 Jul 2021 18:01:05 +0200, Geert Uytterhoeven wrote:
>   - Fix rejection of legitimate flash subnodes containing multiple
>     compatible values,
>   - Add missing list of required properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop #{address,size}-cells.
> ---
>  .../memory-controllers/renesas,rpc-if.yaml      | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
