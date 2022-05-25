Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B131C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fSUZYnSlcH7U8RNM4eqbT1QnBJCZxhDyZz4wOiB+Xps=; b=dP3hHR0hbc7anz
	LjHfOivvMmfdhQRBuQpOUHX2HTzHx3JjQXl2PUEoKhxa5BRjCYDLCeVC9IHoh1OW691RDPJADj5pY
	4Y7I3RFkXK/z/Xr7HUKhBRHgFuN9DkC3ujY3Az4n2YEBqU9n1oZUuu3Hx9ldorH13I7BC8z8fi9Ky
	pzCjfCfRDi5Lr8BfbEKqCHvkl18JnJeM5tSFK82Uo0Ie3Paq8zY+22viNtULaJPIHJz9KnnRG/lrr
	4Ywd4MiPxW3GOIyUhEsmcT/LM5w5kA0xZ1E4aDcV0QtDSKwVAXUsp7qOcQm/rxx1zo6oCmqUrItgU
	NLNChC7fOQrUs34wQkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntm36-00AHN8-Gq; Wed, 25 May 2022 08:07:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntm2v-00AHLT-RC
 for linux-mtd@lists.infradead.org; Wed, 25 May 2022 08:07:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id p26so26014306eds.5
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2022 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=K0TSn2fqvwK9SDiwJiRffb/eDZSZxCAGCJGbT9SkTtc=;
 b=CPH4puU00SpN4r0xq5dXYT/9N8r3QYL8RRabLLQKg1tmtWnmC9EoFiVIGQNrxhfVeY
 V3g/XsGz9jrl5z3TuSIDKAynEJ6x3W1KqDPAcg4noVeOLzZWCWYeWxh6Q8WBh1TlEyE1
 vR7XRtPoKqCSc+EDNGF0rCZQtO4bIq/vafTTflUwzDL89V8JGPdS+nBVBSlJOEF1bTMf
 JZEceNXOlF/Eyjq+gDZvCD5Yw+tdloey87nLY6T9HdFnlfxQNWjekE2D1HdS0AXGqbLv
 yX/nCKyOoiGm/xMIopFljwGVDU6F7aJGmwOlsJX+QF03hJOqINjrLILBSqkl83bgvbqd
 M4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=K0TSn2fqvwK9SDiwJiRffb/eDZSZxCAGCJGbT9SkTtc=;
 b=hpwtVkWh9KXcb8g+G9v5iX1NVeNFvMSGQqOiDxyqpzhrP4n9lJPgxaQi4bSW7hImWO
 64dhA1B9nx9rrlPXOA5yynKyYw0VZHKrLUOCrI7YanHsS0GasHfNM7htNx7E3KLGAvfd
 466iEUoEYQSCKFMrdJYZh+pP/iOTzyn2SXawOaxKXL4WedWMPP5idsTv6G7IdEYQR4xx
 Cw7Ab+n1SQ+oaQkKyyJ+Br0ciJZFtrActQquz498BExxr2pnytCr4bXeO9gpVJLWuXYl
 DZbhgu2M/K0S+mr4CkggMH5VIKwg3v38/mCGwBh7od02fHC/ROaqoqgmakIeJm1TyaB6
 vTug==
X-Gm-Message-State: AOAM5315/PTAZaPJe9fjlOb+g1nHEknNgPBVPzjNQe3u8lpmYV7bGruu
 tb/eyZlTKzeeWeEBDhzMJWH+Aw==
X-Google-Smtp-Source: ABdhPJxu0J/w/m+jAc1o4NHhbkNTu7E6Qn+2GZlYcRX8vJJeJnGbs2EzXlc/+SXbjKrJIwqyRkBRtw==
X-Received: by 2002:a05:6402:3047:b0:42a:fbe9:4509 with SMTP id
 bs7-20020a056402304700b0042afbe94509mr32502177edb.159.1653466025277; 
 Wed, 25 May 2022 01:07:05 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ot22-20020a170906ccd600b006f4cb79d9a8sm2783035ejb.75.2022.05.25.01.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:07:04 -0700 (PDT)
Message-ID: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
Date: Wed, 25 May 2022 10:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: workflows@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Getting rid of infradead.org - corrupted subjects
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_010709_958308_41A200E1 
X-CRM114-Status: UNSURE (   7.86  )
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

Hi all,

The address list is semi-random as I don't know whom to approach.

Problem: infradead.org corrupts email subjects by changing:
s/,/, /

Examples:
1. Previous discussion with Uwe about linux-arm-kernel:
https://lore.kernel.org/all/20220215125856.es2euyoqo6mp4y2t@pengutronix.de/

2. My last email for MTD
Modified email:
https://lore.kernel.org/linux-mtd/20220408063720.12826-1-krzysztof.kozlowski@linaro.org/
Proper email:
https://lore.kernel.org/all/3e550deb-7c27-894b-a0b5-62609a60f17f@microchip.com/

When people use Patchwork or b4, the email from the list is being used,
thus the one with a changed subject. Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9547c4e74f6b4b56c2f9e4e7a286ce126fd333fa
The subject should be "dt-bindings: mtd: jedec,spi-nor: remove unneeded
properties" (no space after coma)

This leads to real commits with a bit odd subject. At least not the
original subject.

Can we do something about infradead? Get rid of it and move the mailing
lists to vger.kernel.org? Or fix it?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
