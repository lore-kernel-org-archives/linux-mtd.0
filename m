Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA99C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n/1mLNu2eNjFCCS9wpciuw6DfEcBgA1IfaAT1g5uY7E=; b=PsP849mgE2UDX45r3C7Cz/+M0z
	yfxxHgBXG20h+vFq6l+VMGdvYMcX89hLlvX89INmAyRwJ2GE97AIqpH8e00qB4cUbHpU07IKhFWR3
	gu7dffe3YTYDCObdHhEplb+Bb1tvhM8qBHPcH33JTsj2x8uoyR/LMWiKwrYMaaEPbeLhWcRUfu0Bg
	0Y7vEeI1Z4JA5LKIXYS9Q8MjYYolgJ3waS2LlGZL6r/gcJ2oJ0vdHv/bDJiXIioWvJ8eX4qMyj8lw
	4IVv857hlP9FKb4q+ZfZIAxCJ/fQJNisZU2ebyNXfm+6/lEGEdcN/eef7htMtxgMZh9olXD0qMRUb
	/Qop+GwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJfc-000000044Bm-1LC2;
	Mon, 01 Jul 2024 16:14:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJfQ-0000000447J-00Me;
	Mon, 01 Jul 2024 16:14:13 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so31661141fa.1;
        Mon, 01 Jul 2024 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850449; x=1720455249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=MtWlTUewHQsV1MkoH5v7SwxmjkRJWvydKkIt/J7u3KTGGVeRRj5yUMGPzzmzrVj0hs
         17Mx21I6Osj6/A3nXLt+qW4FqgEdYv9I0qqqa8hxknV6CH7w5cQIRjBa53erzozGacfO
         14Vw/fpnQWq37kBCmCHOPuT66hNGfvh5fjOke7WwQ5des3XzcpOZcZkpy2Q6kt/DSjr2
         ERWX6pQq44cupy+pE+3W7tqDEyC2EOL4eBkss9n9v7UW9o8Ye5mo8SqdBLgfQPDA+R5Z
         bWMcj5TauFqObqP4Rh8QrxuVF1p4s48PU+PocZO2ae1yhINsptJQD0jIiafG6z0i9Ue2
         h9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850449; x=1720455249;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=wv19RTLl20CRbgyXyf0UpXqUbB9ynKDjGQrBjB1bh7SyHVlhoBajjJPW0mU1R6C36p
         egbjPqwRrkvrKmprGesA34RH2KdnnX6I4U/Uy1w4rEqnKTBGRbmuKetEoXMkZYivzn91
         KhoN7RaFMJso4WcKaHc2wCPJR7ESISXlD6QRIJ/1jj3lzvjiHqyiIfOEQpk2m9XYCuv0
         X/2uXs7WnisPpNjS8uTG/xLzHsy+vkr6YR7WQ2YvK7OzKXjB7uhJs7BdWPpMHUBBVQIV
         KndNOU631t5NptAkiPkUrKvN78JOmvu7tBvkyTZ2/N0gR8VKiOrAlIHdSmyeYY2+kURb
         6ruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXehjt8gSHn1HDfIwQF4v+01F4D0DaCOmSZQm0A9tsAGaTwlSPa9zlqv+HEcsnov9bbtKGlw83VoIZiqxzpGdRXt76rrY/whpC5prDHJqHoy8zKOrM=
X-Gm-Message-State: AOJu0YzzV7I64Za3ec9RnvnFKM2bC13Jg4/pW0kJaeJRhzOBqxaJd5zZ
	AEpHFlzxMF3QNg7VYyJFiryj+Q/zaONPs0v1jjlMAEdz8XA9loNx
X-Google-Smtp-Source: AGHT+IHHz/OamA1Ukx5sIFBlK+L0AmnL9jrrDHysPJKMb3Xyg4pOUjtzhB1j4PXHUjwphZM6xFX6sw==
X-Received: by 2002:a2e:8558:0:b0:2ec:5382:2703 with SMTP id 38308e7fff4ca-2ee5e6f6972mr34830361fa.53.1719850448585;
        Mon, 01 Jul 2024 09:14:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.75.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516803aesm14192571fa.79.2024.07.01.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:07 -0700 (PDT)
Subject: Re: [PATCH 2/9] mtd: add mtd_is_master helper
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
Date: Mon, 1 Jul 2024 19:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_091412_080918_043DBC49 
X-CRM114-Status: GOOD (  16.14  )
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

On 7/1/24 4:53 PM, Marco Felsch wrote:

> Provide a simple helper to make it easy to detect an master mtd device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/linux/mtd/mtd.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 8d10d9d2e830..bf3fc2ea7230 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
>  	return mtd;
>  }
>  
> +static inline bool mtd_is_master(struct mtd_info *mtd)
> +{
> +	return mtd->parent ? false : true;

   Perhaps:

	return !mtd->parent;

[...]

MBR, Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
