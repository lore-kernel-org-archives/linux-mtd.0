Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54401C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3Efdbg4D54kWtMUGzqwtUV7/KmnXuY4Hl08L/Wq+qY=; b=WuE7TOadAA/7KN
	A+qXHud8okw3OIaPEtnRoUWzHM9crGMzw4RxaDfKY1V4M2SJMe499a+1tNjASDfvvC3giCm1qErZh
	G5uL8SeEOZ4o8JiL21P5x4NrODDqJ1qcwu29m2EjOMowzjXfP0cC5sN37scsSeSKDfBblP/g7BhBI
	cjOGWb86ONPhd6PLgSsv+ikc6z0wtbgjT5m03gsi4/Us+YS3Pfwy++RI6SBmxTVyRjYHGHMkit4Xm
	HTj74rVYUk3SM3hGB8LY4ee3c/ESQ1oF0cLygYIWFknTkraqKZCN+dbN777EqqNc+bvLmgnLPlbIb
	v0y013r+ggW4SIswWvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaYQ-0000000EJJl-3wr5;
	Mon, 24 Feb 2025 15:39:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaUy-0000000EIe9-3f7E
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:36:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2211acda7f6so101606695ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740411360; x=1741016160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
        b=gcuzjZBfEf3gkgXakQIRBeb0P7WDl6SFTH7olf4XkcFDRqxk0ZDk8NFU4fhhvay+D0
         ruHw5irvftHVkjwRMiAHFRW28zvrFU8e3SL8zccR0oob2HafyHjx2IU0CMyhzdN2uK0x
         aCeGsCMU4V1bxrwBOsr+3zDN6oTXUyRg3ix2Rc6JhCg16QneQ0pNQPJhtNQrigQlU8P2
         +nxdBwMUyi/AgbrLTbcdfTbum4BWxCXl5y5UCkgDN3F/7BdDg0nHtaHkw5g8qcwiDGiL
         aVKkokVWhbEZq+IA1yDKJtMyXvPI+2VU5GZExAeeyB0USV38EbYvyfe6Rkwp+KdAnBMN
         BRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740411360; x=1741016160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
        b=A9mCAI2/WC/2aF9bqBiTNad/zmZ2T0pk1SxP8I/91MuqdPg5EuYVqvNTaeiSSX1ccp
         +8JtpLvxMEgD3rTZd/8l989sK7YNI66LhYsrE5+yx0FHWKCfpR+WqiXnZ8Rmf36QRgrv
         eKTphftoHQ8tanTQMExcuz5MNGup8iNfzvmscJis+k2lK0+BGjRj7tPDCuhK42KBWvkK
         ZE5WZNVTs0pLXRO7z8l/yfEMoe7Yno+cpbzdeAmJFMXE48pr0aZcn2+f3fMXhMGuEjYX
         I4wjPvYi8V4y3RE9w20uw3gla2c4g8DiQhwziF20X9pJslQuXGuxSp+RSCO590seGM0H
         0ZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVW2WdYrWiTmfg8segYhOKHi48X6+qJhHBxFzfiszVQ09WpVPB4uG/acOr+uoMM6f+Ps0A+zQIGhzw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6giHwJmyLQ1E2VRXofMfxXEQmwmZsCJG5ZosC5TGXsExksw/P
	wgfsb33Sy0+fp0smxzwcjdk/3kvSndu7BEkweBjS8bFoe1hX+dar
X-Gm-Gg: ASbGncvc4Jbd5xPLPGfzogbOWNPa3Y14hvwdbzVbbz5zcZLE2SkrpKM5NzPHzKpuu6c
	GZAOPKaErhSvSs7EozfkOdZeVu84o3ZOI9VGOLb2029mSBG8jUUebRV8gkHbnn91wjv6BOQRrtZ
	Ns79NubOusAtT+SlTGUqE/6FD9dxDcf0+mF51PjQbvzrn2TlGFgKBqhBsuVPEliBWEo99P7v9W1
	9EnGUO7HyoGqA1n+SYBAM7dmtdGG9RUkSnr8eBmaBCs8XZMNyZRVMkAigLVWs1QcAPwzo3DOirz
	lQixekB8jxqKzSYuK3QbUa6BZYNz
X-Google-Smtp-Source: AGHT+IHd2msCEkxFy+eTP0g8bXm0gN1PJPrXpracR00S9KkpiQvppU+iNHJWil/lk2n6JQBTakl5Tg==
X-Received: by 2002:a17:902:f706:b0:220:faa2:c917 with SMTP id d9443c01a7336-2219ffa74demr245408665ad.34.1740411359935;
        Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f29sm181794265ad.37.2025.02.24.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Date: Mon, 24 Feb 2025 23:35:48 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yR1C4nC1UTrX5e@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_073600_910944_EF8AD7E4 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 24, 2025 at 03:58:49PM +0800, Jeremy Kerr wrote:
> More so than __builtin_parity() ?
> 
> I'm all for reducing the duplication, but the compiler may well have a
> better parity approach than the xor-folding implementation here. Looks
> like we can get this to two instructions on powerpc64, for example.

Hi Jeremy,

Thank for your input. We will do that in V2.

Best regards,
Yu-Chun Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
