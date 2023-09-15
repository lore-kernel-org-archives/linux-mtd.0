Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD8CD37AA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vk1Gvh/Tb1fCj4tzhNJOUW+OG1QaHNAfA4APppF62dI=; b=M7qRgVCM051V+z
	RItkdEStmzraxNdum2yrWloWGehcff0yP8otxEUoaLuGbZEK9rSVAPRaL+bEWzxFB9+dhINzil8BB
	nsxOncP0nM1hc3mmnNAffUhZkAt7aJXCydlUTjQSPjYiDxj2Jq0PgDKyN8zeB+r/ZKt8WnsxF2gRk
	fdUzp1+ljtl0GZf4wqt4R7rLaCmVHBKhgSLRPN716pmiwwf1wnQpQd5hQOk0b5L1lOO1H6pDC4Gua
	RCot/9gm9LPHZqEwo4pcox/DFwET2qdBY9+bnZBnD72FEkOJYuRm3kmRNN/o28d7h78XtulL2/QAr
	yHzBBRXVDsrOtkbbssGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkR-00BMJr-0U;
	Fri, 15 Sep 2023 20:49:07 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkI-00BLpn-0o
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:49:02 +0000
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTP
	id hFjkqkX1SbK1VhFkIqlMHI; Fri, 15 Sep 2023 20:48:58 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFkHq6IgwlWQAhFkHqzVgw; Fri, 15 Sep 2023 20:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9+YfmCRdOxV4l5YZYRTDTDswIsRzP0r4oOgTtdce9YU=; b=W0cwd4inAUdTCh2pnWAfsMnJBX
	SJwASOBFhvZt3FmzCmDC4a/WS6hgyWG/OCUM8gA3MULCN8JQMeO1+rA9ASZykzwOfhSbtpkNoPwzH
	3e1N2VGr/PRoCCeimc32acB0fkuDiIlCLp25Lu1qiIWZKCsDXoJq2eRoo9+1ngxxvUWW3srnmMZbF
	fHUaNP6rx86MXQ6V24YfBmVa2oBPP1ADC/ws1eJ79DeN+zqaLrQSk5nb31iur7qdmz2OlckOCh9ZF
	eZihd5C/zFDoaqCwqMqsTwy5JAm3mY9KrchePVdKK0aos2YK6DfwmvqEtjznkvjMDItK4wrbIvLrE
	u/pDC7cg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38640 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFkG-002e6L-0D;
	Fri, 15 Sep 2023 15:48:56 -0500
Message-ID: <d1189ce2-16ed-6932-94c1-8c6ef3788df7@embeddedor.com>
Date: Fri, 15 Sep 2023 14:49:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: renesas: Annotate struct rnand_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201254.never.511-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201254.never.511-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFkG-002e6L-0D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:38640
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 386
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134858_563048_7AB361DB 
X-CRM114-Status: GOOD (  12.72  )
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



On 9/15/23 14:12, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct rnand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/renesas-nand-controller.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
> index 589021ea9eb2..c9a01feff8df 100644
> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -210,7 +210,7 @@ struct rnand_chip {
>   	u32 tim_gen_seq1;
>   	u32 tim_gen_seq2;
>   	u32 tim_gen_seq3;
> -	struct rnand_chip_sel sels[];
> +	struct rnand_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   struct rnandc {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
