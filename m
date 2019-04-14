Return-Path: <SRS0=XyTp=SQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6766C10F13
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 17:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE76206B7
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 17:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HKSq5A1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="y5DPwaXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE76206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbPfJWy9xZ+20ivhpWrJtSBouB9s/XkF+R167XRvSPs=; b=HKSq5A1jeluAhz
	znq6kOZE8ZAj4lD1nMLUrOjhyFUqCjHvi5A7MvvrRB2Vw9BFh4FH8IS8h2zPmTse4AixarhsoW05I
	8lkOKMiftGmeVGSKDD84g+d8/VytZT5s985eeVqT/vRNVqZPKE1oGDe+1+IxGZJ8HG5wnOTS4Bxi2
	Sb6zWq/eFSR7njbS9bU80spikwKb+NC0u9DXJbruzYa/7jCctW8dxeb7jsom9ehQugGO4cN4WLwiX
	olqkBCKE9ov0B+zlHuxsg9e35sj1tX5nA5nxlJQyKul1me08ANsY6THqnER1dKcRG1mtUqVrnqWaV
	2293Xd5RoDT5w7oq2rhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFjMF-0003Eh-ES; Sun, 14 Apr 2019 17:55:59 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFjMD-0003Du-9D
 for linux-mtd@lists.infradead.org; Sun, 14 Apr 2019 17:55:58 +0000
Received: by mail-lj1-x242.google.com with SMTP id h21so13416425ljk.13
 for <linux-mtd@lists.infradead.org>; Sun, 14 Apr 2019 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VlqTvvjVrSjyP0q+bjGrO5hfsUPGP+Ex9rx1HImXFm4=;
 b=y5DPwaXRD5gfZwa9pC2WIw7SHydZKFqiY4hE2T9RMxSTBuvDs7x6t1enx0Ea9lDn2h
 caTA2Hqq5RMXgeK1gzbqbkpj+z87CTRs+KREYs1ISwXyu52+PyS51KWR/7T+C96fNl8Q
 +bsm4Z7OnsihlVv3YKWM4zlmEuH5ZrAR2Y8NSXAmnV27x5C1smhLPRHUSBVxmJsKUUG0
 y/Kc/XCGSCX8whjZGi4vlWGUS6CZ+VBMmHWK/kmdgXCfrtHtLK0I7TQsJizAGzIIv/sz
 QME5higUH4zetYy/ig/ZSk1CzNj5bkDoSdbILcVUY+LD7Zz3arw7wJSMnM4d7xvES2CG
 IbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VlqTvvjVrSjyP0q+bjGrO5hfsUPGP+Ex9rx1HImXFm4=;
 b=rp3nHBQCy+TKxAC8A1zKAmZC35vh2ITDkklwCGEzgPNn8Aj9MM9w38fmMZezp2Rihe
 G9pF8Klt+2XQeEnpe0F+Xr4Z1DLgq0v42Jw+SVp5P4frv7OdfXifA6veBQksTNE2Gt7r
 2A++xMLFqbqeybpDfFp90ZHsPpx9VD5jUmH0RR5TRUORp691Dy23u3h4tLxMZ8F/WfUK
 nKxNgvMJGUhYXgsvHj59Yt4nXLQunUGhcQrlYFvgDPn3QLbYXH2XOYZnOOmJ44i4Xv8r
 3HvXLDFti5MgHmheFjv3H6J1UhbNbCy4Rt22LsJv2zA2kiEfqFKojnqOEe897cT+1t52
 B0/A==
X-Gm-Message-State: APjAAAXxxB7Bvcnw14G9QFtBCDBJ9cdEISrEnU9yUsG7mOYA3MdYhpGk
 C4scbmBgM62FX0RKD/ms1GKBYg==
X-Google-Smtp-Source: APXvYqyGw/KeMzzhRJs/i3MTfsvOlfdfCkbG8iaSB3T08p7wAJnIWGc6FEufG85F2gvYieMaDPi7kQ==
X-Received: by 2002:a2e:1257:: with SMTP id t84mr38626316lje.115.1555264555174; 
 Sun, 14 Apr 2019 10:55:55 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.85.5])
 by smtp.gmail.com with ESMTPSA id p15sm9554630lfc.48.2019.04.14.10.55.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Apr 2019 10:55:54 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <20190412092923.24919-5-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <6a69ce6f-66c0-3f7c-a326-d76ee717cacf@cogentembedded.com>
Date: Sun, 14 Apr 2019 20:55:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190412092923.24919-5-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_105557_334942_51DF82DF 
X-CRM114-Status: GOOD (  21.62  )
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
Cc: devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/12/2019 12:29 PM, Vignesh Raghavendra wrote:

> Add binding documentation for TI's HyperBus memory controller present on
> AM654 SoC.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 31 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> new file mode 100644
> index 000000000000..00888482df25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> @@ -0,0 +1,31 @@
[...]
> +Optional properties:
> +- mux-controls: phandle to the multiplexer that controls selection of
> +		HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.

   I thought this is usually done with the help of drivers/pinctrl/..

> +
> +Example:
> +	hbmc: hbmc@47034000 {
> +		compatible = "ti,am654-hbmc";
> +		reg = <0x0 0x47034000 0x0 0x100>,
> +			<0x5 0x00000000 0x1 0x0000000>;
> +		power-domains = <&k3_pds 55>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB
> +
> +		/* Slave flash node */
> +		flash@0{

   Need space before {.

> +			compatible = "cypress,hyperflash";
> +			reg = <0x0 0x4000000>;
> +		};
> +	};
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
