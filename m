Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E3CD37AC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxIK5kadZXguMl4uMXathobMAXA5exM/pt/NQDgvS6Y=; b=2xLM6duwWHKG6d
	nz2XAq0EHBSzdYKMi4comSB2nT6YdCbcFRJqYP12nCWw74NOjS91lVMl7rwWLPk/jdMRHFBT9fH+u
	ccoePRk+JIgliouJ44zb6FaCkIO1fAhPxip03W0GDjP6nRlTe+F+PZw1xFnI7iuoWqtI8xgtYZNp7
	vxgYhQBXexoosdVwdDtWLgLK77+R9otNU/m2yTIbrT505Yx0OVR/lYHQHhLTTSkKOivgD7ifok4hQ
	Q/e+OdeBNvE9mdf7VIJVWT98T8IuMfZbiwoMAgq7u32ykdLsOaJBsqoiKX2P8CbXwQ99rpZlcpLxw
	BU/4IBv11Uy8qdHs8tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkY-00BMOY-0e;
	Fri, 15 Sep 2023 20:49:14 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkU-00BM8k-2g
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:49:12 +0000
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTP
	id hFjVqdOwlez0ChFk8qBxTE; Fri, 15 Sep 2023 20:48:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFkTqJbdJXyW8hFkUq9MEt; Fri, 15 Sep 2023 20:49:10 +0000
X-Authority-Analysis: v=2.4 cv=IfeU5Ema c=1 sm=1 tr=0 ts=6504c346
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8
 a=FlkJ-zHRAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8
 a=6jf_rtzPGzjKtfs0wCQA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=aeg5Gbbo78KNqacMgKqU:22 a=pAN39diAhXWuPx0-Vjn3:22 a=rcJ5IfC3ewqtVv14NVGK:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CclFJTPt/kQYr7DtGTorOj0xv3gEfRWPWq0sGa9nXxU=; b=JfYzhAMbESaXEFIgyujVndTe2G
	bR6japwiVCeKiPhHmpOiFA161I2Os9qCf5XyhjoKFsx6xN6vkJraT/QSZnk760duUDC9J8TSNSveU
	yyxCw5AfmC4XiILekTv91ydYFlQI9uvYbNIIynvhjQ9UoftRO1LevL6OqeMZMUp9vMksQNaGm2AdB
	WQxjTc7MST2NriLbt7fim+9tU7AsHPFLgOUzD/JZaQF96yYPX1vPw+FlvalvrtwhF8Le4Vq4KXEq6
	qd1K6WeAu284dVHzFyAquroAqf6RBdnfZ7hsbAxhY6lGly7Yix580DQCw7KI79PFmlIbNg+vorlvQ
	R/xSmPcQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:42002 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFkR-002eMw-2X;
	Fri, 15 Sep 2023 15:49:07 -0500
Message-ID: <4f318e62-b0e1-a1d2-9850-890b93a97bb3@embeddedor.com>
Date: Fri, 15 Sep 2023 14:50:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: sunxi: Annotate struct sunxi_nand_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Manuel Dipolt <mdipolt@robart.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201300.never.057-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201300.never.057-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFkR-002eMw-2X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:42002
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 405
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMsjQ7blimoDVFabcHPjMr68TXTMcglTZrMgk4DCz3k9BgBFPdpdf0J+n3hDyQOl6CrmANK1YjEpzrMoQPfGpRmHgeqJ29QQIg2HEZZJJ06MHAlVqAoZ
 v4ytZwYfd8Z+/qW6ooVz9Hl14UgqZKHxryEj7Nup34fqkqkfcBjzQQ+m2l2kzoHPQQ8hJN5+zf7PK68g2PvLHysjX8yQvtfr9zNXaco1+HXIvjPvI3Ti9EOe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134910_939436_5CC39BFC 
X-CRM114-Status: GOOD (  14.00  )
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



On 9/15/23 14:13, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct sunxi_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Manuel Dipolt <mdipolt@robart.cc>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 9abf38049d35..4ec17c8bce5a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -197,7 +197,7 @@ struct sunxi_nand_chip {
>   	u32 timing_cfg;
>   	u32 timing_ctl;
>   	int nsels;
> -	struct sunxi_nand_chip_sel sels[];
> +	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
