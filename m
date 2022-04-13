Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F6C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIAWyHaAfHFUSveuQDVd9ruGT0wimzFlOoXnzVytJmE=; b=qTOVo8GylrX701
	acaj82bmXMSzpuS/A3KwenVgrLe9LvhKcbtlQDN+rGX2MCNp6Hs7ZmY81iLRA2cgpCp+9x6JWfzDi
	dIHZ9X0SAlUdoCHxZdBJalPTpL9GpyZBd2nh1gz1sTulUfJLsAe0FbawJKULiYzi3ewsr6+DXptUv
	qqmgif/LKv1vK7msStQxau2yJqzLIcMq79x6S+u4KatCEmvYiJfvH/fRaRkTSRsKbcAB9Y4EWTR/Y
	MnCkJcF1ZDvKYP55C2GGqu9k84hLA6imxVv1r3QyV/5aTxQ9oWXkDvuac/yeNBI7aU/zU8+16OulG
	VnaV0jE76ugwugih2CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZbq-000Qeb-7x; Wed, 13 Apr 2022 09:48:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZbn-000Qdc-Eu
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 09:48:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id ks6so2829918ejb.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2022 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tZnSmOkmR+jnc1UZfEUvwidpiK15ShpCuv6Rr5IrP40=;
 b=Kv5sRMwYbYjLPNYkT5zjBdF/EgxreH/N47wdvm5nxS4NHu5+7YjZKNwfB6J2+iOqq6
 JWv4gaCpGkJMWoOqF4iwlWD7rz/3thNwUfWsUbKZ5GAz6emJexgzZEeWVwxRpmG+Vp2j
 3JjJGJMuH/Gk/lczc/cwgmXRtLattQ+Ozj5MKE0G3OequExU70V9yEqvPoduH67ofMqr
 EdgMJgdH/v8fH2IQpYKnjsXrc1SqCL28IETwFKJ5ZOeT/uuf86Ypt4Vph3dns8VTIeWa
 ++pNvO+ej71sKcfHf9OGYD6um/tYuRQCJL3oM5/aJzjGF1Y1MnnCQ10fW9NlYjxZ7gbp
 GqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tZnSmOkmR+jnc1UZfEUvwidpiK15ShpCuv6Rr5IrP40=;
 b=vgDVgyIrWFeswE4xIIPpub+0xWlASBFlX1ZRwkCWv+VoIGBLyg/I8kUD3vrt+FHUwh
 LhHHc+lS5wIx01FU8iXzwqETGHy8hZgP1Rj789mX38X65271UekUyezwuOi7ETYWQXsw
 AViZ/xvKf92l4bUaAEwdhRhxTgUWQThiqNJ0UemeMTkpdRx9+ucbypB4I/sbBlqSJ/xS
 OUVbDK7R9DbVgKKp7NsQnhGLjhuratONdskw3qd489QjNXz+QxPFLrqBFdmiRvH1WtE1
 RvZoz/REcx/J8de0i6nI+aXPrUVIH9NB2/2Ngfjgq2ExaS6kn0X0e8mX1UPRlDFfG4X9
 2ZOg==
X-Gm-Message-State: AOAM530rbsW/Vwsuw0Au8qXr5sks0SI7aeaDps4yYf/mnWwOGHV9yKSp
 pomxn8NFfyunPKJMbk/W6BQrKQ==
X-Google-Smtp-Source: ABdhPJzbdegU2CQVHT6uOyVuIw7Q9eYpybbyI/IPRdZzTwDNFN1kuCqSxBg21H7LNchwJKPPoU+qaQ==
X-Received: by 2002:a17:906:81ca:b0:6e8:ad09:1951 with SMTP id
 e10-20020a17090681ca00b006e8ad091951mr7376712ejx.745.1649843295850; 
 Wed, 13 Apr 2022 02:48:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b006e8688d5fcbsm5320165ejp.135.2022.04.13.02.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 02:48:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>
Subject: Re: [PATCH v4] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual Mode
Date: Wed, 13 Apr 2022 11:48:12 +0200
Message-Id: <164984328891.36085.9849925261305937604.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cde9bfacf704c81865f57b15d1b48a4793da4286.1649681476.git.geert+renesas@glider.be>
References: <cde9bfacf704c81865f57b15d1b48a4793da4286.1649681476.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_024819_549930_055615BC 
X-CRM114-Status: UNSURE (   9.79  )
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

On Mon, 11 Apr 2022 14:53:45 +0200, Geert Uytterhoeven wrote:
> HyperFlash devices fail to probe:
> 
>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
> 
> In HyperFlash or Octal-SPI Flash mode, the Transfer Data Enable bits
> (SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
> from half of the transfer size, cfr. the rpcif_bits_set() helper
> function.  However, rpcif_reg_{read,write}() does not take the bus size
> into account, and does not double all Manual Mode Data Register access
> sizes when communicating with a HyperFlash or Octal-SPI Flash device.
> 
> [...]

Applied, thanks!

[1/1] memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
      commit: 953d7e7cedb49fec97807166be6fa1ecec1cf0c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
