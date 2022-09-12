Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6BCC6FA83
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJfjY3p4BTfWsQEiXfVhpWanhpIMhd29WG0NRnqEYN8=; b=vuawSjfyQa9GrL
	YJHD4WB86k8yCHLj0TcEs92BdsXLSVXaDIL+uxXMhi/VjQAYpV9RV8ZFQGFIK0kMOGJpv/kpf7LUf
	OssQo5Sm+wv6+kOiDX25eUagZWBGwOvDJB/YZXtxBTwYcqwpexW9B1DlrtUtpydTni4eMo7Brojrn
	De/uq8zsdxaVe3Bt7T6qaUIl5t5I2rzfRPEDkoBoMwACwgNNEeOFY+P4zJx35dnqkZVThGjdeAzeb
	/prV4mfTrXBMxXflf0MpOS1tuiNVRj9N6DS6QAsQwatVcehjklhFgQ6pyeUs/cwYwVyklyBCgv0Ba
	LiEviauZlq6T1/X976/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXq5F-00DbUI-Lg; Mon, 12 Sep 2022 20:31:09 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXq58-00DbQY-Vb; Mon, 12 Sep 2022 20:31:07 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1280590722dso26584512fac.1;
        Mon, 12 Sep 2022 13:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=g/UDc025mrWtsVvlPcb6aYSfww62RRfTqVjKHmF+7ik=;
        b=4xmhRAPg9ljfOJiH8Fd0+R0vyatwWfCw/TOPqRqSbYNrEWyr0NPwTuLgPZnbzGcbvx
         Q62Z1kGgTlfc38rPDCBE7vB6DqJbyGo8M1HY3EVBdIscm+Yf7ckq9AP4ARlOBu8ox7eS
         B/p6j7k8e7GwusDcR68inwqePebKxNXEFCBkZPlaqqgbymHdcH3nM8t50ZKTfgD6Vgqd
         gqC9CrkG4gIchUlqajDbcNNupFvWwka87XeewDpkon2wmHK/Btf7KvQ/uUAwQnUitXqO
         xH8oQosReipjEWg7EQuvIw4WZd9wXiYkLMabBWGh9ug9JsOwjeLvyZVHOJUjZsofkmwY
         hlOA==
X-Gm-Message-State: ACgBeo0E97M6xEHWQqqD5krnBy4XuDwuM6CcG08n4gkUfhkS1W5iUVMb
	4ZtqXLK7BI0vS0hytRWIBA==
X-Google-Smtp-Source: AA6agR6XF9RQcPY40kpUXoOfzj6E6g1w/ffzTwA+bpiGExL1d5D2Wgl6YDwnA5faBNqCRi9W1we/Pg==
X-Received: by 2002:a05:6870:e413:b0:127:2f43:af44 with SMTP id n19-20020a056870e41300b001272f43af44mr66328oag.175.1663014661704;
        Mon, 12 Sep 2022 13:31:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id el40-20020a056870f6a800b0012b19b888bfsm6316443oab.47.2022.09.12.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 13:31:01 -0700 (PDT)
Received: (nullmailer pid 1782577 invoked by uid 1000);
	Mon, 12 Sep 2022 20:31:00 -0000
Date: Mon, 12 Sep 2022 15:31:00 -0500
From: Rob Herring <robh@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, XianWei Zhao <xianwei.zhao@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, YongHui Yu <yonghui.yu@amlogic.com>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: nand: meson: convert txt to yaml
Message-ID: <20220912203100.GA1782522-robh@kernel.org>
References: <20220907080405.28240-1-liang.yang@amlogic.com>
 <20220907080405.28240-5-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907080405.28240-5-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_133103_035777_85AAD099 
X-CRM114-Status: UNSURE (   9.24  )
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

On Wed, 07 Sep 2022 16:04:04 +0800, Liang Yang wrote:
> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt       | 55 -----------
>  .../bindings/mtd/amlogic,meson-nand.yaml      | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
