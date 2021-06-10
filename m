Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2C5C48BDF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 17:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B07613E1
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 17:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B07613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb9jSbNoWeT6urSrIxc0I8CtJSKSqhawTU+tOSyLo2A=; b=G0fiuGvBck5FQj
	6VJJuAJj+sNK2KbqOzD/ZKuJVhTxopaY3N9kFtTNYlGY9xMX+fSyP0z2Sn5vhv0Gi6lyLNYXbC0Lr
	lAt5Q0Vd+VNJFGgbGrsbPPbOvwdxcxLVxhq0w2E+f/yPxnRpvBczCTmMXdtbuqMOsCvGnyqs4JMQ/
	4Og7qf3XA5tp2JmeqxGMGJ9BzwiBlzNduTKT9OuJYASa6aS2IOeLRQMjlHAbFkRLYgsdOPAb26eAR
	4S6XazZviXESdNr1O86R6dHpa0sGWYp/NT5uLhod+6eyTvrqN+47OuLCo5TpTGBq+c6Rp4VRg6LOp
	7tzQcs2MECiBmPOXCOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrOd3-001xA8-K0; Thu, 10 Jun 2021 17:38:05 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrOd0-001x9J-KN; Thu, 10 Jun 2021 17:38:04 +0000
Received: by mail-oi1-f175.google.com with SMTP id r16so2606947oiw.3;
 Thu, 10 Jun 2021 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WxflIbs/48qSISC+lCpr67Z9h2+PanKTJGd2chvt3SQ=;
 b=sMYeb2dDv0woPkwS8dxtiJAZn5Nngn64wlnDijDEBm0grkbAohUHqruJBngyFaEUOj
 bPTOw0+aoZDeLZXHUK6VApZGwIGHAzaz6gIKdy1WdAEHtJCy85OVtJo52W3Nicji/7z5
 ZmLGGFZQZdrLupZ0UNPHHAafJAu5dFcIeQ95BuHviiUF6tkI4TT08A3aHQr9f5cldbt/
 L9oi88V6lYN3YkzqJYvFkBTYhl6h1yIxzznDU4SLRQPy2tOkQaZ0Xd/C7q0VvQVMOQw+
 RLSHp6tqNOhU0P7tWoypuHA5dwYkPV5umr7Hi1JWCYuZZMGseduU4YcQK5icTwln/Mac
 FMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WxflIbs/48qSISC+lCpr67Z9h2+PanKTJGd2chvt3SQ=;
 b=A7JKA2dtW2TK/Uawt6HmhInVXXZJwLOg7khbXUxSzB/OjKFMuGBbHsc6edsWippToe
 0NzLwatV61GCO853djfIbgElNh5BQYYruyZohBUNVzEFxooOOwl2WY93nNR2gUxKiAM2
 gN+lUj73quA/MDKGWq8iFMdTtsHunRLbXlQxATy7NPTwsCnXsCgA+2YJTtuTbSImXJ56
 odDpm66HUSBuzHuZuNg99pJCUKWjUdfAYjVShd8djlkYqMeYW3ooF0T6V7k+wUny74Pw
 TAdhC8Xmtof59+NaL1I8VCCHsMd3K/oyjufRbvgUUmSv99z1APC+Bq18GKgTH+X8SA9j
 nykg==
X-Gm-Message-State: AOAM532t+Y4M0tKzbm+okikKeWQzrZ8RgevJckekgIMTkPzl5RFGDvvZ
 oOyH16jePvWrdd77dgvyPobjS7dC9Ks=
X-Google-Smtp-Source: ABdhPJwjCV1uWMlJ9KROgTfw2tgpkPH+P0jRB8KvKDtnhToT/kREHqzL6vWNrdVj3p+6zowc5WIgTw==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr7095904oie.151.1623346619783; 
 Thu, 10 Jun 2021 10:36:59 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s15sm686945oih.15.2021.06.10.10.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:36:59 -0700 (PDT)
Date: Thu, 10 Jun 2021 12:36:57 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org,
 linux-clk@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: rockchip: Enable SFC for Odroid Go
 Advance
Message-ID: <20210610173657.GA20228@wintermute.localdomain>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609141348.19178-1-jon.lin@rock-chips.com>
 <20210609141348.19178-5-jon.lin@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609141348.19178-5-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_103802_703926_74CFE14C 
X-CRM114-Status: GOOD (  31.04  )
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

On Wed, Jun 09, 2021 at 10:13:48PM +0800, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> This enables the Rockchip Serial Flash Controller for the Odroid Go
> Advance. Note that while the attached SPI NOR flash and the controller
> both support quad read mode, only 2 of the required 4 pins are present.
> The rx and tx bus width is set to 2 for this reason.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> Changes in v1: None
> 
>  .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> index 49c97f76df77..f78e11dd8447 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> @@ -484,6 +484,22 @@
>  	status = "okay";
>  };
>  
> +&sfc {
> +	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
> +	pinctrl-names = "default";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <108000000>;
> +		spi-rx-bus-width = <2>;
> +		spi-tx-bus-width = <2>;

Note that I am still working with Jon Lin to research this, but it was
found in testing that if I set the tx bus width to 1 the problems I
encountered in earlier are resolved. At this time I do not know if it
is an issue with the driver for the flash controller, or if the NOR, or
board itself has some sort of errata which prevent dual tx from working
correctly. Note that as of right now the flash chip I am using (an
XTX XT25F128B) is not currently supported in mainline, so it's very
possible this is some sort of errata with the chip. It's also possible
that there is something with the board that is interferring with dual
mode TX.  When Jon comes back that he has tested dual mode on the SFC
with a different board/chip I will recommend that we change the tx
bus width here to a 1, and then once the XT25F128B gets mainlined we
can see if someone else has issues with dual tx mode so we can note
that as a problem with the chip. Or maybe there is something weird
with dual tx mode yet on the SFC driver/controller, I don't know yet.
I'm all too happy to work with a Rockchip engineer so things like
this can be determined before we hit mainline. :-)

The XTX25F128B driver is currently awaiting a decision on how to handle
continuation codes, as this chip ID should be using continuation codes,
but doesn't appear to return them when you query for manufacturer ID.
So I should also note in the commit here that the SFC will still be
unusable on the Odroid Go Advance until the XTX25F128B is also
mainlined.

Thank you.

> +	};
> +};
> +
>  &tsadc {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
