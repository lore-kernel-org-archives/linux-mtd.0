Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9E1C982CA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu7BHda3ggAOjMCsyIZw+GMlFZwl8uuclmQopTpDU08=; b=blljxZhLoyxHyR
	EF0W/1DM0K1KJ+Js+f1m9GIO7NWsQSnE3ppM//tOcpScA5Mhena8zKyrYLCfEIJOznHhm6d8ewGS6
	Yw/f4Bpyc7tZ50Vxm+xtmpg2wLSbtn/Myjtvm/nNWK3z7LbK3Od4nJ2UU8KjMuVgTxFtGJRvNMXeT
	DXwFhVf78EtJWGg8o1jO+zZw07KFFo1/sABTvEMVdRQzrJKGN1iv5antV7vunCD1AvA/LZHvl8oZH
	4XV8Zsamxb9HJ/z8yxW9Ar6pYKROal2QxyivV8PZafHEpHTsU+5/gA8WjMOD3TXSnjhELqP9D6X4S
	kTbC0MRzGx4fdbhuGsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglSC-0000000EK7t-1jR9;
	Fri, 16 Jan 2026 15:09:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglS9-0000000EK6g-1gk3;
	Fri, 16 Jan 2026 15:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8E3B4352E;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0FEC116C6;
	Fri, 16 Jan 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576172;
	bh=JaycEg4pEUBARbXys6lFHpvRjjDORrRS0xEzYaJP3/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bn+ZQ6/SjS86BFNGVsh5LR0MQLdrS94iE39QOjb8kNzERTkYjbHv6uGJLIsNx+PfL
	 rXlgG7UuzYjU27UX54GD5i3ds5Z+2atDjusGzKgzSP8qQEX8KBXfQuX3CX6DpmTlnS
	 g/IQkQkW95qkVfg47/rW3JsrsPUhOOYWAlttYchuZB8m0oS8Exg0rauZNUBBU4305n
	 fWB1gZpgNG9OTrDs8R6mytg+qRr1rYV1SZpvgOA3yxwLZIod+CxyoofLCz0nbprUsS
	 d9PBqrLA2tf/5kGh7yhTelwbDv/NHyvPA2mSf5wORTjh9LnrTYskk/iap3ZFjwGt2j
	 IAQV5jNV3sksA==
Date: Fri, 16 Jan 2026 09:09:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: julien.massot@collabora.com, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
	miquel.raynal@bootlin.com, linux-mediatek@lists.infradead.org,
	conor+dt@kernel.org, vigneshr@ti.com, eugen.hristev@linaro.org,
	richard@nod.at, pratyush@kernel.org, lgirdwood@gmail.com,
	mwalle@kernel.org, jiaxin.yu@mediatek.com, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, shane.chien@mediatek.com
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
Message-ID: <176857617091.1608125.5751888135752689568.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_070933_463059_AB601C55 
X-CRM114-Status: UNSURE (   7.91  )
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


On Thu, 15 Jan 2026 13:56:22 +0100, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>  1 file changed, 162 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
