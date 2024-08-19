Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0B1C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58h4YYZ/TfS8Kpp8l2nD/N5S04TK+djszHSn72yQoog=; b=iubArxoLvW69cx
	j9bak9QRgl96mCk4zVQz2UrsJQZXTQUu0PK6mNFNB2S/Uy/GbVpU5Ve7VXggsGWXGzpZ976LU6RO0
	UQ7FeSv9C03MmW15BRDKfcAym4K88+2rqy1ErUNC3PC9o3BWNwopt/Bz14TX2u/fFnDBthgQQFJqb
	Fccud1Wwg3Rszb0EMd5JD5uY+a87Mui+kldQFSGMebLUimutCA7GYQIAHcnxyzY0x0+Hhx0kVF8JI
	suZ/kFgVAJU7kHv/kiOi/AhQW+uk/wG6cD9E1DtzS2HDlOq8GIb0aSf2+SAaCgIJfs56b1rge+O52
	tWC232EzYTdbwoZhyfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0Mo-00000001CZc-3yzU;
	Mon, 19 Aug 2024 11:16:07 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0M6-00000001CRh-29AM;
	Mon, 19 Aug 2024 11:15:23 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428e3129851so34043125e9.3;
        Mon, 19 Aug 2024 04:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724066120; x=1724670920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xEnhR+BnZyqhep0tu1+6gKqzWhCmgeh7ON3eSgIapg=;
        b=mizRv46v2GzKV3nT9VzsbJ0urHbVTd1RaXMl+/MiypEzY5rafyKG0RaVrItwS+6ggb
         G2pjjB5SXl6AGMn6Kgf8E6DYZi0wjeeXrkXHMgg60eunSMTMqfKjLOWtmmYiDcDSrJ/S
         sxExUH7tB+wtxoqY3qzrgYozFbSaImqEPn+Xw8wsSrAkL7Bx4RH/6pN0s0w/cUKJJHV0
         ziJR0sN2kq9woZROu/I8IOpxGKHP0tbxQ6I4sZNWPFlgV5ak8z15eImR04zE9eu7ZxQv
         FgzO2e7kEdrINsi0PwyNXgtJuI1gjxauqsTOjQPn2hwsiq7JvR8f/sSbLQwn0lukGOJT
         M4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXGAvlyq4NXfk4B91EhEqr511VXgrnKtJYgoHXSVngXe65BWa2AKD/xblS4sj8t5BB3ccJXYqg2bgiIDWAoM7A3@lists.infradead.org, AJvYcCXHrWawcrQ4LiuywFIYXZOCwtQXX1Ar6AyEDKC14hV9Ne9K1j0WV1o4pa/hCwCeEdhWZ9eEWowfokYV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzff5/bBbQWlzxNZ0tRsAjP46GDYLZhUrFW2TK1ckZv3bTknMqU
	p6B7mw+qQzdOC6jDPX8C4OZcO4K9nGgIPDTUpVQj7ZffvAJZJM05
X-Google-Smtp-Source: AGHT+IH8/p+04BfrJXSaCxwKTnTJcsz63gHT8daKI2ZKAyHVF0aeARbyLjNtxUWoElROY9FmJQ+tBw==
X-Received: by 2002:a05:600c:1c24:b0:427:9a8f:9717 with SMTP id 5b1f17b1804b1-429ed620183mr82675765e9.0.1724066120138;
        Mon, 19 Aug 2024 04:15:20 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed784171sm105623845e9.38.2024.08.19.04.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:15:19 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:15:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, esben@geanix.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <l6t47glpxscvbr6rsq67alwpn6mcltjnxrnr3xs4qa3slqezrr@zp6a43hiwq7l>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-2-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-2-hpchen0nvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_041522_575578_96028C1E 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 19, 2024 at 09:20:36AM +0000, Hui-Ping Chen wrote:
> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
