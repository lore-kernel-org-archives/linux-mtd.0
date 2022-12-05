Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54717C4708C
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1MzUNVHKYwFw/0YLV6WywyDP1wAUHxhkO522r/kpyQ=; b=XopBuLYWOxdpUd
	8kMn1NlCBfFzNSORwGFrrYGCmfU0ZyyngpjchoE69W3ZJlTgGb+S6flttwk+uxh5ASVf8qcHhPtbb
	4UeIOxUehk0yesVGt84u9QyVgaRJdYyuFMUQsf/dfZy2bQyCn7NZvoP2uBIHLAkJTh4i4pUDjjXkV
	gRBjbAKeDHtyQL/vNwBKM2QPIIZ7YlhceryULmSRXgY4Skkgj38/ajjnnPGJCuFBfFKK4rnkKbdJQ
	RcXmf3SfK4T8smzHDU5dK3+sEJCycob8my+1oAMVYDqoATCl0xnCuJWVcT3buj9TanE2wYzVishHA
	8qsMVl0SflJgIcCszEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLr-0040JB-Gf; Mon, 05 Dec 2022 14:21:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLa-0040Bk-Qj; Mon, 05 Dec 2022 14:21:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA7BC6601E6A;
	Mon,  5 Dec 2022 14:21:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250084;
	bh=NPMSgIxm/IXldzeGyabGZE0MeVSJ1WmroFFQ+QCluy8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M6aiSYUzpfsDT2/aoI8gLuXBouJWy4KNgMDRTXxHrGEEZ7r81AnVgl1fYYRHwyY+n
	 ZwnArRIo9iXOdslt1Hrp+Pk5SuvMwH4pF67UF+orzFqNPVTStLOLEXBjttmSpQz4at
	 /y0YNqA/sUkZirp+UiFeOjc10QyLLgALk+9gDMaY6BD3TjvfCBJUckAh2KBCAeUwjT
	 4+cu/NgmaIjOLj3/cBsUc6oa1iWe2S+trfLy2OXPWXIY6vuZ4zfhBt8cnPhYhnPCQK
	 5gs6sVOEdWSyD1c+DETIGLp9hVcNj2JsTSnzAQcUoZDhAafl/PPRtRysS5fwAN2ZIA
	 vuQhevsJo8lgw==
Message-ID: <50ede482-7f03-ff55-5ad0-aa6249027cbe@collabora.com>
Date: Mon, 5 Dec 2022 15:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/9] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-5-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-5-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062131_038573_55EEC53A 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
> Add ECC support fot MT7986 IC.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>   drivers/mtd/nand/ecc-mtk.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
> index 9f9b201fe706..c2f6cfa76a04 100644
> --- a/drivers/mtd/nand/ecc-mtk.c
> +++ b/drivers/mtd/nand/ecc-mtk.c
> @@ -79,6 +79,10 @@ static const u8 ecc_strength_mt7622[] = {
>   	4, 6, 8, 10, 12
>   };
>   
> +static const u8 ecc_strength_mt7986[] = {
> +	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
> +};
> +
>   enum mtk_ecc_regs {
>   	ECC_ENCPAR00,
>   	ECC_ENCIRQ_EN,
> @@ -483,6 +487,17 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
>   	.pg_irq_sel = 0,
>   };
>   
> +static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
> +	.err_mask = 0x1f,

Can't we use GENMASK() to define err_mask instead?

#define MT7986_ERRNUM	GENMASK(4, 0)

P.S.: Did I get that right? Is that referred to the ERRNUM(x) bits?

Regards,
Angelo



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
