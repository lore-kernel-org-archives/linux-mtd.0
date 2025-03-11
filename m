Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE9C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Mar 2025 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Udl1S9mpuZD3wCftB2Zy8ApYlPSqnbWfz/O8Q+7bXhg=; b=GDhwgPti75mzag
	VyL+uEBNVSmtNxmHt69hwOHDWYTfEb79pMyP5O/eaMhZ4ic5pUYFze9N6ciIVXVCIuzUg0f1cMUB4
	hoaUmgAdFOheEd7ZWO0MwOXuXJpKcea538nVDVNEYZc4ybtnXcazvDyYdQKPVAJ4jSXGKhBza/hBl
	xFKOk5ZFzNWVGICykj5V1yNr57vAzgnomlhO3Z5YCvO6e7LaJ7XVb27SHyfh4OP4/hM1Sulz/txtj
	/BSL0m8MhrlTyPkQIzYlVgFzpFUmEpenLZVSLWrMCV3Bejuz7ys7CBrYnwo2e1hF7NFYRNs6B+QJY
	C1Ok+Md8lVpLFEJAbxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7ge-000000074FK-2MA1;
	Tue, 11 Mar 2025 22:02:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7fL-0000000744Z-3r43
	for linux-mtd@lists.infradead.org;
	Tue, 11 Mar 2025 22:01:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fd89d036so117866515ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2025 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741730494; x=1742335294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4nGdnQu24c+EnZ9jURP8a6eRlAbk5SN0M0qMNjAtkzg=;
        b=do/sEy/fhIk/l6wxrXcYnsLasDdcjSYKs04MA9l3s3Q+IPqAyXtCD50vJq2ZoayoKm
         7y8NxEmvXtaAM4bB9RF9PolohsYTSpw17VDU0dIa/974MQD5aGpFgnKKIUmdkgAb3JNZ
         D6e3zR+f3hTBn/dltv56ze+lwDpwWhgpNOVIH1i64x5W/QaIzxtXEdkwdej8uL7su1L+
         zzUX/IPro6rKyhzIYIVwdiX50WihIcXQ7oUNTmjjxLzQgEG+38q/mprAi5rxrz2MduKg
         X/W7gBMlxpHxW/A4Fj3c5KSJzqQG9jV1p01EUoyvTc4yngwZtOXdfGNq9NoPyfPs5IWB
         p+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730494; x=1742335294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nGdnQu24c+EnZ9jURP8a6eRlAbk5SN0M0qMNjAtkzg=;
        b=eI6IiAPZJYnSYQIN2G8IM32jM6mgyDfEYgQgjQSy5fXGeBdX2jqHqFTAq7OttpFZ7j
         rDN7rIMWy4goiPmH/baR55cWWTsjf0xczdGmRbHVAFxShlly4uoQeKgqpcP4dgl2Byt3
         CIEaL9IhNS2jvbZK0c5OvOFrLfRLCNtCDNu/MN2o7qe+eSbQ+4m7C0VxajKlJwYACKCO
         h0ynmFiVqEqVBawXOLSZHc3pV/WNpHl2G429JK10P9bV1EMGSg3zW4UD3tzemdTHhNdD
         LkgQ41MzPco47ILGlFr4ZbJcWFQRvw9fWfhh0cWGSiOwDohIuZF02D77kHYb4J2Loof0
         iKZw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2zMHS/aBDGo3h+G8Qqj7XMaS3HfpV2heYpDac9nYQ9x0vpHaHc+75Ct0mnBwQgqa+JmgKXnhGAE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywps2PW2LLF2sDI2R1MMiW++CFz8ou+3d6K2J0z/S248IMYwyIf
	2HmH2Khm1UoCRZPONWxJho62MWKsrNroaAMgpLvRw/pR1N3nGO1+
X-Gm-Gg: ASbGncv1giTv71/KFci/R7R2QcyiNR/k9r5MvvABI3femXhNlFxAoYF8CI6Sh+MFHfa
	gWVbQhaO0qXOgV2NFhyiOkCgTIGDKkd4jE+g0CyAzmkjSx3TzwcuoRiNqB/QvriIwICQiprMb7i
	eiejW+ewXD/0a8mnF/vr6vYO6HEgVj/wvx0dkgr7j4frcXpFL/dd7uDmFZJORZBna4CmS0IwtJY
	oDv8c5S2/AB2GsfaCwzyANVnaIWINuO5lIPZZFneUKWplc4CRQ9ZPA2qSUVROsji36TyF7QA7CP
	j9l0stLSwwnMQvYL5yhm0UI6nEtdO8X20IIITqNp8mPoaz3Ra88na4s=
X-Google-Smtp-Source: AGHT+IHfvnoVJgHMih9pvYSUsyOoOI7rh3JUtGAJjtASiqZVTFfrJXIMw23oGqwW4/w5VR3B4dwAMw==
X-Received: by 2002:a17:903:32ce:b0:223:4b8d:32f1 with SMTP id d9443c01a7336-22428882233mr316949475ad.1.1741730493639;
        Tue, 11 Mar 2025 15:01:33 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736ded451c1sm4125755b3a.119.2025.03.11.15.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:01:32 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:01:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>,
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
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z9CyuowYsZyez36c@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_150135_956683_C36975C9 
X-CRM114-Status: GOOD (  33.28  )
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

On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> > >On Fri, 07 Mar 2025 11:30:35 -0800
> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> > >
> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > >> >> (int)true most definitely is guaranteed to be 1.  
> > >> >
> > >> >That's not technically correct any more.
> > >> >
> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> > >> >other than 0 and 1.
> > >> >
> > >> >https://gcc.gnu.org/gcc-14/changes.html
> > >> >
> > >> >~Andrew  
> > >> 
> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> > >> or anything even remotely like it.
> > >> 
> > >
> > >The whole idea of 'bool' is pretty much broken by design.
> > >The underlying problem is that values other than 'true' and 'false' can
> > >always get into 'bool' variables.
> > >
> > >Once that has happened it is all fubar.
> > >
> > >Trying to sanitise a value with (say):
> > >int f(bool v)
> > >{
> > >	return (int)v & 1;
> > >}    
> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> > >
> > >I really don't see how using (say) 0xaa and 0x55 helps.
> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> > >from that.
> > >
> > >	David
> > 
> > Did you just discover GIGO?
> 
> Thanks for all the suggestions.
> 
> I don't have a strong opinion on the naming or return type. I'm still a
> bit confused about whether I can assume that casting bool to int always
> results in 0 or 1.
> 
> If that's the case, since most people prefer bool over int as the
> return type and some are against introducing u1, my current plan is to
> use the following in the next version:
> 
> bool parity_odd(u64 val);
> 
> This keeps the bool return type, renames the function for better
> clarity, and avoids extra maintenance burden by having just one
> function.
> 
> If I can't assume that casting bool to int always results in 0 or 1,
> would it be acceptable to keep the return type as int?
> 
> Would this work for everyone?

Alright, it's clearly a split opinion. So what I would do myself in
such case is to look at existing code and see what people who really
need parity invent in their drivers:

                                     bool      parity_odd
static inline int parity8(u8 val)       -               -
static u8 calc_parity(u8 val)           -               -
static int odd_parity(u8 c)             -               +
static int saa711x_odd_parity           -               +
static int max3100_do_parity            -               -
static inline int parity(unsigned x)    -               -
static int bit_parity(u32 pkt)          -               -
static int oa_tc6_get_parity(u32 p)     -               -
static u32 parity32(__le32 data)        -               -
static u32 parity(u32 sample)           -               -
static int get_parity(int number,       -               -
                      int size)
static bool i2cr_check_parity32(u32 v,  +               -
                        bool parity)
static bool i2cr_check_parity64(u64 v)  +               -
static int sw_parity(__u64 t)           -               -
static bool parity(u64 value)           +               -

Now you can refer to that table say that int parity(uXX) is what
people want to see in their drivers.

Whichever interface you choose, please discuss it's pros and cons.
What bloat-o-meter says for each option? What's maintenance burden?
Perf test? Look at generated code?

I personally for a macro returning boolean, something like I
proposed at the very beginning.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
