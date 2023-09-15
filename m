Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A93CD37AA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmsaUdXz6SQsAiyrBcCXiigAaBOAkmweU93Jor+f8L8=; b=iEVxoJqh4HXJRS
	RVzcpDZDsljl9IFtdLnDMPJrgMRKQqhEHBAirAKb6YqeZyZNJsyeLNIWqmompVVR9Q63ozFzDEgL7
	yZQGwXnr5TUFMQWgOSAqf0gFYfDNdYZSv7Eq9y1M1DF0yxRBaI8ieRtsr/i7E7KsQIe0UdMj08zBj
	i8O92frvLwUg1TCFUAABwhtyqoTyCzVu2Hyfoe8sBVstPcv68vOZI4UumOp4pNDo/BGU8fNJnP7z3
	AgNkj/yqBV2C8qlmKSC5XND4s2nTjLZAXTSw6ZDa5GqtFeF+Qk8z1Ets4rdTt3Sw20RBBFFzlTlKe
	zbxq9t73TGS5u/R3MPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFjR-00BLw1-1T;
	Fri, 15 Sep 2023 20:48:05 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFjI-00BLrm-0w
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:48:01 +0000
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTP
	id hCX9qkiIoQFHRhFjHqvXOt; Fri, 15 Sep 2023 20:47:55 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFjGqZXlznxNghFjGq3KLI; Fri, 15 Sep 2023 20:47:54 +0000
X-Authority-Analysis: v=2.4 cv=PrSA0iA3 c=1 sm=1 tr=0 ts=6504c2fa
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RqOUINYtZnX/Of+yTyHFYCaBJKqXskU5mxpeljwMPIY=; b=pukAyExiqsVBM3/174lVjFczXB
	/UHmgwxH7KQ2j2h4GHZJGw9tIHJnaQDVLbjQRbmuXfaN8lZfwmtiONe5yIoy9P3xX5khIAW3XtS17
	MZ2PvbJukE8IAzmob31EM7COq2n96cppK+HOfyWSMEWGsBsLdGF4/VlN4C31aRYgtUHaLFtNN+dFw
	SM+wu4aPhH7cGUL1WTeGhibVpcAmXnOFzg3zNyRPiukNsQLItREk4Hl7V0kZAPRBxPMJNl28HgmGN
	1SlqZwHmbJBumiwpfz/n7wuanPtvNyDtEwzNRgYgGd8oZg8Iz5MKPiwDfkADArNozU4k41ARn4taK
	KrcrLKmQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:49250 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFjF-002cqE-0c;
	Fri, 15 Sep 2023 15:47:53 -0500
Message-ID: <14906ef8-63e4-046b-1e18-8d02e1e77eb9@embeddedor.com>
Date: Fri, 15 Sep 2023 14:48:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: denali: Annotate struct denali_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201227.never.483-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201227.never.483-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFjF-002cqE-0c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:49250
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 331
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKf7s+ZIAwKxYc1Qi8CxBHu0RZv8yQij9BbqiKR1ipL8gmX4oLiAyPZQH492WrBpRtQJ0+bFWrqa2Iea3mRofpj9ZJVah70/kNrIYERCuJ/5ILYb+06J
 cB9t/RcYmT4HUhyVFOLEEsqN0PhUT/9JNw86uLDmtLx1zpM8RQwtCz20EwDdpLjKopjVDEIWUrDgwRSBI03qvsktA9KtfxnpRYTD0RYiwAnOOGCVmxFdUxKC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134759_492845_AD502D65 
X-CRM114-Status: GOOD (  13.22  )
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
> As found with Coccinelle[1], add __counted_by for struct denali_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/denali.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
> index ac46eb7956ce..5f2fab022fc5 100644
> --- a/drivers/mtd/nand/raw/denali.h
> +++ b/drivers/mtd/nand/raw/denali.h
> @@ -328,7 +328,7 @@ struct denali_chip {
>   	struct nand_chip chip;
>   	struct list_head node;
>   	unsigned int nsels;
> -	struct denali_chip_sel sels[];
> +	struct denali_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
