Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A38E92FF9
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5Y1oCeAwadng4o0ri68wHU2dXaA9dkMlKRllJrNtm0=; b=ZACms9d6PzSHLd
	emVC4hAnpoVrOAOZBgjPY5v0TCXh2ICcGSt5KZvcOfWBTleIWKfWlURhIwrwh07mdFPzZFnBEq0LT
	S4df/jVVGgj2UvfBNqXeCsDSZWazGq0052SU73XSkNgO+JWpMkjQsMq7Zff5Q8rncGT/tyj5QJ/fA
	ytU8ZPXR0uQrqMIBZDsFDhd4vR3dQxRSL214Ee+8czwaYnTGrGRp1ID5axaQBoME+3RHnackhOcNw
	auE++7mqlczMFKjZEHJYj8eKLDXYs07zph0lfS+VOajlqrCL0MaLnKKv4+rPrxgYssGtUFGti2wzl
	I1B3XBIlEhB7qb30/q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8w-005HX7-0N;
	Fri, 06 Oct 2023 08:25:06 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8r-005HOf-2d
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 08:25:04 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qog8g-0002lb-00; Fri, 06 Oct 2023 10:24:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5C3C2C0243; Fri,  6 Oct 2023 10:21:28 +0200 (CEST)
Date: Fri, 6 Oct 2023 10:21:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mips: dts: ingenic: Remove unneeded probe-type properties
Message-ID: <ZR/DiLuMVK6CUYIQ@alpha.franken.de>
References: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012502_004299_80421A80 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Aug 30, 2023 at 05:11:55PM +0200, Geert Uytterhoeven wrote:
> The "probe-type" property was only needed when used with the
> (long obsolete) "direct-mapped" compatible value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi | 1 -
>  arch/mips/boot/dts/ingenic/jz4770.dtsi  | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> index acbbe8c4664c110e..c5c5a094c37d2e08 100644
> --- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> @@ -366,7 +366,6 @@ bch: ecc-controller@130d0000 {
>  
>  	rom: memory@1fc00000 {
>  		compatible = "mtd-rom";
> -		probe-type = "map_rom";
>  		reg = <0x1fc00000 0x2000>;
>  
>  		bank-width = <4>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 9c0099919db7aba9..504e895e916e57bf 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -461,7 +461,6 @@ usb_otg: usb@13440000 {
>  
>  	rom: memory@1fc00000 {
>  		compatible = "mtd-rom";
> -		probe-type = "map_rom";
>  		reg = <0x1fc00000 0x2000>;
>  
>  		bank-width = <4>;
> -- 
> 2.34.1
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
