Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D41049515
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1c96180MOvMaxxFaC5yHWtsrStbZlCD89bsoitMMIw=; b=srKHjfpZs+5ae5
	+fZHUnchcso5D8WH1hw6cPCFgpz5Pw3/URQbLgqgsCyz0dUYRVNDifvoBna9ScstlDvH150E6SVGk
	zteo5wBI7eFz/HjbSxOjYxxY9HwMk88t7vdapWTPUWTba4lNRlTDX54L0tkdF/wCE786uTKlq+gPc
	iYy8YRjJ9E/634UIlgFn2HuxrghPqSwIRQ4lQvk4cNkg/6SQ4whxxCKWxWFROZJkQxMQGHb7h+1Zn
	3CiElVmhg4yBHBGbQ2KdPtcLOMUXeSLUkwR25lSIRUUK/rC34W9NMAEElEd/D1QBPbmOoBnEue2OH
	DhgYm8ITjaUAaBDcdMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GqR-0000000BR4I-1oTW;
	Wed, 11 Mar 2026 10:31:15 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GqP-0000000BR3x-00SZ
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 10:31:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-824b05d2786so10637842b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225071; x=1773829871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfjId/EpLdm+RxO2tIlmAYHD6wfm6GkL4KUKPqjqPag=;
        b=iPQroDCVLSCgMn7txw1K4wMwVqYtozDTQPnilTQkL4gDJ23o8D8Rlih0E+pVnt/TxK
         HH+aW6dYTTPG10DdZ2Y4grPv9CvyIT8A8EJHaqPqFYt7hvO4Lc7cZcbRsuuJxLYFI/oG
         hc1GgMpgaVBaj1ZpgUOs3r4FY9u/KWl9u3jINxRqJBwxXCnQzQA8VFz7OCXvyQ3rN8A4
         3HJ49qfCGX/xFcIuCROCQMdO9mysL5OmraPWh9AdJS2te2pS6An9/Nyew+RyEuvX8ynl
         hdkcpzHY98x6tYO6GGpebjoOQi8VLJ8DN9abHHo/Dk/a5ol9DDiLGLQe8e8HDUj3ZroN
         VP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225071; x=1773829871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfjId/EpLdm+RxO2tIlmAYHD6wfm6GkL4KUKPqjqPag=;
        b=Bb7wx39FUzlAmaBNpWsXPYjwN1B+EIcXPw3KghzRdJhtPBKT1NNLZw9D351WRouBhM
         INjJHbSHCXT3O1FezQP6BZAfACY2Kh+Ok//i8G17E0sZ687xLFFX0HIVYYxLzpFeYmXh
         sFdFDdT3e8ADoyiZAyfdyZTrriWtEQFd5fKZNom/uvy0si2aU0phCvNkiVub38r7NdyJ
         Dlh7fTiJ+MNlJiWUlRflQ2v0CuYsdapo3543PqCRshLquUqHesyLhQKEsyo1kxNKRuy7
         a0FSYGJ0UY4K9GygD8Zd6fAKRMI8Fi5whl2Sa0/hawQ8zfpzq3DItTG2W9qwd8enhVoI
         2QeA==
X-Forwarded-Encrypted: i=1; AJvYcCVm/Okqd0fx0TxZwSg1h2zZhhHTMiG7MMUYlg6REP+Uyj9wp67hLGNjS1q8k/CHqw/18fy+mdPHMrk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBohVaScQ6/Fe6m4wJNUgPTZ967ZVE7nfg/bJvwK1Q17zG0TM7
	QE48UIAJybkK/BrQmqB1X3nZVpYvxJkBzxi1nMZSTL0O301Yix2/pzsl
X-Gm-Gg: ATEYQzy8wxmUeaS19DSyLZfK+1ONNQxUaCvoG2oCCQ64HsI+K873ifSx6HusepHiE7D
	cKQfLf4hYW062kZGasgjClzg+sNG0wmts5AP5s41Q3QBBL16VStNUkkd/gpxmO9fLYtOxK/bias
	QFV/jY3xAA7dOt8Yk05ltOFJO4ByMieUijr4dv+7AGKcAe87txaplls3NWsYyfPe/4Ditcwur49
	gzlFyu/a9LBhksmti5UHkPDh1lSxgFdJf84O4uVkfrI3LWMo0mbpMeIXXCNWNGpfGGMH1yfV/G/
	wCR62udA2sp6fvPRpsCvNS+JUzfWpE1UW3nmO+YGXZDvssn4zXR90FDfThOnsWFOr61YkAY6iHb
	8kRpZwu8k8V+T/wYSKfZYIRdL0BHYXODrGSq7oFzF9TNlpoQGSVpCI2J0eya9sFk/hc7FcRamMB
	afSLpLmG1bAKO86yEmr8ov9uEKFRvnXA==
X-Received: by 2002:a05:6a00:1702:b0:824:9edb:454 with SMTP id d2e1a72fcca58-829f70d130dmr2083250b3a.37.1773225071345;
        Wed, 11 Mar 2026 03:31:11 -0700 (PDT)
Received: from 1f3ae71dd79f ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf57sm2052558b3a.38.2026.03.11.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:31:10 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v4 0/2] mtd: spi-nor: Fix SST AAI write mode
Date: Wed, 11 Mar 2026 10:30:55 +0000
Message-ID: <20260311103057.29-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_033113_043300_94B984FE 
X-CRM114-Status: UNSURE (   9.50  )
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

Changes in v4:
- Resent as new thread (v3 was incorrectly sent as reply to v2)
- Patch 2/2: Added Fixes tag

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
