Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1060BC28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnE9j50SmWJj7YzaFpv9USJ6MapJYJXJsMrC8I2LvZw=; b=wDND2fuYaiAOXY
	lOO1Q5cuJTvSX/8HA0qXnydFAA7WnrCnEbY0dX8MoT+C7aypRgENe9jZRwvnMDHSvjoR1z1HFDc9z
	x+1F/zxulBk5u8QnKN/wT6Q0T5E2mmmFqZQSnLfyKpdV6wDg4FO+zOvTeEHznKOUsR4HgbnXs42mB
	y+b86RsLQLRScNZnIqMPx+mYtS0Qz/ndginfHSQZXSSv/sx8NV3tR8aepRGp7CJS+7Ig7U2CDMMuM
	bD+et6WfQge8gONsBLzKsD9PjgOkiXSLIQbU0avPrFPAlcvRoeMJUFT3RYgXymacNEAGl6amUvlJn
	s76Fc1KedvNSBsEMRNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdV7-0000000FN1t-0B2l;
	Fri, 07 Mar 2025 19:36:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdV4-0000000FN0W-0wtU
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 19:36:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso13485025e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741376208; x=1741981008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
        b=LqZT8Dg3TSUregq4mih3VjCjPvEXAi7QnuGkF7kK5bnzmW9HsWXjn/gpOXhyHO3/ih
         J8yD3MpU0//VRjNuEm3z72Q9laoxa0V/BZyRDjmmqxQFpNornhxkhmCfZx5J/Q8lo45g
         UTqI5zym/Fk7KNnYSAFjJ0gaFaMCxojME3YkwaMsQRe+0uXzjLJeTDL/FwpRBwM46yUM
         L7OQ/wQlIdSSAbne3uhXicHPelgdqW3/IgxcXWi+2MGvCmm/4AInDg37rZCJRoQXOwaR
         tREK7kXkB1xceVoRo435JXAaG0TbAYw4+nJwk0R4DSGdueNWGlCUJtCsiebOhdyJwffb
         pFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741376208; x=1741981008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
        b=wrxTer7hZLTaoVptPT1TWyBqD+xILRhZcCagu+hxWm0AeViQdthcnRfJcQFFdPO666
         wGTErpDHC4+D5n6i/Fshuz2FFwHjmQVpZ6GxYsZ35glwskpMxor0qFxiafVrvo96QFa7
         Ap0P8MeQsHBqT8IXOF5RWEFYISRcVvFMY6Ul0CQmRyI2k1NieQheIPnkjUoMY8biGOQQ
         ESxKqFf8AX6WNLUERubu/8n8v/XsgmiDTP+h1VjInn90sIb01wpXthOegAdvdtcvSn4g
         /uSMHxC2lr/Vr6sZuHHMSzkEdlVwguP0nUfLhJUloERelHsOi6tG9LnlYY/pBGU0fMYs
         J/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZcHX0emhSgQB0oOYrU20sUZFwr+EdguoLcOmlccPR82Z/pm17FyB4jMxZuyh1DAP5uK+v41cUL7I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPivjfmWL/crjq/VMdqJ0EZ8dbc0VtWC2U4XBGnuDT+9l/pVyI
	zfY0d4nVvjanIHjso/mLSB9TijMQmORJKzmSFelliEVi8GdxijFL
X-Gm-Gg: ASbGncu/pKTGD7Yr3RIARC1zOWx5UXvk+jEMksTigCpipkpxzxCSJy5+Pp5E3TUmQVA
	YwZO9ImiaiMqOMEe5CwRaVPW+bMI/c36jiPtL5XyOWqoSiDkJE7rHEqPTWmKMPWMc1wKgcpRCZL
	OvwbuA27enRmyQWjZ/D7+WQ2ljwgRKeqxNqx4u5YZzwXQJSKu+oYFRkf5BV44qU6ydhgmE2mCY8
	OUgUoIqf0UUhcg6D0PEHkIwVWZVK9odTlhOSMTOwmrvqXuIibn6OGVo7Q0o9Oy4gLzop3iEMnpP
	ZiquxLKU5i4u8wPPpRoK+YdT49szwRmuks7NysiDwo0Y019my90HBkX9qjJhDnpUVA8plFK3lEx
	dtnaZLrI=
X-Google-Smtp-Source: AGHT+IGYxYOhWA1l6Gh+krzanMxcdhuAnlJytBsEAg4OGnrOW8+O9FUNnMqzwJ9p5yYRvsqSKnj7Zw==
X-Received: by 2002:a05:600c:3007:b0:43b:c034:57b1 with SMTP id 5b1f17b1804b1-43c6024be64mr30043695e9.20.1741376208006;
        Fri, 07 Mar 2025 11:36:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1030cfsm6392462f8f.90.2025.03.07.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:36:47 -0800 (PST)
Date: Fri, 7 Mar 2025 19:36:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Message-ID: <20250307193643.28065d2d@pumpkin>
In-Reply-To: <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
	<9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
	<Z8ra0s9uRoS35brb@gmail.com>
	<a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_113650_269278_5DEDA615 
X-CRM114-Status: GOOD (  22.48  )
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

On Fri, 7 Mar 2025 12:42:41 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> > 
> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >   
> >> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:  
> >>> Change return type to bool for better clarity. Update the kernel doc
> >>> comment accordingly, including fixing "@value" to "@val" and adjusting
> >>> examples. Also mark the function with __attribute_const__ to allow
> >>> potential compiler optimizations.
> >>>
> >>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >>> ---
> >>>    include/linux/bitops.h | 10 +++++-----
> >>>    1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >>> index c1cb53cf2f0f..44e5765b8bec 100644
> >>> --- a/include/linux/bitops.h
> >>> +++ b/include/linux/bitops.h
> >>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >>>    /**
> >>>     * parity8 - get the parity of an u8 value
> >>> - * @value: the value to be examined
> >>> + * @val: the value to be examined
> >>>     *
> >>>     * Determine the parity of the u8 argument.
> >>>     *
> >>>     * Returns:
> >>> - * 0 for even parity, 1 for odd parity
> >>> + * false for even parity, true for odd parity  
> >>
> >> This occurs somehow inverted to me. When something is in parity means that
> >> it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> bool is returned? Then you'd return true for odd.  
> > 
> > OTOH:
> > 
> >   - '0' is an even number and is returned for even parity,
> >   - '1' is an odd  number and is returned for odd  parity.  
> 
> Yes, that used to make sense for me. For bool/true/false, it no longer 
> does. But as I wrote, it might be only me...

No me as well, I've made the same comment before.
When reading code I don't want to have to look up a function definition.
There is even scope for having parity_odd() and parity_even().
And, with the version that shifts a constant right you want to invert
the constant!

	David





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
