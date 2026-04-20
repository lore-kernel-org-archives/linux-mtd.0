Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA434F557EE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGlPU9yrqIDFaSEBERihXX11u1NNPFMnT3HU2wag4Mc=; b=f6YXtBkwnGgbsR
	/5utgFHkdnWGSjZBCPwHE0Qc3XxYSDhbXRZ/0T7xAUSYn/nXEQdml5kAbdFIEyzmU8D0VPnXxaqsV
	01kXNknCScYHI2rKuH013va/88xCW3oOP9wiTjBTvz6Rn6n8s3rHf2WeGV8Q4HBra+csCijN7B9zD
	H0mF5t+iES1nCsaKrFswGCcAV5/blZMWxTUtaOOgOivmPeRkQt4O/f1qOJ7n/x8knXVauHsw3fvFj
	jz6hbW//iluM+B3kzcFzN/+qY6kRz85X+6smyPXy67eSyN6vGP1Tf43dE7hrMiltl3ialcIwEyeis
	4lGzBrrNzQ/4TQNt39Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkXW-00000006eTZ-0wWN;
	Mon, 20 Apr 2026 09:03:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkXU-00000006eSy-1j6K
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 09:03:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b2503753efso27176515ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776675811; x=1777280611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tZrYGL2ukBRHqFAeIW8jryqk5p9P57CIGtRpN4KNcs=;
        b=M5fvs3S6Gm0y8jNB+YzIiacNyk1oHC+wWmY2wIT+92PgiZ/zvGGMZ+l8Ql3dWpdC5K
         jAWpXbw9LX1kEXvrUINpalimKDYKUBY2/TPhOWkcsO7RbkiQRj8JRul4Lc6Nfo0wdL3o
         7HAUoA10UFznUBewgOkAkt02EpN/yJhUtbG0DBWR9dhxfAOCgQGple1E1GCa3IFO1gwI
         rh9+kd5EJ8uYTtqHLy6Jc3KzapQIVzw8qIspdhDPZ1riEtYoYNIU58MdrNAtsWb66sLK
         0pffiMMcdLsQk5pGhRsmBWTwHQio0pIZMMAPYTdVHjLUNqX1+RFs8YRkLdtaHVnwFIK8
         5Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675811; x=1777280611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tZrYGL2ukBRHqFAeIW8jryqk5p9P57CIGtRpN4KNcs=;
        b=f8yFyMWFI9rjzJ15BWSEYZDS00X6ee9cgGd9hnwz+JYt2YcWv0HHsaHjaRe84sqlSy
         UZktm+qoXN+nKVqA5k+t0Ffuj7eJhHecCIfgountm/53bYWzEOsxBo5CNn8kX4IfU4dj
         T1cFUx0oyz5L389sKlnTV82wNMfsE7GHke5X6f8DOeIyc/nHxg2skoif+j85FQPCkREj
         HEEcPQ+BJnqhM+ucTil+eADo3tz2vUMtz6PVmvg3ZIqPfbD9gGYynM1dg6r+b3fw9Gdx
         q9AtW8pnDjc8krDSreAJL6r1jCz4ukg0I+8RfPVlBgtRWiYxW4tYL1LSsahMyttpg1HT
         3LZg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tsx6WgGkjGnHGrmE36lhLCoiS3mRKgKq1XIAOPmNPRemX1ygaVcGUwY8+8YPPXKZy0mRzoZcJctA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBxAWQ9Zneh3+J0XRY1GVD84NS5uXK2WdJbD5Gut1ZweAztc9U
	ZbqsfytuDGBWdCcp3F5ZkIujsBGKSM1QZLRsgyGpAz7lre9kgjTPiftE
X-Gm-Gg: AeBDietEB4ZayUQxXLszKBBOFQ+1QRKLl473aIPBlmwRQGHEKnDXKZHxbQ/d1vQUW3V
	jM+gZHDnOSx26EdgMSzNqZopnoBGB+4einGxUvfGQhYAYlMQrAgKT0+LQQUzhRHW6zqda0BOyfT
	HFL2cbyZmF/z6Oj5xSqbfk8kLG4eJYDRkdoto6IoCPJIuF3e6oLWvEUXxiySi11K6r5aGOc2zL9
	mKPVBOXSYX7d7QuauIx3tdM3H/OTpGSGAD1bxMfDBUIJgjjhbPWdCo/jqLiyo5WwH+D4OnLMfra
	ngcElg+wUyrQmnlGqZYoEr/94qjQc5Nf0rnsMDFC0y5q66DNcW3l8AWmU45TnLeMnbVdwydM7xp
	EmzF97NwC5pDZMXo9FcUcbKzKxc9rFyk9eOsLHj0e1Os8kWKoRUuQfjXT4L5D6rTPO/i0zhNu2N
	st6rpUricGonXIj6vVT+uHqJb9i07F7K++21xgL46/wA==
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr140887735ad.32.1776675811168;
        Mon, 20 Apr 2026 02:03:31 -0700 (PDT)
Received: from 7c1ef1825668 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa1739fsm98861015ad.22.2026.04.20.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:03:30 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: pratyush@kernel.org
Cc: hd@os-cillation.de,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH v5] mtd: spi-nor: Fix SST AAI write mode opcode handling
Date: Mon, 20 Apr 2026 09:02:37 +0000
Message-ID: <20260420090237.21-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <40364d66-f8a2-4efb-a4d3-70f0aa3137e2@os-cillation.de>
References: <40364d66-f8a2-4efb-a4d3-70f0aa3137e2@os-cillation.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_020332_450003_184528DC 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
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

Hi Pratyush,

In v4 you suggested updating dirmap_info with the right opcodes. I went
with a different approach in v5 -- disabling dirmap for SST AAI devices
in sst_nor_late_init() instead. The reasoning is that updating
dirmap_info at runtime is problematic since AAI requires dynamic opcode
and address byte changes per write, and controllers may cache the
template at dirmap_create time.

Hendrik has tested this approach on his SST25VF032B.

Does this approach work for you, or would you prefer a different
direction?

Thanks,
Sanjaikumar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
