Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5406C19F32
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CafaRG31ikMczjbhB5XA7/K9EDBhBSVxq+w6baMYLnU=; b=nQT6yHNlhESh3q
	0620vdobH9fVsaOqPg+GC233enTJ05PELAGjbr0IVLyxiY1ch5cEhiFOcKe7mI/rkOXJyxydV4TV3
	IiVbnca8jblZXWt8bRzjGtX3w1jT8TMRgokK4CFSv24Xpjze3/x7cDtCd+hosOgf5CjWcxOY/d0Fo
	v2nmtVuIfqW7R1Cm8OvKvBGGtTOD/TToi5UedO3sWP1cGz4TQJ4RKLH1Kfol+Fj8aTFUHeEXP0r6q
	omkjLp4Ru6hehxZDhulP8oHXsXH8H0urQ3l/BiWNRaXc1PBs/QCS7Bs7h9ilfNzlCH9fL8Qdo/DA7
	qpAfG9bhHfENl9XRb4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlE-00000008bHv-1Jnt;
	Thu, 27 Feb 2025 19:41:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhop-00000008EG6-0Ri4
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 17:37:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2234e4b079cso23684235ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2025 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740677826; x=1741282626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VUAFuA6WyxlqIwMao9P+DyP+C2TxjteBYJ1MyyDLQfw=;
        b=ii98RUMgvqJPj2zpB2dmY7FkkfSz0fODMbDSBkAcrO0X8tLMt33dXcegRd70KYK4EB
         j1xKTAn9jtqLecE9W0Mq0Fj0uol7Tt31uUKF8UTl2aGADQXjm9kD0pzzhGZ+SOeL84aZ
         sxl/88p41J9uJd8cCiLkc6w9KPrXeS4UiaB2D2uEJaY3dyPCvluSRUq5+g4n4IJCq0/7
         ZSvrKZewOaVeQL4Eb/U4CyrU7LxsA/p25RlqKx76gqynF4QSUTBAvuhkAaODrUT5Lvlx
         3ebcgTUbXlTJJ3P1wETkhdpVNcxu1ZoTNgQ8+t3dv5alK05XI4SKSF17gUrmsWeZWagq
         coKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740677826; x=1741282626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUAFuA6WyxlqIwMao9P+DyP+C2TxjteBYJ1MyyDLQfw=;
        b=ta06VEGIsWowrpLkVjHGsCj30k3vuN4KZVOno1+XtfWjSMWrUn0S9NnNKlYZOLWl+H
         iT+ySVMr9pfYGOQYUxvi/w6yrqsbQIfPoMI4mrwxVD0stebUCabVT0QicW3ntXfm6a9T
         c5vnXP6rq9z59wRm8SgEAinsdt4nbbJQEmezPyeOQNYKIgox5/lN3wnY1V0kNQ/H3mFy
         Vok9EZj+5YJktb1LC+sPA0301N/RKg3ZjMamH7gLsfuxqfvafDgvvITEI9/M7FHDxZUb
         zGJvORvl2VEcuHwsE6a/UDyxJDS/lE3r4VBXFG6WT3Q3vihGOwfnP72b9IHq9r8B/fxL
         rtXA==
X-Forwarded-Encrypted: i=1; AJvYcCUv/q+f1De9B1x92nKgA6vZQ9GHQH1mdxoItGEx9ZJhFDoVrNpJopoznAIBEsB2H4wVB2pkSahWy7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzixlnAUSBfs6e6YQgMsKRjswpD5693zbYFNDCQpI2/ywoDiG0P
	d/4yHtc9PKEnBd9XGeAdXPIhakCJ+FChvuSrlw5VYuTmOZuAF5i3
X-Gm-Gg: ASbGnctsq59KYMAlOCNNHy4cuS4C45NlyzRt6XNptg0ftLz/22vj17OC083aD1zTdLx
	R35yly2k/k1+2lLJR+n4OPZWPxBsBi2+UudnDJQMHOAYq+qxkh9YWUsM9XhCvDdZtJKjzWgZQJe
	8/l6urHQ6eZQbndLMJiRRo+4qjd0rn2yddIozlbwjHRufhjIDPP3h0PGn5PqUz2QorUAB2GKR/J
	pWki54Tf/rE1xPieJcdlUfwf9qyhwedHHYZ2XzVUvGBFcUFlSWYOGZ+9zolyceXALbaoChWtsWF
	lrbxauy55//qsgKaibszSmOhIWMkUnbbZWi7vXf41AAqIofLIg==
X-Google-Smtp-Source: AGHT+IGK2yvXxMwGzFuS4qAPXT9dc4oLUeTze+y8wAtciDVfBiItiQouqHwlR4imml9fxjD4qYJfDg==
X-Received: by 2002:a05:6a20:9146:b0:1ee:d6da:b651 with SMTP id adf61e73a8af0-1f0fc993ffdmr22305716637.35.1740677825727;
        Thu, 27 Feb 2025 09:37:05 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19d3fsm1745501a12.18.2025.02.27.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:37:05 -0800 (PST)
Date: Thu, 27 Feb 2025 12:37:02 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
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
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8Civv0QaBzmFPTq@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
 <Z79ebv630yuNOJKV@thinkpad>
 <a8c29dec-6178-4f8f-80f5-aece636c410b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8c29dec-6178-4f8f-80f5-aece636c410b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_093707_141627_8D14F373 
X-CRM114-Status: GOOD (  20.68  )
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

On Thu, Feb 27, 2025 at 07:38:58AM +0100, Jiri Slaby wrote:
> On 26. 02. 25, 19:33, Yury Norov wrote:
> > > Not in cases where macros are inevitable. I mean, do we need parityXX() for
> > > XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?
> > 
> > The existing codebase has something like:
> > 
> >          int ret;
> > 
> >          ret = i3c_master_get_free_addr(m, last_addr + 1);
> >          ret |= parity8(ret) ? 0 : BIT(7)
> > 
> > So if we'll switch it to a macro like one above, it will become a
> > 32-bit parity. It wouldn't be an error because i3c_master_get_free_addr()
> > returns an u8 or -ENOMEM, and the error code is checked explicitly.
> > 
> > But if we decide to go with parity() only, some users will have to
> > call it like parity((u8)val) explicitly. Which is not bad actually.
> 
> That cast looks ugly -- we apparently need parityXX(). (In this particular
> case we could do parity8(last_addr), but I assume there are more cases like
> this.) Thanks for looking up the case for this.

This parity8() is used in just 2 drivers - i3c and hwmon/spd5118. The hwmon
driver looks good. I3C, yeah, makes this implied typecast, which is nasty
regardless.

This is the new code, and I think if we all agree that generic parity()
would be a better API, it's a good time to convert existing users now.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
