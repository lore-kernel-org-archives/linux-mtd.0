Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C5CD37AC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADPu6J2VE4pQyS3iC1Iw2lIVdvYVocgm78b4sPSLHy4=; b=ITmqxQFvtl9u1q
	VGzpgd/g4zUPw1g5lEx9rPiuu9zZw/BieuWV5OXpd5l/TWy3DxzFAghclPIwho5jPa3/RJh8WjD6h
	cItiFqb9bc+SVgt5OgZLCW3ZtOcvA6VH8xxnC3WvsMZOv6NZXIxpzwhcljjI/8CdAgDN2ew8V4+9H
	OXgY3LAXrQ1+jOURheUluhxtWxY585+NyVzSuTBa4pW60vv1HPLnAh5RIK5LK/cPjRsYPVGB3eTHS
	eBtmrLogwVJFCruWe9X/XHtlx4JTmqSQM904RmqzoYOOKxaYxsNFc3tzuD12m3cGPaNslQU51ETdE
	HMlvArL8HJ1MAqkHo7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkO-00BMHQ-06;
	Fri, 15 Sep 2023 20:49:04 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFkA-00BM8k-0H
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:48:55 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTP
	id hAJMqbjPTez0ChFjmqBxHp; Fri, 15 Sep 2023 20:48:26 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFk8qx7prZRGzhFk8qOU6K; Fri, 15 Sep 2023 20:48:48 +0000
X-Authority-Analysis: v=2.4 cv=PLscRNmC c=1 sm=1 tr=0 ts=6504c330
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=BY5PBP3jAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=KKAkSRfTAAAA:8
 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=gQW0MTutLl7eKD3OLfcZ:22 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=cvBusfyB2V15izCimMoJ:22 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZgsrTB4ijVLhsjuka7LCf1vP3KJ69ueZYWGwWisaVKA=; b=IRvyZEZ58BWzjvA37uFDtVeDu0
	SHv9y9Zi52SBnAa4kZgCra9Z/4HYBKrsMNBm7VLU2OyJEHU41Jiz2vVG2PPQ2nqsAh/tqH4viMF8C
	Ec+u1ZOZ4aOY7EorR/njLUer57jGZnKtX9KxL6bPHFqdQp/EsZwBpcQ5IdfmkydkuvOB0SRNgBIDl
	A4h0E1njPsuqwyVjtFYY8LzwymRIunN3p4U142i0dphwDdYEDWLCITWTi8BA2EuQ5qVvvuDJnjfKg
	IWhsaXB6XxFjyuX5zPoUpkyxZS1QLkOKEEZhmSAHWCXYRh+2AC1SEwLZZvYkXLkB95YXZ4ARrRyVA
	CSPDe6qw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:50288 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFk6-002dt3-1t;
	Fri, 15 Sep 2023 15:48:46 -0500
Message-ID: <c14c5a6a-6e5e-54f6-bb73-c77eb93ed820@embeddedor.com>
Date: Fri, 15 Sep 2023 14:49:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: meson: Annotate struct meson_nfc_nand_chip
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201249.never.509-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201249.never.509-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFk6-002dt3-1t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:50288
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 369
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfD0E+iIXKxkhBIlSjPEVe2445NFh1o1JtLp/Xp9r45Tulbdn0rxJl1Ocob3TucuOnW94BbdIDWZAoDevRmRr7qthvky8Bc/LQfULY2YppZj7pMkQ007p
 FyzdyC462VtDiKYMDoO4juYGQFaz1LlJAwESwyQTlewoZzbuJx9+2DgwgPStBMAEN83OZl+KYoK74EISXuUB+wHCynO6iWhxFQ9nBOQ5PJCrnVeZWhN5utYk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134853_011235_F35F1A3E 
X-CRM114-Status: GOOD (  12.60  )
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
> As found with Coccinelle[1], add __counted_by for struct meson_nfc_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Liang Yang <liang.yang@amlogic.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 25e3c1cb605e..378f28ce6a74 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -128,7 +128,7 @@ struct meson_nfc_nand_chip {
>   	u8 *data_buf;
>   	__le64 *info_buf;
>   	u32 nsels;
> -	u8 sels[];
> +	u8 sels[] __counted_by(nsels);
>   };
>   
>   struct meson_nand_ecc {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
