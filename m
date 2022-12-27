Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD3C10F1B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Dec 2022 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNMQ8E7bfJfDnPbLorJBCJbm83YI04CEyZxRpOidENk=; b=LFkufcdGCCzZrp
	LmQ9p9mPcyp6lBTcZ0xA79nPCl8u1SX+f23Z2rtsju4mmV1K1YGChb9jD67OBKOLSNcrIIEpnPH0T
	ZXv4vHnvk0wHjiRFv+RLy2JLh6nGPyC+jkq09WlaTLJSyg/jM4pLBiO8d8IcqDikYBgRxCAYOcsFO
	wS7yuFhXJCHknI02MGR7n2KQAFenwe49HI4XtM4RxkBSqXHZ46uHNsDKhHwj0CQYv0aDYZY79MmrL
	jdSa9eInBzvLeky3E0HVOyEw+Ayo0CCzvhR1gmCgDKBpOao7Bd8WsFWcJoNkvTRcF8WFMIQCTihgd
	aCYemVllTuNgJphDbRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5oj-00BbKf-No; Tue, 27 Dec 2022 09:00:13 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5oR-00BbCc-Qu
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2022 08:59:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id s22so13148134ljp.5
        for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2022 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvTNpgCL5uXa6TwKXCetO6h5nnP9ujMVdxuzta2chr4=;
        b=KARqcbnv0d6fxdcr5jNfYWAC36DDVi1WYdyJRJhwoKuLXa8j+x5OJB6cnLNcEa5vS+
         NJgJ9CSeJNRcxrxM2X9tW6bgzZLnOlL3odGL68zWwshGBYgm9QGERpw1iqh6bbDHMS80
         35FbatNiYnWdH3ZGh1qdoiFMpUZqapBSP1OJFzliNt1JSDhmb/2CMZDpSqOojH6UfK4T
         sle/FniuFRZZDKgRzuZotSrMw2V0zNS4qFbizBNpfKe1gLamb4C+QcdNefxEW7OWo83G
         6vJgbVJbMY6Oie/BohXvlXkFaoGLUZqGpCTkbeyV6uFxsD/hUNM75T1R3xz7NxoKBB1o
         jcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvTNpgCL5uXa6TwKXCetO6h5nnP9ujMVdxuzta2chr4=;
        b=E6ovrTCy+vczXXlz55YHqtTP4hDfB+3bsqS8XmylSlLZKWCwsMkVKMgO4cIE7JywKs
         ncgiOOcNPqV7rigzNAs896GgXxRKNGGAFt2ic79F8fD/zLCSE3YluhmhA1Zl2R+Wbwaq
         NsgZQgS3foRIKCsCXmObgbcUVeukwVEsu2F5PrxT/YBrUC9iqFJ11LbaqWd3ZxFEezHJ
         u+Ahe64C1Abr9cms6gFg5hnwBmbiP5YY9V+cpNDEe355B+rmsYBVYB4ScpLB6MsDmLo6
         IJeOpdHQll7XmXsN3rKfEKDljUSRjAwhccdV62KBJ5IU+5oCIPKCFOiiTDz1S5HgWVNv
         v/+g==
X-Gm-Message-State: AFqh2krxicMVYzpxhQw0lGz5cpTHNtK8RveaM8p1eGCO+NCci6BIMDH9
	ewRsfApcEA3bR0ShxPJsw/kCbQ==
X-Google-Smtp-Source: AMrXdXtV6v0U0PGx9l5HdKGRGgf72ErVoKNwc1GIhdk/VuOQnmmaZrNC1qRvoFgs23cE5C+Svpl2OQ==
X-Received: by 2002:a2e:2e17:0:b0:27f:ba77:fec3 with SMTP id u23-20020a2e2e17000000b0027fba77fec3mr2284970lju.10.1672131593109;
        Tue, 27 Dec 2022 00:59:53 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c031200b0026bf0d71b1esm1534837ljp.93.2022.12.27.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 00:59:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc cleanups
Date: Tue, 27 Dec 2022 09:59:44 +0100
Message-Id: <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_005956_307066_D9ABF532 
X-CRM114-Status: UNSURE (   9.55  )
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

On Wed, 23 Nov 2022 15:41:16 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> To handle this, three drivers are used:
>   1. The RPC-IF core diver,
>   2. An HyperFlash child driver,
>   3. An SPI child driver.
> 
> [...]

Applied, thanks!

[1/6] memory: renesas-rpc-if: Split-off private data from struct rpcif
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f8fa9cb3fb16e06514fec0bac58996015dedc453
[2/6] memory: renesas-rpc-if: Move resource acquisition to .probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9bdb35b864fb92c037b3e441ae8f3a7efc6bc679
[3/6] memory: renesas-rpc-if: Always use dev in rpcif_probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ef1eabee9d97e263e61aa32c961f8c94cb3e6e5c
[4/6] memory: renesas-rpc-if: Improve Runtime PM handling
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f63d7c4d409461aee459c21797a3d7bb6039affd
[5/6] memory: renesas-rpc-if: Pass device instead of rpcif to rpcif_*()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/eb66a9971ffddd0dc0640f282768660875445ef1
[6/6] memory: renesas-rpc-if: Remove Runtime PM wrappers
      https://git.kernel.org/krzk/linux-mem-ctrl/c/691f04fc5251f79c71975acf1f69ace87496738b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
