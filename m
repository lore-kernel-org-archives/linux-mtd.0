Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6E7C19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEaJ6nK0epUxx11YJmOHfwMmk+yHXzNxTFvmf1up1us=; b=mK9927c0h2PvVS
	/arI4VeYiwPVdDagz7/W3XWnZsFnx3O3Z4B5o0lTOWgUXC9p0C373hT4k2AbiTns1G3DVxq3F6GAH
	Tkz861hrztpi/ImfT5YdNVAh1jwNo0DkWdDbG43U6m3lVertsgnnjof6HQpUoxV/MQ+upyKrUf4LP
	UIJiYieocF9PLH485ejz2geOIPcDlW3BcMpLJuNtyMULuHT4bVrV8RC/uHd1HgX7aa56yV0E08cbV
	IZAzJGwuQHLnX4vQIDeSySZvCppY6cQPduJ5tUNYYdFqbl7ssL3+EwDSqWULhQrVwkac9m+GaV+ie
	Eup28oWSFBB+KOrLdK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn1t-00000007sRp-05g7;
	Wed, 05 Mar 2025 11:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm2Y-00000007h25-2SJZ;
	Wed, 05 Mar 2025 10:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Subject:To:From
	:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=YImHt5qjndllozKWs900DqbEkZX+2qEfYUCZayrEIVQ=; b=kYZcQ4QUL5HkiVUyn7mf3ABJJn
	Gueoghe9YA1i/Po0XNnmwDpkym5OtKCvBBQnxuwuN0Sx4iyGmJ9kXpynifBlZzJVfxO5Jd6qwKpeb
	ONuzkRcC0+q0lYOib/+0otop/aANGtTU0NNytwxqIpYJuLsFydSqMADEqo8gWLwJiolocfR/JQ1cN
	G35crvlBsiE6c3kBWFiZIatGXpF7byzHBuIrmM7Mkct8Q/LgoH7ZOTeWoYZJdKcOK655U5vFS6Ym7
	9IHfuUskoZ6OZbqa5R14BsmHy6bpTwrKqSkS6bew55O7nbSv3PZxkJOfXiINzr9lSLeFzLWIG5Sny
	Wj5JJ+5Q==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm2V-00000000TEd-3ALq;
	Wed, 05 Mar 2025 10:31:49 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AEE0B130;
	Wed,  5 Mar 2025 11:31:36 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 05 Mar 2025 11:31:36 +0100
Message-Id: <D889HZF97H8U.1UUX54BAVLAC3@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI to describe EUI48 MAC address region
X-Mailer: aerc 0.16.0
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
 <20250305100134.1171124-2-manikandan.m@microchip.com>
In-Reply-To: <20250305100134.1171124-2-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103147_858867_7243BB53 
X-CRM114-Status: GOOD (  16.90  )
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

On Wed Mar 5, 2025 at 11:01 AM CET, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to describe EUI48 MAC address region.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured in Linux.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> index 7be215781549..81aca8502195 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> @@ -480,6 +480,16 @@ flash@0 {
>  		label = "atmel_qspi1";
>  		status = "okay";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@261 {

I don't think the offset should be hardcoded in the device tree.
Apparently it is a property of this very chip (and not backed up by
a JEDEC standard). What happens if the SFDP are changed for this
flash? I.e. The length of the SFDP region changes.

Also, this looks like it is a layout for the SPI flash contents and
not the SFDP, how do you differentiate between these two? Also
please update your device tree to use 'compatible =
"fixed-partitions"'.

-michael

> +				reg = <0x261 0x6>;
> +			};
> +		};



> +
>  		at91bootstrap@0 {
>  			label = "at91bootstrap";
>  			reg = <0x0 0x40000>;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
