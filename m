Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07EBC28B2F
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Mar 2025 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQjVoXWqudC6wsj/ynpE7fvk6zPpWfkcGajjUzgjrro=; b=ThmVGoQtn77L/e
	Zuk3zEu9OiAReZCkYAjl7IuHa+sfjv0yld/kPg33hi6Gs5wHnf25MqAlqn1Y9yuqVAwkDerxVC1mZ
	RRsvLUDlg4hc75bUmeGihZupSQS+qWeOLKpKd/5oslwlEiXmhoMu6gWi4AfrTCN2WA4akx8XxN+kE
	Mv46mNsgJCuNBGi2sNnYodXeuDzruYNoRnYgVVlXqh/ZVLRMsVt55izmMEy6JdzpNx/Ovp5qttH7f
	ZEI9aQNm9LJUWUONYWRaMRBNFrLtVz7IMGqJ6tDdCQP3eH6v6rJa6w/Gjlup6BYf4ktotL3K7iytl
	D2kRbHZ7hCtpTMpmzUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trItM-00000000l09-3dPE;
	Sun, 09 Mar 2025 15:48:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trItJ-00000000kzl-3Pfd
	for linux-mtd@lists.infradead.org;
	Sun, 09 Mar 2025 15:48:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2232aead377so70347705ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Mar 2025 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741535316; x=1742140116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
        b=P2v1a3rIdRIXjUBcInzPggLZhEyLUtnDJSqbGee/4/RTcOCNUmgQ51zph5skQrOcOi
         cOdmIq3MJkD98q0QbI4j//SwAoMghLidNQC2MhEAx3hsLgpSFmKLetbb3qIqpck+LXSX
         Xc1ULefE0UFftT/auj+VvWltnhYpvK4+KwmDSO07eN2XYLzDqnHtB+Gxp6CZTAS3ssWS
         ltru75KcNEawN3ayPHLYuXhAFvISi+ZVlGXv8CAw/J5nSkU2aNojl0CYz9FIJRSQLmFt
         5dQENHfcfdv8EXXfRnJ66Q8KfcuxAuG1prER5lVNs0FPsqrucA8SO186Qhbnw2yOvlkx
         Jlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741535316; x=1742140116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
        b=aOKT0jkSI6T+6N/PnQL0UX5ivhFttmSmRxKmO8ZmPFmesVodKTkfcWyhDQejq2k89U
         pzOh2r3G3AYtM93YLpjO8vbxmo2ppEhVLqRCcWw9veh79xX2gMC3CpzGevCpxvh6U4KS
         4pEkMbrR/QKnKLegAKuNw+OCuThDhhx/yVF26hVAUNh8PwbVIAmT/O/EPlauIc7b6hZq
         TA3EQBrbmYdExv6R/3KsOGz669nEU2TqBFjCKTdRoiZN81VIRFCE52PNaSFZwwXulPDj
         dAE6jgH6y7ykf5SNAnwKvaKIT2kkm6RRlLYR9JNt6+sFaHiHbyyUPPxFze0XlgE+ATBG
         RGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2z0y5Y7eA40zgGr4ptjUmxykUJLdFfkZoZ83vsmOfMduXNA7QF9+2Q+s82zcsrqKGrLoZ5AIgOaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIgELJuknz9eh6Y1reAaBljVMYwg4EXMKAhMckyuzV6osc/1Yd
	8zqYG4sHbVH97lFfhiUPAIehfb/lNX7T/rASDlEmCTmQAvM+NaKi
X-Gm-Gg: ASbGncvamVFWzR5U46D4fje4Y9ZyoVtj9hDdV1f39gQPKAsGqsFpzGR6+8xSxEYetrW
	jZ9tZ1gBhnQ9LRhVOx0rirBQbtqWV5LvvvocM2skDpiIVKnLjMSqgwtbiubq2zo4OZUt6NiJf3t
	s38UTmYCMjyqWZ9rizNbChanUduvnGyMt9hodJZ2AdE/8tSfbdqgzUZXzb5Pd4nxWgR4IAcC2YL
	dDEgbkXiXFZE2NGgvvuFsI6oEn3BnCpa3p8wzEfSqo4W54dtoFXwReiklIKCzbDwfir/tURTGyJ
	SKSfBRdcn6cpjfcSlYF6hoAtUMBp8ZlMPD02SqlLc+Vr+Lks/4aeh11lD35/Hq5j316K+A7S
X-Google-Smtp-Source: AGHT+IEkPjdlZsP28acQWQx0Qye7i9usm3kNOW0i6DfYwW0Xas+u0oor8hXm2eg176ewgjMSRnRBqg==
X-Received: by 2002:a05:6a20:4328:b0:1f3:4661:d19e with SMTP id adf61e73a8af0-1f544acd6ffmr16482561637.9.1741535316400;
        Sun, 09 Mar 2025 08:48:36 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af2894e3cdasm5384249a12.24.2025.03.09.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 08:48:35 -0700 (PDT)
Date: Sun, 9 Mar 2025 23:48:26 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org,
	yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_084837_855533_DE86C573 
X-CRM114-Status: GOOD (  25.52  )
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

On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >On Fri, 07 Mar 2025 11:30:35 -0800
> >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >
> >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> >> (int)true most definitely is guaranteed to be 1.  
> >> >
> >> >That's not technically correct any more.
> >> >
> >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> >other than 0 and 1.
> >> >
> >> >https://gcc.gnu.org/gcc-14/changes.html
> >> >
> >> >~Andrew  
> >> 
> >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> or anything even remotely like it.
> >> 
> >
> >The whole idea of 'bool' is pretty much broken by design.
> >The underlying problem is that values other than 'true' and 'false' can
> >always get into 'bool' variables.
> >
> >Once that has happened it is all fubar.
> >
> >Trying to sanitise a value with (say):
> >int f(bool v)
> >{
> >	return (int)v & 1;
> >}    
> >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >
> >I really don't see how using (say) 0xaa and 0x55 helps.
> >What happens if the value is wrong? a trap or exception?, good luck recovering
> >from that.
> >
> >	David
> 
> Did you just discover GIGO?

Thanks for all the suggestions.

I don't have a strong opinion on the naming or return type. I'm still a
bit confused about whether I can assume that casting bool to int always
results in 0 or 1.

If that's the case, since most people prefer bool over int as the
return type and some are against introducing u1, my current plan is to
use the following in the next version:

bool parity_odd(u64 val);

This keeps the bool return type, renames the function for better
clarity, and avoids extra maintenance burden by having just one
function.

If I can't assume that casting bool to int always results in 0 or 1,
would it be acceptable to keep the return type as int?

Would this work for everyone?

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
