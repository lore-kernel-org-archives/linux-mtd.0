Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB37C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 05:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqEkhkXIakD44YelOxbIk/yW127W6he9jE5au0AkNsE=; b=R4Ezs4dL743Uzs
	5g4SNYshEmNuweO/UEH/rodUXqPKWS7xYe7cHv3XiiIsApde/1nLUh8S8y5dgx0fpnIzbeloBulcG
	Ui5U+yMUtb33mxnh0n9BCy7U9vEg29ELWV6UiuhMw3IcaJp6/U2FOzXHWNzIXWSn2LxJkRJRCnA8Q
	mGGY9QKuo2HbYAdVtgd3EMgSyBmbqjLkZ2iCgrQFYebnHqw1jl8+PRo9iYWLXfMHK/2H7Q7XsKoFj
	sxXkEW9oly6LdHYjZ4XT4xtHj1Prv1pcVk0IaaduG+rKjF0uqLjoSbnoR91aiI6yIryGwYz8uQLUX
	biy6rLtx6BLeL/0vgrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6AU-00DXIh-M4; Thu, 26 May 2022 05:36:18 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6AR-00DXI4-7o; Thu, 26 May 2022 05:36:16 +0000
Received: from [10.28.39.121] (10.28.39.121) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 26 May
 2022 13:34:46 +0800
Message-ID: <f82fdbaa-fed4-cbd3-b559-53bdd373b923@amlogic.com>
Date: Thu, 26 May 2022 13:34:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mtd: rawnand: meson: Fix a potential double free issue
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>
References: <ec15c358b8063f7c50ff4cd628cf0d2e14e43f49.1653064877.git.christophe.jaillet@wanadoo.fr>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <ec15c358b8063f7c50ff4cd628cf0d2e14e43f49.1653064877.git.christophe.jaillet@wanadoo.fr>
X-Originating-IP: [10.28.39.121]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_223615_495147_1C449383 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Christophe,

On 2022/5/21 0:41, Christophe JAILLET wrote:
> [ EXTERNAL EMAIL ]
> 
> When meson_nfc_nand_chip_cleanup() is called, it will call:
> 	meson_nfc_free_buffer(&meson_chip->nand);
> 	nand_cleanup(&meson_chip->nand);
> 
> nand_cleanup() in turn will call nand_detach() which calls the
> .detach_chip() which is here meson_nand_detach_chip().
> 
> meson_nand_detach_chip() already calls meson_nfc_free_buffer(), so we
> could double free some memory.
> 
> Fix it by removing the unneeded explicit call to meson_nfc_free_buffer().
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is speculative, so review with care.
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index ac3be92872d0..032180183339 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1307,7 +1307,6 @@ static int meson_nfc_nand_chip_cleanup(struct meson_nfc *nfc)
>   		if (ret)
>   			return ret;
>   
> -		meson_nfc_free_buffer(&meson_chip->nand);
>   		nand_cleanup(&meson_chip->nand);
>   		list_del(&meson_chip->node);
>   	}

Acked-by: Liang Yang <liang.yang@amlogic.com>

Thanks,
Liang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
