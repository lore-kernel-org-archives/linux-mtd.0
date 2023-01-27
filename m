Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19504C38142
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0VxrHR/z0a4k2fAuyZJ7euW+NY3UU0tkHmOJw82SpQ=; b=j7TpcePCyeXVDf
	JA/iN7kRELAh5t5Hh+rbxLcsQZhqPcOs3SQcUMOfWaiRwYop3zNOry4np9u06Ko6r9X0Zy0TX55qq
	YQK7dGsC9y7CE56u9DnHq+c4xBHYShoKxEK+YmgQ2h97YP3j6ZKYCCpdfi9EnJeNe0OOomHsNdZud
	BJlHab1WWxUNguYlvj0QoXCdbnjzMgZYInQloI4JmLr2ij1WDU+A0y+eimXP7z3251hbWtF0yMWna
	tSNzO+Ul2H4GunYU+qx/ZuIZLOIxzxpovaAwWJuMdBYIj6kU2bGPjgE/IbMT1n6lE85GityvIYw8w
	6nM2Wh1ncpXZGhEf7XBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP73-00F8EF-GG; Fri, 27 Jan 2023 13:49:53 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOi4-00Ey0g-QB
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 13:24:07 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4ff1fa82bbbso66481687b3.10
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZZ3MuEVu6XkQPyGITmSKOdfGu07b5+34vXdaMUVpmM=;
        b=UAHrFOhuENO8p4X6jjmFs9KrdLnh1L5ioIcN1vRBhDE992xV4cddAO0IjROU44dIG/
         nalP7afFVUtdPnm8JH4xghgm1GM/q5GOZS2kC5Yd9GXI9Z7PktEengh3fovMoq+zsVVE
         t0IPxp6dqeh897/z5G46UH91FQqy4WJQU8D3SIuIya0S9WZHfZk2C5Y30r2S827bu9eD
         CJLrDr1gIIxiC13d3vWqjY/9ZHwEpUdCVVNQAD/k++s1nG+mBWETZdTm2h8dtkZQWFeu
         swJGEwBP9C1DSuiQ188wLhYmsd5xFXheW++Lnq9ZpWPRKwvE/hZ2po1OCXDHo+L7t9nf
         jzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZZ3MuEVu6XkQPyGITmSKOdfGu07b5+34vXdaMUVpmM=;
        b=ek20dAaTHcow79GlOOjKcozx6lcFOclk7Dj+g7kBFrtHWZF5HI9RwDZRjSF7+wEx93
         p7jeMulc8bh/bQSF6nTLqV4AefWhRFOvyKgJ1Fym6l6/Rtt6H5wVWzTPg3UpuwmtQTFh
         h0BbOppZofc/9HbOlXCa+QqbowPHM13MUpTs8N6MWw1q3H0zszFpfzDw+gmdy7Zb/FTS
         l2RTHpBLPspT0j8bQUyubGvelaqDgPIEVoTFf+Hd4yZpSUFbDOjLEPYm7Tw5f1AGGPIX
         DEStVvodMq3YJinaGqGvukemJ9E42RlblfO262U/yLT+KIZ9yBk5XQy0ToVvwYZh7kvH
         5bHQ==
X-Gm-Message-State: AFqh2kqN1mGMBKpUyg9H78R8wmwNI4eROy7ls8o97EmhTAD6VCJXx6gj
	57RmO98rDe4fm6IK3ON37dSyCXpXdkdMpPKgMsBBEg==
X-Google-Smtp-Source: AMrXdXsM2Y+feqWmDnpZZfAnDgXVYRK43870GInPFgNTT7qpRIbR4qPNx7T9fr58byEQonupKGetuGN9HSWpF17Olo4=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3538984ywb.185.1674825843435; Fri, 27
 Jan 2023 05:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org> <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 14:23:51 +0100
Message-ID: <CACRpkdabA03VEFFVDVDiEVnLDZXGmW-kyCpD8iRVOcBzNBTfkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split out
 peripheral properties
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
X-CRM114-CacheID: sfid-20230127_052404_971058_27FCC848 
X-CRM114-Status: GOOD (  12.19  )
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

> The properties of devices in IXP4xx expansion bus need to be also
> applied to actual devices' bindings.  Prepare for this by splitting them
> to separate intel,ixp4xx-expansion-peripheral-props binding, just like
> other memory-controller peripheral properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Whoa, this is a complex one!
But I assume you and Marek know what you're doing so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Maybe I can assign the following external bus interface to the Qcom
people, as it is yet another one of those:
Documentation/devicetree/bindings/bus/qcom,ebi2.txt

I've been uncertain about how I should convert that one over properly.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
