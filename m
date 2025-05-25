Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE2DC54E90
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O8o3BehJ8mCIIW7eN5jDw7PYcCiRbKkP4OEAEum82kw=; b=BKb+N2NO9OyBVN
	JucLLS0PmGGMPE6ftCIUhrJUcCSlJi6RVX/9Cr6WdlgKRRA0oXDNamPJO1w2m1ttX7Nz9Kw7HG9gg
	LfGOVhlOX4aNMj6H7Frio4XX1yfcVPFRKxfO67alaZstiRnDZbHv3plm+nyT6UszI8sNqPJUj+Du/
	7VAFcwhNABP02yN1swH0T5JQiqQ6F0jUG2DBYBrnb4oi7E9rMJrrWdzpFD2rqmpMiGiRP1j7qxmfY
	DZksxtPvvyORgbLCLtx/B6MQB3JsVmginIpgNL98vuouIoMxD+IACViWZGJTqSxsOw7qCb+wi8PJm
	W2tbNY6PRaCAVkEYI95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnL-00000007NoM-02nl;
	Sun, 25 May 2025 17:05:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnI-00000007NnL-2lul
	for linux-mtd@lists.infradead.org;
	Sun, 25 May 2025 17:05:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso1778564f8f.1
        for <linux-mtd@lists.infradead.org>; Sun, 25 May 2025 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748192750; x=1748797550; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSPtkl2k2o6TvMihlt2eH/B28rLRtVyXETO98Nlddcg=;
        b=QeZPGDZ59SEyx2QTSqwzxDIGPCqlGtQi5/kxf+IhSZz7gYNzYf01X0+XC/fOVWQrHd
         0WK6eKJxGlWQRYE5GZ6JzUbxdrcsH/Sp2j5ukiiawpXCvCNCFoVigd1CaNZRsGN30FGB
         +KyMiS7QBZ5MbQfN/2rjMhhbgp+W1nOXuJvJ7HDfk2BX8Ih8hfCXhEFHfZlWPnfSGw+J
         GjQDQYU0sZPg1aVzpqZ5gjvWe81AAUsnNyc6ohIC/qpJ9n1JuVtjgzOk0yCloX6ffw+3
         Jz14BLxnrgTrhMCZUG+CYvkU9idnv3Rz/OjPxuiT4++IAa94kaqKWS/81x8tG1IJCtby
         1zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748192750; x=1748797550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSPtkl2k2o6TvMihlt2eH/B28rLRtVyXETO98Nlddcg=;
        b=BVSWLJbziZNWCXw+cXYiPmYHhuRJRsxzy/1WvCcED4fgKxG/nbz65tdAL+uj3KeLmI
         wEE2otKQMa19LLxuwlezq9GZpi6vQK6IR0gHIDpX4P6NiKj9LmDGvI9Xm7X+EALFshTv
         6G3z9NBGKLEIPflQwJl0EAvphhtV5dzXNBRWUxEpikFBcyOAYFb349a9NsKxwyiFlObH
         z0qEoYDYvI3YL5jdDBphW5+L/mKMJIFZTFpVn/Z1t98FwlxEOUO5UFw4ABMWdHlfpdwX
         F4fMkClxL/FsyDPwprrWqkC+Yk37iWNipusUE95J3X8YeHkU93XQU9gigs0hk8YtSoTC
         tMvg==
X-Forwarded-Encrypted: i=1; AJvYcCXdCw3nruaq5OIADnCfm9ZAfdH5DEmImQkaOmyEn41UbE092ValNeGfH9RXXu/kA8NYgSIEfN7xD0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4v/u84hpKHtayJ7m2wAmnWPRPNx4JSeAq7PJM6+p6u3Eo/c19
	efXctq7ati6amdTg9vPlxuNpfbJT0D++nvgnBD6/jawPXEOd7nXjYLO7
X-Gm-Gg: ASbGncuOZRRJ24tiu3svp5q77OBeW3Hb2YIJddbSBohPE5VIj5xUYlrAlyhvZAluBgo
	eHbH4O4pD9kJAw0PB35OKaJdqK0uTnU3P+nDMM+pS2pqQVSmQbAGXWo7knME7eiqtoIQtl1JQLJ
	kbwrOg7KxFRu7T1+/c0RWaMMkEmFT14U8OBq5BQuZVcWBYuiesrZaQso86jvAx/5m66BH8dnpRK
	3dWhJsCs6M68N1sj8RkiCNdYFO91v5chFJcULXfW3qxN9Dh6kdW4LgpiNw07VRxOT4C37fWcPH5
	BLaPpZoQjBMMDxfFBzaAbMJTJGdsO6gF6GlS0OrVjYy54gfxqBlC2JcQPRCq+UU3NNWumSVgiBn
	5AAKl
X-Google-Smtp-Source: AGHT+IHrqdaTfd2CvQtrbD19G5LSxUJsrVd7AD2/hDFFT83q8/zfeCWuZFodkMnHDVSIbhoYgXl5Kw==
X-Received: by 2002:a05:6000:22c7:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a4da0e537cmr26224f8f.27.1748192750374;
        Sun, 25 May 2025 10:05:50 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm32317405f8f.22.2025.05.25.10.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 10:05:49 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] spi: spi-qpic-snand: avoid memory corruption
Date: Sun, 25 May 2025 19:05:34 +0200
Message-Id: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN5NM2gC/x2NMQ7DIAwAv4I81xIhypKvVB0MOI2HADUtioTy9
 6CON9xdh8oqXGE1HZSbVMlpwPQwEHZKb0aJg8FZt9jFzfgpErAmShGpZYl48IEhq/7Kd7g424k
 28uwtexiVorzJ+T88X9d1A5+0GMlxAAAA
X-Change-ID: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_100552_702186_47C2220C 
X-CRM114-Status: UNSURE (   9.62  )
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

The 'spi-qpic-nand' driver may cause memory corruption under some
circumstances. The first patch in the series changes the driver to
avoid that, whereas the second adds some sanity checks to the common
QPIC code in order to make detecting such errors easier in the future.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      spi: spi-qpic-snand: reallocate BAM transactions
      mtd: nand: qpic_common: prevent out of bounds access of BAM arrays

 drivers/mtd/nand/qpic_common.c       | 28 ++++++++++++++++++++++++----
 drivers/spi/spi-qpic-snand.c         | 16 ++++++++++++++++
 include/linux/mtd/nand-qpic-common.h |  8 ++++++++
 3 files changed, 48 insertions(+), 4 deletions(-)
---
base-commit: b00d6864a4c948529dc6ddd2df76bf175bf27c63
change-id: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
