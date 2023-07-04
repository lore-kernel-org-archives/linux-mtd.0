Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EC1EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 11:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7OEpHJqZiruQMnLf8N51z/Kipc+awhHbDTYIe09KQ0=; b=ypM07bHQaICxGB
	B/MqUlB0WZZ1txiLBo5QiwpQ8zis+X4ztSZtgp0MS6Ft3JaVxftbhd2BOCTmyZORrMCcu94+or90d
	JeDDECJyon9YB/C9SoGVbHhYplYALED+9jkQY8tb9YP6wAELeOreHZC+ibRQOFqAK1BEkx/4o1FcA
	kdv/YGIaOl/KAFCEYLHuYfptJZCYeV7N8O321LIhcIP1L/Y+uYaiu76OF1ky/eV2btoteNvwnUqyv
	6l6NcvBBIvtrQhwgou3yE+R+WZsrsz1XALMZn/NS4lFPVIooDoy28DO/VhrCODPbgfthLJAWJa+9C
	nsWypnjG1IObRAMfXUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGe78-00D70q-2w;
	Tue, 04 Jul 2023 11:22:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGe74-00D6zW-2c;
	Tue, 04 Jul 2023 11:22:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFD4B61193;
	Tue,  4 Jul 2023 11:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9688BC433C9;
	Tue,  4 Jul 2023 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688469749;
	bh=bWtf92i8/oO3zMlwR5SLYOrLYXhx27D67V8Iypmio+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvywrCopXdg0XDl7CE9xtuwtEFzMRdFnLG5B6RMq/g6B8poPgGQYKuYTYBjDTrKo6
	 v9FRy/OxlIpGaB4cCFoX5jMvHX4Wr+2MpZFyMVuUFZyrLAdavaYzj3BWquHzMkMNfO
	 bpoOVkSkpgx3TDxSzYD0gbZTKBqVisLLyYQFePmyHaw6t9/AFj1wnNEIjQ2tUFn53w
	 xEslso4o8h/nlnGoW4LrM8lxpyVELRWR57V6NSbDR3ZlV0YOwEBmHP0hP/qUYPh+Hh
	 ZKBWoHvVOTc1pLMKNxrYL0lo4wH0bdTm1XMfQcws4vk+hw6d7u7g8cL1qy6hloVRLn
	 RD5Ww+GgHPt7Q==
Date: Tue, 4 Jul 2023 16:52:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <ZKQA8HxGavlwq550@matsya>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_042230_911303_D63B7AB7 
X-CRM114-Status: UNSURE (   9.09  )
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

On 02-07-23, 20:23, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=' sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob,
> 
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
