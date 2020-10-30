Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9C7C4363A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 02:24:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C54020756
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 02:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IbIwy6Y+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C54020756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IJB38x2JGsXCuMQ3rr5QtAkwk1Tjij6IE6f6lbr57q0=; b=IbIwy6Y+lslvlic54HF3LmnVS
	xpKj/Gxm3KOLUWq/KwbdDIN/5vtCVIT/qdj8NKf5NIWCSZ3HZ1DVGfoxcXZlIlWb/qG46GVa4DGon
	VwAvZk6P3R/HVI/ukL1kFMFKU2pZTWUTzIh1MpZDGFxffrgj+ImMYowzEz3FY3U7msaTuet/svCwc
	3VRVmfy6J1jgzffiZdf3tQM0xNm82KE+r8t5jPhLFpVNYlU4rr63cbRWFVeMmqeIhrPNVu6R0ttpB
	XhXpGWcxoA/hzw+J99/5g4ZwwaHcYVHAsxgXbplbcHkcCr6nWJ1pqKvgUDLi/Xvg6I5JkJermaSCS
	tQOOaoyAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYK3x-0006GR-HO; Fri, 30 Oct 2020 02:22:45 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYK3v-0006G3-G4
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 02:22:44 +0000
Received: from [10.28.39.46] (10.28.39.46) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 30 Oct
 2020 10:22:31 +0800
Subject: Re: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
To: Sergei Antonov <saproj@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20201028094940.11765-1-saproj@gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <a1dc1e51-d52e-a5de-6261-2a4740272cbb@amlogic.com>
Date: Fri, 30 Oct 2020 10:22:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201028094940.11765-1-saproj@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.46]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_222243_553574_D808A119 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: stable@vger.kernel.org, jianxin.pan@amlogic.com, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei, miquel

On 2020/10/28 17:49, Sergei Antonov wrote:
> Arguments 'infolen' and 'datalen' to meson_nfc_dma_buffer_release() were mixed up.
>
> Fixes: 8fae856c53500 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Antonov <saproj@gmail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 48e6dac96be6..a76afea6ea77 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -510,7 +510,7 @@ static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, void *databuf,
>   }
>   
>   static void meson_nfc_dma_buffer_release(struct nand_chip *nand,
> -					 int infolen, int datalen,
> +					 int datalen, int infolen,
>   					 enum dma_data_direction dir)
>   {
>   	struct meson_nfc *nfc = nand_get_controller_data(nand);
It is good to me:

Acked-by: Liang Yang <liang.yang@amlogic.com>

and thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
