Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249FDCD37AA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AASfZmySMRuKNDDaehToQpx2UD8wGReJxc8ouzGjA8=; b=iBQPeWRam/GmD+
	wzpbW6eJ6RIDIoc8ZZHf4jX/wAwsDeSTAB4O/BZGsAUFsgzzrmCGvydGjSVS0S7bis+WElLxCTvU9
	V3zPLo4IIHTyGkYgjF0S5lNrdQs5iq6wjH+ODU/+WL9d7dQ4epnOHK9ar1qC907/KlfCIcFjpK0nd
	ZiUS4YiOjPTbQtpCjErL9fm4TTLVWXJ5v5EDwEe5kEXaEDK1oai1/ojmeGF3TAIzgMv3/O9xnwfJ7
	YO6k4no/rC/lCrHJK2vK6K/PCksYDcGMNfUCU2mxFFAXpklzobdfB8rWqtmmyXk+j2Gu73pb3d2fw
	2idS3BHaWdxGSc0XZY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFjP-00BLv6-0N;
	Fri, 15 Sep 2023 20:48:03 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFid-00BLpM-0D
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:47:39 +0000
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id hAPdqzoTpDKaKhFibqIdKo; Fri, 15 Sep 2023 20:47:13 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFibqkP8Axtb5hFibqfXaW; Fri, 15 Sep 2023 20:47:13 +0000
X-Authority-Analysis: v=2.4 cv=IOERtyjG c=1 sm=1 tr=0 ts=6504c2d1
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
	bh=OJCQwVBr4oMmx1OajRhUTQW8+WMKMrIsQ1SjzAZI0kw=; b=iLVLOqm/ucWxBdREakyaAZKEZW
	VyWAV4xwP/gdKvpIXbyLjtyVtj5G0qiLMdtI4MpK0B5MXMoOWm7vPCfqLm+lIder34rh2kjBdSHKJ
	0X/kumYodifIFYehekFVjfFKsu52UTk+0r6JCGI0KOOUTnVNtYrwrmfSosWHhp3t/KY85qxKHA8X7
	zBmvAp3bJ7jD559M/SrLjKmDAPk6hTJMjSf0xIre7zJ95KVwm5O9yBMgK1DSpM0CNEUItK+PZoAbL
	jY8Hjw6tc+GS39Ce0FFc2/+MXHg/EmtSAprs+nLPyG+P7TzzuRnzuse4EeJq6i2aYMgLAgF4HiEGJ
	gXlqB6Jw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:49856 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFiZ-002c5c-3D;
	Fri, 15 Sep 2023 15:47:12 -0500
Message-ID: <e0fba1f9-fc9d-81eb-4bd9-9f6db9d75df8@embeddedor.com>
Date: Fri, 15 Sep 2023 14:48:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: Annotate struct lpddr_private with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201159.never.112-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201159.never.112-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFiZ-002c5c-3D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:49856
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 293
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE8H5qLSX7Bvxm4NjCcSFr+KEVeckS5QRpxu927zEpZ7lAm7YE+wuzvRVtVFNSM3hK3fKgPEG1n3rGp+o0lWPlXJ9T4YbNahUgbgFZyOqKRIJl6JUV5/
 iCPElOG4Y+L55GH2/co+ZadrKPoQ+xPBLmEA81nwjDHcLh91auOObLJazZdwOIZF0A7cALYPbivQu/39/olEUxhuvSRKGXFS85/NYr6A1YD/SSdf+OmTVHZO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_134737_868557_1F8D43B4 
X-CRM114-Status: GOOD (  13.08  )
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
> As found with Coccinelle[1], add __counted_by for struct lpddr_private.
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
>   include/linux/mtd/qinfo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/qinfo.h b/include/linux/mtd/qinfo.h
> index 2e3f43788d48..0421f12156b5 100644
> --- a/include/linux/mtd/qinfo.h
> +++ b/include/linux/mtd/qinfo.h
> @@ -24,7 +24,7 @@ struct lpddr_private {
>   	struct qinfo_chip *qinfo;
>   	int numchips;
>   	unsigned long chipshift;
> -	struct flchip chips[];
> +	struct flchip chips[] __counted_by(numchips);
>   };
>   
>   /* qinfo_query_info structure contains request information for

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
