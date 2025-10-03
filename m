Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F9CCA470
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Oct 2025 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwD8gUcpcLEZMTgGjqON68VNXTE+YaIf4uT1aj6b7D4=; b=EKblegD68Vn3lQ
	ZjiOcmELZzmShP1XWVG98Rgt2BJn9bgerGcZhTCv8g97GkbIpTMx4P6+nzH4RRoPbLGMvRw8CwAZu
	CNb7WgynbGY9yZ5PWb+5SF2LcAC3nKTozT2T0O4fVoPOjcLuREELJlYp6vsk3deMbpskFIyrNNbKl
	gVeIiAV7uQ7qBS8jTaKW33QlU1T7igop1ZTs6kcfRzUTkMoBiccN/T9WS1HfdiTr4o43cyYGX+STN
	pflxsMIW46iCLItoRVxCdejcKSvzpI/F/l5gCuh7tkN4Fj5UxWbCCB4gLRoZP6yblHtURTkeKEhmg
	OlTX4eFFUNvwGzkZnTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZdE-0000000Bky8-2KB1;
	Fri, 03 Oct 2025 06:51:08 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Zd8-0000000BkwP-0Ebc
	for linux-mtd@lists.infradead.org;
	Fri, 03 Oct 2025 06:51:06 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89019079fbeso511683241.2
        for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2025 23:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759474260; x=1760079060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QYI64cW+XHmj+sby6MngC+206bn5fsu3IzSbvpr/6s=;
        b=S++Yacq+TcKnsHqF3Vt8Lp20ImT2N++mhHdpYJhoEQcP/+f1iBVkEwIPdrPiWS09pS
         OGcdbF5xKi1Lt81FFlinU34Qfp0InrmOZljS0OO01L+P260v8ylUOgwoNKN4sLkCmobs
         e9F/rL1etd3FezDj/y5OcOWnbxBT91HLlgtJk43xyG0KEqk8fDJqJDbPVLMzjaE8q0vt
         5XBIXg/7c/NRd/KwaRG1Y7jVVF1Tp09uZcMue36r/ORV6PIeULOaPYmB0EXL5+yZnpJZ
         /g4tPXAbLZobsnFmKEtVmx5XJbsoXhs0fcxYEwgogJPHsEfeOryhKbTjiT8kXUkxJRHY
         o3pA==
X-Forwarded-Encrypted: i=1; AJvYcCVrwdtMbU1Ovdysuq7cjirNINukcejddbJ08XH/eovwDVtjjnhixiqKbg+k5jXnMK+yUgw2ZRXrGBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRngOHrlkAH6TMZfJBnwmE00SNvmEieqr9dS/pMgH5HOeXg6GE
	qiiQWiWiS2e9izXEdOJjAk2JzZX93ICip1bEUcarXT2D+KN3m4I3Do2UJesmN/Viwxw=
X-Gm-Gg: ASbGncvkWtLxpNiiTTSpJR8mNFfTvQlJS+jHK4heGnHNIB1DZYK59rKwtgjpf3fQCi6
	d6QaYAo56HvFhCwJLuQnbsc9zwDWHlvxk2cxqpRx7Jglkf7gUSMsOnVJIdLtByP3trtqe7IW4Fz
	A3A32SFYClR/fBzgxTLngWfLWCbGnJDKuqIB8rlqtoGsqe2qNv2Cktx+ySeX8CKp/Alp02I2eET
	ReCI4PRIiUcOY6WLpMzeIvFRwu1P+RUrjNkul4Ld+uS5izCILWzAo/4oCjgkxzHArBoDI4bwuJ0
	OTIORHruJq8i70Y9N/YETzi4qkE0b7cZt0lWnJP5o4BUQjiSDOJxiDPHKYSsCYb1mqTigz7IntQ
	oeS9Bx3NpbH8UVeTh4XhW8wGia+vOy2DzddHL+YmyCezCa6HU4X+ilfUm8khTkoTrTgZt9VEPqS
	RX1RZ5194WVp93adjV1EE=
X-Google-Smtp-Source: AGHT+IEHha0zStS/OZ7IC8wO3SfrOo7D3O6VNk8AduYin/gt9ceEWVy8c4k1sUCoi8aj18IEsYT72A==
X-Received: by 2002:a05:6122:2190:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-5524eb1ba60mr622820e0c.16.1759474260403;
        Thu, 02 Oct 2025 23:51:00 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e2a5sm996270e0c.14.2025.10.02.23.50.59
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5838680e242so661648137.0
        for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5dU7Rf/Gh7RQBY0JOWJ/cA06G1CZL+v8G1RoMN/lOjgL8l69n6QnUgRe3k8iEECYHrcA1eNJABNw=@lists.infradead.org
X-Received: by 2002:a67:e70f:0:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-5d41d0e7a0dmr687881137.16.1759474259285; Thu, 02 Oct 2025
 23:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Oct 2025 08:50:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
X-Gm-Features: AS18NWB3eHLy8T1jBKvTcs-a-FuOQsD2BAEeM1FO7vparrzr8v4t9PBKVzDwMXY
Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_235102_101065_52D3DC31 
X-CRM114-Status: GOOD (  17.72  )
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

On Thu, 2 Oct 2025 at 16:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
> physmap: Add minimal Runtime PM support"), so support it also when used
> in DT configurations.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
