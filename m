Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FB7C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 02:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FAC20835
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 02:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJsfc5HP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FAC20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bo4zuh6pZcDlUufi46MP0xGPPv2VAzd1mqVGDuspqo4=; b=gJsfc5HP3/uTVN/+Y6ZZ7OCMT
	oKPYXcv68za0PxuwXMNS+4MXoMyEwtP9UHFygW1Buan6jZjbajcbkxupW223GhO35jh3xrvKuj/tX
	FPNa8iRX+IEjWtXfRfQyhVOBnRqA0RCmTqaoZGBZj0rL47DtH7tyPRlnEoJSklv9YifnPkonT8BPI
	mdh695JFQOVEDX3GDqBZMF1rp+aG/KiJPOQ2VFLkLgshURi8OI6J76ShZSwk8MnoJsBPftB3UQkQG
	2Qi72EQd51UDT7uHs7VpfZbUHWPQw/VqoQgdxX+oDQZler2Is1gHVgK48mGy6rmikk9FCTTXBeuT/
	g8O2YIJcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0dK2-0002HZ-Ut; Mon, 04 Mar 2019 02:27:18 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0dJv-0002GJ-KZ; Mon, 04 Mar 2019 02:27:13 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 4 Mar
 2019 10:28:11 +0800
Subject: Re: [PATCH 1/2] mtd: rawnand: meson: add missing ENOMEM check in
 meson_nfc_read_buf()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>
References: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
 <20190301173820.30776-2-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <4835b7c3-e360-fb73-7ddb-b86fa3c59f8c@amlogic.com>
Date: Mon, 4 Mar 2019 10:28:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190301173820.30776-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190303_182711_675318_3C5C0623 
X-CRM114-Status: GOOD (  12.69  )
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

On 2019/3/2 1:38, Martin Blumenstingl wrote:
> kzalloc() can return NULL if memory could not be allocated. Check the
> return value of the kzalloc() call in meson_nfc_read_buf() to make it
> consistent with other memory allocations within the meson_nand driver.
> 
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 3e8aa71407b5..a1d8506b61c7 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -528,6 +528,9 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>   	u8 *info;
>   
>   	info = kzalloc(PER_INFO_BYTE, GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +

Thank you very much. it is really good to me.
Acked-by: Liang Yang <liang.yang@amlogic.com>

>   	ret = meson_nfc_dma_buffer_setup(nand, buf, len, info,
>   					 PER_INFO_BYTE, DMA_FROM_DEVICE);
>   	if (ret)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
