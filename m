Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD64C19F28
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Aug 2022 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtnCYQJ5XSLpV9lWdujDU0CUmn2C3ThOJw69InbX3qM=; b=HMeYZrb1pvFDch
	T58zmVJxnxNKPdTiR8hj6GcmYD/957Y5NoJPOiJw9cM3Pq20bCk5XhkSKEGuCIGwBiEIl1mrVxz0c
	uRVK/g+3OxbOc6H822WXTYqBCr1c5L/sNsy8f5AHF+fYClz7oBOI5xFVFVDhhYbFk1UEtce9xhU4m
	SQfGmyMe+3Rj7wco+nPx/YgR/YnVoIZHjfJS/eF4vxXkjGh7DTxyuL0Dmn8jAeMmo++Y9JrYyVEFJ
	cOGtPn2ZEJx6w5xzLmju3e9uKHDeiyrvk7jtPnFGDewgOMW8dPK5f6ESoWqmQeBgdeBuIv+2rHM2V
	34s1iFruT54SpR5yr30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCJu-005E4J-U0; Wed, 03 Aug 2022 11:13:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCJq-005Dva-U4; Wed, 03 Aug 2022 11:13:44 +0000
Received: from [10.28.39.72] (10.28.39.72) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2507.6; Wed, 3 Aug 2022 19:13:26 +0800
Message-ID: <e954f248-614b-5f59-b6c3-13d67575c416@amlogic.com>
Date: Wed, 3 Aug 2022 19:13:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: rawnand: meson: fix bit map use in
 meson_nfc_ecc_correct()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <linux-mtd@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <kernel-janitors@vger.kernel.org>
References: <YuI2zF1hP65+LE7r@kili>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <YuI2zF1hP65+LE7r@kili>
X-Originating-IP: [10.28.39.72]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_041343_034762_59C452E9 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Dan,

Thanks.

On 2022/7/28 15:12, Dan Carpenter wrote:
> [ EXTERNAL EMAIL ]
> 
> The meson_nfc_ecc_correct() function accidentally does a right shift
> instead of a left shift so it only works for BIT(0).  Also use
> BIT_ULL() because "correct_bitmap" is a u64 and we want to avoid
> shift wrapping bugs.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>>From review.  Untested.
> 
>   drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 829b76b303aa..ad2ffd0ca800 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -454,7 +454,7 @@ static int meson_nfc_ecc_correct(struct nand_chip *nand, u32 *bitflips,
>   		if (ECC_ERR_CNT(*info) != ECC_UNCORRECTABLE) {
>   			mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
>   			*bitflips = max_t(u32, *bitflips, ECC_ERR_CNT(*info));
> -			*correct_bitmap |= 1 >> i;
> +			*correct_bitmap |= BIT_ULL(i);
>   			continue;
>   		}
>   		if ((nand->options & NAND_NEED_SCRAMBLING) &&
> @@ -800,7 +800,7 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
>   			u8 *data = buf + i * ecc->size;
>   			u8 *oob = nand->oob_poi + i * (ecc->bytes + 2);
>   
> -			if (correct_bitmap & (1 << i))
> +			if (correct_bitmap & BIT_ULL(i))
>   				continue;
>   			ret = nand_check_erased_ecc_chunk(data,	ecc->size,
>   							  oob, ecc->bytes + 2,

Acked-by: Liang Yang <liang.yang@amlogic.com>

Thanks,
Liang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
