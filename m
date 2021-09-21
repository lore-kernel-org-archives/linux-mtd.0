Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE57C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B396360FDA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B396360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PS1MKYOrNlnz8KTolCawTpa0Lh+C0rRPaRreGy2dYlo=; b=L73M9efhFM9AeD
	yNgfEcnQF+b/xhmjoo5HLrA4ztMKgvvoHCjkU/jL6NbL72eI+GtnHVaNXwg8iIZ4qDWS85on7a7aE
	7IujSYPybBgTIVXhq0d++Tz6EKCAvcJsIX0jYiFllp88E+Ih/Ox107rwAZrCk4UsJGVXPt9arAt90
	HHnzszXzpcwHPp8bVcnEG94u8gKcpYkIsoowIYyFj6vAK30/jLqTXzXL/DKijWyKmetY/jsjEWe9Y
	bytYz522532pGfhJTmnsgZLWvjLL+iXKCZsYX+syH+mk/Eko6kMFNm7d74ykXD2jP01Ul7SsAaIvg
	AwBM2Qk9NkU5iRkE3CkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmWs-005i6i-Kl; Tue, 21 Sep 2021 20:38:14 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmWp-005i5f-R2
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:38:13 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so255744otq.7
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WZ2O/1DywFIdd2AdPGpsXwiZ+HYHMmvVFZU/1PSKMi4=;
 b=Ovm/RI8YWl0coDww2jtLVrMRB2rXYbg+3B+I9O+kea4p5FNSOjswJ3kL/aqsJ8UdjK
 l56E2IrOR2Vey2S3zH/4yl6uX9sFpPHfyd5ofJkC86jfrklyoyOyMdqKXNeQkg4QrGIV
 GeFt1ygll1dT1Qx3gvAWMGZWuClRicrq5K6+upbsvBqvIj653i57Oc5+2wxdiQRgKmHj
 WmTNT9P3ruRm/lfLfssUYNhlQvf/NvSkNud64gZV0YvXmEcTgwv0IxD6qKsIqmWMeHAC
 wgg/fECo1GRkTGskf5/AAvc3oiu616R6Ny3FaQoHeLmxmtMKqAYxy1fjma2kC/5kpVXP
 IDTg==
X-Gm-Message-State: AOAM532VkNXGcRNTM1AfGlOwyvq9h+k9ojTNh5ZGqAOhyPSrhEKb4mjs
 p/kAgaBmjYEoVv94Ped4Dw==
X-Google-Smtp-Source: ABdhPJwCSDs0+dPErWxNouh6rqPfVDvlA8KX1Y3rmLE4RmgmB4wrFYDxroLlTywf2JNDQPhDEUeQhw==
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr28280165otu.299.1632256690870; 
 Tue, 21 Sep 2021 13:38:10 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id b25sm12769otf.67.2021.09.21.13.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:38:10 -0700 (PDT)
Received: (nullmailer pid 3287781 invoked by uid 1000);
 Tue, 21 Sep 2021 20:38:08 -0000
Date: Tue, 21 Sep 2021 15:38:08 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, tony@atomide.com, lokeshvutla@ti.com,
 nm@ti.com, linux-omap@vger.kernel.org, grygorii.strashko@ti.com,
 miquel.raynal@bootlin.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v4 2/8] dt-bindings: mtd: Remove gpmc-nor.txt
Message-ID: <YUpCsBdVcoLv2BH4@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-3-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_133811_928545_790889A2 
X-CRM114-Status: GOOD (  11.21  )
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

On Tue, 14 Sep 2021 15:26:59 +0300, Roger Quadros wrote:
> There is no GPMC NOR compatible or device driver. GPMC is just
> a bus interface over which standard (CFI/JEDC) NOR Flash chips
> can be attached.
> 
> For NOR chip bindings, please refer to
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-nor.txt      | 98 -------------------
>  1 file changed, 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
