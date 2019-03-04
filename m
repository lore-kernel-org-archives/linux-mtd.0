Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEAAC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 02:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F1FB204FD
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 02:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M0KdK7sA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F1FB204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4cd4xvSPvQe/miEdIWYJ1Zkbuqoyx78nQTY8mWokOs=; b=M0KdK7sAavmZ/vaMyE6WYyJx0
	2BZvJHOUfj8zPfcpcp/iCEOlv8ulMaopnGkiPQrdc45jOOlwEw/mbkCP9nq1RXWxzQzFNHT7QiGJH
	djPvfBUtxF4xedwEmOByMBdNhz1IcrSnPotae68K/E6ky9AKFwnsWO4DDSJQt0qKKXE6oiK7czSwD
	1FGI+oAxWwAnYFrDuULk8T4wxlMvbWkY7r9e3XmHlgZG+9OiJklIiMCAu9DSbo4B6W4wkqNRpOn+O
	3KFsf2qzNPAsTr/TMrsR0852oZrl3aFGqRyOlSFZLL5xE0v1RBUSb7jtxCvLrApsSmZCpSUVPiQdf
	sITV9WAdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0dLX-0002b5-4J; Mon, 04 Mar 2019 02:28:51 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0dLV-0002ad-0B; Mon, 04 Mar 2019 02:28:50 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 4 Mar
 2019 10:29:54 +0800
Subject: Re: [PATCH 2/2] mtd: rawnand: meson: fix a potential memory leak in
 meson_nfc_read_buf
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>
References: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
 <20190301173820.30776-3-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <c152e9a7-55ce-424c-8468-a4e861792582@amlogic.com>
Date: Mon, 4 Mar 2019 10:29:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190301173820.30776-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190303_182849_041831_4DC3D955 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Martin,

Thank you very much.

On 2019/3/2 1:38, Martin Blumenstingl wrote:
> meson_nfc_dma_buffer_setup() is called with the "info" buffer which is
> allocated a few lines before using kzalloc(). If
> meson_nfc_dma_buffer_setup() fails we need to free the allocated "info"
> buffer instead of only freeing it upon success.
> 
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index a1d8506b61c7..38db4fd61459 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -534,7 +534,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>   	ret = meson_nfc_dma_buffer_setup(nand, buf, len, info,
>   					 PER_INFO_BYTE, DMA_FROM_DEVICE);
>   	if (ret)
> -		return ret;
> +		goto out;
>   Looks good to me.
Acked-by: Liang Yang <liang.yang@amlogic.com>

>   	cmd = NFC_CMD_N2M | (len & GENMASK(5, 0));
>   	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> @@ -542,6 +542,8 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>   	meson_nfc_drain_cmd(nfc);
>   	meson_nfc_wait_cmd_finish(nfc, 1000);
>   	meson_nfc_dma_buffer_release(nand, len, PER_INFO_BYTE, DMA_FROM_DEVICE);
> +
> +out:
Looks good to me.
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   	kfree(info);
>   
>   	return ret;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
