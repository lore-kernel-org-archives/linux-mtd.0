Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A364C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxcI65/M35NxJLczIQ7XSfqkiO/maRLJTC3OQy8nCfo=; b=HUTAvGeAN8xHy0
	Du6aAQ2pHO5NucJvrOB6XKKefg6Y731htLQ+9239dcnpVMZavJn8YLRtmna056a152YWyl+EC46/1
	V1cOkgglOErSZ/PSoMzvPA2X/OV3D32FoGdkdXJ6mJxH0by5U0qG0iDmSOAbpIXm69XF2T3CSE+qD
	Ujsv2NXBYulwl2PuMbPSb42ZsjWzbBJFfYuMHgHzHYs7YAt9qneDqAmsZNzWUmMdwdCZQwuhF6Zqv
	472aYd8gYGmrZvK4w5R3vUJK3ksBeo4dTSwzPU8Z5iW52edf070CcO/RA/w5Ot1NSgMQ/tNMac1HN
	HgvplNlyaB6kGmmsPUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIEA-0000000CAuR-2P9m;
	Thu, 06 Mar 2025 20:53:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI6G-0000000C9ap-0nQd
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 20:45:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f406e9f80so847499f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741293947; x=1741898747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
        b=kj55ai2jkTToTsXLe8kchbx9lKxJpd6JsH6uadfJZEXLlNDKp3caxmXxXipllxUhEX
         4ZUSDWqark32V/00qClsvCNKX/nz0fjLKon3D4I6vWMiQVH8h+1uOpe+olSzdMYn4K+f
         AScKOYdb+sfHHqrXASTZj/k0OUxid38BimJiv9fQrDlyeuUhHxf6xL/xqSWRMg3ssJll
         4RlX756sGYylXpxdnM5BO+5zsXVySyEzEVmf1xuMggH6PxWTv2X5jLSUFvCMaY4Qw68P
         0dZA8PFZZBWRZHMIZaNO1HT99V/Shw6+kWJOAsjDBcRzksxAbuz9oBVdxnBvAMWVRJjy
         COuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293947; x=1741898747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
        b=AE5VoE2TyxdAQkSWLGY7NUPczIZB4yP1PVEmnuLTDIbPvgw3cnZAmlAKLcRHjysw3j
         Xc0P1EQWHHDxnjieBTn44wcCSEMLpyC6sUx8ue0W5ULgOy0otXYrxJplBJJ2mohIcBHG
         QFgte6Z3vH1OfrgZRkW3l205iW9mz6yXhbrw6szK83MWU03VAfj9Po8KIJfcmUoFWtLf
         FsatagjWExoPyvNYW5EwW4iCtdE+w4F13BFaYa5V4w9vEj9xGbNZIRT7jWTIWM6PKFqN
         /VpC6UxX26D3tJbYgRNRJEs5EoOiKlgEdQQPLP2IYthH4Pzba3pvsew7qr7faBjrkUdz
         0cvw==
X-Forwarded-Encrypted: i=1; AJvYcCX+6UxWtCQxFZPL9h+OvYmta72T2IfydZzvSRHG/tNhYuYFOzubBQ6YV7KCGh5dmypnFu627khvuj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZrtsntokSRnT9H1i/SSXLBR4vMaly8mk+NoQQb0qKuN8S2fKT
	bG6Dia8FKAgInjFXRv2+FcIys6hizTnxo2U4VFWSwLdAj7+MJe58
X-Gm-Gg: ASbGncvgoECd6GjiD7WGnd2+4/DszQFlhUxo3mp+6mWDPqvGlEvDTHlO1Gf9LRZqf1T
	LlAbBRh+fbauHSPrbNSd20hJO60ullf1FTUKzQ23JOkhb4Z2Kt9+VFxN3mIIuCezLrSaKlX3vpY
	MzD/EQo5Pe61LzbrOrlVrA76u3CgRjbleY49mbzssdRJwi5C9hbstssvup6my/qnS4mXMvRmMo5
	AbSWnBEqLCXETHULA+qHIQRMQbtOsfwYNnj+mNoQ8NnjejGfwp2vQuRT9TotIOYmp05Ug6DIL/d
	DAo/G2/qB5ffQPCCwv2Gbkynr1w+w2DV3kWsy7ZAJFKhJ5u763gd+lje4pIpgdPGN/LqTRTagTG
	7ZlKLGYE=
X-Google-Smtp-Source: AGHT+IGypB/6b6ARKmDBu94pyV9a8VQg2efcRX5KU7nOp2iuQaxkdpIq9rBXtaXWDKzDk6KRW6vJqA==
X-Received: by 2002:a05:6000:4112:b0:391:b87:37ad with SMTP id ffacd0b85a97d-39132dad239mr349795f8f.42.1741293946634;
        Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01de21sm3140996f8f.59.2025.03.06.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Date: Thu, 6 Mar 2025 20:45:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250306204544.35086b52@pumpkin>
In-Reply-To: <20250306162541.2633025-2-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_124548_234503_32B2BA9A 
X-CRM114-Status: GOOD (  19.10  )
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

On Fri,  7 Mar 2025 00:25:26 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Change return type to bool for better clarity. Update the kernel doc
> comment accordingly, including fixing "@value" to "@val" and adjusting
> examples. Also mark the function with __attribute_const__ to allow
> potential compiler optimizations.

If the result type is 'bool' you should just check it.
Not compare against true/false.

	David

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..44e5765b8bec 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>  
>  /**
>   * parity8 - get the parity of an u8 value
> - * @value: the value to be examined
> + * @val: the value to be examined
>   *
>   * Determine the parity of the u8 argument.
>   *
>   * Returns:
> - * 0 for even parity, 1 for odd parity
> + * false for even parity, true for odd parity
>   *
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity8(val) == true)
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (parity8(val) == false)
>   *		val ^= BIT(7);
>   */
> -static inline int parity8(u8 val)
> +static inline __attribute_const__ bool parity8(u8 val)
>  {
>  	/*
>  	 * One explanation of this algorithm:


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
