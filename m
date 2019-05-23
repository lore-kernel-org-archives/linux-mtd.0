Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E45AC04AAC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 08:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553512133D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 08:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkTwdEcg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCrNfEmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 553512133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V71T3+hZSu9RFUUFLsZYYIhQhB+3m+VK6VhAYAe+EB4=; b=pkTwdEcgajwP5O
	mvjEOYM7VvWwyIIr43uCR6FcPCFlqCyaZVrUmzVfO20APGk9E4J5uuMDHQpyjtG5ULjIWySC2+Upo
	xckkkbYn5WIVSHYY4KovnPIEPV5ZdbratrAIEA4g4F8w/Et/P6H8lZbqHAXfffKhCcFpJb+sCjYdt
	anq1lNBAs94KzDmlUEFo4FxFgXGkxQNHY3n3Rk7cJcNG8WLF/FFrmdyi/xbx2+xmzXfaal7obJkfk
	+uo0vBtpaCvrJyMM0y+le23pDSXlWx9csA4hnx0g9oUXD+4+njNBYafcLEDC1tkn+5lcvN1wUJv2T
	Lrs2/4+nD1MBdIZ2PqDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTjOZ-0001tn-49; Thu, 23 May 2019 08:48:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTjOR-0001ff-OT; Thu, 23 May 2019 08:48:09 +0000
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0CFD20881;
 Thu, 23 May 2019 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558601287;
 bh=ZpO820+HRCThlTiYwTEWDIq9N5/gK8HjH0ZTj3YuZcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCrNfEmobtn2AALu+kG8hm28tzxm2DL3MrfxfS5hkbJK7MM2I3DIO8Oz+BObtk8M5
 AJzK7vWJ/rwPgjdH0P3GniVtNsVIZR3DCOohHQjEvqx+n15ryS7UDXBvFiMBMscpSH
 GXTbFZ/pBI7X3TE14i1bs6gvmx6A1VXnNjkXBk2s=
Date: Thu, 23 May 2019 16:47:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: Re: [PATCH] arm64: dts: ls1046a: Fast read m25p60
Message-ID: <20190523084707.GN9261@dragon>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
 <20190516114807.30817-2-kuldeep.singh@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516114807.30817-2-kuldeep.singh@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_014807_814545_EF1FD6A4 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Ashish Kumar <ashish.kumar@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 11:47:06AM +0000, Kuldeep Singh wrote:
> QSPI support is added for kernel version greater than 5.0 and supports
> quad mode defined by
> TX-WIDTH = <4>, RX-WIDTH = <4>
> 
> RDB/QDS has two 64MB flash from SPANSION(s25fs512s)
> 
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>

Please do not send patch in message encoding with base64.  I do not
apply it.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 3 ++-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index eec62c63dafe..43a5ef6357d5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -166,9 +166,10 @@
>  	status = "okay";
>  
>  	qflash0: flash@0 {
> -		compatible = "spansion,m25p80";
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		m25p,fast-read;
>  		spi-max-frequency = <20000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> index 6a6514d0e5a9..85105a20fc04 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> @@ -102,9 +102,10 @@
>  	status = "okay";
>  
>  	qflash0: flash@0 {
> -		compatible = "spansion,m25p80";
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		m25p,fast-read;
>  		spi-max-frequency = <20000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> @@ -112,9 +113,10 @@
>  	};
>  
>  	qflash1: flash@1 {
> -		compatible = "spansion,m25p80";
> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		m25p,fast-read;
>  		spi-max-frequency = <20000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
