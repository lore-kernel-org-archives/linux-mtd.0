Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EBDC28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rp6Yt4t6f2O3kjbi7ToetlgMY9kiDNKAL35JcfMdrz0=; b=WEbyM40iazwGas
	fOOHXy7skeloP8hzNxrm5Oi+CLsWtWeUkx1LFACXmT5LURFMJfxCLQ/2eB+W5Zu2PAmqdaiuSpmhj
	DWp4beAHEURaFEmvfvX1XNLc6ncB/P2eZu9BJ1zPwS5IZHc7Odadmc03xkArMejQ/10toxDxUxXBa
	iVMqaPtd9be1H9hZYEWZ6iVN/2tIXvcHnsxv91IXHUzjwl5xInAsCAIRU2yoV2qNPFZE/jwIY5uOl
	vjBWfgdU7Slqvf2sVkO3pDD2IYSzA6cy3ZEK8mJt4pUm1xDHbAFjk2gpOua+RFA+RCEMYHxTUQfsJ
	bMbkzwrK+S5P130/m2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdOh-0000000FLaK-11gf;
	Fri, 07 Mar 2025 19:30:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdOe-0000000FLYW-13KQ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 19:30:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224341bbc1dso14343365ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741375811; x=1741980611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
        b=lvNf83Ig+dScthQ1FPRtS6GFWHmjwfxSk/6x9cUZaKukOoCiW2xVjZys00c93nnrzl
         mKoKWXjIVWY4R0q0C/Imwc2zFM3k4MJNNWp+0EFTe74eJ46N3QOQ6Csdeah6PjIEid83
         9Fe4Bg9Rf8GMmTj33ad2BnKCWiserWqJ3v+QUP2HqjEGsT2PphXL1djRmAnHr4kGeJ48
         Ux33Vn02VRuKaeDk9TcPCCvvIv5R5ITSbZoIxuxeARfn7dlufRx3dkcayXv/zXdBfS/j
         TqWztWOQpPJrAKWgVuEKTCCRKtwLqck7EMyJjy7PQF2m7pjU6fN2F10z4LzIyMaBBcri
         d3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741375811; x=1741980611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
        b=nniqTYU4GEhFcx7BXHtW9kvJSO2SzzhDg77/pz46XgYEN9HzbxJCNsl03dPNwGQ1+7
         ZBVXM7N4WQwljY2NdZ5awMFFpRnUbxSxlXgNve6glkb924HlNcin0gaqOKZerrB7UY9k
         qgVW/2gHlpnHZqM3kZfAK2oT88cR5/tgtj4MR3QnDB7rAWzS2lLVO0GMJ3PuQAlZr5oE
         HLqIoAwjQQpTnz0DmcQWHPhg7btd8zR96WGjsX/FvinL1zN2VaG+z/EUcDjWepe0c+CL
         qaC7JORPsabbcG+f50ZjkfroZASXff6SiqtQ6FQ/+AsDp73qKQAXh58PkYy8mGT5n7wX
         bdvw==
X-Forwarded-Encrypted: i=1; AJvYcCU2abFP96v503iTjBb6rz8l6UJj6FmO/J7z3iAUvQy2mDw38HYDwUUnjN7rud6gywa+w7vdUYJlz6k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJjIrJXnzmUltgvUfyyDZWe8+UA5AEvewojnFWyvGfXDdIqZQm
	8PbXJGsUGo8m9XwQUGucgs6YT7rki7toCAYpWFBQQ+eR+su7ScWI
X-Gm-Gg: ASbGnctMNOXKaCh5dgmyJbgVE80VYAFQ9ranWMvfchxyWdeuO9LnZBtFkkwBOMVegmG
	6amKCbe3Yj7MKhGn+sw1yDqRA2nSk2rUh0m6zEtW5SfxMaJJJAeKxxXh+jZNajxlhd2jNDCv3W0
	jzISOvvTY7nezQ5FTQHg+w1oPnLAeRnbK/yxDwJWFIgTza3oGS4fumL0qkFPXgGDXv2li72KfHN
	iKq/XjGQ+3ALVjSZVtMrH03aQ1Re653sE87eqIRcgscP5sPOIZDE4TdbfsGgM5mUqjHRA9SEhg6
	n+olVbzK/39LQv5l5T1yl9E4hQld4OOxRnJm57APNKUi
X-Google-Smtp-Source: AGHT+IEmnovg8SODODeYbL7InF2WSqC9McWE/UoY4IWxbTzIc1jrQMfyhDSc++tBv5NrR3IGNpr8rQ==
X-Received: by 2002:a17:902:f645:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-22428ac90a6mr73028235ad.42.1741375810720;
        Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddffesm34081415ad.40.2025.03.07.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Date: Fri, 7 Mar 2025 14:30:08 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
	akpm@linux-foundation.org, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z8tJNt83uVBca0cj@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_113012_293994_CF60687F 
X-CRM114-Status: GOOD (  28.48  )
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

On Fri, Mar 07, 2025 at 04:14:34AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >* Jiri Slaby <jirislaby@kernel.org> wrote:
> >
> >> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> >> > 
> >> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >> > 
> >> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> >> > > > Change return type to bool for better clarity. Update the kernel doc
> >> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
> >> > > > examples. Also mark the function with __attribute_const__ to allow
> >> > > > potential compiler optimizations.
> >> > > > 
> >> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >> > > > ---
> >> > > >    include/linux/bitops.h | 10 +++++-----
> >> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
> >> > > > 
> >> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >> > > > index c1cb53cf2f0f..44e5765b8bec 100644
> >> > > > --- a/include/linux/bitops.h
> >> > > > +++ b/include/linux/bitops.h
> >> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >> > > >    /**
> >> > > >     * parity8 - get the parity of an u8 value
> >> > > > - * @value: the value to be examined
> >> > > > + * @val: the value to be examined
> >> > > >     *
> >> > > >     * Determine the parity of the u8 argument.
> >> > > >     *
> >> > > >     * Returns:
> >> > > > - * 0 for even parity, 1 for odd parity
> >> > > > + * false for even parity, true for odd parity
> >> > > 
> >> > > This occurs somehow inverted to me. When something is in parity means that
> >> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> > > bool is returned? Then you'd return true for odd.
> >> > 
> >> > OTOH:
> >> > 
> >> >   - '0' is an even number and is returned for even parity,
> >> >   - '1' is an odd  number and is returned for odd  parity.
> >> 
> >> Yes, that used to make sense for me. For bool/true/false, it no longer does.
> >> But as I wrote, it might be only me...
> >
> >No strong opinion on this from me either, I'd guess existing practice 
> >with other parity functions should probably control. (If a coherent 
> >praxis exists.).
> >
> >Thanks,
> >
> >	Ingo
> 
> Instead of "bool" think of it as "bit" and it makes more sense

So, to help people thinking that way we can introduce a corresponding
type:
        typedef unsigned _BitInt(1) u1;

It already works for clang, and GCC is going to adopt it with std=c23.
We can make u1 an alias to bool for GCC for a while. If you guys like
it, I can send a patch.

For clang it prints quite a nice overflow warning:

tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
   59 |         u1 r = 2;
      |            ~   ^

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
