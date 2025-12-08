Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FABD3B7EA
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JzYbLzZ34yd1ffhvO6VjoJXQ+vL5iiM1otgt3Ldt7eU=; b=PdrqPvVoFZvXa4
	WaUZmSIzNf9NgWhTURy/RaQLmaxeG6uT+B7lx5r+CHFEJfkH60HLFW1AcFaX0fxvjyAtW0FwP6RCz
	kb11LY4geYJ3AiAuaRsdRF3l53JMmJk7k6JLQEPvyDEq+d0bT2YDWQXVUlSI/2lrtQxCkweWfP3Nb
	owiE38617jLIyo3KDxtyGMieRszcP1P3OQwLzQizBfBNPO/uQkt1YgaYfJ6yRMFbx4CwrK+9wr8Yi
	piensqOObNVQhF905ayeR0eYv6GVet6g2roIwWNmaUzJ4Wx4bOR+oVdKfakAd/Bsvzkqj/bKrQCnE
	B1NLoJAxWq9FwUF7e9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSheG-0000000DVgE-3q9W;
	Mon, 08 Dec 2025 20:15:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSheD-0000000DVfp-2uhr
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 20:15:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso40445085e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2025 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1765224951; x=1765829751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3D3vIJGJPnYyuNbe5ScxA0aV0FwmwGapHVC8g/aGFTg=;
        b=SeBkNUStltzy1dtA6KrG8Yg7ZitcTlJ+9Ea0BwrKdwej3MukmaDZwic3roV1vYcSqM
         Wb0193uCB3peKK9rNC5yT5fIPfx0XixrZm1zxphAvDxVZ7+nNzDlO/n0EegUgi+rYY5/
         dUTEoVTYITid13o+TSthtpXwrMD5NzyyDvtl4u0zaE9BngmbPwfP+m7AeNnlfr7TpstG
         uVuNKEUeBcKFrMbAfnbtSWaVECpqDwMkXI9pr3Z7uSMC5dd5czkpJFKoTZzXTMwS19o+
         v3x7j8xm4/5eEdRlA4BY9kIobYbisWlT4+zdWdbpOdcar3wDZzvJk75H1g9fInbxUD+O
         8JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765224951; x=1765829751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D3vIJGJPnYyuNbe5ScxA0aV0FwmwGapHVC8g/aGFTg=;
        b=eaZhVk8VChlWeyKdm21fqjbkuGO13ixH8cXebWQXTcEcRoNpdTj8J/FgGeKU/mw+2O
         nuJvirQuWiH/4R44Elf2p1HL3dpQCVjUycZXXXYOYJNiWEVf2vQkiGqfPZSLT9xIvRtQ
         J/fKHeg51vskA/E9Is3A2bPirnaXNy0FpVJDAYBXLyU5pmuk7MOUhC8uEyrmQyUpohlW
         Dblfry+5fYoSisWiCldhaugLbCv8KgUs/WYpKiXLhBw6k5dQvG4vmIgWP31+XJwVUEuP
         90ZxfCPR94WbmSWd8jw/xJsx0jvn7a2pB/S2n/Kznptk5iJ5ON3sC2ROG3MzGMDnmNCd
         iaGg==
X-Forwarded-Encrypted: i=1; AJvYcCW8DIRqves29bLGjVZzzIUgUGvcbJlJ+AqtcvCccQ0gR2nmwB6fix4ajT27qCBGlCVnCpY7yAhuL5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAp25RDt0oifg6p9LugHXoHH8rGOYHyEhaqNfF0Od28ZBOGxnj
	La509FFi+4QV+ln45LckVKclOBlylHrPzm1twR4SIWGUqBheBB8q2rCXNrJdc1DoR8czfyIWSmH
	CoDLXaFM=
X-Gm-Gg: ASbGncudJuyCWxQ5M4H4Wk345j0HaxV8HNRngc8sJrCZOjUr8chQRHhc+fW9qmq75ve
	ZJBgb+Kvavcz2fAoifSdsABJtNa3KarmwssmUT1WKY9r2NusR9ydD4WzbwZ3ot06g0tHCTStsxQ
	BSNRlJzYzLWkmPH7wB3n8/DroqCbOMV0bmkLuQqPuLQHo7Na6nJ+sZHWeE8Gbig05f6wsVgCfGb
	YzxC0JdhgnjN0nTAYX1sG68zEeBWMgEg5igdvQghcrrh4uTBmfPIviVnEJBMBDUZCOBjnq4ewIo
	mfEiMQrcyjYF0ilup1nsLIUGB/Lvtxufwiu1roQ6gquSg69IV8gsw1GHFc2byp5RaD0u2xrfcn8
	rxitavFLTWVx82T1seX1ozWn4cFFM/ig5Xjh+J85xFwe2z2X8v+V3IpJzG377iw/QXi0zOHvfXk
	a+POaWZBlmRkr2EZYRA6zPU+fIyMY94e6qYj5OEBRuMSRwZcFpi0Hj
X-Google-Smtp-Source: AGHT+IFvXUeNU9HRRpuulWo5t52sUGh8YJNYwt+0V2JdO62mDhCnEF9wKyJaWWqewTP1fusx1UOK7g==
X-Received: by 2002:a05:600c:6014:b0:479:3a2a:94e7 with SMTP id 5b1f17b1804b1-4793a2a952fmr67424175e9.10.1765224951165;
        Mon, 08 Dec 2025 12:15:51 -0800 (PST)
Received: from somecomputer (85-127-105-34.dsl.dynamic.surfer.at. [85.127.105.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d6fcffesm2502815e9.6.2025.12.08.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 12:15:50 -0800 (PST)
From: Richard Weinberger <richard@sigma-star.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] UBI and UBIFS changes for v6.19-rc1
Date: Mon, 08 Dec 2025 21:15:50 +0100
Message-ID: <21252217.fSG56mABFh@nailgun>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_121554_098966_3AE7219F 
X-CRM114-Status: UNSURE (   8.79  )
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

Linus,

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.19-rc1

for you to fetch changes up to 0695aef23d674815c352293c49d944a2375ee9c9:

  ubifs: vmalloc(array_size()) -> vmalloc_array() (2025-11-28 21:52:55 +0100)

----------------------------------------------------------------
This pull request contains the following changes for UBI and UBIFS:

UBIFS:
	- Misc code cleanups such as removal of unnecessary variables

UBI:
	- No longer program unused bit in UBI headers

----------------------------------------------------------------
Cheng Ming Lin (1):
      mtd: ubi: skip programming unused bits in ubi headers

Liyuan Pang (1):
      ubi: fastmap: fix ubi->fm memory leak

Qianfeng Rong (1):
      ubifs: vmalloc(array_size()) -> vmalloc_array()

Xichao Zhao (3):
      ubifs: Remove unnecessary parameters '*c'
      ubifs: Simplify the code using ubifs_crc_node
      ubifs: Remove unnecessary variable assignments

 drivers/mtd/ubi/attach.c     |  4 +++-
 drivers/mtd/ubi/fastmap-wl.c |  8 +-------
 drivers/mtd/ubi/io.c         | 10 ++++++++++
 drivers/mtd/ubi/ubi.h        | 12 ++++++++++++
 fs/ubifs/io.c                | 13 ++++---------
 fs/ubifs/lpt.c               | 12 ++++++------
 fs/ubifs/recovery.c          |  4 +---
 fs/ubifs/tnc_misc.c          |  9 +--------
 fs/ubifs/ubifs.h             |  2 +-
 9 files changed, 39 insertions(+), 35 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
