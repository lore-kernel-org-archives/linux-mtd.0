Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35163C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpQI6Z2y1gq/JGjRgr5rxxq86PGkx3PulJotEaFbVYE=; b=vFQGZUnOUuvr65
	fOHCKEqh9N98YFBTv8Yh9vtqx5apJEJShJYMGRAH/rcAufjsPRxMEOkchASbTyo1kT+60H84KM969
	0XbDgSrRL8seYSDBHpyZOudnLKnTHVMBsWQhdx0rifFFBii/RssXAVnYj19sKFhv0w849i8jYq5+l
	UiAEbBx9W06rxOFRbcCg07ipFr4YTF/XQ21yEx8BDy34xJ+Ifb1ajtzFxMTRYOnBLNmvWsQ+YTcUy
	TiRAKLzU84Py31nm2Hdsu4QwuBXSPWylCmwBKcxsn+OzIOGuOEob0BRKFe4SeNPBX9DBY0PR1apDg
	RCbLTQzjj8krAZkcEPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQgZ-00000008XlS-0SDV;
	Wed, 26 Mar 2025 13:20:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQen-00000008XY4-39l8;
	Wed, 26 Mar 2025 13:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=woq4Ws3S18XYVJpP2olLOVDzz5HvlN2ip72DX9s9ClY=; b=5qdfKNjkUR8BygJiqjz9XfexAv
	AbsoIPNCFJCwMXoAhJl7jNzVt71lOlp+G5deiQ/UtJWilSkwghbaRZLcTncOX6xCorfibWtpRU4eG
	TME82MvdisQ8vvxubngwX8u6nF21fPTMS7TJJqf6hdWCp2V7FGs1ISbzafn8xKnWlEnY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txQeU-007Ach-9u; Wed, 26 Mar 2025 14:18:38 +0100
Date: Wed, 26 Mar 2025 14:18:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Message-ID: <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
 <20250326072140.172244-4-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326072140.172244-4-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_061857_792836_EE5B8BD6 
X-CRM114-Status: GOOD (  19.55  )
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

On Wed, Mar 26, 2025 at 12:51:40PM +0530, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> net drivers using the nvmem property.The offset is set to 0x0
> since the factory programmed address is available in the
> resource managed space and the size determine if the requested
> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured by the kernel
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> index 35756cc01e68..6c5ff08f0b3f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> @@ -478,6 +478,16 @@ flash@0 {
>  		label = "atmel_qspi1";
>  		status = "okay";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@0 {
> +				reg = <0x0 0x6>;
> +			};
> +		};
> +

I've not looked too deeply how this all works. Don't you need a
reference in the ethernet node pointing to this?

And are there ordering issues? Boards used to use the MAC address from
somewhere else now start using this address, causing a change in
behaviour. I would expect somewhere a comment that this MAC address
will be used last, after all other options have been tried, in order
to avoid regressions.

   Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
