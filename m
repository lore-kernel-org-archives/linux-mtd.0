Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D4C61DA3
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGSD2gz4VQPS8rnvR2YiezafSS/ncN1T7nqTEdTmK6w=; b=HuB8n1nL1vC0OF
	cMv94HLPq3o3gjawfQoi7EIPcdxxvRy8deqKErUG6M1+WEVuXuQRD1UnsyyPgaDvjGed4BlSZZQOi
	iHLemfJjDgnu5+irxn6T+8AvVLF9MCCWVFbZQH0W9efBk/r4Jz4wkboQKMdPThnkfbARUU1mI5p+H
	+0nshyc9OtR+O/9bXhVl8nuQOM9WoabueDRe85eDeusQVImMYxRmH715jR7C7GQ6PNtmK9wPf+RNZ
	H2OFbQhbvfXEPisVjTvzFzV7HN8tt4A8UtLiNDKekDSiNhQOI+j3Qc7d845vNS2NDZPNvu8ii2fV6
	frg47AnHmgefz7lqSacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP9A-00F92l-Rc; Fri, 27 Jan 2023 13:52:04 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOj5-00EyKo-Ph
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 13:25:09 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id x4so5974698ybp.1
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 05:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfmZdMJN/D3xI4YTB54xIsWSAze0zkG8RrFJPkBL4AQ=;
        b=d2yyXte/yKIliOx/+8dSFRH8+M3Ex72UVdCuqh3m2tyi3rrRYlzuFLuFuOaXo8UJua
         gElqKdzCZZxnNL7BluA63zU1vXbJTTdCGK01yYehPr6WfmZLwmosoPiS95G7b5lmagCS
         L/upqPf5qIY2pjLEDKrUW9EdvBvPWpcC2GegAPRzTI8cGzevNc5TRFXyVw8hHFy7XJzN
         TH3bv0sOG57U6+65n9Xq6fsYWtTWYlZhS/Bzf440xEraF0lC2iKIkZMz3ndkI1DvtaHw
         EQNdQGri5E5aTQGN016ehd0p8PTqoPCqtOXzj5K3ayVZ69ryCa5toREYxDUTePUi+iWo
         LVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfmZdMJN/D3xI4YTB54xIsWSAze0zkG8RrFJPkBL4AQ=;
        b=tckMbOQEROBhtfXApk6m+FOVrhevHDIl4ZtJYu6smj4o1g/1LKce49RNL8pkYHt2gQ
         dxrLsYgg9UEKVKKoDCyjrTCqIEvZ7EdCWWkTFliCzprI8OHzCEiBy4+33HuMr5ock1rD
         IB/uVz2OGjLaGI4NMVPdDX3yXK11zXrLcVKxhtq4RjzR5ZJ+6+0uTHhsn7mAKhn6oE0k
         R6xBjePoh+fOrlI/9XovjjbMq0z+uKE6fgiDMW0Fg5FslAEmGA+T5aLqkKkucb+P/H3o
         CblAaq47qhJs1t7If1sfdbBv6sdg/SS9fU9vIvIzMfN0aQZt9vufCilW6lb5kkCge32l
         RTRg==
X-Gm-Message-State: AO0yUKXxVGjIr33+xI0eBgwVxsstpg3Jnu3Il+hrBFd2DfWYVkKKMl1q
	QcPUJO2Zl3lUouN/XA9WsTBD5TySbMjlTARO4th2Bg==
X-Google-Smtp-Source: AK7set/AyCr5YILgHa1njAbv5GENd6K1HRNPT5FGDcIp6NDqNoyOABScAptxZu4MVa9CTfeWH7nQwPnr2nr1FbGyMhU=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr1325238ybg.584.1674825903381; Fri, 27
 Jan 2023 05:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org> <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 14:24:52 +0100
Message-ID: <CACRpkdZUD1rw5j=Kik9KMt0w=JzS_T06FOGnyUA9GWmWZyQjcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in
 relevant devices
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, 
	Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_052507_876127_268DA981 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, Jan 27, 2023 at 10:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Several devices can be attached to memory controllers (or memory-mapped
> buses), thus they can come with additional controller-specific
> properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
> intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.
>
> Referencing Memory Controller or IXP4XX bus peripheral properties fixes
> few dtbs_check warnings like:
>
>   intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
>     ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
