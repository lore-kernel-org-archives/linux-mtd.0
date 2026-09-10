Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B01C79FBF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYyKWVvC8r2b3TcI9jA8dm+WR2hCkz8wvlp+s2qxrCs=; b=cmR/t8szRk7Zql
	ePvQOIUQ7vDqqWUj8nlq020/LzqZpgBw8DL/9xA2QWvRUmWBdxVbkq1J/501Hk24n1dlavF5hNEMm
	+o75UWYG+2ewHI5yxsaAglyWwW0b6tID74K0L+1yZGBBsaxkzxr34cSUT0hDxiVxKwQgmZvwiQJ5b
	yftDqBhc1cGjKCvOZaiK0bwf5c4VTRZNrD9GZWMUODX54mTLha19jx5D0rb6xAmHVRti5cuWTIZ2y
	cgOWY2NGyLe9SXEPE+0ZJqmD6+Lx90UmrWBn9+uW813R1PSK022TcpMeeMuUsYzXfk4n56vjEMt9H
	hzK9s7MxSnQFf0+Q/Y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmI-0000000FB3Z-0sGR;
	Thu, 10 Sep 2026 18:45:42 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmG-0000000FB2e-1X9N
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 18:45:41 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso215335e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065938; x=1789670738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFwsI9simMxQb02NAezYgKw4f6SO8os6Tv0e8NhfUjA=;
        b=k2VkchR12w5iGw27YhLs0CMUvHlrhhpVB6Jlx2zjbSkBqG1R1ar8xGVnHyjpHyyQfN
         KfhDUW4FpElL+AImJXa7d7W9u2Zsp+Gx6vTCZgDiIt1CB3LYxD7aR3D6k6/lAxHvZxbX
         GwU9YEusKAvJR6e42EVJM5zlQKvD9Ug4uKX4I/hHs6gK6bS3YWRQ3dkaltcO5wcPJ7mJ
         wle4SnmmyMfd125lslztpITqpjF6bjvxQGlno4YJwvU8osXFnzTlOJzjJPQtbEHosQA6
         QR5KMfZHKmDyg1fu0nJspcnujSgU1P05FSdxi8gMvxoTcUADsRQtXU1jK6OVEpwAWx+G
         Po6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065938; x=1789670738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFwsI9simMxQb02NAezYgKw4f6SO8os6Tv0e8NhfUjA=;
        b=sROYIIfFUw86NtRxUPOk66oZHR7tnKlGODQ67UnsnQBLQ5ezXmbBSIzu8uE9M6xaDi
         ntxnpSMvwNaWYO4Usvf0HlLGmvjAIrwA3GWbyGBEu/iTDbTgCF6//B5ZFX0DSwmE+Agd
         0kr1P3P1jZx0upvo1Cyj9j1RFxSr3wVvLUSXYPp9OIb+AuxDuQHraPSHl+33GmXF5DYb
         Op+0IS5GbYVZBlMvzuKs/NHPHEmyzYg8K4we5Q9Hyr5MVsxnjiDYUqN9v7NcHNaShAEi
         2JqPoEEWqLM12bCapFtyM8p22d6swBYBOS1kxiI6ePaHPsuCvRt3AdaxhC1/IK3R75B6
         Fhvw==
X-Forwarded-Encrypted: i=1; AKwUvBxBr17nyjFQ2VCgIeNf/SEc8LqyzKaudSgHcJ3P0G1q6uZqFTHCKH9otiDDEhPGB9Zl02Z4Oij9X1M=@lists.infradead.org
X-Gm-Message-State: AFuF++lxbLk+Z3Bxrxp8t/myPah2QE3+m/4j/wjgg8CSz6JMGS094fDH
	jRMI7v+ajrVihPnCJ7rny7ZYL+TKGQWkZj9SDmv+HgTA0wUzo7oXNLCE
X-Gm-Gg: AYBFou1pLR6ZDoM5EG5i+I003wLZtwqkc3bFh3lTWn/UbwdE42a8qztaxTXKyAhkW9h
	xxHdfoGr69z6qdwG7z3PaOMXXcTjUYKcda2C9KUOZQeu4fvmHJ6id0fymchDRviumsCD/gyk6JL
	G0l72w7g4C2UNH43AoSVibxMh/JUtATCMTnQZjlCaji2EJbKCGg1vNmtDptwuikBlf/R0tDV+XJ
	X3El3DctstjIRaUo8RcDFlaOQnbR9QCITOOpRI40Hi7cjOuXHh+TsijgbJ1LKPlZzyGxTMR2E77
	4e5oX5xBQhJR+ZWe2tHsbZ1nH5pPri/ErLP1z1E7gFlzenKw2jRLhOsw6ijhX9hAUZlapbLwxa4
	Jop44X9M7PVa+S+XNzFsvx02Hs1I1djEdv+5ago8sYW5EbczaxbL955C4SUXdIABiDp5xr+dfq3
	IBWK4paS/JgQ62iAtCB+kRTur6R5ltbJcbZ1tV7U2xpLoUd/aLmJJ5bkNBzEUTaHKMcO4V0VZ+i
	jlRK4G0APvZfOHx6rnP
X-Received: by 2002:a05:600c:4e47:b0:49b:910c:76fb with SMTP id 5b1f17b1804b1-49e619c054cmr3478415e9.2.1789065938294;
        Thu, 10 Sep 2026 11:45:38 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm18760055e9.14.2026.09.10.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:45:37 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH 0/2] mtd: spi-nor: fix the unlocked restore on shutdown and remove
Date: Thu, 10 Sep 2026 21:44:50 +0300
Message-Id: <20260910184452.895485-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_114540_417812_B29F0E6B 
X-CRM114-Status: GOOD (  15.77  )
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

Two threads can talk to the flash at once during reboot/kexec and during
an unbind, because spi_nor_restore() is called without nor->lock while
MTD users are still attached. A busy flash silently ignores the restore
and is left in 4-byte addressing, which is exactly the failure the
restore was added to prevent; a restore landing inside a read corrupts
the rest of that read instead.

I reproduced this under QEMU, using a flash model extended to implement
erase busy time. With an erase outstanding, spi_nor_shutdown() issues
WREN, EX4B and WRDI; the chip refuses all three because it is busy, and
each one still reports success to the caller:

  the flash was mid-erase when spi_nor_shutdown() tried to put it back
  into 3-byte addressing, and refused 3 of its command(s):
  0x06 (four_byte=1), 0xe9 (four_byte=1), 0x04 (four_byte=1)

four_byte=1 is the mode the chip was left in, and so the mode the next
kernel inherits. With the patch, shutdown waits for the erase and the
restore reaches an idle chip. The reproduction is deterministic: the
workload keeps the flash busy continuously, so no timing window is
involved.

Two caveats on that. It runs on a 5.10 vendor tree rather than mainline,
though the path is unchanged - mainline's spi_nor_shutdown() has the
same unlocked spi_nor_restore() call. And what started the investigation
was intermittent hangs after kexec on a Zynq UltraScale+ board, which I
have not tied to this race.

Patch 1 fixes ->shutdown, which every reboot and kexec goes through,
and is marked for stable. Patch 2 fixes the identical problem in ->remove;
I have deliberately not marked it for stable, since nobody has reported
hitting it and it changes how long an unbind can block.

Note what patch 1 does not do: the restore still runs with MTD users
attached, so an operation starting after it completes still addresses a
3-byte chip with nor->addr_nbytes == 4. Serialising against operations
already in flight is what stops the restore being issued into a busy
chip; fully closing the window would mean stopping MTD from accepting
operations before ->shutdown, which seemed too big a change to fold in
here. I am happy to look at that separately if you would prefer it.

The patches are independent; patch 2 can be dropped without affecting
patch 1.

Itai Handler (2):
  mtd: spi-nor: take the flash lock in spi_nor_shutdown()
  mtd: spi-nor: take the flash lock in spi_nor_remove()

 drivers/mtd/spi-nor/core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
