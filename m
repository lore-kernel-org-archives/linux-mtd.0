Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD9C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Co829FYPYF2NecQNKRPVV1Eflvbmmx8//VZU9M+psfM=; b=EsFP7Wu2QfbtFB
	KSuTgEUwPo3nvm5k7XUrUlC03mEVrgb4VfIRrxEjqPtKSc6DjfY2BuehRKSKu/sLumLX0w+/XJ3hY
	jJBeajkU09wqOyw/h8evP72QWIA1n5kZsWfGbH1zhQvZpjgVBmRiNCdfyqsZtzXyJUZ5A7HFeH5Br
	xH8DoMkoYZOu6yEvvbPVAIpTun5cLGLzZz3wHq6ZVHzhVec4qDsPrML+7Sddzq+Ln4c4tJiQ2g34m
	XEbIhDroSjAM4FR5TqUIQOdxpySp8snWslmOv/DCPvsWyXwy+zxiYzLN/LwaP12HcshSd9eKYl3or
	MC3of27prX/qSvtePTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61np-00000002gQ6-1vro;
	Mon, 14 Sep 2026 08:12:37 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nn-00000002gOY-1eur
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:12:36 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso231684f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373553; x=1789978353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvL+tll9z+rZiVIgsLmiJriXCowgjHq2TgUmvCdD0FM=;
        b=M7cB7SQ+q54ud2tWkNMcabEmJXtqfZDjAb+Y0frMNPonBwpDZeEKLCmMwB0LXWMxmH
         892FOGrrfECAr4vKSQ9QdaKLjzbV8k2TgqAWS2ouQgWqHJeZasCAcs2xLCMnWyoGmHsL
         4hIAElliGSiLsKvJDFM4q05FxfSFrtTk3zuGbHtnoLkpdBO2jhuHHUsCFjhQmVkLb1NO
         0HuHIx+QFAQyusMdbf4OednJp0WazZ4A4yTHJXw57zrixKCaduQs0YWwVYL1ekQxRj+t
         5nL/n2/IzKtwsZQjN4C769W9vVznGjtJY6l0nbwQ0aUau9Wd82Vh2QkIZzdMFbfLiyU8
         qpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373553; x=1789978353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvL+tll9z+rZiVIgsLmiJriXCowgjHq2TgUmvCdD0FM=;
        b=NJvXhShLL9Mof+dm5tuTPqy/9qs/KiPTRFiJIJAFil8pjwiEjxzS8quQsqHcWTOxOa
         xOvrp79MEOVQncGOUvj8m3OiYyoVeP4fUSdwXrKhTn/IpVDryezQoKt8XlL1/K5zgEju
         scAroDO9iacAN0sPx5r8LzLXOh/a/FZMLnCE1vPec8Kef1IZO+la/yFW+hI8El3Y0nQJ
         qUssUlVVLohmksOl+y448KypG2DdAcgwRe6J32B2psLzNnF+dLGSFnYtOh7W/UERcPgL
         6YaD8HDmoPgkjTgTtzlt5TEZsez+oyOX0gss7UMZRL6BJlLXHcDpzBZz9I0/jO3zj1dO
         4nMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/MjLLKo0V3DX/DjC9yWJgueg3BiDbYi7ue5S78stuywvATrtW178nRFOF1MiFPk8r8aeQepNrSwE=@lists.infradead.org
X-Gm-Message-State: AFuF++mc07wxr6wJzwiZdXBGpedFdmrxnn7RUBYhN80KaTxMVCcPmDXv
	YcgQ+LU5aLzf/Cqr2YxqbOQdOlpHTVREZxwZTGHx7Y1HRysp2g/0/zLT
X-Gm-Gg: AYBFou1WOLPLAp91zyw2ON1UEWrymVfbnIMH2RS0Hr8/EpNdT6lEaoQgVSY5kWuyMJ7
	fzpf4cNhXxfU1Z/WEKy0I+ZA8phjYM0wW9PU6gLC3gv0E74cH0Tmnbg9CNJbhktcx1LX7lEZMUJ
	f6xUlCH644ddrPC5Y+oufHK9FIH9N5oT4suHVeFBImsT/cFOlhraQ8xXI/ioKxQE7nF75k6KM/N
	M/aGcQqllTqe+senZg9fyoM9h1RReOXquDUB1XRV5VCJHiUE9YzTv+J7+wRTc5sNc/Q70nwb478
	2UQfbtHW0JI1PjFdklV+gXBnEXnrdMtiRZM8mGQOGuqHjKoPh3QA8+COPpiAzRFiThJp6VL6oY8
	UsRB8AyYa1OYwbM7Z9NDgsbp54diuq8d9Py1RN8A8R5hnRhq+QjTUw5ik6Y/o/ti6WwXYmIQnn+
	GeeydWiBxyOj7YVUoJpQ9oUgcOQJo9oIZ4j5wFGJuom7/dev989KjCZ3U62AaHx0z+Imo0GbrNT
	M3DXSbXWpM7TD+mX1M=
X-Received: by 2002:a05:600c:4683:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49e7a5ed9a7mr13611875e9.0.1789373553467;
        Mon, 14 Sep 2026 01:12:33 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:33 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by spi_nor_rww_start_exclusive()
Date: Mon, 14 Sep 2026 11:11:47 +0300
Message-Id: <20260914081149.1916589-2-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914081149.1916589-1-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011235_500069_15FCBA20 
X-CRM114-Status: GOOD (  15.75  )
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

spi_nor_rww_start_exclusive() takes nor->lock and never drops it. It
returns with the mutex held whether it hands out the exclusive claim or
reports the flash busy, leaving the caller holding a lock it does not
know it has.

Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") turned its "goto busy" into a plain "return false" and deleted
the busy: label that did the mutex_unlock(), but kept the mutex_lock()
at the top instead of replacing it with guard(mutex). It is now the only
one of the ten spi_nor_rww_{start,end}_* helpers that does not use the
guard.

Its only caller is spi_nor_prep_and_lock(), so on a flash with
SNOR_F_RWW set:

 - if the flash is idle it returns true with nor->lock held, and the
   matching spi_nor_unlock_and_unprep() calls
   spi_nor_rww_end_exclusive(), whose guard(mutex)(&nor->lock) then
   deadlocks on the non-recursive mutex;

 - if the flash is busy it returns false with nor->lock held, and
   wait_event_killable() sleeps holding it, so the operation that would
   clear ongoing_* can never take the lock to do so.

Nothing reaches this today: the only flash with SPI_NOR_RWW is the
MX25UW51245G, which has neither OTP nor locking ops, so none of the
existing spi_nor_prep_and_lock() callers in otp.c, swp.c and sst.c apply
to it. It becomes reachable as soon as any common path takes the
exclusive lock.

Use guard(mutex) as the other helpers do.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..8bc117b46e02 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
