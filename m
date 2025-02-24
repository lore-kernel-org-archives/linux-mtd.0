Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA9FC021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcRJRPZyW7ZPrMwdMiWYNaFXic2FteGqXT22imrqXXo=; b=4O8kt7lltiJ2IN
	B6thxQjllChzEjiCJiMjenQgq5mUfoHpDHP25YvruLhPoe4ZBGASb/3qPGoFLks0JCNpbpW4SeEoQ
	l6EMyIk0q5vk/PSW/6Qg/QulP+4ZUDt2EEjRrSqwS0BPJ8flMJlR4XPo5wzO8Nb236DVyWxSifoqm
	k9s6WC8YSYUJejMCmJ18+oU7PTaDL+jgpvY1xc5AgZESzjQSxQ9w7yN8/ZmyLghIsm601sENN0H84
	ACd6kY8R7KszcPDjpGHMqcBY5+IPKi9IcN7fyaF7RvqwE7KsX/cHcyIBB5Bqy+Q+X4B8TkzWwGfes
	owVqNLsc19Cqr/b38I4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbmU-0000000EWQT-3d1C;
	Mon, 24 Feb 2025 16:58:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbl5-0000000EVsC-0dFK
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 16:56:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c2a87378so78384655ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 08:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740416202; x=1741021002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
        b=eKsmRmR/kYwr7q2NvK30+6ONlubU3OWtTtDI0NPqYrrW5jEjrregixH5LyEIe0VoFi
         T9t6P6uX4VnbgDntG24zlXbDUgar2gB3JfdFSbUTefZvQjYtr9Phc7O/d7Tj7c7fvjCA
         FgFTdvqmpbG/PBaZuF38UVKmuaHnydnsX0YVUfq3YttgOZvIThKl03o0JdQbPsYQZG8m
         cKEIDFQfxqs+LESQPmo6hcA+k44ZpNzgBn2b6hdpHbeVIr8Z4YjrUXL7JpLQPpjloP+V
         OYoE2MUY72q/qposvLZ+mhhCrHuxi37HybAhh6kMTg2TiyxB93RvAZitKmA8VsGlSmhx
         ExEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416202; x=1741021002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
        b=uAEk59lq+BjWTdSWQwsK1WGq/KmIYEHLYZYuBqDcXMy3vVCJBlMMdmHh3TgLSDiNq4
         9UazBLZbbwOxD2axkUCZtN36Ci3b9vLR9ClPbN5onCEh9ydZrSBqh5/3CXcowuio9lrz
         ISBkusPL+Ue81Ww4PW/rvOAJhT5KdR/zGiBTK9dRNUErRxoqAL2GdufZgpNZfb+nuIDl
         Mif3khgDmC6ydoycPKEROckt82miazBXw+Nzm+mFNMmSGtuywHejNWgKn1ZYlCP1xicD
         +0itbDT1aIAkPQNJ5PqLZJGVk15csreFLV3VAWkF5ttqeJE7J57ZCVOalG7yemQWeNOX
         4YxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2m2YQ6FQ/lk4yZvlmsQkEZMGVC6HBI8HacoDYan2beTmwlOWBHFi3ZM4Ipr+dYAdpetzruWQSjP8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTKPo9gYgKNZQUQtcEwsLDr7mzKT2BdhBUDwcCGSRdSAVO1JzC
	CW0GMVV+ChD78rxmKFIKmjpY4QolRHZOBupKolpbyxSZZdfRoN/+
X-Gm-Gg: ASbGncsvzYCRo57UYJQH2LX+DlrHms2urdQxT79wU6dSKPCek+UGCl9RVznhX6pgOp8
	evUCXYEXNxut8N25OXiCktA/T7lo+hZRrpCvB0vIKSz5r1ByzKecl1GKxHysEEGU3p1xZXlw/ZS
	oVmPcNOhLMwp3bwGFFT1sqv88XDYbAR63DjkAaUqjvI/Cctlfk2sKPKmhsCncMd3rboJ4bi7XR9
	C6XZHBxnjEDayN06d+sjjfgj1esYf532qEJWhfihEhYODthYj+cJG3jHM2XYw7ExCuNop7Wm2Xv
	aWKM7ed8A/ibySK84ug9GlxmGImE
X-Google-Smtp-Source: AGHT+IFVgQBLmZYFNL+ZV4HrxXg4lZgXZnXGnGr0U7DF5esCoQcIST0NuWk3m7oQnTUJjc9HIW9Ozw==
X-Received: by 2002:a17:902:d492:b0:220:c63b:d93c with SMTP id d9443c01a7336-221a11b9493mr230835105ad.44.1740416201946;
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534afadsm185140065ad.26.2025.02.24.08.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Date: Tue, 25 Feb 2025 00:56:29 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
	yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z7ykvf1g03XDLXKc@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
 <20250224133431.2c38213f@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224133431.2c38213f@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_085643_199448_1B6D2862 
X-CRM114-Status: GOOD (  30.98  )
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

On Mon, Feb 24, 2025 at 01:34:31PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 08:09:43 +0100
> Jiri Slaby <jirislaby@kernel.org> wrote:
> 
> > On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel open-code parity calculations using
> > > different methods. Add a generic parity64() helper implemented with the
> > > same efficient approach as parity8().
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index fb13dedad7aa..67677057f5e2 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> > >   	return (0x6996 >> (val & 0xf)) & 1;
> > >   }
> > >   
> > > +/**
> > > + * parity64 - get the parity of an u64 value
> > > + * @value: the value to be examined
> > > + *
> > > + * Determine the parity of the u64 argument.
> > > + *
> > > + * Returns:
> > > + * 0 for even parity, 1 for odd parity
> > > + */
> > > +static inline int parity64(u64 val)
> > > +{
> > > +	/*
> > > +	 * One explanation of this algorithm:
> > > +	 * https://funloop.org/codex/problem/parity/README.html
> > > +	 */
> > > +	val ^= val >> 32;  
> > 
> > Do we need all these implementations? Can't we simply use parity64() for 
> > any 8, 16 and 32-bit values too? I.e. have one parity().
> 
> I'm not sure you can guarantee that the compiler will optimise away
> the unnecessary operations.

Hi Jiri and David,

Unless we can be certain about the compiler's optimization behavior, we
prefer to follow an approach similar to hweight, distinguishing
implementations based on different bit sizes.

> 
> But:
> static inline int parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32))
> }
> 
> should be ok.

We will adopt this approach, as it is indeed more concise.

Thank you all for your feedback.

Best regards,

Yu-Chun Lin

> It will also work on x86-32 where parity32() can just check the parity flag.
> Although you are unlikely to manage to use the the PF the xor sets.
> 
> 	David
> 
> > 
> > > +	val ^= val >> 16;
> > > +	val ^= val >> 8;
> > > +	val ^= val >> 4;
> > > +	return (0x6996 >> (val & 0xf)) & 1;
> > > +}
> > > +
> > >   /**
> > >    * __ffs64 - find first set bit in a 64 bit word
> > >    * @word: The 64 bit word  
> > 
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
