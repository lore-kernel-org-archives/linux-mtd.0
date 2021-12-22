Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EBFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ/E/dXHEIIybzSVj2xOptviPWfTIaviZ5GnxPxFaEY=; b=Q/UL+H6Ip6ZObC
	bbkGWQAVlr7Nn8k9+ENWD2a+BJ2HlViWDTnH/xnmHWeCPeawoaEq+vhX/YjHd22TiQUmMolm+gXej
	H+opQuEVghLxZLwE9F2KvCpdK7wCFw3EvNh5EMOyAI0Ygxu7P7+27ovV05ujBe5P9qebIFTpBu6OW
	xYrlxGNUzVN8tgE62dFydyD2IC33b4w/8idcOY8/KVUTmywru2DBU+G3lPuedx5uprVnKTlfeoEjT
	U4U8xwDICn7bMOLyVKq1WFbOV7lvG8MabhntbHpPBf6Tk5aNNaYhw81K0yUxBG5sJ0/NW6ZHtZUC7
	h/xy/qitOE8rT77C4zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n03vR-00AmTG-Pi; Wed, 22 Dec 2021 15:53:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n03vO-00AmSC-1O
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 15:53:07 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B10543F1EE
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640188383;
 bh=wwMXPWMLJyza5v6X1TaAk2XM/noBR4icpHiHaWLn4fY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=pG5llTIwvWeZlNywUVS9lYmq+0tgzA0oeBSvuikkEUaHAXew/8LVCxo3Qf9lZHhma
 VCxwpaN/LYGhlzg9KNHnfg+Qn9tvHALMD7Q1R+zZyjn84XgmnWEHb64EFGC+8hWEzP
 D72Fo1LAuwt4J3u5q+r31EK4wHOi58y54XwVxrKoTr9ByUL1yzBGH3z2KHABhQuhma
 3LMx6TDdJ6DAsVywVC/2cHr2rR1mnWPiktrwKkoSQClOIYHAF3lGzUJn6a6Z9EgZlZ
 NMnawPl6njy3cNWHzXtxKAV0cu4MRnQT3VvRtOAraT1mO68oyxkEDGvXa7BL/I+MzN
 L1yRpjAGOCrZg==
Received: by mail-lf1-f69.google.com with SMTP id
 b35-20020a0565120ba300b0042604bb4857so1388550lfv.19
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 07:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwMXPWMLJyza5v6X1TaAk2XM/noBR4icpHiHaWLn4fY=;
 b=pWegCc4KfpU7x8DZc2jgeGHBT3MG+zWPMx5osEwWF4JpnMl5D4FXAKQRrBv087SQlZ
 2AqulJYrAgiDtlvVU5KtDUNb9fdyDipVKyvJGeIyO1efYGrqNtByb2+hRionRKImjqwR
 YHRIh7t0YHG1bwfftlV6C9HbByBPmWh1pZaVpFFph+XRu4pkveMIZBv5cyhKEusf7Nbt
 tq5+jsz0mIXKwr2dFvOz1+dkOs35TV/fwWe4LyPrmei3Sbnlf9LZS4e3kQ1ZXOfSynwX
 wsrr/hdAk5SPwbITlZNSbMImvvQqbvRiCERdrmm4P+TDAK/zDURsrT7IFhZ7qZRgCoat
 ihWw==
X-Gm-Message-State: AOAM531iBVdod1P8SSKX2oMDId93ODoXqmiTdsywv1xPFxAvbbX30QtC
 gzP4WcFUIgsEsz9uzUOQyJjMeuaBVA9A2LW0x2VQTYEKWm8zan5OtQRLyVLjkMUoYx4A5Pj6k/W
 EhQeXAox16zGRrCdhNWQOKwKfklwewNVbTqvIYrDc5Mk=
X-Received: by 2002:a2e:9017:: with SMTP id h23mr2465771ljg.13.1640188382558; 
 Wed, 22 Dec 2021 07:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXN7uYxkuhPW5AvR4M49wCb95nQJIFBIueJZUYTf3lHmM6d+eH8m+7D55Ok0F5KBXbHsnuvw==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr2465760ljg.13.1640188382372; 
 Wed, 22 Dec 2021 07:53:02 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id u4sm250738lff.17.2021.12.22.07.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 07:53:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: tony@atomide.com, miquel.raynal@bootlin.com,
 Roger Quadros <rogerq@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-mtd@lists.infradead.org, robh@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, nm@ti.com, vigneshr@ti.com, kishon@ti.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Date: Wed, 22 Dec 2021 16:52:59 +0100
Message-Id: <164018828306.17046.6793512518826929956.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_075306_242176_E8D681E1 
X-CRM114-Status: GOOD (  13.58  )
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

On Tue, 21 Dec 2021 15:17:53 +0200, Roger Quadros wrote:
> TI's AM64 SoC contains one GPMC module. Add driver support for it.
> 
> cheers,
> -roger
> 
> Changelog:
> v4
> - move compatible match table to header file so it can be used by
> GPMC driver even when NAND driver is not enabled or as a module.
> GPMC driver is always enabled as built-in.
> - Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
> OMAP_GPMC is not essential for ARCH_K3 boot.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
      commit: 4892242784786f3cbaa3b79ea03f8b0c145f6cfd
[2/4] memory: omap-gpmc: Add support for GPMC on AM64 SoC
      commit: 7e58accf4547b75070e5cc1e04f97e890d7f719a
[3/4] memory: omap-gpmc: Use a compatible match table when checking for NAND controller
      commit: f2f8115fe8b390af27d013411045bd712a812103
[4/4] mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
      commit: 5784260892e5b808e1317843f71d4b787ad1f4b7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
