Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E7C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DaXIa37+JZGEq5BGL9T4xHNzPnT5n6TVpDA1y/2z4U=; b=lcUvf3vci1AZ1X
	qZxm9C/N8yk0reRArw3xajEMvdBdLaqYLNOe/BKR6nvbeJzXLXl3tys3oMrm/Ox9oeA0xju9qRDm0
	F/4GNwYWaSq5r9sPQSDdsLM/meulchdZVypyWOxZvVE0GdRgkGbYBJosNRuk6rtpu3lQ/bUTUn0zn
	v1FsqUee9KS0YjB5GlSxoJuKdWBM0TjROO47kUmzOtR72PML2uaMCb4NrLQlmJg+gPNktHiyLvzrN
	TQvo2cCi/oejDSEg4xDwSOtftaib9WSBhC6Kbnl4D87uO4gAqcOV7v/8G3zg2kARpk2sQfm4tG3i1
	/JVnQN4GlQ2ztzmin/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aCY-00000008BEG-1IAR;
	Wed, 09 Apr 2025 18:31:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aCU-00000008BCY-3Dp5;
	Wed, 09 Apr 2025 18:31:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301c4850194so5811644a91.2;
        Wed, 09 Apr 2025 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223462; x=1744828262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
        b=AsKCNltH6yDyQG4GpkBKvihiZl0fy6NH8d4wMeX96z7eES9b+VJNAfXmD/sDuHt0NM
         6UdMlZ1zy4xsmCJJTz5cs7I5aJfbRpr5JOzhcdALI7j4RTt7r8ztgSgHVOaSMxYhpJa2
         tNI+n6wUM4qxg7CfPlStP0pEOd+pUloS3RCWrC0OXTkKdWtkgE3GKAfamcULux/RLzTN
         XzYmU2su4hGJXIjRqSWf1YkTm1QVoCOS96Ihgzq81HlAoDpQGiXhyfbXFq3MO3fi21cE
         VtsfhctmeaqfQjhOyiccgUvdVLmPc3XxCBLpoPwj901UVy7rmjvg0Xx9apt8gJj4d7BC
         2aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223462; x=1744828262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
        b=Lje1Lxb575D0gxgBALcsu19EkSgBbqvbM1Y57Yf1pMcYhVzcmPpvXrryk8ZxnkDVlc
         zz0taQEcQeaNKHYEKZ6VJTZpWRGdTWfW048nyKSRTmzjGJuV4GeFjD0oJz8Y8pz33XFM
         VR0Sw+STtjVp3vaSFF2i2b5lO4AyZyJd3e62jfh+QXhMnrpEggRMj6jw8SWoIWAWp6sw
         8m88SjZ8uve1vEGkFArb/B/N3wahNUSRQkTBV5yQH6BoT0W6NeK9zZkbMeLDSrbEINh9
         qjoyC3CkRgJsAizZHKSgAV9uQXJsVTvdHtHKy/sAIz3YtBc41MBnuUrw7l6qP5locj58
         CKww==
X-Forwarded-Encrypted: i=1; AJvYcCX1F+MYhVsdABxpSPXVaa+SZ94H+qZ3NoTfpAQJfbxbs+kbjDsQ1kQgekHc5cSMTuPBzNR34bnp49uF@lists.infradead.org, AJvYcCXF0bJiJw1MBqLm6J+gDbnRgJWPn9cvHxeddl+wNzaHVNMZUgIgh0zDEz8kputzUYIA0fSCRhap3Fw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCnrwOqsekDD2AhEult9ugpGXjejI6HHBmoRj14rP0TvHxdf6I
	cNxZP1vLjpk9pjnU/DTBUiFEW7FHnzeaVaL8aZ2vg2qZVwwTJRQm
X-Gm-Gg: ASbGncvuueGXbYoOwNZPPwTBCRYERWc20L2hsOpQqbzA+AwWsHQ2FZIDy3KiLL4TJJd
	AfgkvC+9LGJqtbQL8i/VyHSxeyYjBkUt2gt7ypk4v+xOcX08eWlFtQcAgfhvQJfWWtI007Xn1K6
	uWsqXikhXZ+7ucuzgXGOMdn2VxymXE8QCFqNiDEaDCmb3l7dbctYLgVrQI8xhnnGQpcwMGtyZVB
	hmnPDGnxmvbHn4cANHTko28S8482BkrUZ0w7uxzZAtnU7WEnr4B4BqKgImoCAbAjhnAcSESrHgW
	jsVQB/QAF+xJRj0VJs8eTYe3J0B6Sinnge2lKK4jIdjm7N3hFaUGFVxNx76On4biHVm9
X-Google-Smtp-Source: AGHT+IEojffDEHS0j3whbiNP8KyNCEs3sfRNMc8qkUsRgVj5cXjPuj6Pe0BT8ErsKVVmpVlb9KZMXw==
X-Received: by 2002:a17:90b:548b:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-306dd5789bbmr4467876a91.31.1744223461782;
        Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306eaec023asm436047a91.33.2025.04.09.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:30:50 +0800
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
Subject: Re: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <Z/a82sdjEDaqE9v0@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
 <Z_atODqZDkff5sjj@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_atODqZDkff5sjj@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_113102_805413_E3283410 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, Apr 09, 2025 at 01:24:08PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/tty/serial/max3100.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> > index f2dd83692b2c..36ed41eef7b1 100644
> > --- a/drivers/tty/serial/max3100.c
> > +++ b/drivers/tty/serial/max3100.c
> > @@ -16,6 +16,7 @@
> >  /* 4 MAX3100s should be enough for everyone */
> >  #define MAX_MAX3100 4
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/container_of.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
> >  	else
> >  		c &= 0xff;
> >  
> > -	parity = parity ^ (hweight8(c) & 1);
> > +	parity = parity ^ parity_odd(c);
> 
> This can be simplified for more unless I misunderstand something...
> 
I usually don't change the existing coding style since each subsystem
may have its own preferred style.  

But yeah, if this is the preferred way, I can make this change in the
next version.

Regards,
Kuan-Wei

> From: Yury Norov <yury.norov@gmail.com>
> Date:   Wed Apr 9 13:22:04 2025 -0400
> 
> serial: max3100: Replace open-coded parity
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..07d332b8e87d 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
>  
>  static int max3100_do_parity(struct max3100_port *s, u16 c)
>  {
> -	int parity;
> -
> -	if (s->parity & MAX3100_PARITY_ODD)
> -		parity = 1;
> -	else
> -		parity = 0;
> -
>  	if (s->parity & MAX3100_7BIT)
>  		c &= 0x7f;
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> -	return parity;
> +	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
>  }
>  
>  static int max3100_check_parity(struct max3100_port *s, u16 c)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
