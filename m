Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A922C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/Xzrjf/OCa5Eg2SfXcZuqwAR4yBdyxNvfrj685YGj0=; b=396JfuIRThgaYk
	Iy9AH3H4UWYHulZeqb2YkKJ7200uzwW7tCDNOPorZ234/ZatpLF7GbouAYaaJjqKSCbKFoYNVlLox
	dmSecwhTUQkLigv5IvVJFZGQm+0xmIDovdusvEwdT4X6f75fVuFr/SY3bcDkgFH7h/MSlMXnvz6US
	v9rniWMxjiR8pH0NYo31X6r+iFR5z7+8ZhJjZ/9mQJ41062nandIv2TPsVyLFiL9RWl+uncWV945M
	I4wF/2NCzAgohIFW/l8K2H5ckJbHPJ4zulkBspLmEgZUEOcqvZSDF7Lo7NgeSHD4TF1RwWi16c1Ab
	McL0WFegssNj+fRqpAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aFg-00000008BiF-1aL7;
	Wed, 09 Apr 2025 18:34:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aEY-00000008Ba5-0KfN;
	Wed, 09 Apr 2025 18:33:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22403cbb47fso77158135ad.0;
        Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223589; x=1744828389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
        b=OXY0njgp19i1cNWMQyfqw5prZxGBKKV5OR4Pe5HkpRygqYKhcUZNYOgXn4ItkNRkDg
         gt/9XbSsnRPGWtbrwJd3In6zGRtTj3wI5PNA+HifBADa+n7zLlmkLKAVmC5jAkaxBGdl
         B+dedMyVKcP6/SYPiCiquFUOKcKQ2Rt3/eZeHheLDtQLwPnVmt+gga8zSPibqBzwQumS
         886m5qG5nZ2ElJm2nug39PNFsJ5Em09Ls25ZquYRCt92+nYsL1QXt2B7fXWzQF4Rs7lc
         AqhNQ79GzIVHMm0igcBZmEpUD1HHu9EKwfBiW46ZDabxXkMWYe8XAigu5dssVZ7UOnlX
         wP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223589; x=1744828389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
        b=NFwDioSt3B/KQZ48h2vZ+AUmxYaF3Tsigkc08FzHWdXvXQJEirb3/hHPpqDF1IJ0TP
         6sJ+6XCMWhyRt0hyfzdYpYlZLUeyRC0h7ycS2GcWVRU6xbSw3Zt0oGx9lzFyIDuRtZM2
         yi7HLusHxAPixhbZrK67BAHFKnsaGrrBOgzjnrJ6ajlbspO28oTiWg7AmhMou7vflrT7
         JLK2dHfLqa0/zSZoWeIBC6iEjZf/TQwLKH7RAitZeQZC19X3LlSxr7cajEFX8EXmv5IL
         af19YwpcWlV4qwTvH0dip6KSLIiS17Di8n83q6cjk1kaIALOrGXqBsWjKaK7zGcbFhve
         Z5+A==
X-Forwarded-Encrypted: i=1; AJvYcCURNRWO1GRqS2Oc2os0SsjEECmM8KyLXmwbb2F9nBwfq9PUmoAMoYqaXKykc+clqvcwlIcZ8kwpne8=@lists.infradead.org, AJvYcCV6i9jzZ5L6mefdOBfStrOat8Y4ZubQaqSbiatT63NI4fqXteDSsT5VhY+a+uBUfdww2EAk36WP/b1y@lists.infradead.org
X-Gm-Message-State: AOJu0YzsnO+64J7Bs6fce3OeByls4G3yF1XAD7BZFBV+AjK3i+S7oEwx
	43Grc4WDXGN/HSt2JrKMhMEwIPB8r3WMO2qrGNbbSL8emKZucZw7
X-Gm-Gg: ASbGnctoAMBK+FaFdpIRusGbGJUbkZmirs/5LjsPO9Wm+/nhjMoAjiiO08DHU1+fK9x
	OrPzAIRw4vk5FaznRJAl7lqOLq+Q5bz0q1PMucNbhknOYhGj6nP8HY8HqXyZ+pHtdBB7/if6GeM
	qgRX+PmAr1xy7pkUi2u9VbPDc9fJwoXJGY1RkPbt/q14C/rs5jzhYlOhw3ezl9tv1hIKaM5/T4f
	P7y4nbTLyDjdaan7+XP2+3mfBhYk+l3cjDd2NRExPsG7eJ3dBLISJ5lOEdhHRQuZL6m8MtYXrPe
	uH3oa9C5ERShZd7wDl+6Dhvry3oBTYP26tHg+Td0
X-Google-Smtp-Source: AGHT+IE8wK8xLsT0Kpo2+eqnCnHqRBL6GoNWR5XNtZUkQwRprgm7rO+knOmPkUYsLXDP1SYqhAYEsw==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22ac2a25780mr61351915ad.37.1744223589016;
        Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0817f2dsm1575586a12.11.2025.04.09.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:33:08 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:33:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z_a9YpE46Xf8581l@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_113310_118141_FFFCFF6C 
X-CRM114-Status: GOOD (  33.07  )
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

On Thu, Apr 10, 2025 at 02:15:30AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:54:35PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel contain open-coded and redundant
> > > implementations of parity calculation. This patch series introduces
> > > a unified helper, parity_odd(), to simplify and standardize these
> > > cases.
> > > 
> > > The first patch renames parity8() to parity_odd(), changes its argument
> > 
> > Alright, if it's an extension of the area of applicability, it should be
> > renamed to just parity(). I already shared a table that summarized the
> > drivers authors' view on that, and they clearly prefer not to add the
> > suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 
> > 
> > https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/
> > 
> > Yes, the argument that boolean function should explain itself sounds
> > correct, but in this case, comment on top of the function looks enough
> > to me.
> > 
> > The existing codebase doesn't care about the suffix as well. If no
> > strong preference, let's just pick a short and sweet name?
> > 
> I don't have a strong preference for the name, but if I had to guess
> the return value from the function prototype, I would intuitively
> expect an int to return "0 for even and 1 for odd," and a bool to
> return "true for even, false for odd." I recall Jiri and Jacob shared
> similar thoughts, which is why I felt adding _odd could provide better
> clarity.

I think they said they are convinced that parity should return 1 for
odd because of folding and __builtin_parity() arguments.
 
> However, I agree that if the kernel doc comment is clear, it might not
> be a big issue. But David previously mentioned that he doesn't want to
> rely on checking the function's documentation every time while reading
> the code.

He's wrong. Kernel engineers _must_ read documentation, regardless.
 
> Regardless, I'm flexible as long as we all reach a consensus on the
> naming.
> 
> > > type from u8 to u64 for broader applicability, and updates its return
> > > type from int to bool to make its usage and return semantics more
> > > intuitive-returning true for odd parity and false for even parity. It
> > > also adds __attribute_const__ to enable compiler optimizations.
> > 
> > That's correct and nice, but can you support it with a bloat-o-meter's
> > before/after and/or asm snippets? I also think it worth to be a separate
> > patch, preferably the last patch in the series.
> > 
> I quickly tested it with the x86 defconfig, and it appears that the
> generated code doesn't change. I forgot who requested the addition
> during the review process, but I initially thought it would either
> improve the generated code or leave it unchanged without significantly
> increasing the source code size.

That's what I actually expected, but was shy to guess openly. :). It's
hard to imagine how compiler may improve code generation in this case...

This attribute is used when there's an asm block, or some non-trivial
function call. In this case, the function is self-consistent and makes
no calls. And you see, const annotation raises more questions than
solves problems. Let's drop it.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
