Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EF8C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 23:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNNWTyJQRQz1c8YBPA+en4+fA1/rxvtI5IGmU28isVA=; b=EXIMTFzjkkyGaV
	OzO3Nrp3PAO2Aiiu8DjYm2LHmAGMZu5Ea5gGq0eOdmBSiJqQKNDqjO+QH6fhBEMcZjxVYOQESuH+o
	Xg3f724cPZd2rZHl1MvWzY3cqmVBczjB3oSi+HKc7+kxr5DP63Ptq+vgvyg+9g1W2fxuFC5ClBbgv
	J9Tv8/7LxngUJFZLabDL63BJIrJpLwmVTxkmt9xyifMUUnJa5krYoBM/DV4YtOMJ5prYpVOjBcqAQ
	ALIfq2moUlWNYIPUi6SRqx/Ecl42F1W6tFI04p9iAGnlM3tri5z+NV6nt9CY3ZiHh3vfR4EBntrzJ
	2v+XS+FQ9UnXNE4Wo+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgA7f-00000008rH5-3qJq;
	Sat, 04 Jul 2026 23:50:11 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgA7d-00000008rGg-1PK5
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 23:50:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9aea40d799so754189a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 04 Jul 2026 16:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783209008; x=1783813808; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HKV+KUUf1l6O94dRnCB7pZKpb3iSjpWDcx87J9hXKo=;
        b=TWyL05HHndLjfJ3ZNSib6TG1H005RmBsHU2aOI1+Nqgp8TX/fJ4lIyXrZJ6JaAEC+W
         uogHXeuYgqu9IaLHj/DVDu0XPiDE7alRPQxxovnAmYu1LYei4rJQ6ysqOo3qM366j5ir
         4HUoV/yD+SBKa2Roq7CTsue+A5nHnFbLizuip89CkkIfy63vKR1zLsfGNvYuTGC6Z1d0
         /+73C+ADXbpOXsjxEfghYn7YpRjc8FOWik5DZguyBn9zvcJE3cijIq6LIp69m7ZwbRhI
         k1IgxeTWfJ8Jm3/jOto+hY8IEPyTFVBsJ0TtU20lxK1bqbBul5arh8k2EiIVmpQ2gHnN
         16Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783209008; x=1783813808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HKV+KUUf1l6O94dRnCB7pZKpb3iSjpWDcx87J9hXKo=;
        b=C2NDc0BFF5HiaosgMQ8emWKTr7KROn3obVB1MUmHuiRgtmHVzvfy0Z4hS0UTcpljqu
         uWqxdkzYMxrsyd5MfnYSgjFmHcQJrdOhxLvwWLbvh6dBToC4Ki9S3Z5y+7XCJ05efeDk
         if1L6EwoZnUddVD7pHpFI8keouKogtEQVMxddsUQF7M9yhD+3cWu+M+GkA0VfvCHAOoa
         V/wF0En5bspoq1GhxJe5EmOmNs/cHKTF5yxBN7EHelqpHtyckxWzk2Dmh9e+rgZ4PsE/
         TiF28Bo1bedKgnEKUZ/OdXzHxT1+HxS4cljuXlEckHzucbxCiAAGM7ns3HFC83IWbHQd
         vyoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NQu2/IWYf2S/yLv8MGy/mk2TdEP+e7jOoPgp6cyJc1A9kQqVJP9D69cUbFRzbXXpBSylCRbNFQHc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdIcUib8OqrU/G5RpVMP7uQFZrDyBVqUeBT/gRVa3KgLAmOp0I
	0UHAf39yJqXJ9gmlnLx48+IDzj+TMT6y23OoQT/BmjZ5UGS4SnNCUIVa
X-Gm-Gg: AfdE7clzoVAHWgAQU80rpoXunQChSQwJarJlQi9zeGycelslHCvYPX8+kKGXCkmKMVD
	G4h+OsSqDZVAT39P0C4lX3r3i9T8Ap6oXQOx9qxLj5gwk18AOuOMp1zLSnJvF65/XnTxIW9TNmP
	Q79YfXnYS2ixKazvORzl+WST8YCt/WSIhPADbVIxU0Dm7NctxKytBObXRiJOx2W4perQ/MszaT3
	fmBi5ePr1Xjzrfej81RJPYTxHU3uNOZnWZ2lPMhg4uMmeUYIKO+gcuc/wXVazyTXa5f4Xx0SL1q
	mjzzS8D7X0jRC/xznXGYJt5jTTgJ69P4lazavWAFQdlj4sFF+vEDm+UkKBLpZk54W54MuoqvxBj
	jlcsyvh1yOwm4EiaE38qJaVrCgHzYypfl6AisBAou5w0jLL9Aym9RAET9qpNypm7NhSRirkdtOD
	737XAbUUQZRm+x8lECewDUbU42tipn4DHYoAcxiVkOllrclKTm2XTjew==
X-Received: by 2002:a05:6a20:2445:b0:3bf:9a30:3a12 with SMTP id adf61e73a8af0-3c03e54ae21mr4963679637.50.1783209008197;
        Sat, 04 Jul 2026 16:50:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3f90:534a:314e:e11d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm54368396c88.10.2026.07.04.16.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:50:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 16:50:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Adrian McMenamin <adrianmcmenamin@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 18/26] sh: maple: introduce callback_mutex in maple_device
Message-ID: <akmbL8AmfrxkHN0u@google.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-18-41e424964da5@gmail.com>
 <akkrQJfxSCvUptC4@lithos>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akkrQJfxSCvUptC4@lithos>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_165009_377837_8EA720AD 
X-CRM114-Status: GOOD (  19.71  )
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

Hi Florian,

On Sat, Jul 04, 2026 at 05:48:16PM +0200, Florian Fuchs wrote:
> Hi Dmitry,
> 
> On 03 Jul 22:57, Dmitry Torokhov wrote:
> > The Maple bus core invokes client callbacks asynchronously from a
> > workqueue (maple_dma_handler). If a device is removed (or closed) while
> > a callback is in flight, it can lead to UAF bugs if the driver's private
> > data is freed.
> > 
> > Introduce callback_mutex in struct maple_device to synchronize
> > callback registration/modification and callback invocation.

...

> 
> Thank you so much for your efforts. I can confirm sashikos finding in my
> test (that I saw later),

Thank you for giving the series a spin!

> that this patch hangs the bus if a VMU memcard
> is inserted. So that the peripherals don't work anymore after insertion
> of the memcard. With a last log like:
> Dreamcast_visual_memory 3:01.E: VMU at (3, 1) is busy

Yes, indeed, I overlooked the vmu-flash use case. I will introduce a
lockless way of setting up the callback and a wrapper that takes the
lock and that should solve the deadlock in vmu-flash driver.

I wonder if you had a chance top try out the preceding patches and if
they worked for you? If they do and you can add your tested-by I should
be able to pick up at least the input patches that do not need maple
core changes...

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
