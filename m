Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC348C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zAn4ijJda1p5aEt9/Hvc+A4tdPmSDbxjAjn/DlSmEU=; b=wC4c+QyUPMTPEk
	bRFnIuRKHUEdFJxCIYQ4jgI7UrVufNNu4kaeZggDh/LwD5OjeKIcikBFSqDEqAJSr+BcazN42S5J3
	yI8cZgVLWhX248hQhG3TzKVAYcZ/BzKhswOyosTx7H0i6lTlrPWxGMVsL7qJWZoH/LsYLXtMLTZzS
	Q8b+kDukbUCGb3v0xjStpZqC59MBCBkZZIB0MFxdrCBJiSVAAaMcAxniWOjXZNTt+TUlnivMsBb+m
	uQrykjvrGoUP3fVjtN8s8Srf7YzvLHRfybCpIRosoL5O7ss6BqgqbbaINQikgdMSeuJLZ+3KcSGN/
	cVNRiegU+VboPjA8JHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2a56-000000089so-0NvD;
	Wed, 09 Apr 2025 18:23:24 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2a53-000000089rX-1WTa;
	Wed, 09 Apr 2025 18:23:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22435603572so71198595ad.1;
        Wed, 09 Apr 2025 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223000; x=1744827800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
        b=LPgRyXz2CIbTA2p/5PYpIWfUcwUAQeR0eNYifYmo2kY1kZedAIO83JURtihdwh/xrU
         /fmTEAb4KIFSPLlL5YC/0QsaoNXRTz1Og6ovhY1OkPfm6Hv97m5kQEHxQClupt40R9t9
         mZOox8/04FWcAahrVTrKfhhSS/4e4Kknu93ceq59cXCcKNH/0zMWSya4C9QHG5IM+sOG
         lDdgUK/ZvZ5Jf3s04GdbrESg8H90wJLj2g2mskKYhiEWfcSzhPe4utszKylXE9HXQIPt
         M1qa9ExW7EaTUy8Es/GwHtojCzwyJvZHPe+aGVCUUKt7u1I2wvuPpatnmWrB0iJ125/k
         9wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223000; x=1744827800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
        b=cObaiJtDg5DBPN9UD5LdZY/xvfBhm7+CW6KsXYy4gCPVtCadIClYbg6Bb8qs7M0WOj
         aZVsW05XQlWb34xJM4hwe7/jYC51o2/tkh6Ym+AAQlUtU18bzILIEZt+GfMalo1bdOj0
         0sETcJkbdAjOw2ZloH+0TbOKtllo0MEY12BGJLUbhci185zZDqyGecJWtarmWpS4r+Bv
         B4vHTEOdGbujuQS+5QPs2GV5qBeVJoAjRZLEi49Uz2C61q9CHA7pSxf8e0W5azMFHBJ/
         b/Oazco/8VkMXglHvR8b78v7CsJkeXg7/n0JxDQPfDxMX2j1N/XWTGaFhk3SJQ9bhJb1
         SF5w==
X-Forwarded-Encrypted: i=1; AJvYcCV76ruadWnZ6Xp1z+lEbYTo6pRVv4p8JAIsveIxnpvvtstYP4o5v+yBC6GSLKFRO+E590oZpvN5jHY=@lists.infradead.org, AJvYcCVT4rNI3MaYDR3o9xs9dzUufKzyHVmkxVNXispkfoqE7JdjHpet84YMMtHiGkc+xWZNOLY0T/8LyYP9@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZZjxW9++8Xh9kSc0Sk/zglDqMvleEX5rFLTc51lyfH40nGgj
	ODZR7sWxzx9S+711H0/2TVpXSiJkGCIF95LlbDyuzAXCeERWt4SX
X-Gm-Gg: ASbGncvRY9UndsA94ibhoFfQhVhzUk7qUGwjXetb6uyMa8wdrZ89GPeyysbuUgDWGq8
	4ISf80V4NlrNxTfnBcCR3faV5mGnj0HHKUlPYlgfIKfgmoY7IuIZJx2JBlk6btBPeQbJlhk9NL4
	d5q8ewAGQugT3ojvuifBZL+XL0Yjtgho9W3aTcBZIMh9+B1eNlTFV3sU56pNZQnSNdjRgagN7uj
	PlqnCnzgGqOtZQToXz22gL6pk17qXTz4qF0yPZ4u6pU/SbKeEpvs/kP3OWVwN2sXubkaLn0sops
	RbTrzUtAW0zxUc5w21HV+TbPyQEz5AdUlQ6I2uuPHgB10Q3NYvrRZFxRD4rWkR7NtHv9
X-Google-Smtp-Source: AGHT+IFJTXcO6iff2D3m6F14Oejj60CpisJRfAo2/LdtyKFQF1rTvBeD9sWDrAGl2dH2tL/2lZXd/A==
X-Received: by 2002:a17:903:2441:b0:223:2361:e855 with SMTP id d9443c01a7336-22ac2a1aefemr59522875ad.39.1744223000437;
        Wed, 09 Apr 2025 11:23:20 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6b8ebsm1679194b3a.180.2025.04.09.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:23:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:23:09 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_aobrK3t7zdwZRK@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_112321_400816_99E464B4 
X-CRM114-Status: GOOD (  19.50  )
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

On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > index 70a4024d461e..5e1b7b1742e4 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > @@ -5,6 +5,7 @@
> >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> >   */
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> >  #include <linux/ktime.h>
> > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> >  
> >  static u8 calc_parity(u8 val)
> >  {
> > -	unsigned i;
> > -	unsigned tot = 0;
> > -
> > -	for (i = 0; i < 7; i++)
> > -		tot += (val & (1 << i)) ? 1 : 0;
> > -	return val | ((tot & 1) ? 0 : 0x80);
> > +	return val | (parity_odd(val) ? 0 : 0x80);
> 
> So, if val == 0 than parity_odd(val) is also 0, and this can be
> simplified just to:
>         return parity(val) ? 0 : 0x80;
> Or I miss something?
>
If val == 0x01, the return value of calc_parity() will remain 0x01.
If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
be changed to 0x00.

Regards,
Kuan-Wei

> >  }
> >  
> >  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> > -- 
> > 2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
