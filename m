Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F7CEBF91
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 22:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+KZa0jcxSE+0RiTc+tYsAogWcBpe0Eg+3ynbIJLH0d0=; b=2cw0+WB8evtw3f
	HEMRWLQB5IElMps2E7G9FcOr7t5wZStX6GCJrFPIpUXwlza4xrBPNx0Zt7pcA3qtSwhsU+OQXt896
	0A4OqtfFHVKd2ZTVSk9fc8a5WCWsV9XPTjQwVj00/jCestriKdelf5K7CMX1Pnq8usxp4E2fBDhT7
	m97vhb4DlutU9YhhJJJkUxisRR9rFtJkk0fw+62677WMUgJmxa/xKzyPcqVqkCmc5xGQkuq/F2cfT
	Vz4kwIxntC5f9CsJ2nCxKhwwF2jeB+hwIf9UbMZ/IcXlhGQHdEGpZAB74aTcCv7NP2Mucvqgd91n7
	cuhDSfCD9Ew8WQnGolYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zs-0000000Gy8Q-1H9y;
	Mon, 17 Nov 2025 22:46:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zp-0000000Gy73-0Y7n
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 22:46:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso8519339a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2025 14:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763419611; x=1764024411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQx5Zus/kcblPuTEEWB+BahVU8fEHd8HqEQoD7L2fXk=;
        b=OToDrpQnXInBND2oBYnlVCU4Kn1QEH67WoSCXb/ssZ235P4LiskLEPSd5A9AYocW/V
         Ka7IZpWHbXlZudBPef/LU2rIIL0X8Wm6NVP6n31kYOeHf+6q1L4d8MEztshLgLaqS0KN
         1bzAnho8E1/0AKo/FtYyKmSgmbgcGgewVaRwd9GnPj4zC3ntJlW5Ffc+7z+OJIXzNvSZ
         f6ny7FYCxUF/pRHIlxP2QVl/YM0VT+UihhYx2qh0lTJ64x2pG0q5ZVl3OrARbBXGyA/Z
         ANi86R2xGigpAaz0A7pKpn+VWnb2GjmqNGJ+dzuloiRNHomXNMaA+tCvdDRBoczPMZc2
         zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763419611; x=1764024411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQx5Zus/kcblPuTEEWB+BahVU8fEHd8HqEQoD7L2fXk=;
        b=Rvw9/a94n1vtiV9mKxPYgBWkOJpXEIZO3ntTd/zqhQJ0nStL0kvrB1knVYjAM1Rw0f
         eH3FEzG6gMvylcplcKqzJHk2fAqZcqYuGamRH6b78+NmEclPRYhi/u9Ijyy5ygnb1zGB
         ybeubAOW66jMBkXdt1XfHbOaYsmWvhpNz0pM4LSLtZRxewWC2cMhwx9CPxZaqiou9VlJ
         tOepZe2rAB7CbZ7bVk25tOpFZxlWN/9s3SPjXcsZQ+c/ezby85Fk21Xo4ce2ZPZAx0Ig
         MamBjKOwubPZjSw/wtRL4AoyzHuQ/tL9YkJGG70blIFZoMUTvF7LQ8jkn3G/W9DFWBDl
         PmIw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Qx9TpLH9+f0YtFfx1we7d42Pq6DyclkmgGAaf+v7bY0E6sJZ4y+B2QCkMfms/HcSto12sKMV8FY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOLF4ETjidz0FRy67zYj9VFIcqP9b9161MBi6bntpGoV7ZO5Hl
	5uLkRR5elmSnazUoA5wfM69Oed07GxORP7cwkpE3Gs2Op/hfzXfy4fs=
X-Gm-Gg: ASbGncsqyVGjSmzVnwTTznkhYXG8ZX+uhkLMWOGzjzwqgvmalCtOhac+qwXIikvwjX7
	jAAA8vDTW9y7/iVKDSznXFN6ufLYZsgVqP/gPQRpq6oWUq2DPye5F/7BPMjf0iqNCImfeid/iXl
	yWzlpvqSfH0VgBdqv5/9HeZwea8/PDix2YIhE+Ux5XzpFi+mYKr2HIIjffo9hhvsmL67ClDiEAD
	0shJZKr+V9Dkl+KjldkD6DVBSNU3PkJmf6MQPvcn+zALHSNQxuDg1LrXz2gxtRfVAENys6MKSiB
	50Oo8Ul3KwUxFjQIQ01b7iNgTquOYA+bsEuU7PgpI3p/mIxfJOfcsmbwNuWblCw21r/IBac756p
	JpMeAUfkkB0rN5fbEsCxtMkbcTylZr+5tBxMJjD4+XDWN7bv54//pj7yIHnFSM8oWHIbkRHavK/
	IZIv9rKxre98i4MXp8ggK+0qlYA0cs/UWuepFeUFmaZqPwbUdR0KTN8lVm4TQLT8uymcfJJyNg+
	TMcjF/dbcSrzWw0FpobfZJ8
X-Google-Smtp-Source: AGHT+IE7k66LCLymhdfQOLn0JxvzsVErM9Ncx8SurVFaS1hwSAHD12i4vAoErL5LnOE7oFHNVJw/uw==
X-Received: by 2002:a05:6402:90b:b0:643:8301:d10f with SMTP id 4fb4d7f45d1cf-6438301d619mr6480812a12.31.1763419610795;
        Mon, 17 Nov 2025 14:46:50 -0800 (PST)
Received: from localhost (ip5f5be9e8.dynamic.kabel-deutschland.de. [95.91.233.232])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6433a3f94f8sm11266265a12.13.2025.11.17.14.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 14:46:50 -0800 (PST)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH 0/3] mtd: maps: vmu-flash: Fix build and runtime errors 
Date: Mon, 17 Nov 2025 23:44:05 +0100
Message-ID: <20251117224408.498449-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_144653_174516_CA5E03B7 
X-CRM114-Status: GOOD (  10.90  )
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

Hi all,

This small series fixes build and runtime errors in the vmu-flash driver
(enabled by CONFIG_MTD_VMU) and the included maple.h. These changes were
verified on real Dreamcast hardware with a physical VMU. The VMU can now
be successfully probed, read and written with MTD tools like mtd_info and
mtd_debug. Previously, the driver failed to build or crashed during
probing.

	bash-5.3# mtdinfo /dev/mtd0
	mtd0
	Name:                           vmu2.1.0
	Type:                           mlc-nand
	Eraseblock size:                512 bytes
	Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
	Minimum input/output unit size: 512 bytes
	Sub-page size:                  512 bytes
	Character device major/minor:   90:0
	Bad blocks are allowed:         true
	Device is writable:             true

Thanks,
Florian

Florian Fuchs (3):
  sh: maple: Fix build error due to missing include of linux/device.h
  mtd: maps: vmu-flash: Fix fault in unaligned fixup
  mtd: maps: vmu-flash: Fix NULL pointer dereference in initialization

 drivers/mtd/maps/vmu-flash.c | 8 +++++---
 include/linux/maple.h        | 2 --
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 97315e7c901a1de60e8ca9b11e0e96d0f9253e18
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
