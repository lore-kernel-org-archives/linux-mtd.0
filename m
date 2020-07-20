Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C446FC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 19:21:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A88206F2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 19:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwOxavh9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A88206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iCaHMdvKH4rzIuefA8V79FnmaFS6dgRQ0whmS3ZqfKA=; b=PwOxavh9j9ZNxuvqpl9cRVYa0
	hnOLOuYF9KlV6sjtpdF4cvFm9WVOdFEy4gDAPkygBw+LuuoN0XDlO2FRnRyr0DW0LR+UfD03j/Vs9
	xFnb0iI9rwXuA2lSKmLjJxB7ydqp5Vuz4joR55JW1KTO+SgZQEq1/kxujh2DoCcoIOv8MXhxOal/+
	ioKdJBWyqzQiZ8T5s2eWRUwRKHkVW9pnp78swoU9G6ZEDWXZHJTsI1X+aHyv/Hnq0VBKeO0+5Xmu3
	RfwIlVBnds00jGBuoMlsYv9bupoK/7oJRy/Qyf2X+16xLReLG5ROLNVToRewP8+AbQH+dyVFXoALm
	rx0melXQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxbL7-0007GL-8s; Mon, 20 Jul 2020 19:20:41 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxbL3-0007F6-M3; Mon, 20 Jul 2020 19:20:38 +0000
Received: by mail-il1-f195.google.com with SMTP id t18so14310416ilh.2;
 Mon, 20 Jul 2020 12:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WqYKQMOuIVj5pOBGgBVd/pxUW1b2laun76RvBjVHCKI=;
 b=bOVZpCekIWKPJte1iFGgFWFkkmityFg8jf8G7E/YM90IdfVWok+y40B4G/oeS04GiI
 Yk0norQpfcDLpH+cNh9m5xM6FdKt4WsuLGGOCRFlfbgbmh9lrHweTdoxUXHh8mvR/Ks0
 4/VIku6DEqbV8sfoOcKBKjPtR+s3dq25AHUFhdrRjFvxxD2qMjpKpgA52F4bXrrXeIPC
 YBWCAqLrYfhdUSnUg5luwRFXKJatjcifWAAWZx3Do5IhgjzlTwG6n2CaLGhYh+k1293N
 a5kaDPXi4O62TocncCEUdYVNBMnKaZ4eZE38Lx5wWld9N15u32j/WPkBsKfyRamXg5R6
 G45A==
X-Gm-Message-State: AOAM531a5d7njUYO08ZIaE+kuwILckrlxOwgWPjuoY9weNY68K/sNfk1
 hGqxflxbpfPYRXHaLXLNPbTh03EXiA==
X-Google-Smtp-Source: ABdhPJyOtWoGboV2RT+nQRU1hdrDUTfTCdxNq4fZL2j703qm+oxtWTv25fMik8fIblO96Il829N4cA==
X-Received: by 2002:a92:9fcb:: with SMTP id z72mr24719165ilk.195.1595272836797; 
 Mon, 20 Jul 2020 12:20:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id e1sm9292477ilr.23.2020.07.20.12.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:20:35 -0700 (PDT)
Received: (nullmailer pid 2851198 invoked by uid 1000);
 Mon, 20 Jul 2020 19:20:34 -0000
Date: Mon, 20 Jul 2020 13:20:34 -0600
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v8 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200720192034.GA2851152@bogus>
References: <20200717092420.19798-1-yifeng.zhao@rock-chips.com>
 <20200717092420.19798-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717092420.19798-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_152037_779869_BD0BF671 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jul 2020 17:24:17 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v8:
> - Fix make dt_binding_check error
> 
> Changes in v7:
> - Fix some wrong define
> 
> Changes in v6:
> - Fix some wrong define
> - Modified the definition of compatible
> 
> Changes in v5:
> - Fix some wrong define.
> - Add boot-medium define.
> - Remove some compatible define.
> 
> Changes in v4:
> - The compatible define with rkxx_nfc.
> - Add assigned-clocks.
> - Fix some wrong defineChanges in.
> 
> Changes in v3:
> - Change the title for the dt-bindings.
> 
> Changes in v2: None
> 
>  .../mtd/rockchip,nand-controller.yaml         | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
