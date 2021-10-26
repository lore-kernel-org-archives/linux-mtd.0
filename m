Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D97C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 14:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED9D60E74
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 14:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ED9D60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pR0WBPa460kxx/u5eusqrVFZgpghoxEUxzvDGXvvE5I=; b=Pufv0bw2qeoR0R6ypgdVY4vyBB
	enyNbaaJmI/eRfHEVKtlAcNh4bWs8y8KdOhUb3EQLA+4xr4MNpFsXJlStsOtviFb1X6CS+kLOhj/9
	tka9MS1/vqVm3FT62b10ZqU2fNfErQ4LWJpJibIW/c/kIXyaYBSaRypMBOb3g2M0ofVgnyn5Ycz7Q
	M/6vZFap5H1DaPX9XauDYCa/izTZmEcDBKJAvGTThrlD3OwXyyvb6bJMHrsetgjk1V9iIeQd3M0RW
	FC//ZyIzmz0GG5hK/UvNnwAHRlB2fZRAGE1fhPeT1GfrM2gepFugCaSdpy7Mnthx2xgYtrXBepY5U
	C9M4wtmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfNkZ-0023PX-B4; Tue, 26 Oct 2021 14:48:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfNkP-0023M2-6A
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 14:48:18 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E3BD73FFF8
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635259695;
 bh=fsVkyjuPYlvrvC5KH9851YDRNpooqzcn8kiRcv7IL+0=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=UNm0fXBAxGXOpyLPiRk/MOPFs5tyagZ1DBIGrrPgbCzutPW5qWIVHT0n5oPGGsqxG
 vkyK0HUFKz/xMxiijBXJuvgiHzb+C9ifry+2K1fvKnoJhEYZ74eyrzErjK3nImP8v8
 EITUQAY5lEtQy9Mzle7eFx5COP74vSKwV/IZ9qm5wxbE4gFMF6SwVl4GySlD+6Q5l/
 LoOHb0cYWFsYJBVN9QGpNNV0Ta5s85k+P31x10fOnnLb/rTdMqnbGCtQ1W1LAYRgbq
 o5Skf14TWwskNm6hVyHQagdKJFG49nB6kyiSU0wI6t6SYFFKTLxdO2v3k/gY0BeqHh
 uc9sDOPWUyaAw==
Received: by mail-lf1-f71.google.com with SMTP id
 x17-20020a0565123f9100b003ff593b7c65so6270431lfa.12
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 07:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fsVkyjuPYlvrvC5KH9851YDRNpooqzcn8kiRcv7IL+0=;
 b=I9B9Gh7JX3i955bz/6D3YfiQuVgVfOvTb78VlJ1+rKOVl5E3VqLIfgf5yNG29mgh3f
 Muu+s2covADUmLeFrY8xqzDMLuHSsuu9VAFUxQQBYDO4cwocPBdwVJO/VXvOHs5Kx68l
 mmSh0kI1m+Qq99ZPHy+7r9FHyu3hvy+aiwlTLyJF3pv+qQsxMZmFa5vkvJUeWi/2pspJ
 3EcpklnBQf5GKKgOmm2w5O4MSMl4ELBwAkHtHx7Sv42iHiKWLr2PTFm3VVKj93eVHeHc
 8SL3rHBvay9B5PaaKArFBuw5vkAcAs+TdQiJk+4DCwojajz5z2FgyoOYw2XhYJ1ULoph
 4p7A==
X-Gm-Message-State: AOAM532k+ve+0nwSfMJZRKX1Hk0/S5JLNiy4lDJDrsdQuXt+ZJxv+dn4
 AhTVANZ+7NFKsjDMQucVJp3NxYM35aQRtS4N5i77rFO+eFtWzsPMLUXUhjpxL1mcq5G65t/iy2U
 GyUoC9aIxRShTG708c8xJXN6cGSAZqxIZY2kx+fHAo64=
X-Received: by 2002:a2e:9243:: with SMTP id v3mr27320367ljg.260.1635259695400; 
 Tue, 26 Oct 2021 07:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2KIUw3dMiASKOb3ipaEef5iAQjyB+RBgmFcPme73HkXcK5y3WPmCpFx0YHsoHJhTU83ZWAg==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr27320346ljg.260.1635259695206; 
 Tue, 26 Oct 2021 07:48:15 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id r13sm483731lff.213.2021.10.26.07.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 07:48:14 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support for RZ/G2L
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <02123905-675a-0fda-086e-c2401c202fce@canonical.com>
Date: Tue, 26 Oct 2021 16:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_074817_419462_84C3E538 
X-CRM114-Status: GOOD (  17.75  )
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

On 25/10/2021 22:56, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds a couple of fixes for rpc-if driver and
> adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> is identical to the RPC-IF block found on R-Car Gen3 SoC's.
> 
> Cheers,
> Prabhakar
> 
> Changes for v2:
> * Rebased the patches on linux-next
> * Split patch 5 from v1
> * Included RB tags
> * Fixed review comments pointed by Wolfram
> 
> v1:
> https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> 20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 

Patches look good but you sent them too late for this cycle. I'll take
the memory controller parts after the merge window.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
