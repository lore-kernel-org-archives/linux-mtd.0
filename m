Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2866ECAAD4
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 21:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIURr2RQt1lDgpaxDv2/jnkqCKrqoYjpGSrCRZq5FaU=; b=MOPEMYVCUr9U8c
	dFsAl2LTN+0fugGI4Lx2yp4V9ITDhFmOaLZu2HN14493/TSQ+v7T9gzGe6e6tvsgUICoDjapO0xZL
	FKt8W5vnNoHJDPv/zQ+Xw8eNDyyMeimNhYfwlu3IzXGdzoZ+zwv52RsoCc9tUDxt0+S847Uu9i7yo
	AB6XJwaCh5NtwYhEds5H47rAuXv1ZJ06Gi13kthvD6MoX7fLIFBGzudniyVOm1yG50hZlMTdSVFlq
	PxbJitLbPp4p3NMZj97WH/evMMJLj7yUYN6gsZyS7eZQi4kaJC4AG1SZAMnEbOnNsb8WjkhnrCiEw
	Ed0JIx9xz1zwJ9pTM5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTVZI-008Kmf-03; Wed, 31 Aug 2022 21:48:16 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTVZF-008Klz-0D; Wed, 31 Aug 2022 21:48:14 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-11ee4649dfcso20915886fac.1;
        Wed, 31 Aug 2022 14:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JD82AHGx84kMfXbfehKRODVwT5PdMYhij9FNOZzBHYc=;
        b=5q50iAjU9xZDjSDBGS4DJF3IO9VIJjs+88KJbj4PeZCJZyG0dem9P8Xd1JMlBwTuXR
         RN8hLqLRsiNAU/DlHvTu10jD0Syl0ptWH8QI+2WGRufCpRJ+75NhPBbYQIUGrS6jm6do
         CXjpFZGgfePpqdp55oTQuK4OK/x7qd3iY5S7VjWTkD3Ft9lLUhzwivKajYuhGzHhM44Y
         8bKLiaciU0NwSqz3tgsKNiHyXbLhCa677JE4GhrZyM2XH+/ORSN0meucIa+Au4qiHwse
         1BSusIJlxlUyvdsLDfuZvEbYqrbW1MJpSugW/4yXkrnKnKYpaToUXATJ5J5CC/yz0svF
         f21Q==
X-Gm-Message-State: ACgBeo2vXeJtq0QpW2zxCzRtuL1KKozt+WPhzn/jfdMzCts/dPdo7t95
	adN4D0u0cw7AGooMrSY1OQ==
X-Google-Smtp-Source: AA6agR42CMQBtttjZ/zkx4w8wd0niU7A9WHNAhfgLAJFh/npgcOzrKIbttMD5OzwceY42pFmKqe7lw==
X-Received: by 2002:a05:6808:1491:b0:343:7543:1a37 with SMTP id e17-20020a056808149100b0034375431a37mr2191781oiw.106.1661982491138;
        Wed, 31 Aug 2022 14:48:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p81-20020acad854000000b00342ded07a75sm7875032oig.18.2022.08.31.14.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 14:48:10 -0700 (PDT)
Received: (nullmailer pid 310004 invoked by uid 1000);
	Wed, 31 Aug 2022 21:48:09 -0000
Date: Wed, 31 Aug 2022 16:48:09 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible
 string
Message-ID: <20220831214809.GA282739-robh@kernel.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-9-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825214423.903672-9-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_144813_062007_560E1575 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, Aug 25, 2022 at 11:44:17PM +0200, Michael Walle wrote:
> The "user-otp" and "factory-otp" compatible string just depicts a
> generic NVMEM device. But an actual device tree node might as well
> contain a more specific compatible string. Make it possible to add
> more specific binding elsewere and just match part of the compatibles
> here.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

In hindsight it looks like we are mixing 2 different purposes of 'which 
instance is this' and 'what is this'. 'compatible' is supposed to be the 
latter.

Maybe there's a better way to handle user/factory? There's a similar 
need with partitions for A/B or factory/update.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
