Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BECC36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67Jdd1NEtBsjD6oxqpuMAOMPXZGQpEksqdw7pfk3z54=; b=cyg2DyI79lizqM
	1OrnwHYZH2Mixb0pOZiVXvB6MOnGmOF5cX/vV6iC1RHnz1bBvewze8oXS93DDipaMozPm3lIyCaue
	a4kJ9QQCpcN+wBfwJbA136g+d5EEmk2ofCRzsSJIUyDRdkLLi1UDQ+Cy0XWTWU3O0pnlDmn4jZBNA
	aHStMGNkXCor85O4mlk1Ge+njh7mETP7RY7pUwBHnYauV9wJY5fs34cysH2m+sBqVSoue7JoZHjKC
	ueXHtInAPzUo5/ra2y7Czbf3rvmguDz3m9Iu7adIvdq6YiHiSffj/c8cqkfdwvr5p5va6sIlBSNAb
	D52X4alc+RNlxVRFq7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aeR-00000008FYL-2UYu;
	Wed, 09 Apr 2025 18:59:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aeO-00000008FWl-1oos;
	Wed, 09 Apr 2025 18:59:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736c277331eso1154535b3a.1;
        Wed, 09 Apr 2025 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744225191; x=1744829991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1wi01EF8Z0TS5kAzJp4gC5MlmlCKp8z1jxkmp6i2uY=;
        b=gdEffAbb3aZFEmlKObWxRzoQr184EZlMvcrhXL8LipAAcIH089AoplolxBeIiHVzTf
         MaHg5Xr2qwc9V2qpAeVRkoVliwJExKnwSFpeb0EuIkJrpj1QtqXjHRob+kIbupDapfe4
         CpiDrIkEeUjKD86cPmvFzF4xp3J5lCkuMN6cd50Apmd7chfuKFZF8/IK4pQAjlaoNwKO
         3ONifqAL7lSa0zvz6giafTUzxGgl1COC2d+G44fybnG5VJBYMJ3WACfklUevCoqy0/KS
         5IB69DdCdhoV/ZHOMiCXF5SHg8YsxWnAcC0KWWs/aMf3Q25Es4JzyViZ+7NI6gOLYbVT
         y9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225191; x=1744829991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1wi01EF8Z0TS5kAzJp4gC5MlmlCKp8z1jxkmp6i2uY=;
        b=xNpISSNjL2B4RAJzMLk12R98vhrlbQ0gLGzsH0SjVfDle1SkZx4vcqz2sJ+Lt6J7df
         RZwqyeA5xUo/OOiQxTjJ6rm54p2Oal6jcbYe0nYkv5HxpfD6iIVGEDp3ipQ5xkp+5PTO
         ers13bhMKuqEa1/+D5PeKEBpDCfatJWso90Ca0ZazkeK0vYbpiP3QY14FADQRTCLx+oA
         NK5SkZpT3a3sr3nuhaEhWaTzxCCAQcoBEHTYVPRFOq8RjRDFqYWJmLEywAo6pKMiB/Jf
         r4L5Loi9qHtGBdexsP8MqwCVBMNTJC29is/6MGr6IUyRVKFAWhjWXzuVYMrIgvTWNkyZ
         mksQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM+Nnbv6I5ERCvyKRre3QvlZSeDZTZ1IwKvvmi17WVUU/SjoF+qD+f89XPtkMxrjAdTQ+P9MFQCP4=@lists.infradead.org, AJvYcCXmgUNQv0U7pCeVe7PS3KkLaVCl1DikclKxDUAIn9Cn7CSy5Kys54eCWhort3uZkse0Ajqr8aS4Pa5Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxxwtRbmM+qhhhoifOThqSuSaroK1nAvQ1mB6hrr1y7j7o+reUm
	+9+jb2nGkkXLUXOzRe++OdicycWQT7xGmJtW4+EM6YvjtNRaOSRt
X-Gm-Gg: ASbGncu7TtLp3gWeMQ7oMqAe+eClBmb2DdggGRpbrzo4+Gsr7vcDpSEhk3utWTpO1z7
	Y5M5DL1bAMVUyDWoDQSgrMcgSyIkScjVM81P0YfQdDZLVskaVpe+M4i122ov7iwf5XbegwyE/Lx
	skH6AX+nFJbBEOwRJ5ySyN8dfB5UTRXSbcA4nnMiU3oKTMlaCM+cj9z4IncXu97WphFHmmBIlIp
	oG6MttX2PRXUqg7h1G5L4+SzI8pZwuAVHr/64Eo3hgyh4x4zmSIfX32nnHNj3EhUD1jsPOgItRh
	R/6uu5IsOsSkcwRRIySHvhkpk/8ZsrEbkO3WezUh/gsKZrCWnReK1F6wfMrlkfnG4tLQUgbNxS+
	XfGY=
X-Google-Smtp-Source: AGHT+IECCxkkYx11FRXflSmygxg09UKvf+V06wtQrEcsVk2bA1aQzXREqWD22vkpXtX6pPvgieHcAA==
X-Received: by 2002:a05:6a00:22d4:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-73bbcc568a5mr921360b3a.4.1744225191359;
        Wed, 09 Apr 2025 11:59:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e53e92sm1699061b3a.156.2025.04.09.11.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:59:50 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:59:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
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
	parthiban.veerasooran@microchip.com, johannes@sipsolutions.net,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	yury.norov@gmail.com, akpm@linux-foundation.org, jdelvare@suse.com,
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
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/bDnLzcajzIxey3@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_115952_469798_05638CD9 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, Apr 09, 2025 at 08:43:09PM +0200, Arend van Spriel wrote:
> On 4/9/2025 5:43 PM, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
> >   1 file changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
> > index 65281d40c681..15b515b95956 100644
> > --- a/drivers/media/pci/cx18/cx18-av-vbi.c
> > +++ b/drivers/media/pci/cx18/cx18-av-vbi.c
> 
> [...]
> 
> > @@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
> >   		break;
> >   	case 6:
> >   		sdid = V4L2_SLICED_CAPTION_525;
> > -		err = !odd_parity(p[0]) || !odd_parity(p[1]);
> > +		err = !parity_odd(p[0]) || !parity_odd(p[1]);
> 
> No need to call parity_odd() twice here. Instead you could do:
> 
> 		err = !parity_odd(p[0] ^ p[1]);
> 
> This is orthogonal to the change to parity_odd() though. More specific to
> the new parity_odd() you can now do following as parity_odd() argument is
> u64:
> 
> 		err = !parity_odd(*(u16 *)p);
> 
> 
Thanks for the feedback!
Would you prefer this change to be part of the parity() conversion
patch, or in a separate one?

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
