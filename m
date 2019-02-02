Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4818C282D8
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 03:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD06820855
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 03:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h7BSXGf4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD06820855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QYPalkR8xzsdxxWUGDwfN2XW5C0xhVzwLJDMIpOzCec=; b=h7BSXGf4BQv31aR1fzUXKscSv
	hPUGZZqd56BK2uJFvKCYyefw+cclUlvaWLWH5xCwRxspeBftVIbxyn82iKx9CTt/nCmFnbeTDhPGv
	VzBAE7nLPdbkSohzh6JtLDAJKR3S0fbIuzUPDMev92jGb7euU1uZzb/1/POZA///bFmxb7IPBaVP7
	TmDbP8yQnvILfr7qW0MDfhcnXiD2X6/WY/lIwJntiqkgPFI15zMfyEPSdpx77oyM1pRj/SDD1POYF
	OBBInW7hkxQoh2gVfw3ZjFddmGdw92+pujx7UxsiU/+AerMVMgZdR6Woi6Xmkoamz2kB0u/S+M/VH
	RmUM75CCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gplYJ-0006Aj-JP; Sat, 02 Feb 2019 03:01:07 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gplY7-00060b-GC; Sat, 02 Feb 2019 03:01:04 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sat, 2 Feb
 2019 11:01:45 +0800
Subject: Re: [PATCH 2/3] mtd: rawnand: meson: fix a loop in
 meson_nand_bch_mode()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20190201083009.GD8459@kadam>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <6afa6288-cbad-9d43-002a-5f44348e9e1a@amlogic.com>
Date: Sat, 2 Feb 2019 11:01:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190201083009.GD8459@kadam>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_190056_312634_16607FDD 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/2/1 16:30, Dan Carpenter wrote:
> There is a sizeof() vs ARRAY_SIZE() bug here.  We want the number of
> elements in the array, not the number of bytes.  It means we potentially
> read beyond the end of the array.
> 
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 94c90be7e1e0..0d93d0b9c1af 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1143,7 +1143,7 @@ static int meson_nand_bch_mode(struct nand_chip *nand)
>   	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
>   		return -EINVAL;
>   
> -	for (i = 0; i < sizeof(meson_ecc); i++) {
> +	for (i = 0; i < ARRAY_SIZE(meson_ecc); i++) {

ok.

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   		if (meson_ecc[i].strength == nand->ecc.strength) {
>   			meson_chip->bch_mode = meson_ecc[i].bch;
>   			return 0;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
