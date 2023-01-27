Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDDFC61DA3
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkDK6VPXN31gWuwXVuWayKpKKRL54oiFP0/LoImpyXk=; b=VVjceGpm4vaqpK
	C5fA+XlJBD96V9T3lOPnl6oxwpiwsGoPw5/IEE0FsXEEUXC7WedWfjW4zKmCmER7fPoO88fKMXkc4
	777VnddXsGKHyUpsqb6c+VrX/L2cq2xop0yst99Cl3TiQBGMAKjC1aUu2oGcgtXgFNbL5BmXcsa3C
	wfk5f0b0q7tzDAchK2Vp7n78Y4zFb3qBUDuEOaW2q1D7tpEPcVcvZxmBxwgniEHW+fNklsvofzDzz
	1zoQsH/a4y79x3Kh8LCNf3AC+MgvZBSbPNF3C6Qi0dr9Qxep3wGlm0H1qbyL9AGwHEy5YrgMoDptd
	WBF0QeknPVLY63BYj+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPAB-00F9Ui-9o; Fri, 27 Jan 2023 13:53:07 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOnJ-00Ezwh-F6
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 13:29:30 +0000
Received: by mail-yb1-xb34.google.com with SMTP id u72so5953174ybi.7
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d90t2HT4axfU/qrUeGEIoyPWhawGVIFewaicVqJDUqg=;
        b=bkF37mijcUJHRTb1p6rDKR/QOD6cFK2fbdggg39R9YmoMeA6tsJ6yvEJ14vk9DFsmT
         cnWWi3EdLY4EgOwM0aFp0esXbWtzUduqqXAgTchHNp1iiaa8mDjQrvwF/FYs7Ezq1EiR
         UD9b2YeYJPMGKbP99a4CO2DUdafwP48N2eGkFFcn4zdO8fQu3CVfLNPxagbHGVNi9Aid
         LKTgkD2YpIKAt4xYqDBLxTKiuI2Bnpd+xENAUnjYKhH1WdkmL3iv9NjHp+q8EXfYVfUM
         wFr6J8H/b6wmAOQ8UXn2NwQkBoN2rvU1BFiqJmNOisRwwkoqxs3IS/K9cTWqDBvwedN8
         E8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d90t2HT4axfU/qrUeGEIoyPWhawGVIFewaicVqJDUqg=;
        b=OSEKxqeMvSXoo5iPCt+lV0Do87C7BlBTXpt89ndTbPH23KenRn57VxONxgTUHJmDDZ
         moOx3xWf3biSa6Pq4NV8L8gnYIiuU1qEVAVR8OwweGR+5NEufWI9dZQLV2zEyQ7/3b+N
         muMJjHiUxf6bn+sGf6LSH0v0ueelTptGpOYFYy9hZRq+cS8F5xvHizpM/MHcWt00svqo
         xsODb10cInUwJsYvt65WRxpfQw4zTlL0h5uKQzmFyPVaVyLF+dRl21sqjOsu+PAU1Uc1
         1RcgDTdloJ3qQwwKxoCNjWpz+MkSeBRuLun7rrFowYXj5ZMazrF7o/p74PPjuJg65RMe
         yUtw==
X-Gm-Message-State: AO0yUKWBF4DaRTXe1l432AEIL3D8SWUsjxHpTdy5s0inqjybUDAwIsfx
	IBxKhLh3/OQ0IyZYjx2nfY3xIohbMQn0VE9eZjv+tQ==
X-Google-Smtp-Source: AK7set/ciBNiEBP0CiIy5i+btLQY0D92zzz0gwoYZYEZs0myOJXaIQEqBAz/mNtne8bob6i5oJYojtdtlEmDw9U92cM=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr1098028ybd.24.1674826166163; Fri, 27
 Jan 2023 05:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org> <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 14:29:14 +0100
Message-ID: <CACRpkdbOZLhQ1DTNJowNXF=O-Nvpqcb_A+PwkPWFiUSQUbkR9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node names
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
X-CRM114-CacheID: sfid-20230127_052929_549762_2C8A4995 
X-CRM114-Status: GOOD (  10.87  )
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

> The re-usable serial.yaml schema matches every property with ".*"
> pattern, thus any other schema referencing it will not report unknown
> (unevaluated) properties.  This hides several wrong properties.  It is
> a limitation of dtschema, thus provide a simple workaround: expect
> children to be only of few names matching upstream usage (Bluetooth,
> GNSS, GPS and MCU).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fair enough,
Acked-by: Linus Walleij <linus.walleij@linaro.org>

However I think V.35 WAN devices (high speed serial network links)
should actually be using this? They are just some fancy serial port
after all. Cf
Documentation/devicetree/bindings/net/intel,ixp4xx-hss.yaml

No big deal I guess since they are mostly an anarchronism and not
on the table right now.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
