Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8717DC021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjkrLjhWk82MQUHgMm8R1m2TAEXAj/Z1nTtZARVzUY=; b=ROi4oCByUf4a+x
	gJKXL8K9khVTA/BwR0YPRerzLGtSPMCSczQfmyc7mWdr0XbtoPeSrPWklBM0ZTQub5ys4HoSuScgh
	tK3QetTyu7FY3ng+NcKXzCKWB/vRkXPpUYtnyuWhKrbtndVs8oMJks+KL54i7nbcSE7/jJi+QVRmA
	JErtpQWA7hHwUovjerNsdFKYxO9AivBH9FaahL/3TGBKW+rxNAA61N/8TnE6khgGevBqQnSZDfaeY
	3/g1/W43msB+fikbCEgFELIb0R0mp7q0QuGuWXThrxnmlzskXHVL4JueWhix9CSURkMHIPTqJMYTu
	cXMo2a/M3Zic9BCMwjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYcC-0000000DuPe-3z3O;
	Mon, 24 Feb 2025 13:35:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYbW-0000000DuHX-0RTU
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 13:34:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2540190f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 05:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740404076; x=1741008876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
        b=f3lN7g/h+VvEphTDY1ku68IhBT11Hxk6EaTZQNolBVfBthMOHH9t2Q6Zr27NH1k+Dn
         OtoTi94hfUEq9bD6FgUJ2BOR87thJFtQ/OmWUEeqWHljYtfsvqKiltzZaRn/pZt1xi0c
         4iXJ/3rfzh6g7gJ5/dbf/g/KyEWKeUd8QqNksug6kpLzZD2qwoGWNfmjcyJLcEEpvj6o
         rCCkApbCx/x9LBa+MmoIdNxQQE3o1BbyL8kZbB3MM40pxY+mQPtBPcmuVUayBWrTn+8O
         zCk+SZ+Pltr2gSnPgZBXZAqPxqJ7ayA1yl1lczAseZV9LzaqeTlivJUbwB9nO1miVzCx
         isew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740404076; x=1741008876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
        b=d/VnRUJlKj4HLkZXP0SkSYq1lpc836+8gN6+afXM6mBgDnPWonZfTk22ZiqYnqLY1m
         zKbfZuSaYqIqWqEKTRK4TreuarbUydh6QM6cCRT2AmrM2YkejCvy3JLDD9BgmlSuYejN
         pvSagjJ88gRTqLK8xQ56QB3QUKwcWTT+YFu5MLjKjMYh27uZhKlrpinRvWU1pQCoFg1w
         R658hUq0eqbuya6h2Qwahz8jrqtQA77Y41+/5ZU/Wq1kYqElXeWMEQpcn1QdS7stCvVf
         Aq5BBpBgowENociFrn4pR/9+NnZt3ZP1ErljvdQyeX/ph30zEF7ynKu0L6xjbPPwC4j6
         4XOA==
X-Forwarded-Encrypted: i=1; AJvYcCXGFFRxEOolTAA/BmO7JN4dXmIymjvrO0bhYdCMnSo9W/ubo4w2Vx/INBXrCTcpxUIUKUWF0PyX2ys=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzus511EdOSAbThkzgfXkgqWYzM0SOVye3Z2Nymbj/hTJnYtaxv
	EVNoBqhTf0zxqMK2KrMcqhOYuIBdEuLcfOF8EWlmz+/2BTDjhDzB
X-Gm-Gg: ASbGncuNgonbglk1BJHI0j1M4+UVzcMQAPW+1+opnNAZ4oH7lbT5Ipj/MT05qa94/z1
	tDBsE1bbf2tJkVi5CpwnRQCj/PAXGucRjR9GxI2jkgH0wOMuzcmcqb8WkIQquDMZAMALjcSgORc
	HH8L+StqmL1RE4KrmNbNY145BnlwUBAfoWuDZXUmF71YAbKwskSr5KwdHJpmalX8x+WD19s34GA
	GVmf08bWPvUJbe4lW87BUVylCjrZwA6ksXvPgZsquQWjqWILfovZEgFHHoyLh1aoKEbSmRR69pG
	g/7vqrx1dQbgL+UotEleKW0Akszu7HIzQqU/TPIeiLJCq5zO8W42j5+aO7+nSIzt
X-Google-Smtp-Source: AGHT+IHAk3Wvwyk1vqkRenvO3RPC8nmIGBVFBN9gj/vKmwdIoVhq2/WUUPGNh8lDJR1/QVDS5j7zIQ==
X-Received: by 2002:a05:6000:144a:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-38f6e7587c5mr11099286f8f.9.1740404075459;
        Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f74817cbdsm9492882f8f.68.2025.02.24.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Date: Mon, 24 Feb 2025 13:34:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
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
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250224133431.2c38213f@pumpkin>
In-Reply-To: <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_053438_148825_D2C6580F 
X-CRM114-Status: GOOD (  23.25  )
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

On Mon, 24 Feb 2025 08:09:43 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > Several parts of the kernel open-code parity calculations using
> > different methods. Add a generic parity64() helper implemented with the
> > same efficient approach as parity8().
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index fb13dedad7aa..67677057f5e2 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> >   	return (0x6996 >> (val & 0xf)) & 1;
> >   }
> >   
> > +/**
> > + * parity64 - get the parity of an u64 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u64 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
> > + */
> > +static inline int parity64(u64 val)
> > +{
> > +	/*
> > +	 * One explanation of this algorithm:
> > +	 * https://funloop.org/codex/problem/parity/README.html
> > +	 */
> > +	val ^= val >> 32;  
> 
> Do we need all these implementations? Can't we simply use parity64() for 
> any 8, 16 and 32-bit values too? I.e. have one parity().

I'm not sure you can guarantee that the compiler will optimise away
the unnecessary operations.

But:
static inline int parity64(u64 val)
{
	return parity32(val ^ (val >> 32))
}

should be ok.
It will also work on x86-32 where parity32() can just check the parity flag.
Although you are unlikely to manage to use the the PF the xor sets.

	David

> 
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +
> >   /**
> >    * __ffs64 - find first set bit in a 64 bit word
> >    * @word: The 64 bit word  
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
