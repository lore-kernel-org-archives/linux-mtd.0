Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F24C2BA1A
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 03:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E3442070A
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 03:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePrFqNx+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E3442070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzyyBGYZU5B15MwF1cSVpcKABNIYCEjPBxobQaffRWk=; b=ePrFqNx+yxKNYI
	dHwJHamtuNiiyYtz9hT4FQn2qHu/1KK2VW4XHYd8nsBZ7zxq3Qq2mtl5WchXQZ+7Av4SOEOQWO6qw
	k/qypoxYjNzTM8bWzyLGLCzBbbhDXfv3FgXS736zg68dJuUa6b7M3yUENlsb07lDBmI7pCBV6gUM3
	3xPxGxbW9o1l2nifyz30r3R0YGz5F72b2zPBz6qnPvUQ7FglYVhC6KRkcSY3l/gCa/CZp/GzVpq7x
	g9pnK3lK7+6iKZAsLnP4fGZwKLKvL96XozW4ymYQyP1PUBAlANFH18e3HCt7SyWkIq1NFEFbswA9F
	dh6Jgh0X0q9yM7O0kfZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSYMr-0006lv-PG; Sun, 26 Apr 2020 03:54:09 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSYMd-0006YY-U7; Sun, 26 Apr 2020 03:53:57 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 93FE666F8A9BDA450EDB;
 Sun, 26 Apr 2020 11:53:49 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
 Sun, 26 Apr 2020 11:53:45 +0800
Subject: Re: [PATCH v4 05/16] mtd: spi-nor: default to address width of 3 for
 configurable widths
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <20200424184410.8578-6-p.yadav@ti.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <6b6384ad-d37a-eea6-af29-322e83924912@hisilicon.com>
Date: Sun, 26 Apr 2020 11:53:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200424184410.8578-6-p.yadav@ti.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_205356_134224_D38FA80E 
X-CRM114-Status: GOOD (  15.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/4/25 2:43, Pratyush Yadav wrote:
> JESD216D.01 says that when the address width can be 3 or 4, it defaults
> to 3 and enters 4-byte mode when given the appropriate command. So, when
> we see a configurable width, default to 3 and let flash that default to
> 4 change it in a post-bfpt fixup.
>
> This fixes SMPT parsing for flashes with configurable address width. If
> the SMPT descriptor advertises variable address width, we use
> nor->addr_width as the address width. But since it was not set to any
> value from the SFDP table, the read command uses an address width of 0,
> resulting in an incorrect read being issued.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index f917631c8110..5cecc4ba2141 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -460,6 +460,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	/* Number of address bytes. */
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  		nor->addr_width = 3;
>  		break;

Should we also assign address width to 3 in default condition. At least we should not
leave it uninitialized here.

Regards,
Yicong


>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
