Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB11C4829A
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Feb 2024 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHRAgouBb1dj+GR3xuvN634a+H0Uz+HBs046OLAt3II=; b=tebPEP6fFSiqUA
	Ha9mFXrf+laYf1jg41skEWb2Ay8vgBImmtNIHMDxvAS0MWTgBpxRdpPV2de+HclDmF5ke9O6ojx9E
	EmakhbIpqczAbdsLbNrjBi2C75ECNUQ0I0JjC1RiCVItohHyS7xb0L22x8qZDkCAORKncSOk/6s7U
	khADF9kAtULU0/v9G2bWfNSGTpRyiq1ZIPd86cF+Z7jw0pqW1JHDMn6piK9lnkGj2PnVwZBmcJo91
	UgtpuhfcTJZOSBbgpAOC/QIzESrOdIRaOPTvKM1XQsbMVQzutncSbnSsyxl2it1D0eOC8sEAZ9FWo
	90iHkiO+s4FpU+F6UuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYqau-00000001pM3-0Wa5;
	Sat, 10 Feb 2024 16:52:48 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYqaq-00000001pKt-1JlP
	for linux-mtd@lists.infradead.org;
	Sat, 10 Feb 2024 16:52:45 +0000
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id YqHqr2CcNpUFLYqanrkrXx; Sat, 10 Feb 2024 16:52:41 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Yqamr4gj4fXY3Yqamr0XFa; Sat, 10 Feb 2024 16:52:40 +0000
X-Authority-Analysis: v=2.4 cv=bO21I++Z c=1 sm=1 tr=0 ts=65c7a9d8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=UFccgQmPsxNMVL67FCoA:9 a=QEXdDO2ut3YA:10
 a=1F1461vogZIA:10 a=5kKzt1m56AEA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tEoQxh0SDX6LhIBHxa1o+jGxPnr7GiGz8Kpi2C96DZY=; b=pzUct+xJvY8RJEJgPd9wEOn8J7
	knPnoxN+3ygMHpLr1awR+90flpSBlkQihH870kIBwMrc4KKfqtySQpCueQ/dr3wfiITWAUHFHtvzq
	awO51/AVqmDqRD4dlEmEFY7ajfvym2CE32QZhD0V11CD+NppmGfqNQz4IOwM+rdIvroxJnvknt/jE
	SNdbysb/FtWPK4UyxtQ5wK7ND0m+GiNVQuDZUP0vkiYFdxUmDk+D4YKiiRr+xLfOoXXhJG1CeG7Hn
	QWAB0yUaEDSiIJd4Sc3vU+mUS5fLAilI6JB2ekkI4YpkDPV62BCAanWLq5if6zsMad3ed4b1Gr7++
	UlKhuw2Q==;
Received: from [201.172.172.225] (port=54094 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rYqak-000XHn-1i;
	Sat, 10 Feb 2024 10:52:38 -0600
Message-ID: <91f29d89-8c9b-46c4-b059-687ea3c57682@embeddedor.com>
Date: Sat, 10 Feb 2024 10:52:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: Prefer struct_size over open coded
 arithmetic
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rob Herring <robh@kernel.org>,
 Li Zetao <lizetao1@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20240210161619.12656-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240210161619.12656-1-erick.archer@gmx.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rYqak-000XHn-1i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:54094
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 20
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCWObZn9gbCp+KCiw9P8MfAhg+M11AdLrAWHbCdtej7hqMOKwcJl6Rrq2DPg7GiB07zfq1j9JCK3E4Npj/ljRLZu5M4PYuC3f4y6iuH39NcYgrJIz5JX
 6eNznj13kSPnzrMh+F48IYxToZegJNLo+n5HwAAgKXgYRt2bIOThO2DSw085/nbFm9TeTu++sg5kZAaU14H2lZSFPDE6PFK815m0h6jhdyQn1RGXltUcC0P5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_085244_427891_C5E3EDB2 
X-CRM114-Status: GOOD (  16.15  )
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



On 2/10/24 10:16, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
> 
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
> 
> This way, the code is more readable and more safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/mtk_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index 60198e33d2d5..17477bb2d48f 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1356,7 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>   		return -EINVAL;
>   	}
> 
> -	chip = devm_kzalloc(dev, sizeof(*chip) + nsels * sizeof(u8),
> +	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
>   			    GFP_KERNEL);
>   	if (!chip)
>   		return -ENOMEM;
> --
> 2.25.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
