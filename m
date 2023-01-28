Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A586C38142
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Jan 2023 00:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8p5HRzGQ4YHWQp0O4sQcp4sqFIhv3jjmODT2U/JIcAg=; b=p1tPu+/6AFcd+N
	+VdE0xa3ufjPFAyTNa9swTV9cKr5p1HAqlANQef19eRgGc4JylVl9AX17i8PXTy1+AoiukQmqIjnm
	AkUbHsdMtWqjxYhjiKTYLGwFqTt4aNpP0Je2P/ASRmpbenoILDvHMzef+liij6X2VVNBmproOwJiY
	3y+vcC+Hp/z8IOnuxu1Rg81wtDSdTApcejZ5jr7oQ6bdJ7/dhRvni8pII7MGQ2CnIatpefGh9b7gp
	TPXlFxmdtzNV4XTACWyQzjpGWwcDK52nDYrInP/UKEjd8xNZ+Xm9B+LdYEDzeSElzH9RIGiiDquXo
	y5HzBkGS98ZZQlHgALJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLZUK-00GyGD-6u; Sat, 28 Jan 2023 00:54:36 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLZU9-00GyEP-0Q
	for linux-mtd@lists.infradead.org; Sat, 28 Jan 2023 00:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674867265; x=1706403265;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=8HroFzcMUn53K8eqs6JLXQhk7cTtRl6khnafxvlvf58=;
  b=jxB3VzM627DzxJOY96or+P5v0hfi6k7N0f5aOv7rt47mhbMWmDhvzvBc
   CULGBbFqPo5xzMsVvFZYwyVPooh8f4TMJ7E9ARwBNmIGa8ZU3ZdInNyE6
   RE/0KFpWao6dcJthWp+/iYFy5JTkz9NAVt2yFel77xoRVH8heLH7Uv0L/
   TGFNnz4JFDazyBLLGNDrtZeUzdnShpHAaulYhfjRtViK5UJwc3YMcVvNm
   s+Ov7/hIwaQ5stlwLA9G8HGaFJ5i7vJHXMkQpPD1MdL1wPScsHhSGajyz
   Hc6NuFGpOO726d0LID9jl+jcXnz+YQTGqknru+DSopk6v3AIfPl3urbgg
   g==;
X-IronPort-AV: E=Sophos;i="5.97,252,1669046400"; 
   d="scan'208";a="326238783"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2023 08:54:19 +0800
IronPort-SDR: 1Kvs7NtE0U4H0rlKeq8CKFyfG1hXtErsBIYeRyywkp49fe7TqTAZLjMwP24IPStWqq1w9+weP/
 9+rBx6MRISnrz/SI4dIwKaiZ0nKM62ZjS7n/Wnqt0LRpIwBRLoeeULPJZgS2gbzitvlbtNewus
 EcfR9iOHlK5BfQHRwnYOk/UzBTONOgAK9KiCZsz2r0cBt1K1gsUz0QzFcqUU9/9eauWtbx7U0C
 Ihb5m/MSyU7/e8/AMh5kh1DwXVaw1KGeAKtjeNgH9n9nJRR7cGWnV45/77EBt9D3v4zqI8IYv5
 qvw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:06:03 -0800
IronPort-SDR: 31dYqO9x8o6buoFt+qnq0Rt1DFKNYT3jvmrbAatUDMlrcfnTYnU5zb0kXKB/OB8+YC85iOeuUD
 5XTKi4uEqQXbaeDPDuisaHr/Lg3lVSwquFTVZTSE+L+ItmQO1/wrU22lT/rbLp65ZtTWoXX4HM
 jo4CCQmD3VGNWnavpC2Mivt6Lnn4OVjywH5uLO6sA5UjFVuonyMylkslXiclM2uHUQBiEb2iAI
 ZQG1MTjJNb9qev481SCxlUIs4+7I1Mh0UiY58O/KM9PYq7DcYWwc/ISNH3sdER3dxUEENqXZ8p
 tP8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:54:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P3bYj6v4Kz1Rx15
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 16:54:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1674867256; x=1677459257; bh=8HroFzcMUn53K8eqs6JLXQhk7cTtRl6khna
	fxvlvf58=; b=ShftbYmd37Un2N6WXeDLuDn368rIZ7rg0bPyrhOhRV4L+OujvBZ
	9t8qHFpVJ9RP9zP8FBgxqvyARvggZHlQecr5g6REKIL7iS/I5mp/zcILc1CJIDnK
	eNA5e0cb5clxhH30P9AwwNnBnpmc4eCQx23IrsUCGiFiYbpjuCzCe4nihmz/r/pb
	a40GgA7aEk2TxXGdKxBIf7R5q8nNV1GLcsTNR48eKphEVQZb3leRSAv96TRrs2Xi
	HvHLkNGrYeNxQEiJKcsmUXydBaOCiqhmUKI8Wog2rqzVCKrwuTaN1On12FtbYbv5
	aQqi/qfXflV+L3rvEVEDNsMiNU0bzwX0V8Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1kS6s467tJDk for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jan 2023 16:54:16 -0800 (PST)
Received: from [10.225.163.66] (unknown [10.225.163.66])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P3bYd1nCCz1RvLy;
	Fri, 27 Jan 2023 16:54:12 -0800 (PST)
Message-ID: <75aa04c9-e173-6a2d-6b38-d0e16f3800aa@opensource.wdc.com>
Date: Sat, 28 Jan 2023 09:54:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in
 relevant devices
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Marek Vasut <marex@denx.de>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_165425_120630_F3A13C6E 
X-CRM114-Status: GOOD (  11.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/27/23 18:32, Krzysztof Kozlowski wrote:
> Several devices can be attached to memory controllers (or memory-mapped
> buses), thus they can come with additional controller-specific
> properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
> intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.
> 
> Referencing Memory Controller or IXP4XX bus peripheral properties fixes
> few dtbs_check warnings like:
> 
>   intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
>     ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
