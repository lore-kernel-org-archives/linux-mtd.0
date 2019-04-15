Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D336AC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A458E20825
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONz+fLsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A458E20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=odgfV4JUGeNcUPztjMQtD+jV6NB0oXcjVfoQ8CxqKNY=; b=ONz+fLsgsDFAAPvDjFGSEjZHL
	8Fb41h2rfs7sI2inUUTJay6EmLfG5GvG9SnJVRx0NzDamAwHNnEfvtojeC7oda14q6BW7ugujIXhV
	9xvjFiO6e+IkJaBS0VJu0WC89j7sKOelrx2BlG4Ngpcoa0UML75sfBhMxYHUSr1bewvRlpgVP6Qt6
	zwkQblSH2Siv9409ZB1OWKgvuvr/0X2ErUSwf1p6myLJmxuWip7jKb9eL6JGrleinjCA80jxGuP1U
	35e3aLVQsd9ekdr7WFeVnrBunsOeYXVAb5J3BF4Loz5Lv6NXmMFUksZgHX9kwnDxRy+vmUPrmOvEl
	GDyTQYSRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFujW-0007UR-Ve; Mon, 15 Apr 2019 06:04:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFujH-0007H5-DV; Mon, 15 Apr 2019 06:04:37 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 15 Apr
 2019 14:04:30 +0800
Subject: Re: [PATCH 4/4] mtd: rawnand: meson: only initialize the RB
 completion once
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <miquel.raynal@bootlin.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <bd1900db-7ca1-a6e5-39f9-db54e0b570dd@amlogic.com>
Date: Mon, 15 Apr 2019 14:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_230431_625830_351CE949 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/4/12 6:00, Martin Blumenstingl wrote:
> Documentation/scheduler/completion.txt states:
>    Calling init_completion() on the same completion object twice is
>    most likely a bug as it re-initializes the queue to an empty queue and
>    enqueued tasks could get "lost" - use reinit_completion() in that case,
>    but be aware of other races.
> 
> Initialize nfc->completion in meson_nfc_probe using init_completion and
> change the call in meson_nfc_queue_rb to reinit_completion so the logic
> matches what the documentation suggests.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 57cc4bd3f665..ea57ddcec41e 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -400,7 +400,7 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
>   	cfg |= NFC_RB_IRQ_EN;
>   	writel(cfg, nfc->reg_base + NFC_REG_CFG);
>   
> -	init_completion(&nfc->completion);
> +	reinit_completion(&nfc->completion);
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   
>   	/* use the max erase time as the maximum clock for waiting R/B */
>   	cmd = NFC_CMD_RB | NFC_CMD_RB_INT
> @@ -1380,6 +1380,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   
>   	nand_controller_init(&nfc->controller);
>   	INIT_LIST_HEAD(&nfc->chips);
> +	init_completion(&nfc->completion);
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   
>   	nfc->dev = dev;
>   
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
