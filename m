Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BCEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUZmSL5mcbHW/1vF6iZChCLJAvlhT13H9FaQkvM7bnQ=; b=2wAmRsycwI08K3
	/aERJ7rwpBp0zbsindogGnkKJwK7swInnTSxeDmEFk1deNdOjQGy2a6kTDy2IP8W6wCyCHcjD2wJr
	ernzywGbdjvBa/8v3Y6rs0QTKn9pcZTVOku24k2D/H10uOApo3pLk9RH8SUUb+blYHBOnnG9qAQrV
	zWkmT5WFJBCoiy20T6LsZg6/E7Y7K6+U0XNGjm1eMCBf8N91/VxZWmxAFoJm+EN6yvJ8uOifLozt8
	huJOVPKJFa73WEZVQcukUJ13UBa2g0ajqVavx6ENyyrC+2e/+ddm7CoILY85yCS4Y5dNXD08XpWzY
	0qdC32qmGc69il894bcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQhS-004Uic-1M;
	Mon, 17 Jul 2023 16:03:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQhN-004UhN-1K
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:03:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so42206595e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689609821; x=1692201821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzMEPTz588E46vXxy5mUnzrAFOkBW/+dR4TsONpfgDs=;
        b=hmC4JEUJ0yS2BhZmUzD1WFgoOgR+TL3jIxHmHWs+VaH1Eb/BudUEOgdcDRC2LyUWed
         NvjydtuzNLSrMdNuQEeUvawFb4q/HDG4pvdQ3B+dOlri/6ZfW8Qut7dPTDXCvXuTFnBQ
         5kRVmo/+wTHfUko6jftrEr7AyrRMwQMynSsVFb3I/eGrT5GJ2LYMCtBLZWYw/tixnwkD
         nJEU4xVIkzCuGkn/uhfvb8ikvQU90pVog14exKwHj49OnpOQs+Ja/9Y23N5/bmQ5o+q/
         b2zM1Bn/qcyJcvOjaVPeg80xhI2VaR+UMcZKX2WBx5xPNUhTtH85seIavgytdraOKIGT
         00CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609821; x=1692201821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzMEPTz588E46vXxy5mUnzrAFOkBW/+dR4TsONpfgDs=;
        b=k/hjv1Z6MRIj1lpywbLJjg37N8PJ4T+yAe/KpeTkAjgI/EATQmCqGP83opOzcHwwE/
         IU6Ec9psMonJKn3Al8PcqEo3KSSeQ/qvztAa8g7csoO44/eeEbbPwBhF/CuY2Yc0hXUF
         yTkKbL05QfDYv10TMUpMjhj/Pywc6t9fT9VU97eCfyh3IKylXGfy8DBJPt4FgdMp+t/J
         tvcO7kbNpTw/og1BnjHCTHVV0UmGBWf5X5TlImS7d/vXVKUGYczw5dxHq+a7sg8Cp2yH
         zLd9py8ZDAK62/w0hUOVCCMdkVQ8vNboCEBn0cU8pohRBP6bvVvUuYuJvSMn55EM9UgN
         gcnA==
X-Gm-Message-State: ABy/qLYzSSE+PLv4Sy8Tb212lk6BslOvYdXhGzXXbcbD1l+pt6TLV0YT
	zxDhbskxJass9TGN9ZUQgfniSw==
X-Google-Smtp-Source: APBJJlF8TV7G64+zI7mZZ9hBeDEcGqA32zWkkv1pZqt8gCcGrSJQ4UJFGTuB0sf4JFEZ790mkXyj9g==
X-Received: by 2002:a1c:7909:0:b0:3fb:fed9:1c7f with SMTP id l9-20020a1c7909000000b003fbfed91c7fmr9716416wme.8.1689609820868;
        Mon, 17 Jul 2023 09:03:40 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bca53000000b003fa96fe2bebsm93407wml.41.2023.07.17.09.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 09:03:40 -0700 (PDT)
Message-ID: <125a610b-b205-52ba-1fe6-e7e0add0f8b9@linaro.org>
Date: Mon, 17 Jul 2023 19:03:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Add support for gigadevice and macronix SPI-NOR
To: Sridharan S N <quic_sridsn@quicinc.com>, pratyush@kernel.org,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230717153536.25700-1-quic_sridsn@quicinc.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230717153536.25700-1-quic_sridsn@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_090345_451289_D1AC51CA 
X-CRM114-Status: GOOD (  10.65  )
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



On 17.07.2023 18:35, Sridharan S N wrote:
> This series add support for SPI NOR devices mentioned below:
> 
> gigadevice:
> gd25lb256e   - This supports quad read and uniform 4K-byte erase.
> gd25d{2,4}0c - These supports dual read and uniform 4K-byte erase.
> 
> macronix:
> mx66u1g45g - This chip supports stateless 4-byte opcodes, dual and quad
>              read and uniform 4K-byte erase.
> Sridharan S N (2):
>   mtd: spi-nor: gigadevice: Add support for gd25lb256e and gd25d{2,4}0c
>   mtd: spi-nor: macronix: Add support for mx66u1g45g
> 
>  drivers/mtd/spi-nor/gigadevice.c | 6 ++++++
>  drivers/mtd/spi-nor/macronix.c   | 3 +++
>  2 files changed, 9 insertions(+)
> 

All these flashes should support SFDP, thus you don't need to explicitly
define them. See
https://lore.kernel.org/linux-mtd/bfc85475bdcea46ea6c3ece98cc1e9cc@walle.cc/T/#mf79010e7031b03bda31690b4229a4f27f712f3a7

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
