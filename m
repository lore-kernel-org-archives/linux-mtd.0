Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27352C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ch9aPDMWvrLkP9jIOypexcAx45enW6PN973mwOgeazo=; b=wXNnbz0aIZD9Vc
	L9JBIfSNtVIjFe0xZ/Kh9xY8vZCyzjjyhj1OIMkS196CwBolcgZtHA6TciBPjVUH1PdNYD5DgrPm6
	06JYLs8Gudmc/9Fz60XNIigbyhLjIFhnpouccAM+kEBxlNdUZezqx8J7mt/X5dkJMycithWCLKBj/
	r7jnPyxSSC56/HX8c4G5FHZlToUh/lJ1NEL2/3VZlLCi5x4m+Cn+3u1c2WGb+mepCauUeocMA9WKk
	9obW+/Nl1jyLyvM9QHitNST8s39aJCP4oTGdAoI3G7exOPRxJc5/3VKjoXCzaNfXPXMAOwlqhpe0+
	2FZJ0RQY64VvWkcpXWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCky-00Ay7d-Je; Wed, 02 Nov 2022 12:22:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCko-00Ay4w-5Q; Wed, 02 Nov 2022 12:21:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CD616602946;
	Wed,  2 Nov 2022 12:21:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667391714;
	bh=GWrRwN7bo6fjXnGPMvnQdgStYumrjcHBQAPPOaH9oHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TFEcV7yYRYT7iW5wv1LhRrmo+Xj1fG3UlLNU1htU2Ve/t57kVotd9+jk1QcLJGJYv
	 21LoV00Gq5lKqyIfGkihnXbvJeetV2KzpagoJZy+0j2xVYVswmw4ZP11SVNSezlslk
	 LO0tMXIilWpkTiDtfVRLaKghaC2ISJubVKOrE1v2CyEOd1ZrfsdNyZ8qgOvGRy2o6Y
	 kOlRvh4rQk2CBpaudqPMhevdpq3GS5JOmr5+hF+mJlQqDQzSycp3sDqjOBhO8ta4ZU
	 zNJOU0bRGMS1SpTirb6ZqP24Zvj7HNkvUhLwGtC9Tq5qTYoQ8E38m3lGhX/ONOlL8U
	 kyZNE0W558Dnw==
Message-ID: <4841b48c-c35c-a375-8e78-154bc5217930@collabora.com>
Date: Wed, 2 Nov 2022 13:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] mtd: spi-nor: Fix the number of bytes for the dummy
 cycles
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bayi Cheng <bayi.cheng@mediatek.com>
References: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_052158_368001_2D3DFE7D 
X-CRM114-Status: GOOD (  10.75  )
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

Il 31/10/22 13:46, Allen-KH Cheng ha scritto:
> The number of bytes used by spi_nor_spimem_check_readop() may be
> incorrect for the dummy cycles. Since nor->read_dummy is not initialized
> before spi_nor_spimem_adjust_hwcaps().
> 
> We use both mode and wait state clock cycles instead of nor->read_dummy.
> 
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Co-developed-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Dhruva Gole <d-gole@ti.com>

On MT8195 Tomato Chromebook:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
