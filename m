Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04636E98E14
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/45lgiKapiffTi35DeE3mjy4Ztn2muDYrEfpvkifN9w=; b=eB3QEk9tgkGNtT
	G4v+78y6Q+279rllFEbVUIGUoz4VyayqL2DYmOOL2SHPVnTSXZfpvnqVmFOBsFKuFRMomyffsk6H+
	BjgF8ziACMeFabGy8qn1cUHWN7VSJfV0J5LoH20X899iYvRHroZZRFTk/t8JbfDG/W9WZZqIhPBcs
	c0FD77REerFaOdLe0o8XE1gtRchgUn8OVTb4WdshvDLz0rexMwz8eyYyNH3OeKZy2v0NnvLXYPT/A
	4tI7a/kiIdtBtAGwyK7qvlX7D0M7YwfNYKaWbeF7R5CZQtkyWWHBBBfBVUMHk2nRvZnaS4b2E0Tkd
	SbMSPbrlt/+7T3JSbauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0a-000000001fQ-42ZU;
	Mon, 23 Feb 2026 10:17:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0Y-000000001f7-03xi
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 10:17:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a8fba3f769so18233965ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 02:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771841861; x=1772446661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48RL7VeEp2klLp0X3X13j82DHjMKhg6nQjIVmjSYm8g=;
        b=fV7X7ydHWWSsZG7LQVGZi1XBeEWoT8SB4HK4QR+8hb06FNZNWmcjFxFhCncZ3DJJnn
         F0tZgwbXznFaK8XqeBmvDE9JsnFbhz4KFXz3Zdk61rbqpdLzytIS0wfP+GYijtb7RGHe
         0TRpBF4HLY5UXg2WGwdUcdtexllFOkNoEPYDsYuzSJJeu7q/spseoSfpcm2knK5Jp+nS
         T0Q7L1i0NGlaP0w/cjEHAEoBiKjbxVP/oHLJHX6lvtVwV+dOD0RrBnk3Nx1Ghl2Y/z1f
         r1jrd+/KJ8FdfUD2e/bfjhLRLvhzn44JNHVEGwk8arElk/OLbUlb5Pv/lceFdIlL8EXi
         pgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841861; x=1772446661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48RL7VeEp2klLp0X3X13j82DHjMKhg6nQjIVmjSYm8g=;
        b=MNXw1sC3voZuge7VjTMYKVF9NljXNMIYMsHS64jvCEY6r4lcuhGpezq4Y+Y6jt2t4N
         z1zuOYngDrjKMaGKiTHYKn+yFXXbOluJc2JL2zArOhDVm5x7Ue5/fa/uMCLfAmKuupTC
         mkfPWFgRbnNljYlWwsGQ08J00li7BguRMxjIzZF9NJy/grRLX+UT5qQQ9WAMYEbkgECT
         A5giPi9BPZ3P45hLg6cPhvN8PXeVtygiwFVtGz8I8zRxgUuJ1OsAP8kVrsMf+uAAEFYn
         CLXq4ExpuwdiM2JQZzCCfxQwQYOaTX/DcZLBxFKucgCpSsuzS/8SkRE6yL26/+NOatd1
         j6ow==
X-Forwarded-Encrypted: i=1; AJvYcCXxfhoNRcS0Nt/tNplvzNjNGL67rcHOii31S4Pt64rcjaJ2gIfUf+HiHfpmyrU7hNdxv60N2d3H0/k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3qeD7y/PDQI16ZX8t42/IGBbpZWjJzVoavaLFd/fkfYOq1dWL
	S8b7FzKpPOX7WOosccuwH78VukGgX/VgblD4QOeqIu/VvXCqRrQUXhsF
X-Gm-Gg: ATEYQzyvzprK++PvVR7RpqK1ReyvkHKiKlgnp54fLGVLF5zWgO/7fOTqBGDMRp6Mjx2
	K+wsFbTwmqH5Ns7GDb6Nfx4qFLDbWYbhaG2euA35vyYNHHHAcZ1iaN1U8drHFIgLxYiB9z+FjUJ
	B5dSpRDxRupoZYNeqWrrGP1OnzD+uXF9rGklFn51XisztfS2LutQxp5m/0mqahjBZCAgSNOAQfR
	n2SMesrgm6i5ARCaF3w7ng2MvUtTkQSxwSOceutjzjnEVs8bp/0SzNtr12pYtl8cCHVzeEBLV0V
	ZpKPc+hdejiP5sVDdt1ydv8GUrYm/FB07NZVgzeEsJPMznJdMFodFm1DoRdmYdGigs17q1WG3+Y
	pYK1AHkwpFfLCdYkQYyTYQCt9dsE0q6AjLvjZU0cF7Vik+/chkIvMu0/VWByTbJdtjIaYkucMXh
	yrCxfPvR63nCAY+Wz8JWjJ1gTwwbyoZQ==
X-Received: by 2002:a17:902:cec3:b0:2a8:7814:47cc with SMTP id d9443c01a7336-2ad744649b5mr63594245ad.16.1771841860595;
        Mon, 23 Feb 2026 02:17:40 -0800 (PST)
Received: from c6dfb3cc7c9a ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3425dsm66574795ad.16.2026.02.23.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:17:39 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumarvs@gmail.com,
	sanjaikumar.vs@dicortech.com,
	tudor.ambarus@linaro.org,
	stable@vger.kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 0/2] mtd: spi-nor: Fix SST AAI write mode
Date: Mon, 23 Feb 2026 10:17:16 +0000
Message-ID: <20260223101718.89-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220094236.28-1-sanjaikumarvs@gmail.com>
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_021742_102300_A78F3BAF 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

This patch series addresses two distinct problems affecting SST flash
Auto Address Increment write functionality:

1. When writes begin at odd addresses, a single byte is programmed first
   using byte program command, which clears the Write Enable Latch. The
   driver fails to re-enable writes before the AAI sequence.

2. When the SPI controller lacks direct mapping support, the fallback
   path uses a probe-time operation template with standard page program
   opcodes instead of AAI opcodes.

Changes in v3:
- Patch 1/2: Use local boolean 'needs_write_enable' for clarity as
  suggested by Michael Walle
- Patch 1/2: Improved comment explaining the fix
- Patch 1/2: Added Fixes tag

Changes in v2:
- Split fixes into separate patches
- Added detailed commit messages

Sanjaikumar V S (2):
  mtd: spi-nor: sst: Fix write enable before AAI sequence
  mtd: spi-nor: core: Fix AAI mode when dirmap is not available

 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/sst.c  | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
